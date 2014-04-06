From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Apr 2014 16:59:28 +0200
Subject: [Buildroot] [PATCH] support/check-kernel-headers: use mktemp
	instead of hand-crafted temp file
Message-ID: <1396796368-26000-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Instead of creating a temporary files with a dubious scheme, use mktemp,
which purpose is exactly that: creating temporary files

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - no space after '(' or before ')'  (Thomas)
---
 support/scripts/check-kernel-headers.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
index b511a08..2a0a301 100755
--- a/support/scripts/check-kernel-headers.sh
+++ b/support/scripts/check-kernel-headers.sh
@@ -8,7 +8,7 @@ HDR_M="${HDR_VER%%.*}"
 HDR_V="${HDR_VER#*.}"
 HDR_m="${HDR_V%%.*}"
 
-EXEC="/tmp/br.check-headers.$(uuidgen)"
+EXEC="$(mktemp --tmpdir check-headers.XXXXXX)"
 
 # By the time we get here, we do not always have the staging-dir
 # already populated (think external toolchain), so we can not use
-- 
1.8.3.2
