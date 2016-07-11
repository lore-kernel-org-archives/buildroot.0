From: Romain Perier <romain.perier@free-electrons.com>
Date: Mon, 11 Jul 2016 11:56:13 +0200
Subject: [Buildroot] [PATCH 3/6] docs/manual: Document the variable
	$(PKG)_DL_REFERER
In-Reply-To: <20160711112709.448eaec2@free-electrons.com>
References: <1468226925-21264-1-git-send-email-romain.perier@free-electrons.com>
 <1468226925-21264-4-git-send-email-romain.perier@free-electrons.com>
 <20160711112709.448eaec2@free-electrons.com>
Message-ID: <57836D3D.5020801@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 11/07/2016 11:27, Thomas Petazzoni a ?crit :
> Hello,
>
> On Mon, 11 Jul 2016 10:48:42 +0200, Romain Perier wrote:
>> Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
>> ---
>>   docs/manual/adding-packages-generic.txt | 75 ++++++++++++++++++---------------
>>   1 file changed, 41 insertions(+), 34 deletions(-)
>>
>> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
>> index 8ed7fe8..2ed01a9 100644
>> --- a/docs/manual/adding-packages-generic.txt
>> +++ b/docs/manual/adding-packages-generic.txt
>> @@ -22,40 +22,41 @@ system is based on hand-written Makefiles or shell scripts.
>>   07: LIBFOO_VERSION = 1.0
>>   08: LIBFOO_SOURCE = libfoo-$(LIBFOO_VERSION).tar.gz
>>   09: LIBFOO_SITE = http://www.foosoftware.org/download
>> -10: LIBFOO_LICENSE = GPLv3+
>> -11: LIBFOO_LICENSE_FILES = COPYING
>> -12: LIBFOO_INSTALL_STAGING = YES
>> -13: LIBFOO_CONFIG_SCRIPTS = libfoo-config
>> -14: LIBFOO_DEPENDENCIES = host-libaaa libbbb
>> -15:
>> -16: define LIBFOO_BUILD_CMDS
>> -17:	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
>> -18: endef
>> -19:
>> -20: define LIBFOO_INSTALL_STAGING_CMDS
>> -21:	$(INSTALL) -D -m 0755 $(@D)/libfoo.a $(STAGING_DIR)/usr/lib/libfoo.a
>> -22:	$(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
>> -23:	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(STAGING_DIR)/usr/lib
>> -24: endef
>> -25:
>> -26: define LIBFOO_INSTALL_TARGET_CMDS
>> -27:	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(TARGET_DIR)/usr/lib
>> -28:	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
>> -29: endef
>> -30:
>> -31: define LIBFOO_USERS
>> -32:	foo -1 libfoo -1 * - - - LibFoo daemon
>> -33: endef
>> -34:
>> -35: define LIBFOO_DEVICES
>> -36:	/dev/foo  c  666  0  0	42  0  -  -  -
>> -37: endef
>> -38:
>> -39: define LIBFOO_PERMISSIONS
>> -40:	/bin/foo  f  4755  foo  libfoo	 -  -  -  -  -
>> -41: endef
>> -42:
>> -43: $(eval $(generic-package))
>> +10  LIBFOO_DL_REFERER = http://www.foosoftware.org
>> +11: LIBFOO_LICENSE = GPLv3+
>> +12: LIBFOO_LICENSE_FILES = COPYING
>> +13: LIBFOO_INSTALL_STAGING = YES
>> +14: LIBFOO_CONFIG_SCRIPTS = libfoo-config
>> +15: LIBFOO_DEPENDENCIES = host-libaaa libbbb
>> +16:
>> +17: define LIBFOO_BUILD_CMDS
>> +18:	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
>> +19: endef
>> +20:
>> +21: define LIBFOO_INSTALL_STAGING_CMDS
>> +22:	$(INSTALL) -D -m 0755 $(@D)/libfoo.a $(STAGING_DIR)/usr/lib/libfoo.a
>> +23:	$(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
>> +24:	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(STAGING_DIR)/usr/lib
>> +25: endef
>> +26:
>> +27: define LIBFOO_INSTALL_TARGET_CMDS
>> +28:	$(INSTALL) -D -m 0755 $(@D)/libfoo.so* $(TARGET_DIR)/usr/lib
>> +29:	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
>> +30: endef
>> +31:
>> +32: define LIBFOO_USERS
>> +33:	foo -1 libfoo -1 * - - - LibFoo daemon
>> +34: endef
>> +35:
>> +36: define LIBFOO_DEVICES
>> +37:	/dev/foo  c  666  0  0	42  0  -  -  -
>> +38: endef
>> +39:
>> +40: define LIBFOO_PERMISSIONS
>> +41:	/bin/foo  f  4755  foo  libfoo	 -  -  -  -  -
>> +42: endef
>> +43:
>> +44: $(eval $(generic-package))
>>   --------------------------------
>
> This big chunk of change seems completely unrelated to your patch. Some
> issue with your text editor?

I just added this variable to the example. By doing so, it shifts the 
lines number. However, I don't think that's very useful to add this 
variable to this snippet of code, because this example seems to be 
helpful only for the most basic common cases.

Thank,
Romain,
-- 
Romain Perier, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
