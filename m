From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 20:40:57 +0200
Subject: [Buildroot] [git commit] check-kernel-headers: mktemp --tmpdir not
	available on RedHat RHEL5
Message-ID: <20140928191300.0F93F9D791@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53223cbb4e775ce88c036ddbfcca260e23c5739e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mktemp --tmpdir is not available on older Redhat RHEL5 machines. The
alternative that has the same behavior is 'mktemp -t'.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/check-kernel-headers.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/support/scripts/check-kernel-headers.sh b/support/scripts/check-kernel-headers.sh
index 82cf9ac..a8cca78 100755
--- a/support/scripts/check-kernel-headers.sh
+++ b/support/scripts/check-kernel-headers.sh
@@ -8,7 +8,7 @@ HDR_M="${HDR_VER%%.*}"
 HDR_V="${HDR_VER#*.}"
 HDR_m="${HDR_V%%.*}"
 
-EXEC="$(mktemp --tmpdir check-headers.XXXXXX)"
+EXEC="$(mktemp -t check-headers.XXXXXX)"
 
 # We do not want to account for the patch-level, since headers are
 # not supposed to change for different patchlevels, so we mask it out.
