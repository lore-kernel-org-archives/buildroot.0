From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Thu, 13 Feb 2014 17:31:25 -0700
Subject: [Buildroot] [PATCH V4 2/2] i.MX: Update versions to match
 latest Freescale release
In-Reply-To: <20140213225218.GC3259@free.fr>
References: <1381287931-7070-1-git-send-email-eric.nelson@boundarydevices.com>
 <1381287931-7070-3-git-send-email-eric.nelson@boundarydevices.com>
 <20140212190351.GD17804@free.fr> <52FBC72D.3090706@boundarydevices.com>
 <52FBD772.40900@boundarydevices.com> <20140212234144.GE17804@free.fr>
 <52FC2750.7000602@boundarydevices.com> <20140213225218.GC3259@free.fr>
Message-ID: <52FD63DD.2000208@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 02/13/2014 03:52 PM, Yann E. MORIN wrote:
> Eric, All,
>
> On 2014-02-12 19:00 -0700, Eric Nelson spake thusly:
>> On 02/12/2014 04:41 PM, Yann E. MORIN wrote:
>>> However, The cleanest in my opinion would be to extract the archive into
>>> a subdir of $(@D), like:
>>>
>>>      # Blurb about auto-extract in a properly-named dir
>>>      define IMX_LIB_EXTRACT_CMDS
>>>          cd $(@D); \
>>>          sh $(DL_DIR)/$(IMX_LIB_SOURCE) --force --auto-accept
>>
>> And then move them?
>> i.e.
>> 	mv $(@D)/packagemname/* $(@D)/
>> 	rm -r $(@D)/packagemname/
>
> No, we would not need to move it. We'd just use it as-is in the
> following commands, like I showed below:
>
>>>      define IMX_LIB_BUILD_CMDS
>>>          $(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D)/imx-lib-$(FREESCALE_IMX_VERSION)
>>>      endef
>
>> It seems like over-kill to keep the directory around.
>
> Well, maybe not overkill, but not-so-clean, yes.
>
>> And what about the patch step references?
>
> Boom! :-)
>

I'm still not quite grokking this, but I'll take a stab.

I just sent a patch set with things done the other way.

Please just Nak patch 3 of 3.

I left it in because I already had the notes in place
and it might be useful for comparison.

Regards,


Eric
