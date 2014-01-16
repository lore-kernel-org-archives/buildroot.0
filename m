From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 16 Jan 2014 09:58:33 +0200
Subject: [Buildroot] [PATCH] busybox: udhcpc script: suppress useless error
	message
Message-ID: <d91ce81270c14b0f3d76ecb8f3ce31528d5efdf2.1389859113.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suppress the following error:

route: SIOCDELRT: No such process

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/busybox/udhcpc.script | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index 43742fbd5302..9aba5165f6a8 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -39,7 +39,7 @@ case "$1" in
 
 		if [ -n "$router" ] ; then
 			echo "deleting routers"
-			while route del default gw 0.0.0.0 dev $interface ; do
+			while route del default gw 0.0.0.0 dev $interface 2> /dev/null; do
 				:
 			done
 
-- 
1.8.5.2
