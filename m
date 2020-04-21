From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 21 Apr 2020 08:08:53 -0500
Subject: [Buildroot] [PATCH] package/swupdate: note init script tokenizing
 limitation
Message-ID: <20200421130853.34356-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Command line options reference:
https://sbabic.github.io/swupdate/_sources/swupdate.txt

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---

I didn't find a good way around this without completely changing
how the upstream scripts were working or requiring a full shell.
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
-- 
2.17.1
