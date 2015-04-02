From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Apr 2015 23:38:46 +0200
Subject: [Buildroot] [git commit] package/ti-gfx: bump version, add hashes
Message-ID: <20150402214451.2121681976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da3e876db79fb744d820da8f708f2a52383edc8c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't bump the softfp version, because there's still no newer release
(probably softfp will never be updated).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ti-gfx/ti-gfx.hash |    3 +++
 package/ti-gfx/ti-gfx.mk   |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/package/ti-gfx/ti-gfx.hash b/package/ti-gfx/ti-gfx.hash
new file mode 100644
index 0000000..d97b559
--- /dev/null
+++ b/package/ti-gfx/ti-gfx.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  54641222cdb49b03f996cbd6412de227198d9e084f5647d706bbf4217e8cdb07  Graphics_SDK_setuplinux_hardfp_5_01_01_02.bin
+sha256  99dae9d33790c87860e828505ac07c5b864ef65d8372b39117704db6b78494ff  Graphics_SDK_setuplinux_softfp_5_01_00_01.bin
diff --git a/package/ti-gfx/ti-gfx.mk b/package/ti-gfx/ti-gfx.mk
index c831dae..061e9fe 100644
--- a/package/ti-gfx/ti-gfx.mk
+++ b/package/ti-gfx/ti-gfx.mk
@@ -7,7 +7,7 @@
 # SDK 5_01_01_01 only support EABIhf so we downgrade to 5_01_00_01 if EABIhf is
 # not available.
 ifeq ($(BR2_ARM_EABIHF),y)
-TI_GFX_VERSION = 5_01_01_01
+TI_GFX_VERSION = 5_01_01_02
 TI_GFX_SOURCE = Graphics_SDK_setuplinux_hardfp_$(TI_GFX_VERSION).bin
 else
 TI_GFX_VERSION = 5_01_00_01
