From: Lars Lockenvitz <l.lockenvitz@fpga-art.de>
Date: Thu, 30 Jul 2009 16:06:00 +0200
Subject: [Buildroot] no fontconfig in $(TARGET_DIR)
Message-ID: <4A71A8C8.5030409@fpga-art.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I don't use the newest buildroot version. I use rev 25671 from git.
And have the problem that fontconfig is present in $(STAGING_DIR) but 
not in $(TARGET_DIR).
But the fontconfig.mk says:

FONTCONFIG_VERSION = 2.6.0
FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.gz
FONTCONFIG_SITE = http://fontconfig.org/release
FONTCONFIG_AUTORECONF = YES
FONTCONFIG_USE_CONFIG_CACHE = NO
FONTCONFIG_INSTALL_STAGING = YES
FONTCONFIG_INSTALL_TARGET = YES
# This package does not like using the target cflags for some reason.
FONTCONFIG_CONF_ENV = CFLAGS="-I$(STAGING_DIR)/usr/include/freetype2"

FONTCONFIG_CONF_OPT = --with-arch=$(GNU_TARGET_NAME) \
        --with-freetype-config="$(STAGING_DIR)/usr/bin/freetype-config" \
        --with-cache-dir=/var/cache/fontconfig \
        --with-expat="$(STAGING_DIR)/usr/lib" \
        --with-expat-lib=$(STAGING_DIR)/usr/lib \
        --with-expat-qincludes=$(STAGING_DIR)/usr/include \
        --disable-docs

FONTCONFIG_DEPENDENCIES = uclibc freetype expat

$(eval $(call AUTOTARGETS,package,fontconfig))

I can't see any error for this or something that let me know what the 
problem.
Is there a known problem or do someone a suggestion?

Regard
Lars
