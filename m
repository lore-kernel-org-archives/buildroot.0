From: Michael Nosthoff <buildroot@heine.tech>
Date: Fri, 16 Apr 2021 09:29:54 +0200
Subject: [Buildroot] [PATCH RESEND] package/systemd: fix homed dependency
 warning
Message-ID: <20210416072956.151549-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

showing "enable home daemon"
and "homed support needs a toolchain w/ threads, dynamic library, kernel headers >= 4.12"
when BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12

introduced by fa62b5165ca41e4800e00a84af9026bfa5fb9155

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
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
-- 
2.25.1
