From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 20:45:54 +0100
Subject: [Buildroot] [git commit branch/2018.08.x]
 support/download/dl-wrapper: fix urlencode option never being sent to
 backend
Message-ID: <20181216194150.9768286C19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4dcb53bafc326fb6bf9c4ed83d478516e303e0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

Since commit 38de434123 ("download: fix file:// BR2_PRIMARY_SITE
(download cache)"), the urlencode option is no longer passed to the
download backend, because we use ${backend} instead of
${backend_urlencode}.

We must get the urlencode information from backend_urlencode.

Signed-off-by: Damien Th??bault <damien.thebault@vitec.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: rework commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit bb7c13273fbe2da0969e14ddfd61a46b78d79db2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/download/dl-wrapper | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 490335c859..f8040b6649 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -96,7 +96,7 @@ main() {
         esac
         uri=${uri#*+}
 
-        urlencode=${backend#*|}
+        urlencode=${backend_urlencode#*|}
         # urlencode must be "urlencode"
         [ "${urlencode}" != "urlencode" ] && urlencode=""
 
