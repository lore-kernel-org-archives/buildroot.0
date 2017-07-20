From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jul 2017 15:47:41 +0200
Subject: [Buildroot] [git commit] support/scripts: relocate-sdk.sh now
	creates sdk-location in share/buildroot
Message-ID: <20170720134343.87CD080DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c542ba06d0eae5742f7729474cedd0fad88e75c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is because $(HOST_DIR)/usr is gone.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
