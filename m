From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 20:45:42 +0100
Subject: [Buildroot] [git commit branch/2018.11.x]
 support/download/dl-wrapper: fix urlencode option never being sent to
 backend
Message-ID: <20181216194333.B17638D4AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e38dbeab1ae774fa048d87ae1d12ac4aa02841e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

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
index bb70c98253..3315bd410e 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -93,7 +93,7 @@ main() {
         esac
         uri=${uri#*+}
 
-        urlencode=${backend#*|}
+        urlencode=${backend_urlencode#*|}
         # urlencode must be "urlencode"
         [ "${urlencode}" != "urlencode" ] && urlencode=""
 
