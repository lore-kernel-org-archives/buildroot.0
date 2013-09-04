From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 4 Sep 2013 21:07:54 +0200
Subject: [Buildroot] [PATCH 2 of 9 v4] Config.in.legacy: update
 description for users
In-Reply-To: <52275B02.7020106@mind.be>
References: <patchbomb.1378152469@argentina>
 <ac4d080274a06689e8d4.1378152471@argentina>
 <20130902225514.7d9323cc@skate> <52257EA4.9030001@mind.be>
 <20130903091818.616d6665@skate>
 <CAAXf6LWNRK1fZMQfMU5w52NzgyG+HL1VbXPU1o5FuFQ+eNBFEA@mail.gmail.com>
 <20130903135209.3b1ea8f5@skate> <87ob8a54ie.fsf@dell.be.48ers.dk>
 <52261367.8040905@mind.be>
 <CAAXf6LX1QTw3DgSG5uWGOvFgmgsmmn2a6_cvwHp5p_cgF6RXpg@mail.gmail.com>
 <52275B02.7020106@mind.be>
Message-ID: <CAAXf6LX87oaYh3a63=ZS2QAHpC32TRH5bTqGoKMSPsTWm2qoEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Op 4-sep.-2013 20:35 schreef "Arnout Vandecappelle" <arnout@mind.be> het
volgende:
>
> On 09/04/13 10:33, Thomas De Schampheleire wrote:
>>
>> Hi Arnout,
>>
>> On Tue, Sep 3, 2013 at 6:50 PM, Arnout Vandecappelle <arnout@mind.be>
wrote:
>>>
>>> On 09/03/13 17:06, Peter Korsgaard wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>>>>>>>> writes:
>>>>
>>>>
>>>>
>>>>
>>>>    Thomas> So far, the only problem I see with this are related to
minimal
>>>>    Thomas> defconfigs. In the case (1) above, the minimal defconfig
will
>>>> continue
>>>>    Thomas> to contain the name of the legacy option, and not the name
of
>>>> the new
>>>>    Thomas> option, since the new option is selected by the legacy
option.
>>>> This is
>>>>    Thomas> annoying since it means minimal defconfigs are not
progressively
>>>>    Thomas> updated to use the new option name. And this probably makes
my
>>>> entire
>>>>    Thomas> proposal moot.
>>>>
>>>> Damn, yes :/
>>>>
>>>> So people really do need to explictly change to the new option /
restart
>>>> make menuconfig.
>>>
>>>
>>>
>>>   I never tried it, but a workaround could be to run olddefconfig
before any
>>> interactive config (menuconfig, nconfig, xconfig, qconfig). olddefconfig
>>> should be equivalent to saving immediately.
>>
>>
>> I tried it manually (not yet integrated in a Makefile) and it works as
expected.
>> However, a disadvantage is that any new symbol will no longer be
>> marked as NEW in the interactive config. So the trade-off would be
>> between loosing this NEW marker, and requiring the user to do an
>> intermediate save.
>
>
>  If the user does an intermediate save, the NEW marker will also be
gone...

Yes, but before that save he does see the markers...

>
>  But at least, this is only for a user that has legacy stuff, not for all
those innocent people out there that just do a 'make menuconfig' after 'git
pull'.

Right.

To proceed with this, I think the community should decide which alternative
we prefer, knowing that each one has its pros and cons...

Looking forward to everyone's input...

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130904/5990fb74/attachment-0001.html>
