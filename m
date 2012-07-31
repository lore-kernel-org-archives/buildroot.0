From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jul 2012 21:38:16 +0200
Subject: [Buildroot] [git commit branch/next] pkg-stats: ensure infratype is
	reset for every package
Message-ID: <20120802195303.A878C827F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=697f034f589e0cacaf01f57baa2b9015f7f3227d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/pkg-stats |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index ca2d0ec..de73eeb 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -105,6 +105,7 @@ for i in $(find boot/ linux/ package/ -name '*.mk' | sort) ; do
 
     hashost=0
     hastarget=0
+    infratype=""
 
     # Determine package infrastructure
     if grep -E "\(host-autotools-package\)" $i > /dev/null ; then
