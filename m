From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 21 Jul 2015 18:26:48 +0200
Subject: [Buildroot] [PATCH 2/2] rtl8188eu: new package
In-Reply-To: <20150718233012.5293b49f@free-electrons.com>
References: <1436188175-7912-1-git-send-email-luca@lucaceresoli.net>
 <1436188175-7912-2-git-send-email-luca@lucaceresoli.net>
 <20150718233012.5293b49f@free-electrons.com>
Message-ID: <55AE72C8.10405@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Mon,  6 Jul 2015 15:09:35 +0200, Luca Ceresoli wrote:
>
>> diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
>> new file mode 100644
>> index 0000000..843d9b0
>> --- /dev/null
>> +++ b/package/rtl8188eu/rtl8188eu.mk
>> @@ -0,0 +1,22 @@
>> +################################################################################
>> +#
>> +# rtl8188eu
>> +#
>> +################################################################################
>> +
>> +RTL8188EU_VERSION = 3091828c8f4b4a01cbec6025128bf77e6e7b9f97
>> +RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
>> +RTL8188EU_DEPENDENCIES = linux
>> +RTL8188EU_LICENSE = GPLv2
>> +RTL8188EU_LICENSE_FILES = COPYING
>> +
>> +define RTL8188EU_BUILD_CMDS
>> +	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KSRC=$(LINUX_DIR)
>> +endef
>> +
>> +define RTL8188EU_INSTALL_TARGET_CMDS
>> +	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KSRC=$(LINUX_DIR) \
>> +		modules_install firmware_install
>> +endef
>> +
>> +$(eval $(generic-package))
>
> In addition to the previous discussion, this package should also
> probably be using the new kernel-module infrastructure.

Yes, I guess so.

>
> Can you respin a new version? In the mean time, I'll mark this one as
> "Changes Requested" in patchwork.

It's on my todo list.

However, I still haven't understood your opinion about using mdev
without devtmpfs (it's for firmware loading in this case)...

-- 
Luca
