From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 02 Sep 2014 11:25:45 +0200
Subject: [Buildroot] [PATCH 1 of 2] check-kernel-headers: mktemp --tmpdir
 not available on RedHat 5
In-Reply-To: <patchbomb.1409649944@localhost>
References: <patchbomb.1409649944@localhost>
Message-ID: <2c7735c0247a4c83a3c2.1409649945@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

# HG changeset patch
# User Thomas De Schampheleire <thomas.de_schampheleire@alcatel-lucent.com>
# Date 1407153076 -7200
#      Mon Aug 04 13:51:16 2014 +0200
# Node ID 2c7735c0247a4c83a3c2ea1d58e74be613465255
# Parent  6af0c3866b64670bb6d62302b64f3164b1f70fb6
check-kernel-headers: mktemp --tmpdir not available on RedHat 5

mktemp --tmpdir is not available on older Redhat 5 machines. The alternative
that has the same behavior is 'mktemp -t'.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 support/scripts/check-kernel-headers.sh |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
--- a/support/scripts/check-kernel-headers.sh
+++ b/support/scripts/check-kernel-headers.sh
@@ -8,7 +8,7 @@
 HDR_V="${HDR_VER#*.}"
 HDR_m="${HDR_V%%.*}"
 
-EXEC="$(mktemp --tmpdir check-headers.XXXXXX)"
+EXEC="$(mktemp -t check-headers.XXXXXX)"
 
 # We do not want to account for the patch-level, since headers are
 # not supposed to change for different patchlevels, so we mask it out.
