From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
Date: Mon, 10 Oct 2011 19:32:13 +0200
Subject: [Buildroot] [PATCH] add package tango-icon-theme and dependency
 icon-naming-utils
In-Reply-To: <20111010161008.3ba4b436@skate>
References: <1318253496-23729-1-git-send-email-schwarzkopf@sensortherm.de>
 <20111010161008.3ba4b436@skate>
Message-ID: <4E932C1D.1090605@sensortherm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

if made the changes, and test it with the latest git tree. But i get an 
error:

 >>> tango-icon-theme 0.8.90 Extracting
gzip -d -c 
/home/klaus/ti-dvsdk_dm365/buildroot/dl/tango-icon-theme-0.8.90.tar.gz | 
tar --strip-components=1 -C 
/home/klaus/ti-dvsdk_dm365/buildroot/output/build/tango-icon-theme-0.8.90 
-xf -
 >>> tango-icon-theme 0.8.90 Patching package//tango-icon-theme
 >>> tango-icon-theme 0.8.90  Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find 
/home/klaus/ti-dvsdk_dm365/buildroot/output/build/tango-icon-theme-0.8.90 -name 
$file); do cp support/gnuconfig/$file $i; done; done
 >>> tango-icon-theme 0.8.90 Patching libtool
make: *** No rule to make target `host-icon-naming-utils', needed by 
`tango-icon-theme-depends'.  Stop.


Can you help?

Regards,

Klaus

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
>> +$(eval $(call AUTOTARGETS,package,icon-naming-utils,host))
>
> This should be:
>
> $(eval $(call AUTOTARGETS))
>
> in the Git version of Buildroot. The documentation has not yet been
> updated in that regard.
>
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
>
>> +$(eval $(call AUTOTARGETS,package,tango-icon-theme))
>
> $(eval $(call AUTOTARGETS))
>
> Regards,
>
> Thomas
