From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Jun 2017 09:58:25 +0200
Subject: [Buildroot] [PATCH] azure-iot-sdk-c: New package
In-Reply-To: <37120af7-cab4-1758-20a3-46042eb64715@dawncrow.de>
References: <1496945304-8582-1-git-send-email-nerv@dawncrow.de>
 <9904cc2a-a8d8-b3a2-bc4d-dda30196e105@mind.be>
 <37120af7-cab4-1758-20a3-46042eb64715@dawncrow.de>
Message-ID: <a7d8267a-ee36-9a1d-7007-261b02859b61@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-06-17 23:53, Andr? Hentschel wrote:
> Hi Arnout,
> 
> Thank you for your review!
> I'm about to send v2, so here some comments inline:
> 
> Am 10.06.2017 um 14:03 schrieb Arnout Vandecappelle:
>>  Hi Andr?,
>>
>> On 08-06-17 20:08, Andr? Hentschel wrote:
[snip]
>>> +AZURE_IOT_SDK_C_VERSION = lts_03_2017
>>
>>  This is a branch, not a tag. Please use 2017-03-24 instead.
>>
>>  However, that branch doesn't seem to have received any commits since its
>> release, so I wonder if it doesn't make more sense to use the 2017-06-02 tag.
> 
> I use 2017-05-05 now, because newer versions will need some fixes (maybe as patches), so let's start with a cleaner version that just works.

 OK, please make this clear in the commit message.

[snip]
>>> +define AZURE_IOT_SDK_C_INSTALL_STAGING_CMDS
>>> +	$(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
>>> +		$(INSTALL) -D -m 0755 $(@D)/$(l) $(STAGING_DIR)/usr/lib/
>>> +	)
>>> +	cp -a $(@D)/c-utility/inc/* $(STAGING_DIR)/usr/include/
>>> +	cp -a $(@D)/iothub_client/inc/* $(STAGING_DIR)/usr/include/
>>
>>  Why are these custom commands needed? I had a quick look at the CMakeLists.txt
>> and it doesn't look like it does anything special.
>>
>>  If they are needed, please explain in a comment or the commit message.
> 
> Depending on the version the install target either installs only files which no one is interested in (sample libs or something) or it fails because they removed the install target

 They *removed* the install target? I didn't even know that was possible in CMake...

 Anyway, please clarify this in the commit message (you only need to explain the
problem in the version that you use, so not either/or).

 Regards,
 Arnout

> 
> 
>>
>>  Regards,
>>  Arnout
>>
>>> +endef
>>> +
>>> +define AZURE_IOT_SDK_C_INSTALL_TARGET_CMDS
>>> +	$(foreach l,$(AZURE_IOT_SDK_C_LIBS), \
>>> +		$(INSTALL) -D -m 0755 $(@D)/$(l) $(TARGET_DIR)/usr/lib/
>>> +	)
>>> +endef
>>> +
>>> +$(eval $(cmake-package))
>>>
>>
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
