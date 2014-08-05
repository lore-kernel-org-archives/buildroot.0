From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 05 Aug 2014 15:14:44 +0200
Subject: [Buildroot] [PATCH v3] bcache-tools: Adding package.
In-Reply-To: <53E09448.7050409@tribudubois.net>
References: <1407221585-30867-1-git-send-email-jcd@tribudubois.net>
 <53E088D5.2080505@trzebnica.net> <53E09448.7050409@tribudubois.net>
Message-ID: <53E0D8C4.3030506@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Jean-Christophe,

> Le 08/05/2014 09:33 AM, Jerzy Grzegorek a ?crit :
>>
>> Hi Jean-Christophe,
>>
>>>
>>> index 0000000..36f0b22
>>> --- /dev/null
>>> +++ b/package/bcache-tools/bcache-tools.mk
>>> @@ -0,0 +1,44 @@
>>> +################################################################################ 
>>>
>>> +#
>>> +# bcache-tools
>>> +#
>>> +################################################################################ 
>>>
>>> +
>>> +BCACHE_TOOLS_VERSION = 1.0.7
>>> +BCACHE_TOOLS_SITE = $(call 
>>> github,g2p,bcache-tools,v$(BCACHE_TOOLS_VERSION))
>>> +BCACHE_TOOLS_SOURCE = v$(BCACHE_TOOLS_VERSION).zip
>>
>> This should be:
>>
>> BCACHE_TOOLS_VERSION = v1.0.7
>> BCACHE_TOOLS_SITE = $(call 
>> github,g2p,bcache-tools,$(BCACHE_TOOLS_VERSION))
>>
>> Regards,
>> Jerzy
>
> I tried this before but this is not working because when unzipped the 
> bcache-tools directory is named bcache-tools-1.0.7 and not 
> bcache-tools-v1.0.7.
>
> JC

Did you remove:
define BCACHE_TOOLS_EXTRACT_CMDS
     unzip -d $(BUILD_DIR) $(DL_DIR)/$(BCACHE_TOOLS_SOURCE)
endef
?

Regards,
Jerzy

>
>
>
