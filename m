From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 22:13:22 +0200
Subject: [Buildroot] [git commit] systemd: add input group
Message-ID: <20141022201338.ABA23B0429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9364c51a78e08768a310727ac06bdeb69d3443d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's used by 50-default-udev.rules for input-class devices.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/systemd/systemd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
