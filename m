From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jan 2021 23:21:21 +0100
Subject: [Buildroot] [git commit] package/swupdate: note init script
 tokenizing limitation
Message-ID: <20210107220346.519268690A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52683ea4073322d206e24d69de47744dc2fddc4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Command line options reference:
https://sbabic.github.io/swupdate/_sources/swupdate.txt

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swupdate/swupdate.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/swupdate/swupdate.sh b/package/swupdate/swupdate.sh
index 17d99ef0d4..31ec536373 100644
--- a/package/swupdate/swupdate.sh
+++ b/package/swupdate/swupdate.sh
@@ -5,6 +5,9 @@
 
 # Override these variables in sourced script(s) located
 # in /usr/lib/swupdate/conf.d or /etc/swupdate/conf.d
+# NOTE: There are substrings used in some swupdate commands which will
+#       need to be wrapped in a script to prevent tokenizing
+#       ( -p/-P post/pre cmds are good examples)
 SWUPDATE_ARGS="-v ${SWUPDATE_EXTRA_ARGS}"
 SWUPDATE_WEBSERVER_ARGS=""
 SWUPDATE_SURICATTA_ARGS=""
