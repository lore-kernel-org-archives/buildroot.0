From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Apr 2017 09:45:10 +0200
Subject: [Buildroot] [git commit] pkg-stats: ignore additional package infra
	.mk files
Message-ID: <20170409074608.97D2C80335@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33b78b2ecf618d0b7afde5691c21c4ac69021e71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/pkg-stats | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 2870662..aab49d1 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -119,6 +119,8 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 	$i = "package/pkg-virtual.mk" -o \
 	$i = "package/pkg-download.mk" -o \
 	$i = "package/pkg-generic.mk" -o \
+	$i = "package/pkg-waf.mk" -o \
+	$i = "package/pkg-kernel-module.mk" -o \
 	$i = "package/pkg-utils.mk" ; then
 	echo "skipping $i" 1>&2
 	continue
