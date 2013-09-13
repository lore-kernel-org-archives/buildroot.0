From: =?UTF-8?B?QXJuYXVkIFLDqWJpbGxvdXQ=?= <rebillout@syscom.ch>
Date: Fri, 13 Sep 2013 09:29:21 +0200
Subject: [Buildroot] [PATCH] tcping: new package
In-Reply-To: <20130912184411.1afe29d2@skate>
References: <1378912077-8707-1-git-send-email-rebillout@syscom.ch>
 <20130912184411.1afe29d2@skate>
Message-ID: <5232BED1.5040603@syscom.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

thanks for your feedback, the corrected version will come soon.

Best regards

On 09/12/2013 06:44 PM, Thomas Petazzoni wrote:
> Dear Arnaud R?billout,
>
> Thanks for this contribution! A few comments below, if you could fix
> them and resend an updated version, that'd be great!
>
>> http://www.linuxco.de/tcping/tcping.html
>> Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
> First, leave one empty line before the Signed-off-by line.
>
> On Wed, 11 Sep 2013 17:07:57 +0200, Arnaud R?billout wrote:
>
>> diff --git a/package/tcping/Config.in b/package/tcping/Config.in
>> new file mode 100644
>> index 0000000..d440c56
>> --- /dev/null
>> +++ b/package/tcping/Config.in
>> @@ -0,0 +1,7 @@
>> +config BR2_PACKAGE_TCPING
>> +	bool "tcping"
>> +	help
>> +	  tcping does a TCP connect to the given ip/port combination.
> I believe you could put here a slightly longer description, such as the
> one you've written in your commit log.
>
>> +	  http://www.linuxco.de/tcping/tcping.html
>> +
>> diff --git a/package/tcping/tcping.mk b/package/tcping/tcping.mk
>> new file mode 100644
>> index 0000000..67bb30a
>> --- /dev/null
>> +++ b/package/tcping/tcping.mk
>> @@ -0,0 +1,27 @@
>> +#############################################################
>> +#
>> +# tcping
>> +#
>> +#############################################################
> There should be 80 # dashes, and an empty line between this header and
> the first variable.
>
>> +TCPING_VERSION = 1.3.5
>> +TCPING_SOURCE = tcping-$(TCPING_VERSION).tar.gz
> This last line is not needed since it is the default value.
>
>> +TCPING_SITE = http://www.linuxco.de/tcping
>> +TCPING_LICENSE = GPLv3+
> You should add another line here for the licensing informations:
>
> TCPING_LICENSE_FILES = LICENSE
>
> this will automatically consider the file called 'LICENSE' in the
> tcping source tree as the license file.
>
>> +define TCPING_BUILD_CMDS
>> +	$(MAKE) CC="$(TARGET_CC)" CCFLAGS="$(TARGET_CFLAGS)" -C $(@D) tcping.linux
>> +endef
> It's quite unfortunate that the Makefile uses the non-standard CCFLAGS
> instead of CFLAGS, but ok.
>
>> +define TCPING_INSTALL_TARGET_CMDS
>> +	$(INSTALL) -D -m 0755 $(@D)/tcping $(TARGET_DIR)/usr/bin/tcping
>> +endef
>> +
>> +define TCPING_UNINSTALL_TARGET_CMDS
>> +	rm -f $(TARGET_DIR)/usr/bin/tcping
>> +endef
>> +
>> +define TCPING_CLEAN_CMDS
>> +	-$(MAKE) -C $(@D) clean
>> +endef
> You can remove the uninstall and clean commands, we are going to remove
> them soon.
>
> Other than that, looks good! Thanks again!
>
> Thomas


-- 
Arnaud R?billout
SYSCOM Instruments SA
rue de l'industrie 21
CH-1450 Sainte-Croix
Switzerland
Tel: +41 (0)24 455 44 11
