From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Apr 2015 22:09:50 +0200
Subject: [Buildroot] [PATCH] raspberrypi2: kernel version does no more
	exist
In-Reply-To: <20150408232038.4942770f@free-electrons.com>
References: <1428480480-6422-1-git-send-email-jezz@sysmic.org>
 <20150408232038.4942770f@free-electrons.com>
Message-ID: <55282E0E.8010300@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/04/15 23:20, Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Wed,  8 Apr 2015 10:08:00 +0200, J?r?me Pouiller wrote:
>> It looks like version 2c4959b of Raspberry kernel does no more exist:
>>
>> $ git clone https://github.com/raspberrypi/linux.git
>> [...]
>> $ cd linux
>> $ git co 23c76b7f608e51258c6fca02aebeb5d588583149
>> fatal: reference is not a tree: 23c76b7f608e51258c6fca02aebeb5d588583149
>>
>> Replace it by lastest version of 3.19 branch
>>
>> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> 
> Yeah, the RPi people are annoying, they constantly rebase their
> branches so there's no way to have a stable commit. Yann posted an
> issue to their github: https://github.com/raspberrypi/linux/issues/915.
> Maybe we need to look into what they propose, apparently they have some
> stable branches.

 In that issue, popcornmix writes:

> The stable branches (e.g. 3.18.y) don't get rebased, so should have a linear history

so perhaps we should stick to the stable 3.18 branch instead? The
raspberry_dt_defconfig is based off the 3.18 branch, so why not do the same for
the RPi2?


 Regards,
 Arnout

> 
> I've nonetheless applied your commit, after tweaking the commit log.
> 
> (Hint: "does no more exist" isn't proper English as far as I know, you
> should say "does not exist anymore" I believe. Though I'm not a native
> English speaker, so I might be wrong.)
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
