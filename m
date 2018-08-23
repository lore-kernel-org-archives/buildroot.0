From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 21:18:20 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] dmidecode: enable for
 aarch64
Message-ID: <20180823191101.34D138E379@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f470492c0fd3bee1e1702436166d45dbbc4f99a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

arm64 systems support SMBIOS, so update the dmidecode config
to allow building dmidecode for arm64.

Signed-off-by: Geoff Levand <geoff@infradead.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6e00a671bc227a8e567f485df9ccdbefb9a1d5c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
