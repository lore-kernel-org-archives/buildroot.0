From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 23 Jun 2013 21:51:57 +0200
Subject: [Buildroot] [git commit] system/permissions: make /root
	group+others non-writable
Message-ID: <20130623200856.C9A869B141@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f2bf6a800d585ea381e09eec148844a7135ac53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upon logging, dropbear whines if /root is group- or others-writable, and
key-based authentication is attempted, reverting to password-based
authentication:
    dropbear[149]: /root must be owned by user or root, and not writable by others
    dropbear[149]: Password auth succeeded for 'root' from 192.168.127.35:41566

On my system, /root was 770. Changing to 700 fixed the issue.

Having /root 700 is a good idea, anyway.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 system/device_table.txt |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/system/device_table.txt b/system/device_table.txt
index 43c0cfa..7ae4b07 100644
--- a/system/device_table.txt
+++ b/system/device_table.txt
@@ -9,6 +9,7 @@
 /dev					d	755	0	0	-	-	-	-	-
 /tmp					d	1777	0	0	-	-	-	-	-
 /etc					d	755	0	0	-	-	-	-	-
+/root					d	700	0	0	-	-	-	-	-
 /home/default				d	755	1000	1000	-	-	-	-	-
 /var/www				d	755	33	33	-	-	-	-	-
 /etc/shadow				f	600	0	0	-	-	-	-	-
