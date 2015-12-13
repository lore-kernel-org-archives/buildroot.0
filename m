From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 13 Dec 2015 12:47:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/libhdhomerun: new package
References: <1450004296-5335-1-git-send-email-bernd.kuhls@t-online.de>
 <20151213113342.GF2318@tarshish>
Message-ID: <ve20kcx3eu.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Am Sun, 13 Dec 2015 13:33:42 +0200 schrieb Baruch Siach:

> Hi Bernd,
> 
> On Sun, Dec 13, 2015 at 11:58:16AM +0100, Bernd Kuhls wrote:
>> +define LIBHDHOMERUN_INSTALL_STAGING_CMDS +	$(INSTALL) -D -m 0755
>> $(@D)/libhdhomerun.so \ +		$(STAGING_DIR)/usr/lib/
libhdhomerun.so +
>> $(INSTALL) -D -m 0644 $(@D)/*.h \ +		$(STAGING_DIR)/usr/
include/
>> +endef +
>> +define LIBHDHOMERUN_INSTALL_TARGET_CMDS +	$(INSTALL) -D -m 0755
>> $(@D)/hdhomerun_config \
>> +		$(TARGET_DIR)/usr/bin/hdhomerun_config
> 
> Are you sure this is not for staging?

yes, because it is not a script but a binary compiled for the target:

$ file /home/bernd/buildroot/br2_kodi16/output/target/usr/bin/
hdhomerun_config
/home/bernd/buildroot/br2_kodi16/output/target/usr/bin/hdhomerun_config: 
ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, 
interpreter /lib/ld64-uClibc.so.0, not stripped

I am not sure whether the file is really needed on the target or not but 
it is definitely not suited for staging.

Regards, Bernd
