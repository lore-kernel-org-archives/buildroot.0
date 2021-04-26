From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 09:08:26 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/systemd: fix
 homed dependency warning
Message-ID: <20210426064148.1470185F3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa649c0f961c0bb6207f3db7ab9802ef0dabf136
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes:

showing "enable home daemon"
and "homed support needs a toolchain w/ threads, dynamic library, kernel headers >= 4.12"
when BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12

introduced by fa62b5165ca41e4800e00a84af9026bfa5fb9155

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5d4dc98c58bb80c121a3d6c7ff3f89a00f192213)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/systemd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index fbe1a4081b..d658308213 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -233,7 +233,7 @@ comment "homed support needs a toolchain w/ threads, dynamic library, kernel hea
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
+		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 
 config BR2_PACKAGE_SYSTEMD_HOSTNAMED
 	bool "enable hostname daemon"
