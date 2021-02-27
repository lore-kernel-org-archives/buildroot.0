From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 27 Feb 2021 16:54:13 +0100
Subject: [Buildroot] [PATCH v1] package/util-linux: disable runuser for the
 host build
Message-ID: <20210227155413.15809-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes host build in case unsuitable libs are found on the system
(see [1]).

[1] http://lists.busybox.net/pipermail/buildroot/2021-February/304261.html

Reported-by: GA K <guyarkam@gmail.com>
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/util-linux/util-linux.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 0178c52bac..09acaca1a7 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -211,6 +211,7 @@ HOST_UTIL_LINUX_CONF_OPTS += \
 	--disable-nsenter \
 	--disable-pg \
 	--disable-rfkill \
+	--disable-runuser \
 	--disable-schedutils \
 	--disable-setpriv \
 	--disable-setterm \
-- 
2.30.1
