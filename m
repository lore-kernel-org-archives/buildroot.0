From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 11 Feb 2015 12:10:45 +0100
Subject: [Buildroot] [PATCH 2/3] system: Defaulting TZ_LOCALTIME to UTC
In-Reply-To: <1423653046-27560-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1423653046-27560-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1423653046-27560-3-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch sets the default timezone to UTC if not overwritten.
Some packages need a configured system timezone for properly
operating like mono based software.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 system/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/system/Config.in b/system/Config.in
index 95e10ab..d967002 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -371,6 +371,7 @@ config BR2_TARGET_TZ_ZONELIST
 
 config BR2_TARGET_LOCALTIME
 	string "default local time"
+	default "Etc/UTC"
 	help
 	  The time zone to install as the default local time, expressed as a
 	  tzdata location, such as:
-- 
1.9.1
