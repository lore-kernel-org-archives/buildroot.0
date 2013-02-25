From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 25 Feb 2013 22:31:30 +0100
Subject: [Buildroot] [PATCH 10/11] manual: update generated lists
In-Reply-To: <cover.1361827174.git.s.martin49@gmail.com>
References: <cover.1361827174.git.s.martin49@gmail.com>
Message-ID: <0965f3ed7d7c62623f3fb2441dc2a0d6539c4763.1361827174.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/deprecated-list.txt   |  79 ++--
 docs/manual/host-package-list.txt |  19 +
 docs/manual/package-list.txt      | 930 ++++++++++++++++++++++++++++++++++++++
 docs/manual/pkg-list.txt          | 870 -----------------------------------
 4 files changed, 985 insertions(+), 913 deletions(-)
 create mode 100644 docs/manual/host-package-list.txt
 create mode 100644 docs/manual/package-list.txt
 delete mode 100644 docs/manual/pkg-list.txt

diff --git a/docs/manual/deprecated-list.txt b/docs/manual/deprecated-list.txt
index 6dc87a4..7bef3c8 100644
--- a/docs/manual/deprecated-list.txt
+++ b/docs/manual/deprecated-list.txt
@@ -1,46 +1,39 @@
-// -*- mode:doc -*- ;
-
-[[deprecated]]
-Deprecated list
----------------
-
-The following stuff are marked as _deprecated_ in Buildroot due to
-their status either too old or unmaintained.
-
-// list generated using the followings command:
-// $ git grep -EB4 'depends on BR2_DEPRECATED'
-// and
-// $ git grep -EB4 'depends on BR2_DEPRECATED' | \
-//     grep -Eo '(:|-).*?(config|comment) BR2_.*'
 //
-// Need manual checks and sorting.
-
-* Packages:
-
-** +busybox+ 1.18.x
-** +customize+
-** +lzma+
-** +microperl+
-** +netkitbase+
-** +netkittelnet+
-** +pkg-config+
-** +squashfs3+
-** +ttcp+
-
-* Toolchain:
-
-** +gdb+ 6.8
-** +gdb+ 7.0.1
-** +gdb+ 7.1
-** +kernel headers+ 2.6.37
-** +kernel headers+ 2.6.38
-** +kernel headers+ 2.6.39
-
-* Bootloaders:
-
-** +u-boot+ 2011-06
-** +u-boot+ 2011-09
+// Automatically generated list for Buildroot manual.
+// Buildroot 2013.02-rc2-00028-g4564f78-dirty
+// Generation date: 2013-02-25 19:45:02.967339
+//
 
-* Output images:
+[width="90%",cols="^1,4",options="header"]
+|===================================================
+| Packages                                 | Location
+
+| documentation on the target              | Build options
+| development files in target filesystem   | Build options
+| Linux 3.1.x kernel headers               | Toolchain -> Kernel Headers
+| Linux 3.3.x kernel headers               | Toolchain -> Kernel Headers
+| Linux 3.5.x kernel headers               | Toolchain -> Kernel Headers
+| uClibc 0.9.31.x                          | Toolchain -> uClibc C library Version
+| binutils 2.20                            | Toolchain -> Binutils Version
+| Build gdb debugger for the Target        | Toolchain
+| gdb 7.2.x                                | Toolchain -> GDB debugger Version
+| gdb 7.3.x                                | Toolchain -> GDB debugger Version
+| lzma                                     | Package Selection for the target -> Compressors and decompressors
+| autoconf                                 | Package Selection for the target -> Development tools
+| automake                                 | Package Selection for the target -> Development tools
+| ccache                                   | Package Selection for the target -> Development tools
+| gcc                                      | Package Selection for the target -> Development tools
+| make                                     | Package Selection for the target -> Development tools
+| pkg-config                               | Package Selection for the target -> Development tools
+| xstroke                                  | Package Selection for the target -> Graphic libraries and applications (graphic/text)
+| squashfs3                                | Package Selection for the target -> Filesystem and flash utilities
+| microperl                                | Package Selection for the target -> Interpreter languages and scripting
+| netkitbase                               | Package Selection for the target -> Networking applications
+| netkittelnet                             | Package Selection for the target -> Networking applications
+| ttcp                                     | Package Selection for the target -> Networking applications
+| 3.x                                      | Filesystem images -> SquashFS version
+| 2011.09                                  | Bootloaders -> U-Boot Version
+| 2011.06                                  | Bootloaders -> U-Boot Version
+
+|===================================================
 
-** squashfs3 image
diff --git a/docs/manual/host-package-list.txt b/docs/manual/host-package-list.txt
new file mode 100644
index 0000000..3e52740
--- /dev/null
+++ b/docs/manual/host-package-list.txt
@@ -0,0 +1,19 @@
+//
+// Automatically generated list for Buildroot manual.
+// Buildroot 2013.02-rc2-00028-g4564f78-dirty
+// Generation date: 2013-02-25 19:45:02.967339
+//
+
+[width="90%",cols="^1,4",options="header"]
+|===================================================
+| Packages                                 | Host utilities -> ...
+
+| host dfu-util                            | .
+| host lpc3250loader                       | .
+| host omap-u-boot-utils                   | .
+| host openocd                             | .
+| host sam-ba                              | .
+| host u-boot tools                        | .
+
+|===================================================
+
diff --git a/docs/manual/package-list.txt b/docs/manual/package-list.txt
new file mode 100644
index 0000000..94375ab
--- /dev/null
+++ b/docs/manual/package-list.txt
@@ -0,0 +1,930 @@
+//
+// Automatically generated list for Buildroot manual.
+// Buildroot 2013.02-rc2-00028-g4564f78-dirty
+// Generation date: 2013-02-25 19:45:02.967339
+//
+
+[width="90%",cols="^1,4",options="header"]
+|===================================================
+| Packages                                 | Package Selection for the target -> ...
+
+| acl                                      | . -> System tools
+| acpid                                    | . -> Hardware handling
+| alsa-lib                                 | . -> Libraries -> Audio/Sound
+| alsa-utils                               | . -> Audio and video applications
+| alsamixergui                             | . -> Graphic libraries and applications (graphic/text)
+| applewmproto                             | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| appres                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| apr                                      | . -> Libraries -> Other
+| apr-util                                 | . -> Libraries -> Other
+| argp-standalone                          | . -> Libraries -> Other
+| argus                                    | . -> Networking applications
+| arptables                                | . -> Networking applications
+| at                                       | . -> Shell and utilities
+| atk                                      | . -> Libraries -> Graphics
+| attr                                     | . -> System tools
+| audiofile                                | . -> Libraries -> Audio/Sound
+| aumix                                    | . -> Audio and video applications
+| autoconf *(deprecated)*                  | . -> Development tools
+| automake *(deprecated)*                  | . -> Development tools
+| avahi                                    | . -> Networking applications
+| axel                                     | . -> Networking applications
+| b43-firmware                             | . -> Hardware handling -> Misc devices firmwares
+| bash                                     | . -> Shell and utilities
+| bdftopcf                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| beecrypt                                 | . -> Libraries -> Crypto
+| beforelight                              | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| bellagio                                 | . -> Audio and video applications
+| berkeleydb                               | . -> Libraries -> Database
+| bigreqsproto                             | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| bind                                     | . -> Networking applications
+| binutils                                 | . -> Development tools
+| bison                                    | . -> Development tools
+| bitmap                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| blackbox                                 | . -> Graphic libraries and applications (graphic/text)
+| bluez-utils                              | . -> Networking applications
+| bmon                                     | . -> Networking applications
+| boa                                      | . -> Networking applications
+| bonnie++                                 | . -> Debugging, profiling and benchmark
+| boost                                    | . -> Libraries -> Other
+| bootutils                                | . -> System tools
+| bridge-utils                             | . -> Networking applications
+| bsdiff                                   | . -> Development tools
+| bustle                                   | . -> Development tools
+| BusyBox                                  | .
+| bwm-ng                                   | . -> System tools
+| bzip2                                    | . -> Compressors and decompressors
+| cache-calibrator                         | . -> Debugging, profiling and benchmark
+| cairo                                    | . -> Libraries -> Graphics
+| can-utils                                | . -> Networking applications
+| ccache *(deprecated)*                    | . -> Development tools
+| ccid                                     | . -> Libraries -> Hardware handling
+| cdrkit                                   | . -> Hardware handling
+| cegui06                                  | . -> Graphic libraries and applications (graphic/text)
+| cgilua                                   | . -> Interpreter languages and scripting -> LUA libraries/modules
+| cifs-utils                               | . -> Filesystem and flash utilities
+| cJSON                                    | . -> Libraries -> JSON/XML
+| classpath                                | . -> Libraries -> Other
+| collectd                                 | . -> Miscellaneous
+| compositeproto                           | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| connman                                  | . -> Networking applications
+| conntrack-tools                          | . -> Networking applications
+| copas                                    | . -> Interpreter languages and scripting -> LUA libraries/modules
+| coreutils                                | . -> Development tools
+| coxpcall                                 | . -> Interpreter languages and scripting -> LUA libraries/modules
+| cpanminus                                | . -> Interpreter languages and scripting -> Perl libraries/modules
+| cpuload                                  | . -> System tools
+| cramfs                                   | . -> Filesystem and flash utilities
+| ctorrent                                 | . -> Networking applications
+| cups                                     | . -> Networking applications
+| curlftpfs (FUSE)                         | . -> Filesystem and flash utilities
+| cvs                                      | . -> Development tools
+| damageproto                              | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| dash                                     | . -> Shell and utilities
+| dbus                                     | . -> Hardware handling
+| dbus-glib                                | . -> Hardware handling
+| dbus-python                              | . -> Hardware handling
+| devmem2                                  | . -> Hardware handling
+| dhcpdump                                 | . -> Networking applications
+| dhrystone                                | . -> Debugging, profiling and benchmark
+| dialog                                   | . -> Shell and utilities
+| diffutils                                | . -> Development tools
+| directfb                                 | . -> Graphic libraries and applications (graphic/text)
+| directfb examples                        | . -> Graphic libraries and applications (graphic/text)
+| directfb virtual input extension         | . -> Graphic libraries and applications (graphic/text)
+| distcc                                   | . -> Development tools
+| dmalloc                                  | . -> Debugging, profiling and benchmark
+| dmidecode                                | . -> Hardware handling
+| dmraid                                   | . -> Hardware handling
+| dmxproto                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| dnsmasq                                  | . -> Networking applications
+| docker                                   | . -> Graphic libraries and applications (graphic/text)
+| dosfstools                               | . -> Filesystem and flash utilities
+| dri2proto                                | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| dropbear                                 | . -> Networking applications
+| dsp-tools                                | . -> System tools
+| dstat                                    | . -> Debugging, profiling and benchmark
+| dvb-apps (transponders data)             | . -> Hardware handling
+| dvbsnoop                                 | . -> Hardware handling
+| e2fsprogs                                | . -> Filesystem and flash utilities
+| ebtables                                 | . -> Networking applications
+| ed                                       | . -> Text editors and viewers
+| editres                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| eeprog                                   | . -> Hardware handling
+| elfutils                                 | . -> Libraries -> Other
+| empty                                    | . -> Miscellaneous
+| enchant                                  | . -> Libraries -> Text and terminal handling
+| encodings                                | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| enlightenment                            | . -> Graphic libraries and applications (graphic/text)
+| Enlightenment Foundation Libraries       | . -> Graphic libraries and applications (graphic/text)
+| erlang                                   | . -> Interpreter languages and scripting
+| ethtool                                  | . -> Networking applications
+| evtest                                   | . -> Hardware handling
+| expat                                    | . -> Libraries -> JSON/XML
+| expedite                                 | . -> Graphic libraries and applications (graphic/text)
+| explorercanvas                           | . -> Libraries -> Javascript
+| ezxml                                    | . -> Libraries -> JSON/XML
+| faad2                                    | . -> Audio and video applications
+| fb-test-app                              | . -> Graphic libraries and applications (graphic/text)
+| fbdump (Framebuffer Capture Tool)        | . -> Graphic libraries and applications (graphic/text)
+| fbgrab                                   | . -> Graphic libraries and applications (graphic/text)
+| fbset                                    | . -> Graphic libraries and applications (graphic/text)
+| fbterm                                   | . -> Graphic libraries and applications (graphic/text)
+| fbv                                      | . -> Graphic libraries and applications (graphic/text)
+| fconfig                                  | . -> Hardware handling
+| feh                                      | . -> Graphic libraries and applications (graphic/text)
+| ffmpeg                                   | . -> Audio and video applications
+| fftw                                     | . -> Libraries -> Other
+| file                                     | . -> Shell and utilities
+| findutils                                | . -> Development tools
+| firmware-imx                             | . -> Hardware handling -> Misc devices firmwares
+| fis                                      | . -> Hardware handling
+| fixesproto                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| flac                                     | . -> Audio and video applications
+| flashbench                               | . -> Filesystem and flash utilities
+| flashrom                                 | . -> Hardware handling
+| flex                                     | . -> Development tools
+| flot                                     | . -> Libraries -> Javascript
+| fltk                                     | . -> Libraries -> Graphics
+| fluxbox                                  | . -> Graphic libraries and applications (graphic/text)
+| fmtools                                  | . -> Hardware handling
+| font-adobe-100dpi                        | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-adobe-75dpi                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-adobe-utopia-100dpi                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-adobe-utopia-75dpi                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-adobe-utopia-type1                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-alias                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-arabic-misc                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-bh-100dpi                           | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-bh-75dpi                            | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-bh-lucidatypewriter-100dpi          | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-bh-lucidatypewriter-75dpi           | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-bh-ttf                              | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-bh-type1                            | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-bitstream-100dpi                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-bitstream-75dpi                     | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-bitstream-speedo                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-bitstream-type1                     | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-cronyx-cyrillic                     | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-cursor-misc                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-daewoo-misc                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-dec-misc                            | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-ibm-type1                           | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-isas-misc                           | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-jis-misc                            | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-micro-misc                          | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-misc-cyrillic                       | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-misc-ethiopic                       | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-misc-meltho                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-misc-misc                           | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-mutt-misc                           | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-schumacher-misc                     | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-screen-cyrillic                     | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-sony-misc                           | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-sun-misc                            | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-util                                | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-winitzki-cyrillic                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| font-xfree86-type1                       | . -> Graphic libraries and applications (graphic/text) -> X11R7 Fonts
+| fontcacheproto                           | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| fontconfig                               | . -> Libraries -> Graphics
+| fontsproto                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| fonttosfnt                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| freerdp                                  | . -> Graphic libraries and applications (graphic/text)
+| freetype                                 | . -> Libraries -> Graphics
+| fslsfonts                                | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| fstobdf                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| fxload                                   | . -> Hardware handling
+| gadgetfs-test                            | . -> Hardware handling
+| gamin                                    | . -> Libraries -> Filesystem
+| gawk                                     | . -> Development tools
+| gd                                       | . -> Libraries -> Graphics
+| gdbm                                     | . -> Libraries -> Database
+| gdisk                                    | . -> Hardware handling
+| gdk-pixbuf                               | . -> Libraries -> Graphics
+| genext2fs                                | . -> Filesystem and flash utilities
+| genromfs                                 | . -> Filesystem and flash utilities
+| gesftpserver                             | . -> Networking applications
+| gettext                                  | . -> Development tools
+| giblib                                   | . -> Libraries -> Graphics
+| glib-networking                          | . -> Libraries -> Networking
+| glproto                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| gmp                                      | . -> Development tools
+| gmpc                                     | . -> Graphic libraries and applications (graphic/text)
+| gnuchess                                 | . -> Games
+| gnupg                                    | . -> Shell and utilities
+| gnutls                                   | . -> Libraries -> Crypto
+| gob2                                     | . -> Graphic libraries and applications (graphic/text)
+| Google font directory                    | . -> Miscellaneous
+| gperf                                    | . -> Development tools
+| gpsd                                     | . -> Hardware handling
+| gqview                                   | . -> Graphic libraries and applications (graphic/text)
+| grantlee                                 | . -> Graphic libraries and applications (graphic/text)
+| grep                                     | . -> Development tools
+| gsl                                      | . -> Libraries -> Other
+| gst-dsp                                  | . -> Audio and video applications
+| gst-ffmpeg                               | . -> Audio and video applications
+| gst-fsl-plugins                          | . -> Audio and video applications
+| gst-omapfb                               | . -> Audio and video applications
+| gst-plugins-bad                          | . -> Audio and video applications
+| gst-plugins-base                         | . -> Audio and video applications
+| gst-plugins-good                         | . -> Audio and video applications
+| gst-plugins-ugly                         | . -> Audio and video applications
+| gstreamer                                | . -> Audio and video applications
+| gtk engines                              | . -> Libraries -> Graphics
+| gtkperf (performance test for GTK2)      | . -> Graphic libraries and applications (graphic/text)
+| gvfs                                     | . -> Hardware handling
+| gzip                                     | . -> Compressors and decompressors
+| haserl                                   | . -> Interpreter languages and scripting
+| hdparm                                   | . -> Hardware handling
+| heirloom-mailx                           | . -> Networking applications
+| hiawatha                                 | . -> Networking applications
+| hicolor (default theme)                  | . -> Libraries -> Graphics -> GTK Themes
+| hostapd                                  | . -> Networking applications
+| htop                                     | . -> System tools
+| httping                                  | . -> Networking applications
+| hwdata                                   | . -> Hardware handling
+| i2c-tools                                | . -> Hardware handling
+| iceauth                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| ico                                      | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| icu                                      | . -> Libraries -> Text and terminal handling
+| ifplugd                                  | . -> Networking applications
+| iftop                                    | . -> Networking applications
+| igh-ethercat                             | . -> Networking applications
+| imagemagick                              | . -> Graphic libraries and applications (graphic/text)
+| imlib2                                   | . -> Libraries -> Graphics
+| imx-lib                                  | . -> Libraries -> Hardware handling
+| inadyn                                   | . -> Networking applications
+| infozip                                  | . -> Compressors and decompressors
+| inotify-tools                            | . -> Shell and utilities
+| input-event-daemon                       | . -> Hardware handling
+| input-tools                              | . -> Hardware handling
+| inputproto                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| intltool                                 | . -> Development tools
+| iostat                                   | . -> Hardware handling
+| iperf                                    | . -> Networking applications
+| ipkg                                     | . -> Package managers
+| iproute2                                 | . -> Networking applications
+| ipsec-tools                              | . -> Networking applications
+| ipset                                    | . -> Networking applications
+| iptables                                 | . -> Networking applications
+| irda-utils                               | . -> Hardware handling
+| isc dhcp                                 | . -> Networking applications
+| iw                                       | . -> Networking applications
+| jamvm                                    | . -> Interpreter languages and scripting
+| jpeg                                     | . -> Libraries -> Graphics -> jpeg variant
+| jpeg support                             | . -> Libraries -> Graphics
+| jpeg-turbo                               | . -> Libraries -> Graphics -> jpeg variant
+| jQuery                                   | . -> Libraries -> Javascript
+| jQuery-Sparkline                         | . -> Libraries -> Javascript
+| jQuery-Validation                        | . -> Libraries -> Javascript
+| jsmin                                    | . -> Libraries -> Javascript
+| json-c                                   | . -> Libraries -> JSON/XML
+| kbd                                      | . -> Hardware handling
+| kbproto                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| kexec                                    | . -> Debugging, profiling and benchmark
+| keyutils                                 | . -> System tools
+| kismet                                   | . -> Networking applications
+| kmod                                     | . -> System tools
+| lame                                     | . -> Audio and video applications
+| latencytop                               | . -> Debugging, profiling and benchmark
+| lcdapi                                   | . -> Libraries -> Hardware handling
+| lcdproc                                  | . -> Hardware handling
+| leafpad                                  | . -> Graphic libraries and applications (graphic/text)
+| less                                     | . -> Text editors and viewers
+| libaio                                   | . -> Libraries -> Hardware handling
+| libao                                    | . -> Libraries -> Audio/Sound
+| libarchive                               | . -> Libraries -> Compression and decompression
+| libargtable2                             | . -> Libraries -> Other
+| libart                                   | . -> Libraries -> Graphics
+| libatasmart                              | . -> Libraries -> Hardware handling
+| libatomic_ops                            | . -> Libraries -> Other
+| libcap                                   | . -> Libraries -> Other
+| libcap-ng                                | . -> Libraries -> Other
+| libcdaudio                               | . -> Libraries -> Audio/Sound
+| libcgi                                   | . -> Libraries -> Networking
+| libcgicc                                 | . -> Libraries -> Networking
+| libcofi                                  | . -> Libraries -> Other
+| libconfig                                | . -> Libraries -> Filesystem
+| libconfuse                               | . -> Libraries -> Filesystem
+| libcue                                   | . -> Libraries -> Audio/Sound
+| libcuefile                               | . -> Libraries -> Audio/Sound
+| libcurl                                  | . -> Libraries -> Networking
+| libdaemon                                | . -> Libraries -> Other
+| libdmtx                                  | . -> Libraries -> Graphics
+| libdmx                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libdnet                                  | . -> Libraries -> Networking
+| libdrm                                   | . -> Libraries -> Graphics
+| libdvdnav                                | . -> Libraries -> Multimedia
+| libdvdread                               | . -> Libraries -> Multimedia
+| libebml                                  | . -> Libraries -> Multimedia
+| libecore                                 | . -> Graphic libraries and applications (graphic/text)
+| libedbus                                 | . -> Graphic libraries and applications (graphic/text)
+| libedje                                  | . -> Graphic libraries and applications (graphic/text)
+| libeet                                   | . -> Graphic libraries and applications (graphic/text)
+| libefreet                                | . -> Graphic libraries and applications (graphic/text)
+| libeina                                  | . -> Graphic libraries and applications (graphic/text)
+| libeio                                   | . -> Graphic libraries and applications (graphic/text)
+| libelementary                            | . -> Graphic libraries and applications (graphic/text)
+| libelf                                   | . -> Libraries -> Other
+| libembryo                                | . -> Graphic libraries and applications (graphic/text)
+| Liberation (Free fonts)                  | . -> Graphic libraries and applications (graphic/text)
+| libesmtp                                 | . -> Libraries -> Networking
+| libethumb                                | . -> Graphic libraries and applications (graphic/text)
+| libev                                    | . -> Libraries -> Other
+| libevas                                  | . -> Graphic libraries and applications (graphic/text)
+| libevas generic loaders                  | . -> Graphic libraries and applications (graphic/text)
+| libevent                                 | . -> Libraries -> Other
+| libexif                                  | . -> Libraries -> Graphics
+| libeXosip2                               | . -> Libraries -> Networking
+| libfcgi                                  | . -> Libraries -> Networking
+| libffi                                   | . -> Libraries -> Other
+| libfontenc                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libfreefare                              | . -> Libraries -> Hardware handling
+| libfribidi                               | . -> Libraries -> Text and terminal handling
+| libFS                                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libfslcodec                              | . -> Libraries -> Multimedia
+| libfslparser                             | . -> Libraries -> Multimedia
+| libfslvpuwrap                            | . -> Libraries -> Multimedia
+| libftdi                                  | . -> Libraries -> Hardware handling
+| libfuse                                  | . -> Libraries -> Filesystem
+| libgail                                  | . -> Libraries -> Graphics
+| libgcrypt                                | . -> Libraries -> Crypto
+| libgeotiff                               | . -> Libraries -> Graphics
+| libglade                                 | . -> Libraries -> Graphics
+| libglib2                                 | . -> Libraries -> Other
+| libgpg-error                             | . -> Libraries -> Crypto
+| libgsasl                                 | . -> Libraries -> Networking
+| libgtk2                                  | . -> Libraries -> Graphics
+| libhid                                   | . -> Libraries -> Hardware handling
+| libical                                  | . -> Libraries -> Other
+| libICE                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libiconv                                 | . -> Libraries -> Text and terminal handling
+| libid3tag                                | . -> Libraries -> Audio/Sound
+| libidn                                   | . -> Libraries -> Networking
+| libiqrf                                  | . -> Libraries -> Hardware handling
+| libiscsi                                 | . -> Libraries -> Networking
+| liblo                                    | . -> Libraries -> Audio/Sound
+| liblockfile                              | . -> Libraries -> Filesystem
+| liblog4c-localtime                       | . -> Libraries -> Other
+| libmad                                   | . -> Libraries -> Audio/Sound
+| libmatroska                              | . -> Libraries -> Multimedia
+| libmbus                                  | . -> Libraries -> Networking
+| libmcrypt                                | . -> Libraries -> Crypto
+| libmhash                                 | . -> Libraries -> Crypto
+| libmicrohttpd                            | . -> Libraries -> Networking
+| libmms                                   | . -> Libraries -> Multimedia
+| libmnl                                   | . -> Libraries -> Networking
+| libmodbus                                | . -> Libraries -> Networking
+| libmpd                                   | . -> Libraries -> Audio/Sound
+| libmpeg2                                 | . -> Libraries -> Multimedia
+| libneon                                  | . -> Libraries -> Networking
+| libnetfilter_acct                        | . -> Libraries -> Networking
+| libnetfilter_conntrack                   | . -> Libraries -> Networking
+| libnetfilter_cthelper                    | . -> Libraries -> Networking
+| libnetfilter_cttimeout                   | . -> Libraries -> Networking
+| libnetfilter_log                         | . -> Libraries -> Networking
+| libnetfilter_queue                       | . -> Libraries -> Networking
+| libnfc                                   | . -> Libraries -> Hardware handling
+| libnfc-llcp                              | . -> Libraries -> Hardware handling
+| libnfnetlink                             | . -> Libraries -> Networking
+| libnl                                    | . -> Libraries -> Networking
+| libnspr                                  | . -> Libraries -> Other
+| libnss                                   | . -> Libraries -> Crypto
+| liboauth                                 | . -> Libraries -> Networking
+| libogg                                   | . -> Libraries -> Multimedia
+| liboldX                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| liboping                                 | . -> Libraries -> Networking
+| libosip2                                 | . -> Libraries -> Networking
+| libpcap                                  | . -> Libraries -> Networking
+| libpciaccess                             | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libplayer                                | . -> Libraries -> Multimedia
+| libpng                                   | . -> Libraries -> Graphics
+| libpthread-stubs                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libraw                                   | . -> Libraries -> Graphics
+| libraw1394                               | . -> Libraries -> Hardware handling
+| libreplaygain                            | . -> Libraries -> Audio/Sound
+| librsvg                                  | . -> Libraries -> Graphics
+| librsync                                 | . -> Libraries -> Networking
+| libsamplerate                            | . -> Libraries -> Audio/Sound
+| libseccomp                               | . -> Libraries -> Other
+| libsexy                                  | . -> Graphic libraries and applications (graphic/text)
+| libsha1                                  | . -> Libraries -> Crypto
+| libsigc++                                | . -> Libraries -> Other
+| libSM                                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libsndfile                               | . -> Libraries -> Audio/Sound
+| libsoup                                  | . -> Libraries -> Networking
+| libsvgtiny                               | . -> Libraries -> Graphics
+| libsysfs                                 | . -> Libraries -> Filesystem
+| libtheora                                | . -> Libraries -> Multimedia
+| libtirpc                                 | . -> Libraries -> Networking
+| libtool                                  | . -> Development tools
+| libtorrent                               | . -> Libraries -> Networking
+| libtpl                                   | . -> Libraries -> Other
+| libts - The Touchscreen tslib Library    | . -> Libraries -> Hardware handling
+| libungif                                 | . -> Libraries -> Graphics
+| libupnp                                  | . -> Libraries -> Networking
+| liburcu                                  | . -> Libraries -> Other
+| libusb                                   | . -> Libraries -> Hardware handling
+| libusb-compat                            | . -> Libraries -> Hardware handling
+| libv4l                                   | . -> Libraries -> Hardware handling
+| libvncserver                             | . -> Libraries -> Networking
+| libvorbis                                | . -> Libraries -> Audio/Sound
+| libX11                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXau                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXaw                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libxcb                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXcomposite                            | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXcursor                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXdamage                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXdmcp                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXext                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXfixes                                | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXfont                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXfontcache                            | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXft                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXi                                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXinerama                              | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libxkbfile                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libxkbui                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libxml-parser-perl                       | . -> Libraries -> JSON/XML
+| libxml2                                  | . -> Libraries -> JSON/XML
+| libXmu                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXp                                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXpm                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXprintAppUtil                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXprintUtil                            | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXrandr                                | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXrender                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXres                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXScrnSaver                            | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libxslt                                  | . -> Libraries -> JSON/XML
+| libXt                                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXtst                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXv                                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXvMC                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXxf86dga                              | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libXxf86vm                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| libyaml                                  | . -> Libraries -> JSON/XML
+| lighttpd                                 | . -> Networking applications
+| linenoise                                | . -> Libraries -> Text and terminal handling
+| links                                    | . -> Networking applications
+| linphone                                 | . -> Networking applications
+| linux-firmware                           | . -> Hardware handling -> Misc devices firmwares
+| linux-fusion communication layer for DirectFB multi | . -> Graphic libraries and applications (graphic/text)
+| linux-pam                                | . -> Libraries -> Other
+| listres                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| LiTE (toolbox engine)                    | . -> Graphic libraries and applications (graphic/text)
+| live555                                  | . -> Libraries -> Multimedia
+| lm-sensors                               | . -> Hardware handling
+| lmbench                                  | . -> Debugging, profiling and benchmark
+| lockfile programs                        | . -> Shell and utilities
+| logrotate                                | . -> Shell and utilities
+| logsurfer                                | . -> Shell and utilities
+| lrzsz                                    | . -> Networking applications
+| lshw                                     | . -> Hardware handling
+| lsof                                     | . -> Debugging, profiling and benchmark
+| lsuio                                    | . -> Hardware handling
+| ltp-testsuite                            | . -> Debugging, profiling and benchmark
+| ltrace                                   | . -> Debugging, profiling and benchmark
+| lttng-babeltrace                         | . -> Debugging, profiling and benchmark
+| lttng-libust                             | . -> Libraries -> Other
+| lttng-modules                            | . -> Debugging, profiling and benchmark
+| lttng-tools                              | . -> Debugging, profiling and benchmark
+| lua                                      | . -> Interpreter languages and scripting
+| lua-msgpack-native                       | . -> Interpreter languages and scripting -> LUA libraries/modules
+| luacjson                                 | . -> Interpreter languages and scripting -> LUA libraries/modules
+| luaexpat                                 | . -> Interpreter languages and scripting -> LUA libraries/modules
+| luafilesystem                            | . -> Interpreter languages and scripting -> LUA libraries/modules
+| luajit                                   | . -> Interpreter languages and scripting
+| luasocket                                | . -> Interpreter languages and scripting -> LUA libraries/modules
+| luit                                     | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| lvm2 & device mapper                     | . -> Hardware handling
+| lzma *(deprecated)*                      | . -> Compressors and decompressors
+| lzo                                      | . -> Libraries -> Compression and decompression
+| lzop                                     | . -> Compressors and decompressors
+| m4                                       | . -> Development tools
+| macchanger                               | . -> Networking applications
+| madplay                                  | . -> Audio and video applications
+| make *(deprecated)*                      | . -> Development tools
+| makedepend                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 Utilities
+| makedevs                                 | . -> Filesystem and flash utilities
+| Matchbox Desktop                         | . -> Graphic libraries and applications (graphic/text)
+| Matchbox Panel                           | . -> Graphic libraries and applications (graphic/text)
+| Matchbox session common files            | . -> Graphic libraries and applications (graphic/text)
+| Matchbox Virtual Keyboard                | . -> Graphic libraries and applications (graphic/text)
+| MatchBox Window Manager                  | . -> Graphic libraries and applications (graphic/text)
+| mcookie                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Utilities
+| mcrypt                                   | . -> Miscellaneous
+| mdadm                                    | . -> Hardware handling
+| media-ctl                                | . -> Hardware handling
+| mediastreamer                            | . -> Libraries -> Multimedia
+| memstat                                  | . -> Debugging, profiling and benchmark
+| memtester                                | . -> Hardware handling
+| Mesa 3D Graphics Library                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| metacity                                 | . -> Graphic libraries and applications (graphic/text)
+| microperl *(deprecated)*                 | . -> Interpreter languages and scripting
+| midori                                   | . -> Graphic libraries and applications (graphic/text)
+| mii-diag                                 | . -> Networking applications
+| Mini-XML                                 | . -> Libraries -> JSON/XML
+| minicom                                  | . -> Hardware handling
+| mkfontdir                                | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| mkfontscale                              | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| mobile-broadband-provider-info           | . -> Miscellaneous
+| module-init-tools                        | . -> System tools
+| monit                                    | . -> System tools
+| mpc                                      | . -> Development tools
+| mpd                                      | . -> Audio and video applications
+| mpfr                                     | . -> Development tools
+| mpg123                                   | . -> Audio and video applications
+| mplayer                                  | . -> Audio and video applications
+| mrouted                                  | . -> Networking applications
+| msmtp                                    | . -> Networking applications
+| mtd/jffs2 utilities                      | . -> Filesystem and flash utilities
+| mtdev                                    | . -> Libraries -> Hardware handling
+| mtdev2tuio                               | . -> Libraries -> Other
+| musepack                                 | . -> Audio and video applications
+| mutt                                     | . -> Networking applications
+| MySQL client                             | . -> Libraries -> Database
+| nano                                     | . -> Text editors and viewers
+| nanocom                                  | . -> Hardware handling
+| nbd                                      | . -> Networking applications
+| ncdu                                     | . -> System tools
+| ncftp                                    | . -> Networking applications
+| ncurses                                  | . -> Libraries -> Text and terminal handling
+| ndisc6 tools                             | . -> Networking applications
+| neard                                    | . -> Hardware handling
+| neardal                                  | . -> Libraries -> Hardware handling
+| netatalk                                 | . -> Networking applications
+| netcat                                   | . -> Networking applications
+| netkitbase *(deprecated)*                | . -> Networking applications
+| netkittelnet *(deprecated)*              | . -> Networking applications
+| netperf                                  | . -> Debugging, profiling and benchmark
+| netplug                                  | . -> Networking applications
+| netsnmp                                  | . -> Networking applications
+| netstat-nat                              | . -> Networking applications
+| nettle                                   | . -> Libraries -> Crypto
+| NetworkManager                           | . -> Networking applications
+| newt                                     | . -> Libraries -> Text and terminal handling
+| nfacct                                   | . -> Networking applications
+| nfs-utils                                | . -> Filesystem and flash utilities
+| ngircd                                   | . -> Networking applications
+| ngrep                                    | . -> Networking applications
+| noip                                     | . -> Networking applications
+| nss-mdns                                 | . -> Libraries -> Networking
+| ntfs-3g                                  | . -> Filesystem and flash utilities
+| ntp                                      | . -> Networking applications
+| nuttcp                                   | . -> Networking applications
+| ocf-linux                                | . -> Libraries -> Crypto
+| oclock                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| ofono                                    | . -> Hardware handling
+| OLSR mesh networking Daemon              | . -> Networking applications
+| open2300                                 | . -> Hardware handling
+| opencv                                   | . -> Libraries -> Graphics
+| openntpd                                 | . -> Networking applications
+| openocd                                  | . -> Hardware handling
+| openssh                                  | . -> Networking applications
+| openssl                                  | . -> Libraries -> Crypto
+| openswan                                 | . -> Networking applications
+| openvpn                                  | . -> Networking applications
+| opkg                                     | . -> Package managers
+| oprofile                                 | . -> Debugging, profiling and benchmark
+| opus                                     | . -> Libraries -> Audio/Sound
+| opus-tools                               | . -> Audio and video applications
+| orc                                      | . -> Libraries -> Other
+| oRTP                                     | . -> Libraries -> Networking
+| owl-linux                                | . -> Hardware handling
+| pango                                    | . -> Libraries -> Graphics
+| parted                                   | . -> Hardware handling
+| patch                                    | . -> Development tools
+| pciutils                                 | . -> Hardware handling
+| pcmanfm                                  | . -> Graphic libraries and applications (graphic/text)
+| pcre                                     | . -> Libraries -> Text and terminal handling
+| pcsc-lite                                | . -> Libraries -> Hardware handling
+| perf                                     | . -> Debugging, profiling and benchmark
+| perl                                     | . -> Interpreter languages and scripting
+| php                                      | . -> Interpreter languages and scripting
+| picocom                                  | . -> Hardware handling
+| pixman                                   | . -> Libraries -> Graphics
+| pkg-config *(deprecated)*                | . -> Development tools
+| pkgconf                                  | . -> Development tools
+| poco                                     | . -> Libraries -> Other
+| polarssl                                 | . -> Libraries -> Crypto
+| polkit                                   | . -> System tools
+| popt                                     | . -> Libraries -> Text and terminal handling
+| portaudio                                | . -> Libraries -> Audio/Sound
+| portmap                                  | . -> Networking applications
+| pppd                                     | . -> Networking applications
+| pptp-linux                               | . -> Networking applications
+| PrBoom                                   | . -> Games
+| printproto                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| procps                                   | . -> System tools
+| proftpd                                  | . -> Networking applications
+| protobuf                                 | . -> Libraries -> Other
+| proxychains-ng                           | . -> Networking applications
+| psmisc                                   | . -> System tools
+| pulseaudio                               | . -> Audio and video applications
+| pv                                       | . -> Debugging, profiling and benchmark
+| pygame                                   | . -> Interpreter languages and scripting -> external python modules
+| pyparsing                                | . -> Interpreter languages and scripting -> external python modules
+| python                                   | . -> Interpreter languages and scripting
+| python-bottle                            | . -> Interpreter languages and scripting -> external python modules
+| python-dpkt                              | . -> Interpreter languages and scripting -> external python modules
+| python-id3                               | . -> Interpreter languages and scripting -> external python modules
+| python-mad                               | . -> Interpreter languages and scripting -> external python modules
+| python-meld3                             | . -> Interpreter languages and scripting -> external python modules
+| python-netifaces                         | . -> Interpreter languages and scripting -> external python modules
+| python-nfc                               | . -> Interpreter languages and scripting -> external python modules
+| python-protobuf                          | . -> Interpreter languages and scripting -> external python modules
+| python-serial                            | . -> Interpreter languages and scripting -> external python modules
+| python-setuptools                        | . -> Interpreter languages and scripting -> external python modules
+| python3                                  | . -> Interpreter languages and scripting
+| qextserialport                           | . -> Graphic libraries and applications (graphic/text)
+| Qt                                       | . -> Graphic libraries and applications (graphic/text)
+| qtuio                                    | . -> Graphic libraries and applications (graphic/text)
+| quagga                                   | . -> Networking applications
+| quota                                    | . -> System tools
+| qwt                                      | . -> Graphic libraries and applications (graphic/text)
+| radvd                                    | . -> Networking applications
+| ramspeed                                 | . -> Debugging, profiling and benchmark
+| randrproto                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| rdesktop                                 | . -> Graphic libraries and applications (graphic/text)
+| read-edid                                | . -> Hardware handling
+| readline                                 | . -> Libraries -> Text and terminal handling
+| recordproto                              | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| renderproto                              | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| resourceproto                            | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| rgb                                      | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| rings                                    | . -> Interpreter languages and scripting -> LUA libraries/modules
+| rng-tools                                | . -> Hardware handling
+| roxml                                    | . -> Libraries -> JSON/XML
+| rp-pppoe                                 | . -> Networking applications
+| rpcbind                                  | . -> Networking applications
+| rpi-firmware                             | . -> Hardware handling -> Misc devices firmwares
+| rpi-userland                             | . -> Hardware handling
+| rpm                                      | . -> Package managers
+| rrdtool                                  | . -> Graphic libraries and applications (graphic/text)
+| rsh-redone                               | . -> Networking applications
+| rstart                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| rsync                                    | . -> Networking applications
+| rsyslog                                  | . -> System tools
+| rt-tests                                 | . -> Debugging, profiling and benchmark
+| rtai                                     | . -> Real-Time
+| rtorrent                                 | . -> Networking applications
+| rubix                                    | . -> Games
+| ruby                                     | . -> Interpreter languages and scripting
+| samba                                    | . -> Networking applications
+| sane-backends                            | . -> Hardware handling
+| SawMan (Window Manager)                  | . -> Graphic libraries and applications (graphic/text)
+| schifra                                  | . -> Libraries -> Other
+| sconeserver                              | . -> Networking applications
+| screen                                   | . -> Shell and utilities
+| scripts                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| scrnsaverproto                           | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| SDL                                      | . -> Graphic libraries and applications (graphic/text)
+| SDL_gfx                                  | . -> Graphic libraries and applications (graphic/text)
+| SDL_image                                | . -> Graphic libraries and applications (graphic/text)
+| SDL_mixer                                | . -> Graphic libraries and applications (graphic/text)
+| SDL_net                                  | . -> Graphic libraries and applications (graphic/text)
+| SDL_sound                                | . -> Graphic libraries and applications (graphic/text)
+| SDL_TTF                                  | . -> Graphic libraries and applications (graphic/text)
+| sdparm                                   | . -> Hardware handling
+| sed                                      | . -> Development tools
+| ser2net                                  | . -> Networking applications
+| sessreg                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| setserial                                | . -> Hardware handling
+| setxkbmap                                | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| sg3-utils                                | . -> Hardware handling
+| shared-mime-info                         | . -> Miscellaneous
+| shareware Doom WAD file                  | . -> Games
+| showfont                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| slang                                    | . -> Libraries -> Text and terminal handling
+| slirp                                    | . -> Libraries -> Networking
+| smartmontools                            | . -> Hardware handling
+| smproxy                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| snowball-hdmiservice                     | . -> Hardware handling
+| snowball-init                            | . -> Miscellaneous
+| socat                                    | . -> Networking applications
+| socketcand                               | . -> Networking applications
+| sound-theme-borealis                     | . -> Miscellaneous
+| sound-theme-freedesktop                  | . -> Miscellaneous
+| spawn-fcgi                               | . -> Networking applications
+| speex                                    | . -> Libraries -> Audio/Sound
+| spice protocol                           | . -> Networking applications
+| spice server                             | . -> Networking applications
+| sqlcipher                                | . -> Libraries -> Database
+| sqlite                                   | . -> Libraries -> Database
+| squashfs                                 | . -> Filesystem and flash utilities
+| squashfs3 *(deprecated)*                 | . -> Filesystem and flash utilities
+| squid                                    | . -> Networking applications
+| sredird                                  | . -> Hardware handling
+| sshfs (FUSE)                             | . -> Filesystem and flash utilities
+| sstrip                                   | . -> Development tools
+| startup-notification                     | . -> Libraries -> Other
+| statserial                               | . -> Hardware handling
+| strace                                   | . -> Debugging, profiling and benchmark
+| stress                                   | . -> Debugging, profiling and benchmark
+| stunnel                                  | . -> Networking applications
+| sudo                                     | . -> Shell and utilities
+| supervisor                               | . -> System tools
+| sylpheed                                 | . -> Graphic libraries and applications (graphic/text)
+| synergy                                  | . -> Graphic libraries and applications (graphic/text)
+| syslogd & klogd                          | . -> System tools
+| sysprof                                  | . -> Debugging, profiling and benchmark
+| sysstat                                  | . -> Hardware handling
+| systemd                                  | . -> System tools
+| sysvinit                                 | . -> System tools
+| taglib                                   | . -> Libraries -> Audio/Sound
+| tar                                      | . -> Development tools
+| tcl                                      | . -> Interpreter languages and scripting
+| tcllib                                   | . -> Interpreter languages and scripting -> tcl libraries/modules
+| tcpdump                                  | . -> Networking applications
+| tcpreplay                                | . -> Networking applications
+| tftpd                                    | . -> Networking applications
+| thttpd                                   | . -> Networking applications
+| ti-utils                                 | . -> Hardware handling
+| tidsp-binaries                           | . -> Audio and video applications
+| tiff                                     | . -> Libraries -> Graphics
+| time                                     | . -> Shell and utilities
+| tinyhttpd                                | . -> Networking applications
+| tn5250                                   | . -> Networking applications
+| torsmo                                   | . -> Graphic libraries and applications (graphic/text)
+| transmission                             | . -> Networking applications
+| tremor (fixed point vorbis decoder)      | . -> Libraries -> Audio/Sound
+| ttcp *(deprecated)*                      | . -> Networking applications
+| tvheadend                                | . -> Networking applications
+| twm                                      | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| u-boot tools                             | . -> Hardware handling
+| udev                                     | . -> Hardware handling
+| udisks                                   | . -> Hardware handling
+| udpcast                                  | . -> Networking applications
+| uemacs                                   | . -> Text editors and viewers
+| ulogd                                    | . -> Networking applications
+| unionfs (FUSE)                           | . -> Filesystem and flash utilities
+| usb_modeswitch                           | . -> Hardware handling
+| usb_modeswitch_data                      | . -> Hardware handling
+| usbmount                                 | . -> Hardware handling
+| usbredir                                 | . -> Libraries -> Networking
+| usbutils                                 | . -> Hardware handling
+| ushare                                   | . -> Networking applications
+| util-linux                               | . -> System tools
+| util-macros                              | . -> Graphic libraries and applications (graphic/text) -> X11R7 Utilities
+| ux500-firmware                           | . -> Hardware handling -> Misc devices firmwares
+| vala                                     | . -> Development tools
+| valgrind                                 | . -> Debugging, profiling and benchmark
+| vde2                                     | . -> Networking applications
+| videoproto                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| viewres                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| vim                                      | . -> Text editors and viewers
+| vorbis-tools                             | . -> Audio and video applications
+| vpnc                                     | . -> Networking applications
+| vsftpd                                   | . -> Networking applications
+| vtun - BEWARE: read package/vtun/README.txt before use | . -> Networking applications
+| wavpack                                  | . -> Audio and video applications
+| webkit                                   | . -> Libraries -> Graphics
+| webrtc-audio-processing                  | . -> Libraries -> Audio/Sound
+| wget                                     | . -> Networking applications
+| whetstone                                | . -> Debugging, profiling and benchmark
+| which                                    | . -> Shell and utilities
+| windowswmproto                           | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| wipe                                     | . -> Hardware handling
+| wireless tools                           | . -> Networking applications
+| wpa_supplicant                           | . -> Networking applications
+| wsapi                                    | . -> Interpreter languages and scripting -> LUA libraries/modules
+| x11perf                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| x11vnc                                   | . -> Graphic libraries and applications (graphic/text)
+| xauth                                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xavante                                  | . -> Interpreter languages and scripting -> LUA libraries/modules
+| xbacklight                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xbiff                                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xbitmaps                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Other data
+| xcalc                                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xcb-proto                                | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| xcb-util                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| xcb-util-keysyms                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| xclipboard                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xclock                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xcmiscproto                              | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| xcmsdb                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xcursorgen                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xdata_xcursor-themes                     | . -> Graphic libraries and applications (graphic/text) -> X11R7 Other data
+| xdbedizzy                                | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xditview                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xdm                                      | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xdpyinfo                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xdriinfo                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xedit                                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| Xenomai Userspace                        | . -> Real-Time
+| xerces-c++                               | . -> Libraries -> JSON/XML
+| xev                                      | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xextproto                                | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| xeyes                                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xf86-input-evdev                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-input-joystick                      | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-input-keyboard                      | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-input-mouse                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-input-synaptics                     | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-input-tslib                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-input-vmmouse                       | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-input-void                          | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-ark                           | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-ast                           | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-ati                           | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-cirrus                        | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-dummy                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-fbdev                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-geode                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-glide                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-glint                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-i128                          | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-intel                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-mach64                        | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-mga                           | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-neomagic                      | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-newport                       | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-nv                            | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-openchrome                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-r128                          | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-savage                        | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-siliconmotion                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-sis                           | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-tdfx                          | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-tga                           | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-trident                       | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-v4l                           | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-vesa                          | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-vmware                        | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-voodoo                        | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86-video-wsfb                          | . -> Graphic libraries and applications (graphic/text) -> X11R7 Drivers
+| xf86bigfontproto                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| xf86dga                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xf86dgaproto                             | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| xf86driproto                             | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| xf86rushproto                            | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| xf86vidmodeproto                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| xfd                                      | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xfontsel                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xfs                                      | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xfsinfo                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xfsprogs                                 | . -> Filesystem and flash utilities
+| xgamma                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xgc                                      | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xhost                                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xineramaproto                            | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| xinetd                                   | . -> Networking applications
+| xinit                                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xinput                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xinput-calibrator                        | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xkbcomp                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xkbevd                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xkbprint                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xkbutils                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xkeyboard-config                         | . -> Graphic libraries and applications (graphic/text) -> X11R7 Other data
+| xkill                                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xl2tp                                    | . -> Networking applications
+| xload                                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xlogo                                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xlsatoms                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xlsclients                               | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xlsfonts                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xmag                                     | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xman                                     | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xmessage                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xmh                                      | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xmlstarlet                               | . -> Shell and utilities
+| xmodmap                                  | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xmore                                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xorg-server                              | . -> Graphic libraries and applications (graphic/text) -> X11R7 Servers
+| xplsprinters                             | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xpr                                      | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xprehashprinterlist                      | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xprop                                    | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xproto                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 X protocols
+| xrandr                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xrdb                                     | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xrefresh                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xset                                     | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xsetmode                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xsetpointer                              | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xsetroot                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xsm                                      | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xstdcmap                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xstroke *(deprecated)*                   | . -> Graphic libraries and applications (graphic/text)
+| xterm                                    | . -> Graphic libraries and applications (graphic/text)
+| xtrans                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Libraries
+| xvidtune                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xvinfo                                   | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xvkbd                                    | . -> Graphic libraries and applications (graphic/text)
+| xwd                                      | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xwininfo                                 | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xwud                                     | . -> Graphic libraries and applications (graphic/text) -> X11R7 Applications
+| xz-utils                                 | . -> Compressors and decompressors
+| yajl                                     | . -> Libraries -> JSON/XML
+| yasm                                     | . -> Development tools
+| yavta                                    | . -> Audio and video applications
+| zd1211-firmware                          | . -> Hardware handling -> Misc devices firmwares
+| zeromq                                   | . -> Libraries -> Networking
+| zlib                                     | . -> Libraries -> Compression and decompression
+| zxing                                    | . -> Libraries -> Graphics
+
+|===================================================
+
diff --git a/docs/manual/pkg-list.txt b/docs/manual/pkg-list.txt
deleted file mode 100644
index 5d9b54f..0000000
--- a/docs/manual/pkg-list.txt
+++ /dev/null
@@ -1,870 +0,0 @@
-* acl
-* acpid
-* alsa-lib
-* alsamixergui
-* alsa-utils
-* apr
-* apr-util
-* argp-standalone
-* argus
-* arptables
-* at
-* atk
-* attr
-* audiofile
-* aumix
-* autoconf
-* automake
-* avahi
-* axel
-* bash
-* beecrypt
-* bellagio
-* berkeleydb
-* bind
-* binutils
-* bison
-* blackbox
-* bluez_utils
-* bmon
-* boa
-* bonnie
-* boost
-* bootutils
-* bridge-utils
-* bsdiff
-* busybox
-* bwm-ng
-* bzip2
-* cairo
-* can-utils
-* ccache
-* ccid
-* cdrkit
-* cgilua
-* cifs-utils
-* cjson
-* cloop
-* cmake
-* collectd
-* connman
-* conntrack-tools
-* copas
-* coreutils
-* coxpcall
-* cpanminus
-* cpuload
-* cramfs
-* ctorrent
-* cups
-* cvs
-* dash
-* dbus
-* dbus-glib
-* dbus-python
-* devmem2
-* dhcp
-* dhcpdump
-* dhrystone
-* dialog
-* diffutils
-* directfb
-* directfb-examples
-* distcc
-* divine
-* dmalloc
-* dmidecode
-* dmraid
-* dnsmasq
-* docker
-* doom-wad
-* dosfstools
-* dropbear
-* dsp-tools
-* dstat
-* e2fsprogs
-* ebtables
-* ed
-* eeprog
-* empty
-* enchant
-* erlang
-* ethtool
-* evtest
-* expat
-* expedite
-* explorercanvas
-* ezxml
-* faad2
-* fbdump
-* fbgrab
-* fbset
-* fbterm
-* fb-test-app
-* fbv
-* fconfig
-* feh
-* ffmpeg
-* fftw
-* file
-* findutils
-* fis
-* flac
-* flashrom
-* flex
-* flot
-* fltk
-* fluxbox
-* fmtools
-* fontconfig
-* freerdp
-* freetype
-* fxload
-* gadgetfs-test
-* gamin
-* gawk
-* gdbm
-* gdisk
-* gdk-pixbuf
-* genext2fs
-* genromfs
-* gettext
-* giblib
-* glib-networking
-* gmp
-* gmpc
-* gnuchess
-* gnupg
-* gnutls
-* gob2
-* googlefontdirectory
-* gperf
-* gpsd
-* gqview
-* grantlee
-* grep
-* gsl
-* gst-dsp
-* gst-ffmpeg
-* gst-omapfb
-* gst-plugins-bad
-* gst-plugins-base
-* gst-plugins-good
-* gst-plugins-ugly
-* gstreamer
-* gtk2-engines
-* gtk2-theme-hicolor
-* gtkperf
-* gvfs
-* gzip
-* haserl
-* hdparm
-* heirloom-mailx
-* hiawatha
-* hostapd
-* htop
-* hwdata
-* i2c-tools
-* icu
-* ifplugd
-* igh-ethercat
-* imagemagick
-* imlib2
-* inadyn
-* inotify-tools
-* input-event-daemon
-* input-tools
-* intltool
-* iostat
-* iperf
-* ipkg
-* iproute2
-* ipsec-tools
-* ipset
-* iptables
-* irda-utils
-* iw
-* jpeg
-* jquery
-* jquery-sparkline
-* jquery-validation
-* jsmin
-* json-c
-* kbd
-* kexec
-* kismet
-* kmod
-* lame
-* latencytop
-* lcdapi
-* lcdproc
-* leafpad
-* less
-* libaio
-* libao
-* libarchive
-* libargtable2
-* libart
-* libatomic_ops
-* libcap
-* libcap-ng
-* libcdaudio
-* libcgi
-* libcgicc
-* libconfig
-* libconfuse
-* libcue
-* libcuefile
-* libcurl
-* libdaemon
-* libdmtx
-* libdnet
-* libdrm
-* libdvdnav
-* libdvdread
-* libecore
-* libedbus
-* libedje
-* libeet
-* libefreet
-* libeina
-* libelementary
-* libelf
-* libembryo
-* liberation
-* libesmtp
-* libethumb
-* libev
-* libevas
-* libevent
-* libexif
-* libeXosip2
-* libfcgi
-* libffi
-* libfreefare
-* libftdi
-* libfuse
-* libgail
-* libgcrypt
-* libgeotiff
-* libglade
-* libglib2
-* libgpg-error
-* libgtk2
-* libhid
-* libical
-* libiconv
-* libid3tag
-* libidn
-* libiqrf
-* liblo
-* liblockfile
-* liblog4c-localtime
-* libmad
-* libmbus
-* libmicrohttpd
-* libmms
-* libmnl
-* libmodbus
-* libmpd
-* libmpeg2
-* libnetfilter-acct
-* libnetfilter-conntrack
-* libnetfilter-cthelper
-* libnetfilter-cttimeout
-* libnetfilter-log
-* libnetfilter-queue
-* libnfc
-* libnfc-llcp
-* libnfnetlink
-* libnl
-* libnspr
-* libnss
-* liboauth
-* libogg
-* liboping
-* libosip2
-* libpcap
-* libplayer
-* libpng
-* libraw
-* libraw1394
-* libreplaygain
-* libroxml
-* librsvg
-* librsync
-* libsamplerate
-* libsexy
-* libsigc
-* libsndfile
-* libsoup
-* libsvgtiny
-* libsysfs
-* libtheora
-* libtirpc
-* libtool
-* libtorrent
-* libtpl
-* libungif
-* libupnp
-* liburcu
-* libusb
-* libusb-compat
-* libv4l
-* libvncserver
-* libvorbis
-* libxcb
-* libxml2
-* libxml-parser-perl
-* libxslt
-* libyaml
-* lighttpd
-* links
-* linphone
-* linux-firmware
-* linux-fusion
-* linux-pam
-* lite
-* live555
-* lmbench
-* lm-sensors
-* lockfile-progs
-* logrotate
-* logsurfer
-* lrzsz
-* lshw
-* lsof
-* lsuio
-* ltp-testsuite
-* ltrace
-* lttng-babeltrace
-* lttng-libust
-* lttng-modules
-* lttng-tools
-* lua
-* luacjson
-* luaexpat
-* luafilesystem
-* luajit
-* luasocket
-* lvm2
-* lzma
-* lzo
-* lzop
-* m4
-* macchanger
-* madplay
-* make
-* makedevs
-* matchbox-common
-* matchbox-desktop
-* matchbox-fakekey
-* matchbox-keyboard
-* matchbox-lib
-* matchbox-panel
-* matchbox-startup-monitor
-* matchbox-wm
-* mcookie
-* mdadm
-* mediastreamer
-* memstat
-* memtester
-* mesa3d
-* metacity
-* microperl
-* midori
-* mii-diag
-* minicom
-* mobile_broadband_provider_info
-* module-init-tools
-* monit
-* mpc
-* mpd
-* mpfr
-* mpg123
-* mplayer
-* mrouted
-* msmtp
-* mtd
-* mtdev
-* mtdev2tuio
-* musepack
-* mutt
-* mxml
-* mysql_client
-* nano
-* nanocom
-* nasm
-* nbd
-* ncftp
-* ncurses
-* ndisc6
-* neon
-* netatalk
-* netcat
-* netkitbase
-* netkittelnet
-* netperf
-* netplug
-* netsnmp
-* netstat-nat
-* network-manager
-* newt
-* nfacct
-* nfs-utils
-* ngircd
-* ngrep
-* noip
-* nss-mdns
-* ntfs-3g
-* ntp
-* nuttcp
-* ocf-linux
-* ofono
-* olsr
-* open2300
-* opencv
-* openntpd
-* openocd
-* openssh
-* openssl
-* openswan
-* openvpn
-* opkg
-* oprofile
-* opus
-* opus-tools
-* orc
-* ortp
-* owl-linux
-* pango
-* parted
-* patch
-* pciutils
-* pcmanfm
-* pcre
-* pcsc-lite
-* perl
-* php
-* picocom
-* pixman
-* pkgconf
-* pkg-config
-* poco
-* polarssl
-* popt
-* portaudio
-* portmap
-* pppd
-* pptp-linux
-* prboom
-* procps
-* proftpd
-* protobuf
-* psmisc
-* pthread-stubs
-* pulseaudio
-* pv
-* python
-* python3
-* python-dpkt
-* python-id3
-* python-mad
-* python-meld3
-* python-netifaces
-* python-nfc
-* python-protobuf
-* python-pygame
-* python-serial
-* python-setuptools
-* qextserialport
-* qt
-* qtuio
-* quagga
-* quota
-* radvd
-* ramspeed
-* rdesktop
-* read-edid
-* readline
-* rings
-* rng-tools
-* rpcbind
-* rpm
-* rp-pppoe
-* rrdtool
-* rsh-redone
-* rsync
-* rsyslog
-* rtai
-* rtorrent
-* rt-tests
-* rubix
-* ruby
-* samba
-* sane-backends
-* sawman
-* schifra
-* sconeserver
-* screen
-* sdl
-* sdl_gfx
-* sdl_image
-* sdl_mixer
-* sdl_net
-* sdl_sound
-* sdl_ttf
-* sdparm
-* sed
-* ser2net
-* setserial
-* shared-mime-info
-* slang
-* smartmontools
-* socat
-* socketcand
-* sound-theme-borealis
-* sound-theme-freedesktop
-* spawn-fcgi
-* speex
-* sqlcipher
-* sqlite
-* squashfs
-* squashfs3
-* squid
-* sredird
-* sshfs
-* sstrip
-* startup-notification
-* statserial
-* strace
-* stress
-* stunnel
-* sudo
-* supervisor
-* sylpheed
-* synergy
-* sysklogd
-* sysprof
-* sysstat
-* systemd
-* sysvinit
-* taglib
-* tar
-* tcl
-* tcpdump
-* tcpreplay
-* tftpd
-* thttpd
-* tidsp-binaries
-* tiff
-* time
-* tinyhttpd
-* ti-utils
-* tn5250
-* torsmo
-* transmission
-* tremor
-* tslib
-* ttcp
-* uboot-tools
-* udev
-* udpcast
-* uemacs
-* ulogd
-* unionfs
-* usb_modeswitch
-* usb_modeswitch_data
-* usbmount
-* usbutils
-* ushare
-* util-linux
-* vala
-* valgrind
-* vim
-* vorbis-tools
-* vpnc
-* vsftpd
-* vtun
-* wavpack
-* webkit
-* webrtc-audio-processing
-* wget
-* whetstone
-* which
-* wipe
-* wireless_tools
-* wpa_supplicant
-* wsapi
-* x11vnc
-* xapp_appres
-* xapp_bdftopcf
-* xapp_beforelight
-* xapp_bitmap
-* xapp_editres
-* xapp_fonttosfnt
-* xapp_fslsfonts
-* xapp_fstobdf
-* xapp_iceauth
-* xapp_ico
-* xapp_listres
-* xapp_luit
-* xapp_mkfontdir
-* xapp_mkfontscale
-* xapp_oclock
-* xapp_rgb
-* xapp_rstart
-* xapp_scripts
-* xapp_sessreg
-* xapp_setxkbmap
-* xapp_showfont
-* xapp_smproxy
-* xapp_twm
-* xapp_viewres
-* xapp_x11perf
-* xapp_xauth
-* xapp_xbacklight
-* xapp_xbiff
-* xapp_xcalc
-* xapp_xclipboard
-* xapp_xclock
-* xapp_xcmsdb
-* xapp_xcursorgen
-* xapp_xdbedizzy
-* xapp_xditview
-* xapp_xdm
-* xapp_xdpyinfo
-* xapp_xdriinfo
-* xapp_xedit
-* xapp_xev
-* xapp_xeyes
-* xapp_xf86dga
-* xapp_xfd
-* xapp_xfontsel
-* xapp_xfs
-* xapp_xfsinfo
-* xapp_xgamma
-* xapp_xgc
-* xapp_xhost
-* xapp_xinit
-* xapp_xinput
-* xapp_xinput-calibrator
-* xapp_xkbcomp
-* xapp_xkbevd
-* xapp_xkbprint
-* xapp_xkbutils
-* xapp_xkill
-* xapp_xload
-* xapp_xlogo
-* xapp_xlsatoms
-* xapp_xlsclients
-* xapp_xlsfonts
-* xapp_xmag
-* xapp_xman
-* xapp_xmessage
-* xapp_xmh
-* xapp_xmodmap
-* xapp_xmore
-* xapp_xplsprinters
-* xapp_xpr
-* xapp_xprehashprinterlist
-* xapp_xprop
-* xapp_xrandr
-* xapp_xrdb
-* xapp_xrefresh
-* xapp_xset
-* xapp_xsetmode
-* xapp_xsetpointer
-* xapp_xsetroot
-* xapp_xsm
-* xapp_xstdcmap
-* xapp_xvidtune
-* xapp_xvinfo
-* xapp_xwd
-* xapp_xwininfo
-* xapp_xwud
-* xavante
-* xcb-proto
-* xcb-util
-* xdata_xbitmaps
-* xdata_xcursor-themes
-* xdriver_xf86-input-acecad
-* xdriver_xf86-input-aiptek
-* xdriver_xf86-input-evdev
-* xdriver_xf86-input-joystick
-* xdriver_xf86-input-keyboard
-* xdriver_xf86-input-mouse
-* xdriver_xf86-input-synaptics
-* xdriver_xf86-input-tslib
-* xdriver_xf86-input-vmmouse
-* xdriver_xf86-input-void
-* xdriver_xf86-video-apm
-* xdriver_xf86-video-ark
-* xdriver_xf86-video-ast
-* xdriver_xf86-video-ati
-* xdriver_xf86-video-chips
-* xdriver_xf86-video-cirrus
-* xdriver_xf86-video-dummy
-* xdriver_xf86-video-fbdev
-* xdriver_xf86-video-geode
-* xdriver_xf86-video-glide
-* xdriver_xf86-video-glint
-* xdriver_xf86-video-i128
-* xdriver_xf86-video-i740
-* xdriver_xf86-video-intel
-* xdriver_xf86-video-mach64
-* xdriver_xf86-video-mga
-* xdriver_xf86-video-neomagic
-* xdriver_xf86-video-newport
-* xdriver_xf86-video-nv
-* xdriver_xf86-video-openchrome
-* xdriver_xf86-video-r128
-* xdriver_xf86-video-rendition
-* xdriver_xf86-video-s3
-* xdriver_xf86-video-s3virge
-* xdriver_xf86-video-savage
-* xdriver_xf86-video-siliconmotion
-* xdriver_xf86-video-sis
-* xdriver_xf86-video-sisusb
-* xdriver_xf86-video-suncg14
-* xdriver_xf86-video-suncg3
-* xdriver_xf86-video-suncg6
-* xdriver_xf86-video-sunffb
-* xdriver_xf86-video-sunleo
-* xdriver_xf86-video-suntcx
-* xdriver_xf86-video-tdfx
-* xdriver_xf86-video-tga
-* xdriver_xf86-video-trident
-* xdriver_xf86-video-tseng
-* xdriver_xf86-video-v4l
-* xdriver_xf86-video-vesa
-* xdriver_xf86-video-vmware
-* xdriver_xf86-video-voodoo
-* xdriver_xf86-video-wsfb
-* xdriver_xf86-video-xgi
-* xdriver_xf86-video-xgixp
-* xenomai
-* xerces
-* xfont_encodings
-* xfont_font-adobe-100dpi
-* xfont_font-adobe-75dpi
-* xfont_font-adobe-utopia-100dpi
-* xfont_font-adobe-utopia-75dpi
-* xfont_font-adobe-utopia-type1
-* xfont_font-alias
-* xfont_font-arabic-misc
-* xfont_font-bh-100dpi
-* xfont_font-bh-75dpi
-* xfont_font-bh-lucidatypewriter-100dpi
-* xfont_font-bh-lucidatypewriter-75dpi
-* xfont_font-bh-ttf
-* xfont_font-bh-type1
-* xfont_font-bitstream-100dpi
-* xfont_font-bitstream-75dpi
-* xfont_font-bitstream-speedo
-* xfont_font-bitstream-type1
-* xfont_font-cronyx-cyrillic
-* xfont_font-cursor-misc
-* xfont_font-daewoo-misc
-* xfont_font-dec-misc
-* xfont_font-ibm-type1
-* xfont_font-isas-misc
-* xfont_font-jis-misc
-* xfont_font-micro-misc
-* xfont_font-misc-cyrillic
-* xfont_font-misc-ethiopic
-* xfont_font-misc-meltho
-* xfont_font-misc-misc
-* xfont_font-mutt-misc
-* xfont_font-schumacher-misc
-* xfont_font-screen-cyrillic
-* xfont_font-sony-misc
-* xfont_font-sun-misc
-* xfont_font-util
-* xfont_font-winitzki-cyrillic
-* xfont_font-xfree86-type1
-* xfsprogs
-* xinetd
-* xkeyboard-config
-* xl2tp
-* xlib_libdmx
-* xlib_libfontenc
-* xlib_libFS
-* xlib_libICE
-* xlib_liboldX
-* xlib_libpciaccess
-* xlib_libSM
-* xlib_libX11
-* xlib_libXau
-* xlib_libXaw
-* xlib_libXcomposite
-* xlib_libXcursor
-* xlib_libXdamage
-* xlib_libXdmcp
-* xlib_libXext
-* xlib_libXfixes
-* xlib_libXfont
-* xlib_libXfontcache
-* xlib_libXft
-* xlib_libXi
-* xlib_libXinerama
-* xlib_libxkbfile
-* xlib_libxkbui
-* xlib_libXmu
-* xlib_libXp
-* xlib_libXpm
-* xlib_libXprintAppUtil
-* xlib_libXprintUtil
-* xlib_libXrandr
-* xlib_libXrender
-* xlib_libXres
-* xlib_libXScrnSaver
-* xlib_libXt
-* xlib_libXtst
-* xlib_libXv
-* xlib_libXvMC
-* xlib_libXxf86dga
-* xlib_libXxf86vm
-* xlib_xtrans
-* xmlstarlet
-* xproto_applewmproto
-* xproto_bigreqsproto
-* xproto_compositeproto
-* xproto_damageproto
-* xproto_dmxproto
-* xproto_dri2proto
-* xproto_fixesproto
-* xproto_fontcacheproto
-* xproto_fontsproto
-* xproto_glproto
-* xproto_inputproto
-* xproto_kbproto
-* xproto_printproto
-* xproto_randrproto
-* xproto_recordproto
-* xproto_renderproto
-* xproto_resourceproto
-* xproto_scrnsaverproto
-* xproto_videoproto
-* xproto_windowswmproto
-* xproto_xcmiscproto
-* xproto_xextproto
-* xproto_xf86bigfontproto
-* xproto_xf86dgaproto
-* xproto_xf86driproto
-* xproto_xf86rushproto
-* xproto_xf86vidmodeproto
-* xproto_xineramaproto
-* xproto_xproto
-* xserver_xorg-server
-* xstroke
-* xterm
-* xutil_makedepend
-* xutil_util-macros
-* xvkbd
-* xz
-* yajl
-* yasm
-* zeromq
-* zlib
-* zxing
-- 
1.8.1.4
