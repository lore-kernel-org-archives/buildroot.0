From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 14 Feb 2013 10:03:01 -0300
Subject: [Buildroot] [PATCH 2/2] libcurl: packages that use it need mmu also
In-Reply-To: <1360846981-26122-1-git-send-email-gustavo@zacarias.com.ar>
References: <1360846981-26122-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1360846981-26122-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/b812b8931a7291ea8969c9818aea1044ee302c20

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/Config.in                   | 6 ++++++
 package/feh/Config.in                        | 1 +
 package/midori/Config.in                     | 1 +
 package/multimedia/gst-plugins-bad/Config.in | 1 +
 package/multimedia/mpd/Config.in             | 1 +
 package/multimedia/vorbis-tools/Config.in    | 1 +
 package/rtorrent/Config.in                   | 1 +
 package/transmission/Config.in               | 1 +
 package/webkit/Config.in                     | 1 +
 9 files changed, 14 insertions(+)

diff --git a/package/collectd/Config.in b/package/collectd/Config.in
index 74419f6..0fbe3f7 100644
--- a/package/collectd/Config.in
+++ b/package/collectd/Config.in
@@ -69,6 +69,7 @@ comment "Select at least one for collectd to be useful"
 config BR2_PACKAGE_COLLECTD_APACHE
 	bool "apache"
 	select BR2_PACKAGE_LIBCURL
+	depends on BR2_USE_MMU # libcurl
 	help
 	  Collects Apache's mod_status information.
 
@@ -85,6 +86,7 @@ config BR2_PACKAGE_COLLECTD_BATTERY
 config BR2_PACKAGE_COLLECTD_BIND
 	bool "bind"
 	select BR2_PACKAGE_LIBCURL
+	depends on BR2_USE_MMU # libcurl
 	select BR2_PACKAGE_LIBXML2
 	help
 	  Collects BIND DNS statistics.
@@ -112,6 +114,7 @@ config BR2_PACKAGE_COLLECTD_CPUFREQ
 config BR2_PACKAGE_COLLECTD_CURL
 	bool "curl"
 	select BR2_PACKAGE_LIBCURL
+	depends on BR2_USE_MMU # libcurl
 	help
 	  Uses libcurl to read files and then parses them according
 	  to the configuration.
@@ -120,6 +123,7 @@ config BR2_PACKAGE_COLLECTD_CURL_JSON
 	bool "curl-json"
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_YAJL
+	depends on BR2_USE_MMU # libcurl
 	help
 	  Queries JSON data using the cURL library and parses it
 	  according to the user's configuration using YAJL.
@@ -128,6 +132,7 @@ config BR2_PACKAGE_COLLECTD_CURL_XML
 	bool "curl-xml"
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBXML2
+	depends on BR2_USE_MMU # libcurl
 	help
 	  Reads files using libcurl and parses it as XML.
 
@@ -382,6 +387,7 @@ config BR2_PACKAGE_COLLECTD_UNIXSOCK
 config BR2_PACKAGE_COLLECTD_WRITEHTTP
 	bool "writehttp"
 	select BR2_PACKAGE_LIBCURL
+	depends on BR2_USE_MMU # libcurl
 	help
 	  Sends values collected to a web-server using HTTP POST and PUTVAL.
 
diff --git a/package/feh/Config.in b/package/feh/Config.in
index 31e7239..e7c3b7a 100644
--- a/package/feh/Config.in
+++ b/package/feh/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FEH
 	bool "feh"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # libcurl
 	select BR2_PACKAGE_XLIB_LIBXINERAMA
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_IMLIB2_PNG
diff --git a/package/midori/Config.in b/package/midori/Config.in
index 41f4515..18d37fa 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_MIDORI
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_INSTALL_LIBSTDCPP # webkit
 	depends on BR2_USE_WCHAR	 # webkit
+	depends on BR2_USE_MMU # webkit->libcurl
 	help
 	  Midori is a lightweight web browser based on WebKit
 
diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
index 370259b..e9927d2 100644
--- a/package/multimedia/gst-plugins-bad/Config.in
+++ b/package/multimedia/gst-plugins-bad/Config.in
@@ -258,6 +258,7 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CDAUDIO
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_CURL
 	bool "curl"
 	select BR2_PACKAGE_LIBCURL
+	depends on BR2_USE_MMU # libcurl
 
 config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DIRECTFB
 	bool "directfb"
diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
index 6e5c690..b8dd31a 100644
--- a/package/multimedia/mpd/Config.in
+++ b/package/multimedia/mpd/Config.in
@@ -55,6 +55,7 @@ config BR2_PACKAGE_MPD_BZIP2
 config BR2_PACKAGE_MPD_CURL
 	bool "curl"
 	select BR2_PACKAGE_LIBCURL
+	depends on BR2_USE_MMU # libcurl
 	help
 	  Enable curl streaming (http) support.
 
diff --git a/package/multimedia/vorbis-tools/Config.in b/package/multimedia/vorbis-tools/Config.in
index 6092e01..6442ffb 100644
--- a/package/multimedia/vorbis-tools/Config.in
+++ b/package/multimedia/vorbis-tools/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_VORBIS_TOOLS
 	select BR2_PACKAGE_LIBOGG
 	select BR2_PACKAGE_LIBVORBIS
 	select BR2_PACKAGE_LIBCURL
+	depends on BR2_USE_MMU # libcurl
 	help
 	  Standalone player, encoder and decoder for Ogg format files.
 
diff --git a/package/rtorrent/Config.in b/package/rtorrent/Config.in
index 142ff8b..ae94b0d 100644
--- a/package/rtorrent/Config.in
+++ b/package/rtorrent/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_RTORRENT
 	bool "rtorrent"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
+	depends on BR2_USE_MMU # libcurl
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBSIGC
 	select BR2_PACKAGE_LIBTORRENT
diff --git a/package/transmission/Config.in b/package/transmission/Config.in
index 9284075..0362eb0 100644
--- a/package/transmission/Config.in
+++ b/package/transmission/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_TRANSMISSION
 	bool "transmission"
 	depends on BR2_INET_IPV6
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # libcurl
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LIBCURL
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 34071e4..02a1a15 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_WEBKIT
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_USE_MMU # libcurl
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBXML2
-- 
1.7.12.4
