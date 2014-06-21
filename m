From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Jun 2014 19:35:23 +0200
Subject: [Buildroot] [git commit] torsmo: needs mmu
Message-ID: <20140621173543.48CEB9D06F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5ef7fcb66606f0384e584bc3476b7b07b3712b78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/28f/28ffabf47643dfdb646ec98a56978db75fc84c05/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/torsmo/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/torsmo/Config.in b/package/torsmo/Config.in
index 7d309da..a3943bd 100644
--- a/package/torsmo/Config.in
+++ b/package/torsmo/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TORSMO
 	bool "torsmo"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	help
