From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 20:20:46 +0200
Subject: [Buildroot] [git commit branch/next] chrony: S49chrony: support a
 defaults file
Message-ID: <20180528182034.C02E582615@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9977053659cdc098b35ef0e9762707a53838209e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
