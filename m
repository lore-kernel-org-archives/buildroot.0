From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Aug 2019 22:33:10 +0200
Subject: [Buildroot] [git commit branch/2019.02.x]
 package/busybox/udhcpc.script: fix domain search comment
Message-ID: <20190830202908.6C7EA7F8A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d74dfcc913ea4a4b1aad1a1f9b20abea8320c689
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The domain search option is from RFC3397, not RFC3359 (which is about TLV
codepoints), so fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 67a52f6fc9fe9fbe3b6ab3399ff1b55c2b4ed47c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/udhcpc.script | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
index ad110d3a7f..131c138b1a 100755
--- a/package/busybox/udhcpc.script
+++ b/package/busybox/udhcpc.script
@@ -56,7 +56,7 @@ case "$1" in
 		cat $TMPFILE > $RESOLV_CONF
 		rm -f $TMPFILE
 
-		# prefer rfc3359 domain search list (option 119) if available
+		# prefer rfc3397 domain search list (option 119) if available
 		if [ -n "$search" ]; then
 			search_list=$search
 		elif [ -n "$domain" ]; then
