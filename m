From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Aug 2013 20:41:54 +0200
Subject: [Buildroot] [git commit] openssl: don't build tests
Message-ID: <20130823184141.8205D9B547@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=467b8d1f694531d77f1c3ce808a424cb8bd0cffe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These require shared libraries and we save a tiny amount of build time.
Fixes:
http://autobuild.buildroot.net/results/88e/88e5e07e94e49879907186ff35ce66944f867ec2/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openssl/openssl.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index a0e103b..4b8b0a4 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -85,6 +85,7 @@ define OPENSSL_CONFIGURE_CMDS
 	)
 	$(SED) "s:-march=[-a-z0-9] ::" -e "s:-mcpu=[-a-z0-9] ::g" $(@D)/Makefile
 	$(SED) "s:-O[0-9]:$(OPENSSL_CFLAGS):" $(@D)/Makefile
+	$(SED) "s: build_tests::" $(@D)/Makefile
 endef
 
 define HOST_OPENSSL_BUILD_CMDS
