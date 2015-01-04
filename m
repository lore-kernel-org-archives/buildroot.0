From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Jan 2015 19:10:14 +0100
Subject: [Buildroot] [PATCH] support/download: further silence the git helper
Message-ID: <1420395014-8961-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We expresely call printf in the git helper, calls which were not
addresed in the previous silent-build patchset.

Just redirect stdout to oblivion when being silent.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/download/git | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/download/git b/support/download/git
index 7f1801f..73cbc0f 100755
--- a/support/download/git
+++ b/support/download/git
@@ -14,7 +14,7 @@ set -e
 verbose=-v
 while getopts :q OPT; do
     case "${OPT}" in
-    q)  verbose=-q;;
+    q)  verbose=-q; exec >/dev/null;;
     \?) printf "unknown option '%s'\n" "${OPTARG}" >&2; exit 1;;
     esac
 done
-- 
1.9.1
