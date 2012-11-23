From: =?UTF-8?B?R3LDqWdvcnkgSGVybWFudA==?= <gregory.hermant@calao-systems.com>
Date: Fri, 23 Nov 2012 08:54:32 +0100
Subject: [Buildroot] [PATCH v3 1/6] snowball-hdmiservice: new package
In-Reply-To: <20121122184521.1599d90d@skate>
References: <1352967920-3164-1-git-send-email-gregory.hermant@calao-systems.com>
 <1352967920-3164-2-git-send-email-gregory.hermant@calao-systems.com>
 <50AC79F3.6000807@mind.be> <50AE1C2D.8010905@calao-systems.com>
 <50AE2FE3.8020801@mind.be> <50AE61D1.7070303@calao-systems.com>
 <20121122184521.1599d90d@skate>
Message-ID: <50AF2BB8.8060908@calao-systems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 22/11/2012 18:45, Thomas Petazzoni a ?crit :
> Dear Gr?gory Hermant,
>
> On Thu, 22 Nov 2012 18:33:05 +0100, Gr?gory Hermant wrote:
>> Le 22/11/2012 15:00, Arnout Vandecappelle a ?crit :
>>> It should be passed in the environment, not in the make argument list.
>>> Otherwise it will override the definition in the Makefile itself.
>>>
>>>  A good Makefile appends to LDFLAGS passed in from the environment, but this
>>> is not always the case...  Anyway the worst that can happen is that the LDFLAGS
>>> are just ignored. 
>> You mean that way:
>>
>> SNOWBALL_HDMISERVICE_MAKE_ENV = CC="$(TARGET_CC)" CCFLAGS="$(TARGET_CCFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)"
>>
>> $(SNOWBALL_HDMISERVICE_MAKE_ENV) $(MAKE) -C $(@D)
> No, just:
>
> $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
>
> Thomas

It doesn't work with this Makefile.

Indeed if i use $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D), CC is set to the host gcc compiler.

gregory
