From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
Date: Mon, 10 Oct 2011 20:09:41 +0200
Subject: [Buildroot] [PATCH] add package tango-icon-theme and dependency
 icon-naming-utils
In-Reply-To: <20111010193854.0ac757c6@skate>
References: <1318253496-23729-1-git-send-email-schwarzkopf@sensortherm.de>	<20111010161008.3ba4b436@skate>	<4E932C1D.1090605@sensortherm.de>
 <20111010193854.0ac757c6@skate>
Message-ID: <4E9334E5.6030300@sensortherm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

thanks very much.

Regards,

Klaus



Am 10.10.2011 19:38, schrieb Thomas Petazzoni:
> Le Mon, 10 Oct 2011 19:32:13 +0200,
> Klaus Schwarzkopf<schwarzkopf@sensortherm.de>  a ?crit :
>
>> make: *** No rule to make target `host-icon-naming-utils', needed by
>> `tango-icon-theme-depends'.  Stop.
>>
>> Can you help?
>
> Yes, see below.
>
>>> We usually have one patch per new package.
>>>
>>>> +$(eval $(call AUTOTARGETS,package,icon-naming-utils,host))
>>>
>>> This should be:
>>>
>>> $(eval $(call AUTOTARGETS))
>
> I should have said:
>
> $(eval $(call AUTOTARGETS,host))
>
> i.e, only the second and third argument have been removed. The optional
> fourth argument, which says whether we instantiate a host or target
> package, remains. Its default value is "target", so with just $(eval
> $(call AUTOTARGETS)) you create a target package and not the host
> package.
>
> Sorry for the mistake.
>
> Thomas
