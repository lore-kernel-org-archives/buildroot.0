From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 21 Oct 2014 11:26:39 -0300
Subject: [Buildroot] [PATCH 4/4] systemd: add input group
In-Reply-To: <1413901599-27312-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413901599-27312-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413901599-27312-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's used by 50-default-udev.rules for input-class devices.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index fd19bff..75a32f4 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -179,6 +179,7 @@ define SYSTEMD_USERS
 	systemd-bus-proxy -1 systemd-bus-proxy -1 * - - - Proxy D-Bus messages to/from a bus
 	systemd-timesync -1 systemd-timesync -1 * - - - Network Time Synchronization
 	systemd-network -1 systemd-network -1 * - - - Network Manager
+	- - input -1 * - - - Input device group
 endef
 
 define SYSTEMD_DISABLE_SERVICE_TTY1
-- 
2.0.4
