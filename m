From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 15:22:57 +0200
Subject: [Buildroot] [PATCH-NEXT 1/2] chrony: S49chrony: support a defaults
 file
Message-ID: <20180528132258.13860-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For specifying custom options to chrony.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/S49chrony | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/chrony/S49chrony b/package/chrony/S49chrony
index 6215acc4aa..5abb3b2582 100755
--- a/package/chrony/S49chrony
+++ b/package/chrony/S49chrony
@@ -2,12 +2,14 @@
 #
 # Start chrony
 
+[ -r /etc/default/chrony ] && . /etc/default/chrony
+
 [ -f /etc/chrony.conf ] || exit 0
 
 case "$1" in
   start)
 	printf "Starting chrony: "
-	chronyd && echo "OK" || echo "FAIL"
+	chronyd $CHRONY_ARGS && echo "OK" || echo "FAIL"
 	;;
   stop)
 	printf "Stopping chrony: "
-- 
2.11.0
