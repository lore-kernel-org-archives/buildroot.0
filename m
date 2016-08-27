From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Aug 2016 19:10:56 +0200
Subject: [Buildroot] [PATCH 02/16 v3] core: commonalise the bundled and
 br2-external %_defconfig rules
In-Reply-To: <20160827141650.GB5755@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <e302f10d06b7406978bbc888b903cb917cb0e754.1468750623.git.yann.morin.1998@free.fr>
 <20160827161249.26d4c72e@free-electrons.com> <20160827141650.GB5755@free.fr>
Message-ID: <d7a4f3c1-c3ad-03fb-a056-806070536d75@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27-08-16 16:16, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2016-08-27 16:12 +0200, Thomas Petazzoni spake thusly:
>> On Sun, 17 Jul 2016 12:34:22 +0200, Yann E. MORIN wrote:
>>
>>> +define percent_defconfig
>>> +%_defconfig: $(BUILD_DIR)/buildroot-config/conf $(1)/configs/%_defconfig outputmakefile
>>> +	# Override the BR2_DEFCONFIG from COMMON_CONFIG_ENV with the new defconfig
>>
>> This comment in here was a bit annoying, because it appears on stdout
>> when you run "make <foo>_defconfig". So I've moved it outside of the
>> target definition instead, in order to preserve the existing behavior
>> in terms of what appears on stdout when loading a defconfig.
> 
> Well, that's how I did it first, but Arnout contended that the comment
> should be moved like I did (or at least that's what I understood from
> his review).

 With "inside the define" I meant exactly what Thomas did: inside the define
(not inside the rule).

 Regards,
 Arnout

> 
> I'm happy you moved it. ;-)
> 
> Thanks!
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
