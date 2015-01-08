From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 08 Jan 2015 21:36:53 +0100
Subject: [Buildroot] [PATCH v3 1/2] randconfig,
 allyesconfig: fix handling of legacy options
In-Reply-To: <20141231151734.0c95b119@free-electrons.com>
References: <1413278695-8979-1-git-send-email-arnout@mind.be>	<20141030230310.4b91e6ab@free-electrons.com>
 <20141231151734.0c95b119@free-electrons.com>
Message-ID: <54AEEA65.1040501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31/12/14 15:17, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 30 Oct 2014 23:03:10 +0100, Thomas Petazzoni wrote:
> 
>> I was going to apply this, and then I tested it, to discover that it
>> then causes the same problem as the one we have with randpackageconfig
>> today: none of the choice options get randomized anymore. So before
>> this patch, if you do "randconfig", you get proper randomization. After
>> this patch, if you do "randconfig", it only generates i386
>> configurations.
>>
>> I admit it's not really an issue introduced by the patch as the issue
>> already exists for randpackageconfig. But it's very annoying :/
> 
> Any comment about this?

 Well, as you explained to me in Dusseldorf, the main reason to use randconfig
is to test against buggy Config.in depends/select chains. If the choices
wouldn't get properly randomized anymore, that would really kill this use case.
So I guess that's a no go.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
