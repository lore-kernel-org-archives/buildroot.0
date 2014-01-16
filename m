From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jan 2014 09:14:34 +0100
Subject: [Buildroot] [git commit] busybox: udhcpc script: suppress useless
	error message
Message-ID: <20140116081740.6BCD69C013@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ce2867352dfa0bbd2830ba70fcee7499a4e7252b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Suppress the following error:

route: SIOCDELRT: No such process

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/udhcpc.script |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index 9e08dad..e23d1f1 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -40,7 +40,7 @@ case "$1" in
 
 		if [ -n "$router" ] ; then
 			echo "deleting routers"
-			while route del default gw 0.0.0.0 dev $interface ; do
+			while route del default gw 0.0.0.0 dev $interface 2> /dev/null; do
 				:
 			done
 
