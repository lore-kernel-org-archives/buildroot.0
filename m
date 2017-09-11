From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Mon, 11 Sep 2017 15:32:32 -0400
Subject: [Buildroot] [PATCH] support/download: fix check_one_hash description
Message-ID: <20170911193232.3072-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Function check_one_hash takes three arguments:
 - algo hash
 - known hash
 - file to hash

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 support/download/check-hash | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/download/check-hash b/support/download/check-hash
index c1ff53c02b..fe9c10570e 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -42,8 +42,9 @@ if [ ! -f "${h_file}" ]; then
 fi
 
 # Check one hash for a file
-# $1: known hash
-# $2: file (full path)
+# $1: algo hash
+# $2: known hash
+# $3: file (full path)
 check_one_hash() {
     _h="${1}"
     _known="${2}"
-- 
2.13.2
