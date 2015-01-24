From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Jan 2015 00:00:40 +0100
Subject: [Buildroot] [PATCH v3 1/2] randconfig,
 allyesconfig: fix handling of legacy options
In-Reply-To: <20150108214327.415ff023@free-electrons.com>
References: <1413278695-8979-1-git-send-email-arnout@mind.be>	<20141030230310.4b91e6ab@free-electrons.com>	<20141231151734.0c95b119@free-electrons.com>	<54AEEA65.1040501@mind.be>
 <20150108214327.415ff023@free-electrons.com>
Message-ID: <54C42418.5030206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/08/15 21:43, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Thu, 08 Jan 2015 21:36:53 +0100, Arnout Vandecappelle wrote:
> 
>>>> I admit it's not really an issue introduced by the patch as the issue
>>>> already exists for randpackageconfig. But it's very annoying :/
>>>
>>> Any comment about this?
>>
>>  Well, as you explained to me in Dusseldorf, the main reason to use randconfig
>> is to test against buggy Config.in depends/select chains. If the choices
>> wouldn't get properly randomized anymore, that would really kill this use case.
>> So I guess that's a no go.
> 
> Well, the other day, I actually attempted to use randconfig to really
> have random configurations, and see how broken they are. But randconfig
> is unusable today, since it selects a bunch of legacy options, which
> prevents the build from starting.

The use case that currently does work is:

while true; do make randconfig; done

 If there is something wrong with depends/select chains, you'll get the
occasional error like

warning: (BR2_PACKAGE_FOO) selects BR2_PACKAGE_BAR which has unmet direct
dependencies (!BR2_STATIC_LIBS && BR2_PACKAGE_HAS_UDEV)


 My invalid fix of randconfig would make that use case less relevant, because
the invalid chain may depend on some choice value.


 I guess it must have been Yann who explained it to me, not you :-)


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
