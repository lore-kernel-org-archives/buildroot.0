From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  7 Feb 2015 23:10:14 +0100
Subject: [Buildroot] [PATCH] legacy: add missing option for util-linux' wdctl
Message-ID: <1423347014-27774-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In 349c9c7 (package/util-linux: add more tool select options), the
util-linux' wdctl option was renamed, but a entry in the legacy menu was
no added.

Add this now.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 Config.in.legacy | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0f1b202..8d99e24 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -102,6 +102,14 @@ endif
 
 comment "Legacy options removed in 2015.02"
 
+config BR2_PACKAGE_WDCTL
+	bool "util-linux' wdctl option has been renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_UTIL_LINUX_WDCTL
+	help
+	  util-linux' wdctl option has been renamed to BR2_PACKAGE_UTIL_LINUX_WDCTL
+	  to be aligned with how the other options are named.
+
 config BR2_PACKAGE_RPM_BZIP2_PAYLOADS
 	bool "rpm's bzip2 payloads option has been removed"
 	select BR2_LEGACY
-- 
1.9.1
