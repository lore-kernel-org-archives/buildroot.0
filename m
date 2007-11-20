From: Hebbar <gururajakr@sanyo.co.in>
Date: Mon, 19 Nov 2007 16:09:56 -0800 (PST)
Subject: [Buildroot] SDL fails for Buildroot arm926ejs toolchain
In-Reply-To: <4741755A.5010404@promwad.com>
References: <13830846.post@talk.nabble.com> <4741755A.5010404@promwad.com>
Message-ID: <13848331.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Ivan

 I am using version SDL-1.2.12. Below is SDL Config.log and SDL configure
items inside .config from buildroot directory.

  $ ./configure --target=arm-linux --host=arm-linux
--build=i386-pc-linux-gnu --prefix=/usr --exec-prefix=/usr --bindir=/bin
--sbindir=/sbin --libdir=/lib --libexecdir=/lib --sysconfdir=/etc
--datadir=/share --localstatedir=/var --includedir=/include --mandir=/man
--infodir=/info --enable-pulseaudio=no --disable-arts --disable-esd
--disable-nasm --enable-video-fbcon=yes --enable-video-directfb=yes
--enable-video-qtopia=no --enable-video-x11=yes

BR2_PACKAGE_NCURSES=y
BR2_PACKAGE_NCURSES_TARGET_HEADERS=y

# graphic libraries
#
BR2_PACKAGE_DIRECTFB=y
BR2_PACKAGE_DIRECTFB_MULTI=y
# BR2_PACKAGE_IMAGEMAGICK is not set
BR2_PACKAGE_JPEG=y
BR2_PACKAGE_LIBPNG=y
BR2_PACKAGE_LIBUNGIF=y
BR2_PACKAGE_SDL=y

#
# SDL options selection
#
BR2_PACKAGE_SDL_FBCON=y
BR2_PACKAGE_SDL_DIRECTFB=y
# BR2_PACKAGE_SDL_QTOPIA is not set
BR2_PACKAGE_SDL_X11=y
# BR2_PACKAGE_SDL_TTF is not set
# BR2_PACKAGE_TIFF is not set

BR2_PACKAGE_FBV=y

# BR2_PACKAGE_QTE is not set
# BR2_PACKAGE_QTOPIA4 is not set
BR2_PACKAGE_XSERVER_none=y
# BR2_PACKAGE_XSERVER_x11r7 is not set
# BR2_PACKAGE_XSERVER_xorg is not set
# BR2_PACKAGE_XSERVER_tinyx is not set
BR2_X11_PREFIX="/usr"

#
# X libraries and helper libraries
#
# BR2_PACKAGE_ATK is not set
# BR2_PACKAGE_PANGO is not set
# BR2_PACKAGE_LIBDRM is not set
# BR2_PACKAGE_LIBGLIB12 is not set
BR2_PACKAGE_LIBGLIB2=y
BR2_PACKAGE_FONTCONFIG=y
BR2_PACKAGE_FREETYPE=y
# BR2_FREETYPE_VERSION_2_2_1 is not set
BR2_FREETYPE_VERSION_2_3_5=y
BR2_FREETYPE_VERSION="2.3.5"
BR2_PACKAGE_TSLIB=y

Thanks in advance

Regards
Gururaja

Hi,

Please post your output of configure. I have SDL-1.2.12 built ok and headers
are taken from staging_dir.

Regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot



-- 
View this message in context: http://www.nabble.com/SDL-fails-for-Buildroot-arm926ejs-toolchain-tf4834503.html#a13848331
Sent from the BuildRoot mailing list archive at Nabble.com.
