From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Sat, 10 Feb 2018 21:03:30 -0500
Subject: [Buildroot] [PATCH 1/1] qt5webkit: add missing icu dependency
Message-ID: <20180211020330.32658-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Qt WebKit requires icu to be build.

The Config.in is already selecting BR2_PACKAGE_QT5BASE_ICU but the
dependency is missing from the QT5WEBKIT_DEPENDENCIES list in
qt5webkit.mk.

Add icu to the list.

Fixes:

	>>> qt5webkit 5.9.1 Configuring
	...
	Running configure tests...

	Checking for fontconfig... no
	Checking for gccdepends... yes
	Checking for glx... no
	Checking for gnuld... yes
	Checking for icu... no
	Checking for leveldb... no
	Checking for libsqlite3... yes
	Checking for libwebp... no
	Checking for libXcomposite... no
	Checking for libxml2... no
	Checking for libXrender... no
	Checking for libxslt... no
	Checking for libzlib... yes
	Project MESSAGE: PKG_CONFIG_LIBDIR automatically set to /home/gportay/src/buildroot/output-beaglebone_qt5/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/pkgconfig:/home/gportay/src/buildroot/output-beaglebone_qt5/host/arm-buildroot-linux-gnueabihf/sysroot/usr/share/pkgconfig:/home/gportay/src/buildroot/output-beaglebone_qt5/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/arm-buildroot-linux-gnueabihf/pkgconfig
	Project MESSAGE: PKG_CONFIG_SYSROOT_DIR automatically set to /home/gportay/src/buildroot/output-beaglebone_qt5/host/arm-buildroot-linux-gnueabihf/sysroot
	Negative repeat count does nothing at /home/gportay/src/buildroot/output-beaglebone_qt5/build/qt5webkit-5.9.1/Tools/qmake/dump-features.pl line 17.
	Negative repeat count does nothing at /home/gportay/src/buildroot/output-beaglebone_qt5/build/qt5webkit-5.9.1/Tools/qmake/dump-features.pl line 17.
	Negative repeat count does nothing at /home/gportay/src/buildroot/output-beaglebone_qt5/build/qt5webkit-5.9.1/Tools/qmake/dump-features.pl line 17.
	Negative repeat count does nothing at /home/gportay/src/buildroot/output-beaglebone_qt5/build/qt5webkit-5.9.1/Tools/qmake/dump-features.pl line 17.

	Final configuration:

	Build ......................... webkit2
	Configuration ................. release
	All-in-one files .............. no
	GNUmake ....................... yes
	Static libs as shared ......... no
	Static libs as thin archives .. yes
	Production build .............. yes

	Have .......................... qtquick qttestlib sqlite3
	Use ........................... tiled_backing_store cross_platform_context_menus zlib 3d_graphics leveldb
	Features ...................... fast_mobile_scrolling gesture_events inspector_server legacy_viewport_adaption smooth_scrolling subpixel_layout touch_adjustment view_mode_css_media plugin_architecture_unsupported

	3D Rendering .................. yes
	Accelerated 2D Canvas ......... yes
	Battery Status ................ no
	Blob .......................... yes
	Canvas Path ................... yes
	CanvasProxy ................... no
	Channel Messaging ............. yes
	Content Security Policy 1.1 ... no
	CSS Device Adaptation ......... no
	CSS Exclusions ................ yes
	CSS Shapes .................... yes
	CSS Filters ................... yes
	CSS3 Conditional Rules support (i.e. @supports)  no
	CSS3 Text ..................... no
	CSS3 Text Line Break .......... no
	CSS box-decoration-break ...... yes
	CSS image-orientation ......... no
	CSS image-resolution .......... no
	CSS image-set ................. yes
	CSS Regions ................... yes
	CSS Shaders ................... no
	CSS sticky position ........... yes
	CSS Compositing ............... yes
	Support for unprefixed CSS animations and transforms  yes
	CSS Variable .................. no
	Custom Scheme Handler ......... no
	Datalist Element .............. yes
	Data Transfer Items ........... no
	Details Element ............... yes
	Device Orientation ............ no
	Dialog Element ................ no
	Directory Upload .............. no
	Expose DOM4 Events constructors  no
	Download Attribute ............ yes
	File System ................... no
	Filters ....................... yes
	Font Load Events .............. no
	FTP Directory ................. yes
	Fullscreen API ................ yes
	Gamepad ....................... yes
	Geolocation ................... no
	High DPI Canvas ............... no
	Icondatabase .................. yes
	Iframe seamless attribute ..... yes
	Indexed Database .............. yes
	Input Speech .................. no
	Input Type Color .............. yes
	Input Type Date ............... no
	Broken Input Type Datetime .... no
	Input Type Datetimelocal ...... no
	Input Type Month .............. no
	Input Type Time ............... no
	Input Type Week ............... no
	Inspector ..................... yes
	JavaScript Debugger ........... yes
	Legacy Notifications .......... yes
	Legacy Vendor Prefix .......... yes
	Legacy Web Audio .............. yes
	Link Prefetch ................. yes
	MathML ........................ no
	Media Capture ................. no
	Media Source .................. no
	Media Statistics .............. no
	Media Stream .................. no
	Meter Element ................. yes
	MHTML ......................... yes
	Microdata ..................... no
	Scaled mouse cursor ........... no
	Navigator Content Utils ....... no
	Netscape Plugin API ........... no
	Network Info .................. no
	Support for 'X-Content-Type-Options: nosniff'  no
	Notifications ................. yes
	Orientation Events ............ no
	Page Visibility API ........... yes
	Performance Timeline .......... no
	Progress Element .............. yes
	Proximity Events .............. no
	Quota ......................... no
	Resolution media query ........ yes
	Resource Timing ............... no
	Request Animation Frame ....... yes
	Seccomp Filter sandbox ........ no
	Scripted Speech ............... no
	Shadow DOM .................... no
	Shared Workers ................ yes
	SQL Database .................. yes
	Style Scoped .................. no
	Suid sandbox for linux ........ no
	SVG ........................... yes
	SVG Fonts ..................... yes
	HTMLTemplateElement ........... no
	Text Autosizing ............... no
	Tiled Backing Store ........... no
	Threaded HTML parser .......... no
	Touch Events .................. yes
	Touch Slider .................. yes
	Touch Icon Loading Support .... no
	User Timing ................... no
	Vibration ..................... no
	Video ......................... no
	Video Track ................... no
	WebGL ......................... yes
	Web Audio ..................... no
	Web Sockets ................... yes
	Web Timing .................... yes
	Workers ....................... yes
	XHR Timeout ................... yes
	XSLT .......................... no

	Encountered 4 configuration warning(s):

	 ! Qt not configured to use system libjpeg, QImageDecoder will decode JPEG images
	 ! Qt not configured to use system libpng, QImageDecoder will decode PNG images
	 ! Missing GStreamer or QtMultimedia, disabling HTML5 media element support
	 ! Missing QtWidgets module, disabling WebKit1

	The WebKit build was disabled for the following reasons:
	    * ICU is required.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5webkit/qt5webkit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index 7925b114e6..3b218a5385 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -16,7 +16,7 @@ endif
 QT5WEBKIT_SOURCE = qtwebkit-opensource-src-$(QT5WEBKIT_VERSION).tar.xz
 QT5WEBKIT_DEPENDENCIES = \
 	host-bison host-flex host-gperf host-python host-ruby \
-	qt5base sqlite
+	icu qt5base sqlite
 QT5WEBKIT_INSTALL_STAGING = YES
 
 QT5WEBKIT_LICENSE_FILES = Source/WebCore/LICENSE-LGPL-2 Source/WebCore/LICENSE-LGPL-2.1
-- 
2.15.1
