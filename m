From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon,  7 Dec 2015 12:08:45 -0200
Subject: [Buildroot] [PATCH 1/1] merge_config.sh: create temporary files in
	/tmp
Message-ID: <1449497325-5148-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Henrique Marks <henrique.marks@datacom.ind.br>

Creating temporary files in /tmp (or the path pointed by $TMPDIR) allows the
buildroot top directory to be read-only and shareable between multible builds.
This follows what other scripts do, e.g. check-kernel-headers.sh.

Signed-off-by: Henrique Marks <henrique.marks@datacom.ind.br>
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 support/kconfig/merge_config.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
index 81b0c61..8a1708b 100755
--- a/support/kconfig/merge_config.sh
+++ b/support/kconfig/merge_config.sh
@@ -82,7 +82,7 @@ shift;
 
 MERGE_LIST=$*
 SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
-TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
+TMP_FILE=$(mktemp -t .tmp.config.XXXXXXXXXX)
 
 echo "Using $INITFILE as base"
 cat $INITFILE > $TMP_FILE
-- 
2.5.0
