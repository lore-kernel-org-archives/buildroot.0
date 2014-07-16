From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 10:05:00 +0200
Subject: [Buildroot] [git commit] quagga: depends on MMU
Message-ID: <20140716080523.41D819D25E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26b482990870bdc9921ceaa3204eaf513e0be165
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/1c5/1c5fdfe3a0248b65efdea0594d8367ff907015d4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/quagga/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/quagga/Config.in b/package/quagga/Config.in
index e79ab02..ebec2c8 100644
--- a/package/quagga/Config.in
+++ b/package/quagga/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QUAGGA
 	bool "quagga"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Routing software suite, providing implementations of
 	  OSPFv2, OSPFv3 (IPv6), RIP v1 and v2, RIPng (IPv6) and BGPv4+.
