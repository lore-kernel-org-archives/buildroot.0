From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 22:06:55 +0200
Subject: [Buildroot] [git commit] system: make systemd's kernel headers
	comment fit
Message-ID: <20150910200800.CB89181F74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b287378d3c0fca20d7fec4fbf3c097115afcbd5a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The comment line that explains that systemd needs a glibc toolchain and
kernel headers >= 3.10 doesn't fit in the dialog box, which makes it
look as if headers >= 3.1 are needed.

Abbreviate the comment a little by removing an 'an'. It still doesn't
fit completely (only one trailing * is shown), but at least it's
readable.

While we're at it, change the quoting style to " like we always use.

Reported-by: eschu on IRC
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index fad829d..03521fd 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -90,7 +90,7 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	select BR2_PACKAGE_SYSTEMD
 
-comment 'systemd needs an (e)glibc toolchain, headers >= 3.10'
+comment "systemd needs (e)glibc toolchain, headers >= 3.10"
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
 		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10)
 
