From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Tue, 27 Oct 2009 11:17:34 +0100
Subject: [Buildroot] [PATCH] Fix TARGET_PATH variable with external
 toolchain
In-Reply-To: <20091027105329.0cc61c47@surf>
References: <1256342684.28475.5.camel@coalu.atr>
	<87ljj0zlh6.fsf@macbook.be.48ers.dk> <20091027084428.6132b429@surf>
	<1256636707.32194.7.camel@coalu.atr>  <20091027105329.0cc61c47@surf>
Message-ID: <1256638654.32194.44.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mardi 27 octobre 2009 ? 10:53 +0100, Thomas Petazzoni a ?crit :
> Le Tue, 27 Oct 2009 10:45:07 +0100,
> Lionel Landwerlin <llandwerlin@gmail.com> a ?crit :
> 
> > Sounds right to me.
> > 
> > Let's add
> > 
> >  WEBKIT_CONF_ENV = icu_config=$(STAGING_DIR)/usr/bin/icu-config
> > 
> > to the webkit makefile.
> 
> Sure. But we'll have to remember that this is the solution to apply on
> all similar packages... for some of which a xxx_config configure
> options might not be present.

Right.
In my config I built the following packages :

atk-1.22.0
atk-1.22.0-host
autoconf-2.63-host
automake-1.10-host
buildroot-config
busybox-1.15.1
busybox-1.15.2
cairo-1.6.4
cairo-1.6.4-host
dbus-1.2.16
directfb-1.4.2
directfb-examples-1.2.0
eina-0.0.2.060
enchant-1.5.0
ethtool-6
expat-2.0.1
expat-2.0.1-host
fakeroot-1.9.5
fakeroot-1.9.5-host
fontconfig-2.6.0
fontconfig-2.6.0-host
freetype-2.3.9
freetype-2.3.9-host
gettext-0.16.1
icu
icu-host
iostat-2.2
jpeg-6b
libcurl-7.19.2
libecore-0.9.9.062
libe_dbus-0.5.0.062
libedje-0.9.92.062
libeet-1.2.2
libeina-0.0.2.062
libembryo-0.9.9.062
liberation-fonts-1.04
libevas-0.9.9.062
libglib2-2.20.5
libglib2-2.20.5-host
libgtk2-2.12.12
libgtk2-2.12.12-host
libpng-1.2.38
libsoup-2.26.2
libtool-1.5.24-host
libungif-4.1.4
libxml2-2.7.3
libxslt-1.1.24
lzo-2.03
m4-1.4.9-host
makedevs-host
mtd_orig
openssh-5.1p1
openssl-0.9.8k
pango-1.20.5
pango-1.20.5-host
pixman-0.10.0
pixman-0.10.0-host
pkg-config-0.23-host
sawman-1.4.2
sqlite-3.6.18
strace-4.5.18
sysstat-9.0.5
tiff-3.8.2
udev-114
webkit-r44552
zlib-1.2.3


By the way, is there a set of configuration files that cover the list of
package that are known to work with buildroot ?

It could be interesting to setup some kind of non regression builds :)


-- 
Lionel Landwerlin <llandwerlin@gmail.com>
