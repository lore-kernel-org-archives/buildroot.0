From: =?UTF-8?B?7KCV7ISx67SJ?= <devbon@naver.com>
Date: Fri, 19 Aug 2016 23:21:58 +0900 (KST)
Subject: [Buildroot] =?utf-8?q?How_I_can_add_a_package_of_cmus=3F?=
Message-ID: <68562d34c69d106316a77f40dfa9a0@cweb20.nm.nhnsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I want to add cmus(ncurse based cui music player) package to my buildroot. But, I'm a lemon. I am struggling to write. Would you help me some?  
 
################################################################################
#
# cmus
#
################################################################################


CMUS_VERSION = 2.7.1
CMUS_SOURCE = v$(CMUS_VERSION).tar.gz
CMUS_SITE = https://github.com/cmus/cmus/archive
CMUS_DEPENDENCIES  = host-pkgconf
CMUS_INSTALL_STAGING = YES

define CMUS_CONFIGURE_CMDS
        (cd $(@D); \
                PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
                PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
                PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
                PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \
        ./configure \
                prefix="$(STAGING_DIR)/usr"  \
                         )
endef

define CMUS_BUILD_CMDS
          $(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all
endef

$(eval $(generic-package))
 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160819/b717079f/attachment.html>
