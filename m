From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 18:26:28 +0200
Subject: [Buildroot] [git commit] dmidecode: enable for aarch64
Message-ID: <20180725162120.A7E0A8A37F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6e00a671bc227a8e567f485df9ccdbefb9a1d5c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

arm64 systems support SMBIOS, so update the dmidecode config
to allow building dmidecode for arm64.

Signed-off-by: Geoff Levand <geoff@infradead.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dmidecode/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dmidecode/Config.in b/package/dmidecode/Config.in
index 22272ed294..58e7a785ce 100644
--- a/package/dmidecode/Config.in
+++ b/package/dmidecode/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_DMIDECODE
 	bool "dmidecode"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_aarch64 || BR2_i386 || BR2_x86_64
 	help
 	  Dmidecode reports information about your system's hardware
 	  as described in your system BIOS according to the SMBIOS/DMI
