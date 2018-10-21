From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Oct 2018 15:27:46 +0100
Subject: [Buildroot] [[PATCH v2 03/14] package/mender: create directory
 structures required by the Mender client
In-Reply-To: <CADHdJwAS9JXuaHxGYFyn_=dpA+38KTC=sR07O8cL-yAr21Vbsg@mail.gmail.com>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
 <20180820130914.22377-4-mirza.krak@northern.tech>
 <20180820151531.095a087d@windsurf>
 <CADHdJwDdevWF52TVmzUQ=PnU5Q7e45mKkwrNYRydYJpK0JEDuQ@mail.gmail.com>
 <CADHdJwBAKCQdo82=WOuzhzNs5sYFg-NEuG_-kWaiAT9Gob5CDA@mail.gmail.com>
 <CADHdJwAS9JXuaHxGYFyn_=dpA+38KTC=sR07O8cL-yAr21Vbsg@mail.gmail.com>
Message-ID: <55b20834-d885-1e7a-bcd6-b62c69269d94@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/08/2018 15:31, Mirza Krak wrote:
> On Mon, Aug 20, 2018 at 3:43 PM, Mirza Krak <mirza.krak@northern.tech> wrote:
>> On Mon, Aug 20, 2018 at 3:35 PM, Mirza Krak <mirza.krak@northern.tech> wrote:
>>> On Mon, Aug 20, 2018 at 3:15 PM, Thomas Petazzoni
>>> <thomas.petazzoni@bootlin.com> wrote:
>>>> Hello,
>>>>
>>>> On Mon, 20 Aug 2018 15:09:03 +0200, Mirza Krak wrote:
>>>>> /uboot is a mount point for vfat boot partition.
>>>>> /data is a mount point for the persistent data partition.
>>>>>
>>>>> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
>>>>> ---
>>>>>  package/mender/mender.mk | 4 ++++
>>>>>  1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/package/mender/mender.mk b/package/mender/mender.mk
>>>>> index deab0cb039..71f92ce048 100644
>>>>> --- a/package/mender/mender.mk
>>>>> +++ b/package/mender/mender.mk
>>>>> @@ -8,6 +8,10 @@ MENDER_VERSION = 1.4.0
>>>>>  MENDER_SITE = $(call github,mendersoftware,mender,$(MENDER_VERSION))
>>>>>
>>>>>  define MENDER_INSTALL_CONFIG_FILES
>>>>> +     $(INSTALL) -d -m 755 $(TARGET_DIR)/data/mender
>>>>> +     $(INSTALL) -d -m 755 $(TARGET_DIR)/data/uboot
>>>>> +     $(INSTALL) -d -m 755 $(TARGET_DIR)/uboot
>>>>
>>>> I am sorry, but despite the explanations, I still don't understand why
>>>> these *must* be /data and /uboot. Is Mender *enforcing* those locations
>>>> exactly ?
>>>
>>> /uboot, not really enforced, just aligned to other systems that
>>> integrate Mender. I could actually drop this.
>>>
>>> /data is not really enforced but the symlink /var/lib/mender must
>>> point to a valid location (normally it points to /data), because once
>>> the Mender daemon starts it will generate some initial files at that
>>> location and the service would fail if non-existent.
>>
>> Actually I can drop the /data creation from mender.mk as well, as the
>> mender.service will run:
>>
>>     ExecStartPre=/bin/mkdir -p -m 0700 /data/mender
>>
>> So yeah a bit enforced.
> 
> But what I wanted tot say is that we can probably drop this patch.

 As you suggested, I've marked the patch as Rejected in patchwork.

 Regards,
 Arnout
