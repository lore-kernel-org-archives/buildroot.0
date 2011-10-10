From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
Date: Mon, 10 Oct 2011 16:23:49 +0200
Subject: [Buildroot] [PATCH] add package tango-icon-theme and dependency
 icon-naming-utils
In-Reply-To: <20111010161008.3ba4b436@skate>
References: <1318253496-23729-1-git-send-email-schwarzkopf@sensortherm.de>
 <20111010161008.3ba4b436@skate>
Message-ID: <4E92FFF5.8070907@sensortherm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 10.10.2011 16:10, schrieb Thomas Petazzoni:
> Hello Klaus,
>
> Le Mon, 10 Oct 2011 15:31:36 +0200,
> Klaus Schwarzkopf<schwarzkopf@sensortherm.de>  a ?crit :
>
>> Signed-off-by: Klaus Schwarzkopf<schwarzkopf@sensortherm.de>
>> ---
>>   package/Config.in                              |    1 +
>>   package/icon-naming-utils/icon-naming-utils.mk |   11 +++++++++++
>>   package/tango-icon-theme/Config.in             |    6 ++++++
>>   package/tango-icon-theme/tango-icon-theme.mk   |   15 +++++++++++++++
>
> We usually have one patch per new package.
>


The icon-naming-utils is a helper package, only for the 
tango-icon-theme. The program generates the right names and make links 
in the target filesystem.


>> +$(eval $(call AUTOTARGETS,package,icon-naming-utils,host))
>
> This should be:
>
> $(eval $(call AUTOTARGETS))
>
> in the Git version of Buildroot. The documentation has not yet been
> updated in that regard.
>

OK


>> +TANGO_ICON_THEME_VERSION = 0.8.90
>> +TANGO_ICON_THEME_SOURCE = tango-icon-theme-$(TANGO_ICON_THEME_VERSION).tar.gz
>> +TANGO_ICON_THEME_SITE = http://tango.freedesktop.org/releases/
>> +
>> +TANGO_ICON_THEME_CONF_ENV = PKG_CONFIG_PATH=$(HOST_DIR)/usr/lib/pkgconfig
>
> Here you're going to build a target package (tango-icon-theme) based on
> library informations of the host. This looks wrong. pkg-config already
> looks in $(STAGING_DIR)/usr/lib/pkgconfig.
>
> Could you detail why this is needed ?


The icon-naming-utils only need for the host, so tango-icon-theme can 
not find the utils. Have you an better idea?

>
>> +$(eval $(call AUTOTARGETS,package,tango-icon-theme))
>
> $(eval $(call AUTOTARGETS))
>

OK

> Regards,
>
> Thomas

Regards,

Klaus
