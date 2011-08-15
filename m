From: Frederic Bassaler <frederic.bassaler@gmail.com>
Date: Mon, 15 Aug 2011 17:47:27 +0200
Subject: [Buildroot] Trying to package vala (needed to build midori 0.4.0)
Message-ID: <20110815174727.680d45f7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all

I'm trying to package vala (latest version), which is needed to build
midori 0.4.0

my vala.mk :

#############################################################
#
# vala
#
#############################################################
VALA_VERSION_MAJOR = 0.13
VALA_VERSION_MINOR = 1
VALA_VERSION = $(VALA_VERSION_MAJOR).$(VALA_VERSION_MINOR)
VALA_SOURCE = vala-$(VALA_VERSION).tar.bz2
VALA_SITE =
http://ftp.gnome.org/pub/GNOME/sources/vala/$(VALA_VERSION_MAJOR)
VALA_INSTALL_STAGING = NO VALA_INSTALL_TARGET = NO
VALA_CONF_OPT = --prefix=$(HOST_DIR)/usr
VALA_DEPENDENCIES = host-pkg-config

$(eval $(call AUTOTARGETS,package,vala,host))


It compiles OK, but midori complains about the valac version :

Checking for program gcc or
cc           : /home/fred/buildroot/output/host/usr/bin/i686-unknown-linux-uclibc-gcc
Checking for program
ar                  : /home/fred/buildroot/output/host/usr/bin/i686-unknown-linux-uclibc-ar
Checking for program
ranlib              : /home/fred/buildroot/output/host/usr/bin/i686-unknown-linux-uclibc-ranlib
Checking for gcc                         : ok Checking for program
valac               : /home/fred/buildroot/output/host/usr/bin/valac
Checking for gobject-2.0                 : yes Checking for
gthread-2.0                 : yes 
Checking for program version valac >= 0.1.6 : not
found /home/fred/buildroot/output/build/midori-0.4.0/wscript:91: error:
valac version too old to be used with this tool make: ***
[/home/fred/buildroot/output/build/midori-0.4.0/.stamp_configured]
Erreur 1


I found that 

$ output/host/usr/bin/valac --version

returns :

Vala 0.13.0-dirty

I guess the "-dirty" is added by my buildroot installation when
compiling vala, and that's why midori's build script complains...

How do I correct this, so that midori detects valac's version correctly?

Thanks
