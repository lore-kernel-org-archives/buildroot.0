From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Mar 2014 07:20:18 +0100
Subject: [Buildroot] [PATCH 1/6] barebox: fix coding style
In-Reply-To: <CAHkwnC-gS0_GD_XPZ0_pia4UFMMq7VZb-ouj0ezGWjN7bynVmg@mail.gmail.com>
References: <1394540278-28740-1-git-send-email-fabio.porcedda@gmail.com>
 <1394540278-28740-2-git-send-email-fabio.porcedda@gmail.com>
 <20140311173350.GA3330@free.fr> <5320027B.3000005@mind.be>
 <CAHkwnC-gS0_GD_XPZ0_pia4UFMMq7VZb-ouj0ezGWjN7bynVmg@mail.gmail.com>
Message-ID: <53269422.2090305@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/13/14 17:35, Fabio Porcedda wrote:
> Hi Arnout and Yann,
> thanks for reviewing the patch.
> 
> On Wed, Mar 12, 2014 at 7:45 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 03/11/14 18:33, Yann E. MORIN wrote:
>>> Fabio, All,
>>>
>>> On 2014-03-11 13:17 +0100, Fabio Porcedda spake thusly:
>>>> Break long lines.
>>> [--SNIP--]
>>>> -BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)"
>>>> +BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(CCACHE) \
>>>> +    $(TARGET_CROSS)"
>>
>>  Splitting a line between quotes is evil.
> 
> It's a matter of code style because it works fine, doesn't it?

 Yes. It's evil in the sense of: it will come out to bite the programmer
later on.


> 
>>>
>>> Although we have no written rule about thus, I'd rather that folded-lines
>>> assignments continue after the '=' sign, like:
>>>
>>> BAREBOX_MAKE_FLAGS = ARCH=$(BAREBOX_ARCH) CROSS_COMPILE="$(CCACHE) \
>>>                      $(TARGET_CROSS)"
>>>
>>> It makes it easier to see the assignment.
> 
> I don't have a strong opinion about this, i'd like also to be
> consistent to the style used in buildroot and i was unable to find any
> code that follow that rule.
> 
>>  Or better yet (and this is the unwritten rule that we tend to follow):
>>
>> BAREBOX_MAKE_FLAGS = \
>>         ARCH=$(BAREBOX_ARCH) \
>>         CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)"
> 
> It's nice, i will do like that.
> 
>>
>>>
>>>>  ifeq ($(BR2_TARGET_BAREBOX_USE_DEFCONFIG),y)
>>>> -BAREBOX_SOURCE_CONFIG = $(@D)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,$(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
>>>> +BAREBOX_SOURCE_CONFIG = $(@D)/arch/$(BAREBOX_ARCH)/configs/$(call qstrip,\
>>>> +    $(BR2_TARGET_BAREBOX_BOARD_DEFCONFIG))_defconfig
>>
>>  Splitting a single path is also evil. We do usually keep the long lines
>> in such a case.
> 
> This time too it's a matter of code style, isn't it?

 Yes, but this time I exaggerated - splitting a path like that is not
really evil, it's just something I would rather not see.

> 
>>
>>>
>>> Ditto.
>>>
>>>>  else ifeq ($(BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG),y)
>>>>  BAREBOX_SOURCE_CONFIG = $(BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE)
>>>>  endif
>>>>
>>>>  define BAREBOX_CONFIGURE_CMDS
>>>> -    cp $(BAREBOX_SOURCE_CONFIG) $(@D)/arch/$(BAREBOX_ARCH)/configs/buildroot_defconfig
>>>> -    $(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
>>>> +    cp $(BAREBOX_SOURCE_CONFIG) \
>>>> +            $(@D)/arch/$(BAREBOX_ARCH)/configs/buildroot_defconfig
>>>> +    $(TARGET_MAKE_ENV) $(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) \
>>>> +            buildroot_defconfig
>>>>  endef
>>>>
>>>>  ifeq ($(BR2_TARGET_BAREBOX_BAREBOXENV),y)
>>>> @@ -68,7 +73,8 @@ endef
>>>>  endif
>>>>
>>>>  ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_ENV),y)
>>>> -BAREBOX_ENV_NAME = $(notdir $(call qstrip, $(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)))
>>>> +BAREBOX_ENV_NAME = $(notdir $(call qstrip,\
>>>> +    $(BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH)))
>>
>>  This one is probably OK :-)
>>
>>
>>  Regards,
>>  Arnout
>>
>>>
>>> Ditto.
>>>
>>> But I'd like the maintainer to Ack this before you resend. I have no
>>> strong opinion about it, I just find it easier to read...

 That statement is still true BTW.


 Regards,
 Arnout

>>>
>>> Regards,
>>> Yann E. MORIN.
> 
> 
> Thanks
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
