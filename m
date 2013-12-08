From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Sun, 08 Dec 2013 12:29:17 +0100
Subject: [Buildroot] [PATCH] ti-wpan: Add new package
In-Reply-To: <20131208120659.60042c0d@skate>
References: <1386495041-17629-1-git-send-email-alexandre.belloni@free-electrons.com>
 <20131208120659.60042c0d@skate>
Message-ID: <52A4580D.4000200@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/12/2013 12:06, Thomas Petazzoni wrote:
> Dear Alexandre Belloni,
>
> Thanks for this contribution!
>
> On Sun,  8 Dec 2013 10:30:41 +0100, Alexandre Belloni wrote:
>> diff --git a/package/ti-wpan/ti-wpan.mk b/package/ti-wpan/ti-wpan.mk
>> new file mode 100644
>> index 000000000000..ef70495e3342
>> --- /dev/null
>> +++ b/package/ti-wpan/ti-wpan.mk
>> @@ -0,0 +1,25 @@
>> +#############################################################
>> +#
>> +# ti-wpan
>> +#
>> +#############################################################
>> +
>> +TI_WPAN_VERSION = 5beae4748cd36f4464a43e0a870c881a3f8f1b5b
>> +TI_WPAN_SITE = git://git.omapzoom.org/platform/hardware/ti/wpan.git
>> +TI_WPAN_LICENSE = GPLv2+
>> +TI_WPAN_LICENSE_FILES = ti_st/uim-sysfs/uim.c
>> +
>> +define TI_WPAN_BUILD_CMDS
>> +    cd $(@D)/ti_st/uim-sysfs && $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o uim-sysfs uim.c 
> Would be slightly better to have an indentation of one tab here, like
> the other commands below.
>
>> +endef
>> +
>> +define TI_WPAN_INSTALL_TARGET_CMDS
>> +	$(INSTALL) -m 0755 -D $(@D)/ti_st/uim-sysfs/uim-sysfs \
>> +		$(TARGET_DIR)/usr/sbin/uim-sysfs
>> +endef
>> +
>> +define TI_WPAN_UNINSTALL_TARGET_CMDS
>> +	rm -f $(TARGET_DIR)/usr/sbin/uim-sysfs
>> +endef
> Please remove the uninstall command. We have deprecated this, and they
> have all been removed from the repository a few days ago, so we don't
> want to introduce more of them :)

Will do. Anyway, scrap that, I just found another repository without all
the android crap in it...

> Thanks!
>
> Thomas


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
