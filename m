From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 17:12:04 +0200
Subject: [Buildroot] [git commit] support/check-kernel-headers: use mktemp
	instead of hand-crafted temp file
Message-ID: <20140406151222.A26219C512@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=78b862186555bf82e0744e2890cb3c732af59e5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of creating a temporary files with a dubious scheme, use mktemp,
which purpose is exactly that: creating temporary files

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/check-kernel-headers.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
