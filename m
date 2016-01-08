From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Jan 2016 18:25:44 +0100
Subject: [Buildroot] [git commit] tpm-tools: enable GETTEXTIZE to fix build
	with locale
Message-ID: <20160108173609.7EF66827EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0acc3ac16d9061de3f70368ce4cec7db4b305067
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it ends up with a empty MKDIR_P variable, breaking the build:

Making install in po
make[2]: Entering directory `/home/test/autobuild/instance-2/output/build/tpm-tools-1.3.8/po'
/home/test/autobuild/instance-2/output/target/usr/share
make[2]: execvp: /home/test/autobuild/instance-2/output/target/usr/share: Permission denied
make[2]: *** [install-data-yes] Error 127

Fixes:
http://autobuild.buildroot.net/results/53f/53f85bcde19dc79b1266775a26e51bee1266ba7b/
http://autobuild.buildroot.net/results/979/979908a5a159d65b56f196629330892461c0a5a1/
http://autobuild.buildroot.net/results/44e/44e00da2948164ed72212310617d7d621fb0416c/
http://autobuild.buildroot.net/results/c3e/c3e3bfb22dd8e6972e74ce248e4af692aef1b0cf/
And many more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tpm-tools/tpm-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tpm-tools/tpm-tools.mk b/package/tpm-tools/tpm-tools.mk
index d196e89..4fc5138 100644
--- a/package/tpm-tools/tpm-tools.mk
+++ b/package/tpm-tools/tpm-tools.mk
@@ -14,6 +14,7 @@ TPM_TOOLS_DEPENDENCIES = trousers openssl \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 # configure.in and lib/Makefile.am is patched
 TPM_TOOLS_AUTORECONF = YES
+TPM_TOOLS_GETTEXTIZE = YES
 
 TPM_TOOLS_CONF_OPTS = --disable-pkcs11-support
 
