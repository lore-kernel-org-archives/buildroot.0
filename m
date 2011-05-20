From: Rafael Toledo <rafaeldtoledo@gmail.com>
Date: Fri, 20 May 2011 15:38:31 -0300
Subject: [Buildroot] Fwd: Installed package not found
Message-ID: <4DD6B527.3030808@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

I'm trying to add the 'libfprint' package into Buildroot. As I read in
the site of the project, the requisites are glib2, libusb-1.0,
ImageMagick and nss3 in the current version (0.4.0). As I can't found
nss in the Buildroot, I 'downgraded' the version, trying to install the
version 0.0.6. Well, the config files are the following:

## Config.in ##
config BR2_PACKAGE_LIBFPRINT
     bool "libfprint"
     help
       The libfprint is a library for biometric
       fingerprint development.

       http://www.reactivated.net/fprint/wiki/Libfprint
## end Config.in ##

## libfprint.mk ##
#############################################################
#
# libfprint
#
#############################################################

LIBFPRINT_VERSION = 0.0.6
LIBFPRINT_SOURCE = libfprint-$(LIBFPRINT_VERSION).tar.bz2
LIBFPRINT_SITE =
http://sourceforge.net/projects/fprint/files/libfprint/v$(LIBFPRINT_VERSION)/libfprint-$(LIBFPRINT_VERSION).tar.bz2/download
LIBFPRINT_INSTALL_STAGING = YES
LIBFPRINT_INSTALL_TARGET = YES
LIBFPRINT_DEPENDENCIES = libglib2 imagemagick libusb

$(eval $(call AUTOTARGETS,package,libfprint))
## end libfprint.mk ##

First, the download link isn't ok, but I'll fix it later (the current
version is git hosted). For tests, I put the file manually in the dl
folder. My main problem is that, in the ./configure script, the process
stops saying that 'No package 'libusb' found', but it is installed.
Someone can help me?
