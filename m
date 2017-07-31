From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 19:09:09 +0200
Subject: [Buildroot] [git commit] package/f*: fix wrapping of Config.in help
	text
Message-ID: <20170731170652.7190E7FCEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30cf833b88e7e374ff13010e013ce7c7fee2956a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check-package script when ran gives warnings on text wrapping
on all of these Config files.  This patch cleans up all warnings
related to the text wrapping for the Config files starting with
the letter f in the package directory.

The appropriate indentation is: <tab><2 spaces><62 chars>
See http://nightly.buildroot.org/#writing-rules-config-in for more
information.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/fbdump/Config.in        | 8 ++++----
 package/fbgrab/Config.in        | 4 ++--
 package/fbset/Config.in         | 7 ++++---
 package/fbv/Config.in           | 6 +++---
 package/fdk-aac/Config.in       | 6 +++---
 package/fetchmail/Config.in     | 3 ++-
 package/ffmpeg/Config.in        | 4 ++--
 package/fftw/Config.in          | 8 ++++----
 package/ficl/Config.in          | 6 +++---
 package/flot/Config.in          | 6 ++++--
 package/fmc/Config.in           | 8 ++++----
 package/fmlib/Config.in         | 9 +++++----
 package/fmt/Config.in           | 6 +++---
 package/fontconfig/Config.in    | 3 ++-
 package/freescale-imx/Config.in | 5 +++--
 package/ftop/Config.in          | 3 ++-
 package/fxload/Config.in        | 9 +++++----
 17 files changed, 55 insertions(+), 46 deletions(-)

diff --git a/package/fbdump/Config.in b/package/fbdump/Config.in
index 982448d..c102fe2 100644
--- a/package/fbdump/Config.in
+++ b/package/fbdump/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_FBDUMP
 	bool "fbdump (Framebuffer Capture Tool)"
 	help
-	  fbdump is a simple tool to capture snapshots from the Linux kernel
-	  framebuffer  device and write them out as a PPM file. Currently,
-	  most packed-pixel framebuffer formats and the vga16 framebuffer
-	  are supported.
+	  fbdump is a simple tool to capture snapshots from the Linux
+	  kernel framebuffer  device and write them out as a PPM file.
+	  Currently, most packed-pixel framebuffer formats and the vga16
+	  framebuffer are supported.
 
 	  http://www.rcdrummond.net/fbdump
diff --git a/package/fbgrab/Config.in b/package/fbgrab/Config.in
index f3b29d9..d1e9e69 100644
--- a/package/fbgrab/Config.in
+++ b/package/fbgrab/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_FBGRAB
 	bool "fbgrab"
 	select BR2_PACKAGE_LIBPNG
 	help
-	  FBGrab is a framebuffer screenshot program, capturing the linux
-	  frambuffer and converting it to a png-picture.
+	  FBGrab is a framebuffer screenshot program, capturing the
+	  linux frambuffer and converting it to a png-picture.
 
 	  http://fbgrab.monells.se/
diff --git a/package/fbset/Config.in b/package/fbset/Config.in
index c3f8d0b..b4ef41f 100644
--- a/package/fbset/Config.in
+++ b/package/fbset/Config.in
@@ -2,8 +2,9 @@ config BR2_PACKAGE_FBSET
 	bool "fbset"
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	help
-	  Fbset is a system utility to show or change the settings of the frame
-	  buffer device. The frame buffer device provides a simple and unique
-	  interface to access different kinds of graphic displays.
+	  Fbset is a system utility to show or change the settings of
+	  the frame buffer device. The frame buffer device provides a
+	  simple and unique interface to access different kinds of
+	  graphic displays.
 
 	  http://users.telenet.be/geertu/Linux/fbdev/
diff --git a/package/fbv/Config.in b/package/fbv/Config.in
index 3160a85..2206276 100644
--- a/package/fbv/Config.in
+++ b/package/fbv/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_FBV
 	bool "fbv"
 	help
-	  fbv is a very simple graphic file viewer for the framebuffer console,
-	  capable of displaying GIF, JPEG, PNG and BMP files using libungif,
-	  libjpeg and libpng.
+	  fbv is a very simple graphic file viewer for the framebuffer
+	  console, capable of displaying GIF, JPEG, PNG and BMP files
+	  using libungif, libjpeg and libpng.
 
 	  http://freshmeat.net/projects/fbv/
 
diff --git a/package/fdk-aac/Config.in b/package/fdk-aac/Config.in
index f51c5ab..111de41 100644
--- a/package/fdk-aac/Config.in
+++ b/package/fdk-aac/Config.in
@@ -10,9 +10,9 @@ config BR2_PACKAGE_FDK_AAC
 	depends on BR2_PACKAGE_FDK_AAC_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
-	  The Fraunhofer FDK AAC Codec Library for Android ("FDK AAC Codec")
-	  is software that implements the MPEG Advanced Audio Coding ("AAC")
-	  encoding and decoding scheme for digital audio
+	  The Fraunhofer FDK AAC Codec Library for Android ("FDK AAC
+	  Codec") is software that implements the MPEG Advanced Audio
+	  Coding ("AAC") encoding and decoding scheme for digital audio
 
 	  http://sourceforge.net/projects/opencore-amr/files/fdk-aac/
 
diff --git a/package/fetchmail/Config.in b/package/fetchmail/Config.in
index 62f4f84..a4bf5a7 100644
--- a/package/fetchmail/Config.in
+++ b/package/fetchmail/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_FETCHMAIL
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Fetchmail - the mail-retrieval daemon
-	  Client daemon to move mail from POP and IMAP to your local computer
+	  Client daemon to move mail from POP and IMAP to your local
+	  computer
 
 	  http://www.fetchmail.info/
diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 279f94f..ed87ddd 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -15,8 +15,8 @@ menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	help
-	  FFmpeg is a complete, cross-platform solution to record, convert
-	  and stream audio and video.
+	  FFmpeg is a complete, cross-platform solution to record,
+	  convert and stream audio and video.
 
 	  http://www.ffmpeg.org
 
diff --git a/package/fftw/Config.in b/package/fftw/Config.in
index ef11384..d51f8f3 100644
--- a/package/fftw/Config.in
+++ b/package/fftw/Config.in
@@ -33,15 +33,15 @@ config BR2_PACKAGE_FFTW_PRECISION_SINGLE
 	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
 	select BR2_PACKAGE_FFTW_USE_NEON if BR2_ARM_CPU_HAS_NEON && !BR2_ARM_SOFT_FLOAT
 	help
-	  Compile fftw in single precision, i.e. use 'float' for floating
-	  point type.
+	  Compile fftw in single precision, i.e. use 'float' for
+	  floating point type.
 
 config BR2_PACKAGE_FFTW_PRECISION_DOUBLE
 	bool "double"
 	select BR2_PACKAGE_FFTW_USE_SSE2 if BR2_X86_CPU_HAS_SSE2
 	help
-	  Compile fftw in double precision (the default), i.e. use 'double'
-	  for floating point type.
+	  Compile fftw in double precision (the default), i.e. use
+	  'double' for floating point type.
 
 config BR2_PACKAGE_FFTW_PRECISION_LONG_DOUBLE
 	bool "long double"
diff --git a/package/ficl/Config.in b/package/ficl/Config.in
index 3445a64..4d9ab4a 100644
--- a/package/ficl/Config.in
+++ b/package/ficl/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_FICL
 	bool "ficl"
 	help
-	  Ficl is a programming language interpreter designed to be embedded
-	  into other systems as a command, macro, and development
-	  prototyping language.
+	  Ficl is a programming language interpreter designed to be
+	  embedded into other systems as a command, macro, and
+	  development prototyping language.
 	  Ficl is an acronym for "Forth Inspired Command Language".
 
 	  http://ficl.sourceforge.net
diff --git a/package/flot/Config.in b/package/flot/Config.in
index 4c0d3ec..4044872 100644
--- a/package/flot/Config.in
+++ b/package/flot/Config.in
@@ -44,7 +44,8 @@ config BR2_PACKAGE_FLOT_ERRORBARS
 config BR2_PACKAGE_FLOT_FILLBETWEEN
 	bool "fillbetween"
 	help
-	  Flot plugin for computing bottoms for filled line and bar charts
+	  Flot plugin for computing bottoms for filled line and bar
+	  charts
 
 config BR2_PACKAGE_FLOT_IMAGE
 	bool "image"
@@ -54,7 +55,8 @@ config BR2_PACKAGE_FLOT_IMAGE
 config BR2_PACKAGE_FLOT_NAVIGATE
 	bool "navigate"
 	help
-	  Flot plugin for adding panning and zooming capabilities to a plot
+	  Flot plugin for adding panning and zooming capabilities to a
+	  plot
 
 config BR2_PACKAGE_FLOT_PIE
 	bool "pie"
diff --git a/package/fmc/Config.in b/package/fmc/Config.in
index b7398e2..4399aa2 100644
--- a/package/fmc/Config.in
+++ b/package/fmc/Config.in
@@ -15,11 +15,11 @@ config BR2_PACKAGE_FMC
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_FMLIB
 	help
-	  The Frame Manager Configuration tool is Freescale PowerPC platform
-	  software package whose primary purpose is converting
+	  The Frame Manager Configuration tool is Freescale PowerPC
+	  platform software package whose primary purpose is converting
 	  Parse-Classify-Police-Distribute (PCD) descriptions of network
 	  packets flow into hardware configuration. The tool provides an
-	  abstraction layer between the end customer's vision of the PCD task
-	  definition and real hardware implementation.
+	  abstraction layer between the end customer's vision of the PCD
+	  task definition and real hardware implementation.
 
 	  http://cache.freescale.com/files/32bit/doc/app_note/AN4760.pdf
diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
index d399cab..df4ae44 100644
--- a/package/fmlib/Config.in
+++ b/package/fmlib/Config.in
@@ -7,10 +7,11 @@ config BR2_PACKAGE_FMLIB
 	depends on BR2_powerpc_e500mc || BR2_powerpc_e6500
 	depends on BR2_LINUX_KERNEL
 	help
-	  The Frame Manager library provides Freescale PowerPC platforms an
-	  API on top of the Frame Manager driver ioctl calls, that provides
-	  a user space application with a simple way to configure driver
-	  parameters and PCD (parse - classify - distribute) rules.
+	  The Frame Manager library provides Freescale PowerPC platforms
+	  an API on top of the Frame Manager driver ioctl calls, that
+	  provides a user space application with a simple way to
+	  configure driver parameters and PCD (parse - classify -
+	  distribute) rules.
 
 	  http://git.freescale.com/git/cgit.cgi/ppc/sdk/fmlib.git/tree/README
 
diff --git a/package/fmt/Config.in b/package/fmt/Config.in
index 979d940..69a6fb8 100644
--- a/package/fmt/Config.in
+++ b/package/fmt/Config.in
@@ -3,9 +3,9 @@ config BR2_PACKAGE_FMT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	help
-	  fmt is an open-source formatting library for C++. It can be used
-	  as a safe alternative to printf or as a fast alternative to
-	  IOStreams.
+	  fmt is an open-source formatting library for C++. It can be
+	  used as a safe alternative to printf or as a fast alternative
+	  to IOStreams.
 
 comment "fmt needs a toolchain w/ C++, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
diff --git a/package/fontconfig/Config.in b/package/fontconfig/Config.in
index 1c54a43..218fdb2 100644
--- a/package/fontconfig/Config.in
+++ b/package/fontconfig/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_EXPAT
 	help
-	  Fontconfig is a library for configuring and customizing font access.
+	  Fontconfig is a library for configuring and customizing font
+	  access.
 
 	  http://www.fontconfig.org/
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 056728f..656b44b 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -2,8 +2,9 @@ menuconfig BR2_PACKAGE_FREESCALE_IMX
 	bool "Freescale i.MX libraries"
 	depends on BR2_arm
 	help
-	  Those packages provide hardware acceleration for GPU or VPU, hardware
-	  optimization or some hardware tools for Freescale i.MX platforms.
+	  Those packages provide hardware acceleration for GPU or VPU,
+	  hardware optimization or some hardware tools for Freescale
+	  i.MX platforms.
 
 if BR2_PACKAGE_FREESCALE_IMX
 choice
diff --git a/package/ftop/Config.in b/package/ftop/Config.in
index aefe4f5..bee70bf 100644
--- a/package/ftop/Config.in
+++ b/package/ftop/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_FTOP
 	select BR2_PACKAGE_NCURSES
 	help
 	  Ftop is to files what top is to processes.
-	  The progress of all open files and file systems can be monitored.
+	  The progress of all open files and file systems can be
+	  monitored.
 
 	  https://sourceforge.net/projects/ftop/
diff --git a/package/fxload/Config.in b/package/fxload/Config.in
index d178e2c..88cc6d1 100644
--- a/package/fxload/Config.in
+++ b/package/fxload/Config.in
@@ -5,9 +5,10 @@ config BR2_PACKAGE_FXLOAD
 	# Microblaze, just disable it on this architecture.
 	depends on !BR2_microblaze
 	help
-	  This program is conveniently able to download firmware into FX, FX2,
-	  and FX2LP EZ-USB devices, as well as the original AnchorChips EZ-USB.
-	  It is intended to be invoked by hotplug scripts when the unprogrammed
-	  device appears on the bus.
+	  This program is conveniently able to download firmware into
+	  FX, FX2, and FX2LP EZ-USB devices, as well as the original
+	  AnchorChips EZ-USB.
+	  It is intended to be invoked by hotplug scripts when the
+	  unprogrammed device appears on the bus.
 
 	  http://sourceforge.net/projects/linux-hotplug/
