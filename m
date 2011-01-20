From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Jan 2011 14:07:35 +0100
Subject: [Buildroot] [PATCH 10/10] mpd: new package
In-Reply-To: <1295369680-24816-11-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Tue, 18 Jan 2011 13:54:40 -0300")
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
	<1295369680-24816-11-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d3nrbu5k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Add the Music Player Daemon package.
 Gustavo> Enjoy, send me beers ;)

Come to FOSDEM and I'll buy you one ;)

 Gustavo> diff --git a/package/multimedia/mpd/Config.in b/package/multimedia/mpd/Config.in
 Gustavo> new file mode 100644
 Gustavo> index 0000000..b902b7b
 Gustavo> --- /dev/null
 Gustavo> +++ b/package/multimedia/mpd/Config.in
 Gustavo> @@ -0,0 +1,138 @@
 Gustavo> +menuconfig BR2_PACKAGE_MPD
 Gustavo> +	bool "mpd"
 Gustavo> +	depends on BR2_INSTALL_LIBSTDCPP
 Gustavo> +	depends on BR2_USE_WCHAR
 Gustavo> +	select BR2_PACKAGE_LIBGLIB2
 Gustavo> +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 Gustavo> +	help
 Gustavo> +	  MPD is a flexible, powerful, server-side application
 Gustavo> +	  for playing music. Through plugins and libraries
 Gustavo> +	  it can play a variety of sound files while being
 Gustavo> +	  controlled by its network protocol.
 Gustavo> +
 Gustavo> +	  http://www.musicpd.org
 Gustavo> +
 Gustavo> +if BR2_PACKAGE_MPD
 Gustavo> +
 Gustavo> +config BR2_PACKAGE_MPD_ALSA
 Gustavo> +	bool "alsa"
 Gustavo> +	select BR2_PACKAGE_ALSA_LIB
 Gustavo> +	help
 Gustavo> +	  Enable alsa output support.
 Gustavo> +
 Gustavo> +config BR2_PACKAGE_MPD_AO
 Gustavo> +	bool "ao"
 Gustavo> +	select BR2_PACKAGE_LIBAO
 Gustavo> +	help
 Gustavo> +	  Enable libao output support.
 Gustavo> +
 Gustavo> +config BR2_PACKAGE_MPD_BZIP2
 Gustavo> +	bool "bzip2"
 Gustavo> +	select BR2_PACKAGE_BZIP2
 Gustavo> +	help
 Gustavo> +	  Enable bzip2 archive support.
 Gustavo> +
 Gustavo> +config BR2_PACKAGE_MPD_CURL
 Gustavo> +	bool "curl"
 Gustavo> +	select BR2_PACKAGE_LIBCURL
 Gustavo> +	help
 Gustavo> +	  Enable curl streaming (http) support.
 Gustavo> +
 Gustavo> +config BR2_PACKAGE_MPD_FAAD2
 Gustavo> +	bool "faad2"
 Gustavo> +	select BR2_PACKAGE_FAAD2
 Gustavo> +	help
 Gustavo> +	  Enable faad2 input support.
 Gustavo> +	  Select this if you want to play back MP4/AAC files.
 Gustavo> +
 Gustavo> +config BR2_PACKAGE_MPD_FLAC
 Gustavo> +	bool "flac"
 Gustavo> +	select BR2_PACKAGE_FLAC
 Gustavo> +	help
 Gustavo> +	  Enable flac input/streaming support.
 Gustavo> +	  Select this if you want to play back FLAC files.
 Gustavo> +
 Gustavo> +config BR2_PACKAGE_MPD_LIBSAMPLERATE
 Gustavo> +	bool "libsamplerate"
 Gustavo> +	select BR2_PACKAGE_LIBSAMPLERATE
 Gustavo> +	help
 Gustavo> +	  Enable libsamplerate input support.
 Gustavo> +	  Select this for software sample rate conversion.
 Gustavo> +
 Gustavo> +config BR2_PACKAGE_MPD_LIBSNDFILE
 Gustavo> +	bool "libsndfile"
 Gustavo> +	select BR2_PACKAGE_LIBSNDFILE
 Gustavo> +	help
 Gustavo> +	  Enable libsndfile input/streaming support.
 Gustavo> +	  Select this if you want to play back WAV files.
 Gustavo> +
 Gustavo> +config BR2_PACKAGE_MPD_MAD
 Gustavo> +	bool "mad"
 Gustavo> +	select BR2_PACKAGE_LIBID3TAG
 Gustavo> +	select BR2_PACKAGE_LIBMAD
 Gustavo> +	help
 Gustavo> +	  Enable mad input support.
 Gustavo> +	  Select this if you want to play back MP3 files.
 Gustavo> +	  mpg123 has better quality support (24-bit) but doesn't seek.

I think it's a bit confusing to see the reference to mpg123 here.

 Gustavo> +
 Gustavo> +config BR2_PACKAGE_MPD_MPG123
 Gustavo> +	bool "mpg123"
 Gustavo> +	select BR2_PACKAGE_LIBID3TAG
 Gustavo> +	select BR2_PACKAGE_MPG123
 Gustavo> +	help
 Gustavo> +	  Enable mpg123 input support.
 Gustavo> +	  Select this if you want to play back MP3 files.
 Gustavo> +	  mpg123 has better quality support (24-bit) but doesn't seek.
 Gustavo> +
 Gustavo> +config BR2_PACKAGE_MPD_MUSEPACK
 Gustavo> +	bool "musepack"
 Gustavo> +	select BR2_PACKAGE_LIBCUE
 Gustavo> +	select BR2_PACKAGE_LIBREPLAYGAIN
 Gustavo> +	select BR2_PACKAGE_MUSEPACK
 Gustavo> +	help
 Gustavo> +	  Enable musepack input support.
 Gustavo> +	  Select this if you want to play back MPC files.
 Gustavo> +
 Gustavo> +config BR2_PACKAGE_MPD_SQLITE
 Gustavo> +	bool "sqlite"
 Gustavo> +	select BR2_PACKAGE_SQLITE
 Gustavo> +	help
 Gustavo> +	  Enable sqlite database support.
 Gustavo> +	  If you don't use sqlite it will use an ASCII database.
 Gustavo> +
 Gustavo> +config BR2_PACKAGE_MPD_TCP
 Gustavo> +	bool "tcp sockets"
 Gustavo> +	default y
 Gustavo> +	help
 Gustavo> +	  Enable mpd to listen on tcp sockets.
 Gustavo> +
 Gustavo> +	  You want this on if mpd and the client(s) work
 Gustavo> +	  on different machines (the usual scenario).
 Gustavo> +
 Gustavo> +config BR2_PACKAGE_MPD_TREMOR
 Gustavo> +	bool "tremor"
 Gustavo> +	select BR2_PACKAGE_LIBOGG
 Gustavo> +	select BR2_PACKAGE_TREMOR
 Gustavo> +	help
 Gustavo> +	  Enable vorbis input support.
 Gustavo> +	  Select this if you want to play back OGG files.
 Gustavo> +
 Gustavo> +config BR2_PACKAGE_MPD_VORBIS
 Gustavo> +	bool "vorbis"
 Gustavo> +	select BR2_PACKAGE_LIBOGG
 Gustavo> +	select BR2_PACKAGE_LIBVORBIS
 Gustavo> +	help
 Gustavo> +	  Enable vorbis input/streaming support.
 Gustavo> +	  Select this if you want to play back OGG files. 

Trailing space. I think it would be good to add a little note about
when/why someone would want to use tremor instead of vorbis and
otherwise.

 Gustavo> +++ b/package/multimedia/mpd/mpd.mk
 Gustavo> @@ -0,0 +1,85 @@
 Gustavo> +#############################################################
 Gustavo> +#
 Gustavo> +# mpd
 Gustavo> +#
 Gustavo> +#############################################################
 Gustavo> +
 Gustavo> +MPD_VERSION = 0.16.1
 Gustavo> +MPD_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/musicpd
 Gustavo> +MPD_DEPENDENCIES = host-pkg-config libglib2
 Gustavo> +
 Gustavo> +# Config.in selects most options to make life easier and avoid guess work
 Gustavo> +
 Gustavo> +ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
 Gustavo> +MPD_DEPENDENCIES += alsa-lib
 Gustavo> +endif

This is a bit confusing. The users sees config options to enable/disable
support for the various plugins, but those choices are not taken into
consideration.

E.G. if the user for some reason has faad enabled, but are not planning
on using it with mpd, then it will still be enabled no matter what they
set BR2_PACKAGE_MPD_FAAD2 to.

I think we should either get rid of those options, and just build
plugins for whatever libs are enabled (not really optimal), or otherwise
check the options here and pass the correct --enable / --disable options
to force the corresponding plugins to be enabled or not.

-- 
Bye, Peter Korsgaard
