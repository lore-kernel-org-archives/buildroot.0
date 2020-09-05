From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 5 Sep 2020 10:14:37 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] manual: board support:
 add more of our expectations
Message-ID: <20200905082724.1313780AEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc04ce007eebefbd36e1c097a4a7deb924c9474b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

The manual has a section on adding board support to upstream buildroot,
but it fails to mention some of the things we expect. Add more of them.

- Internal toolchain.
- Beautify defconfig file.
- Fixed versions for components.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Adam Duskett <Aduskett@gmail.com>
Reviewed-by: Adam Duskett <aduskett@gmail.com>
[yann.morin.1998 at free.fr:
  - use +monospace+ for the variables
  - use _italic_ for sections in defconfig
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit af6cffb64e3ba5e766bbf534f75cc6736f063e71)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-board-support.txt | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-board-support.txt b/docs/manual/adding-board-support.txt
index f6d74ae1f4..33ed709535 100644
--- a/docs/manual/adding-board-support.txt
+++ b/docs/manual/adding-board-support.txt
@@ -10,9 +10,9 @@ that is known to work. You are welcome to add support for other boards
 to Buildroot too.
 
 To do so, you need to create a normal Buildroot configuration that
-builds a basic system for the hardware: toolchain, kernel, bootloader,
-filesystem and a simple BusyBox-only userspace. No specific package
-should be selected: the configuration should be as minimal as
+builds a basic system for the hardware: (internal) toolchain, kernel,
+bootloader, filesystem and a simple BusyBox-only userspace. No specific
+package should be selected: the configuration should be as minimal as
 possible, and should only build a working basic BusyBox system for the
 target platform. You can of course use more complicated configurations
 for your internal projects, but the Buildroot project will only
@@ -22,7 +22,17 @@ selections are highly application-specific.
 Once you have a known working configuration, run +make
 savedefconfig+. This will generate a minimal +defconfig+ file at the
 root of the Buildroot source tree. Move this file into the +configs/+
-directory, and rename it +<boardname>_defconfig+.
+directory, and rename it +<boardname>_defconfig+. If the configuration
+is a bit more complicated, it is nice to manually reformat it and
+separate it into sections, with a comment before each section. Typical
+sections are _Architecture_, _Toolchain options_ (typically just linux
+headers version), _Firmware_, _Bootloader_, _Kernel_, and _Filesystem_.
+
+Always use fixed versions or commit hashes for the different
+components, not the "latest" version. For example, set
++BR2_LINUX_KERNEL_CUSTOM_VERSION=y+ and
++BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE+ to the kernel version you tested
+with.
 
 It is recommended to use as much as possible upstream versions of the
 Linux kernel and bootloaders, and to use as much as possible default
