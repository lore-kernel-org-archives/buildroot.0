From: Wolfgang Grandegger <wg@grandegger.com>
Date: Wed,  5 Jul 2017 18:53:13 +0200
Subject: [Buildroot] [PATCH v7 8/9] support/scripts: relocate-sdk.sh now
	creates sdk-location in share/buildroot
In-Reply-To: <1499273594-12106-1-git-send-email-wg@grandegger.com>
References: <1499273594-12106-1-git-send-email-wg@grandegger.com>
Message-ID: <1499273594-12106-9-git-send-email-wg@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is because $(HOST_DIR)/usr is gone.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 support/misc/relocate-sdk.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/misc/relocate-sdk.sh b/support/misc/relocate-sdk.sh
index 2a9ebc9..729353a 100755
--- a/support/misc/relocate-sdk.sh
+++ b/support/misc/relocate-sdk.sh
@@ -5,7 +5,7 @@ if [ "$#" -ne 0 ]; then
     exit 1
 fi
 
-LOCFILE="usr/share/buildroot/sdk-location"
+LOCFILE="share/buildroot/sdk-location"
 FILEPATH="$(readlink -f "$0")"
 NEWPATH="$(dirname "${FILEPATH}")"
 
-- 
2.7.4
