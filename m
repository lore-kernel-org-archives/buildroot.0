From: =?ISO-8859-1?Q?Gr=E9gory_Hermant?= <gregory.hermant@calao-systems.com>
Date: Tue, 13 Nov 2012 12:03:05 +0100
Subject: [Buildroot] [PATCH v2 1/6] hdmiservice: new package
In-Reply-To: <20121112193458.1504468b@skate>
References: <1352742102-19010-1-git-send-email-gregory.hermant@calao-systems.com>
 <1352742102-19010-2-git-send-email-gregory.hermant@calao-systems.com>
 <20121112193458.1504468b@skate>
Message-ID: <50A228E9.70507@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi thomas,

Le 12/11/2012 19:34, Thomas Petazzoni a ?crit :
> Dear Gregory Hermant,
> 
> On Mon, 12 Nov 2012 18:41:37 +0100, Gregory Hermant wrote:
>>
>> Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
>> ---
>>  package/Config.in                  |    1 +
>>  package/hdmiservice/Config.in      |   10 +++++++++
>>  package/hdmiservice/hdmiservice.mk |   43 ++++++++++++++++++++++++++++++++++++
> 
> Is this software something generic, or very specific to the Snowball
> platform? I am worried by the package name that is way too generic for
> something that looks board specific. It seems to be tied to a very
> custom graphics driver.

Yes it is specific to the snowball.
What do you suggest to manage this package ?
> 
>> diff --git a/package/hdmiservice/hdmiservice.mk b/package/hdmiservice/hdmiservice.mk
>> new file mode 100644
>> index 0000000..7199f1c
>> --- /dev/null
>> +++ b/package/hdmiservice/hdmiservice.mk
>> @@ -0,0 +1,43 @@
>> +#############################################################
>> +#
>> +# hdmiservice
>> +#
>> +#############################################################
>> +HDMISERVICE_VERSION = f75c99d1c52707240a78b4ba78e41d20d3aa3b08
>> +HDMISERVICE_SITE = git://igloocommunity.org/git/bsp/hdmiservice.git
>> +HDMISERVICE_LICENSE = MIT
>> +HDMISERVICE_LICENSE_FILES = debian/copyright
>> +HDMISERVICE_INSTALL_STAGING = YES
>> +
>> +define HDMISERVICE_BUILD_CMDS
>> +	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
>> +endef
>> +
>> +define HDMISERVICE_INSTALL_STAGING_CMDS
>> +	$(INSTALL) -D -m 0755 $(@D)/hdmiservice.so $(STAGING_DIR)/usr/lib/hdmiservice.so
>> +	$(INSTALL) -D -m 0644 $(@D)/include/hdmi_service_api.h $(STAGING_DIR)/usr/include/hdmi_service_api.h
>> +	$(INSTALL) -D -m 0644 $(@D)/include/hdmi_service_local.h $(STAGING_DIR)/usr/include/hdmi_service_local.h
>> +endef
>> +
>> +define HDMISERVICE_INSTALL_TARGET_CMDS
>> +	$(INSTALL) -D -m 0755 $(@D)/hdmiservice.so $(TARGET_DIR)/usr/lib/hdmiservice.so
>> +	$(INSTALL) -D -m 0755 $(@D)/hdmistart $(TARGET_DIR)/usr/bin/hdmistart
>> +endef
> 
> Any reason not to use the 'make install' target which apparently does
> the right thing?
> 
Not really. I just keep a similar syntax as staging part.
What do you recommend ?

> Thanks,
> 
> Thomas
> 
Thanks,
Gr?gory
