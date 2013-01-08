From: Patrick <kpa_info@yahoo.fr>
Date: Tue, 08 Jan 2013 14:27:27 +0100
Subject: [Buildroot] Error when adding media-ctl as package
Message-ID: <50EC1EBF.80807@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear mailing list,

I am working with buildroot 2012.11 and I need to add the media-ctl tool 
(http://git.ideasonboard.org/media-ctl.git).

I have added this tool in buildroot as a package following the buildroot 
user manual and this: 
https://github.com/MaxGalemin/buildroot/commit/2ac3323f9d40c2610128d3a22fee8dd195979dc9

The Config.in and media-ctl.mk files I have added are attached to this mail.

When doing "make media-ctl" I have the following error when buildroot 
do the configure step :

checking if libtool supports shared libraries... yes
checking whether to build shared libraries... yes
checking whether to build static libraries... yes
./configure: 10676: ./configure.lineno: Syntax error: word unexpected 
(expecting ")")
make: *** 
[/home/pgerber/imusba/buildroot/output/build/media-ctl-36a1357c9c879092fe2e36c82187f1d35b1efe13/.stamp_configured] 
Error 2

As anyone have any idea why I have this and how to fix it ?
Any help is welcome.

Thanks in advance

Patrick
-------------- next part --------------
config BR2_PACKAGE_MEDIA_CTL
	bool "media-ctl"
	help
	  Media controller control application
-------------- next part --------------
#############################################################
#
# media-ctl
#
#############################################################

#MEDIA_CTL_VERSION = ac40b79f002a2315f909548614ccd2d408da25b7
MEDIA_CTL_VERSION = 36a1357c9c879092fe2e36c82187f1d35b1efe13
MEDIA_CTL_SITE = git://git.ideasonboard.org/media-ctl.git
MEDIA_CTL_INSTALL_STAGING = YES
MEDIA_CTL_LICENSE = GPLv2
MEDIA_CTL_LICENSE_FILES = COPYING.LIB
MEDIA_CTL_AUTORECONF = YES
MEDIA_CTL_AUTORECONF_OPT = --install
MEDIA_CTL_CONF_OPT = --with-kernel-headers=$(STAGING_DIR)/usr/include

$(eval $(autotools-package))
