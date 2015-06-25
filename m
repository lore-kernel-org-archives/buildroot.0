From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Jun 2015 01:17:03 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/network-manager: add patches
 to build with kernel headers 3.2
In-Reply-To: <20150624225647.GR28656@t61>
References: <1434969830-31251-1-git-send-email-vorel@jablocom.com>
 <55891190.7080800@mind.be> <20150624225647.GR28656@t61>
Message-ID: <558C8BEF.1060908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/25/15 00:56, Petr Vorel wrote:
> Hi there,
> 
>> On 06/22/15 12:43, Petr Vorel wrote:
>>> From: Petr Vorel <petr.vorel@gmail.com>
> 
>>  "works" as in run-time tested?
> I've done some brief tests, I'll do more testing probably this week. Ok, I should have
> wait and post the patch after more testing. 

 No, it's a good idea to already post before that. But then it's also a good
idea to mention that you haven't done runtime testing :-)


> Anyway I need to get it work even on lower
> kernel than 3.2 (obviously some features will be missing, but NetworkManager cannot
> crash). Upstream is willing to accept simple patches which fixes behaviour on older
> kernels.

 Well, it's not strictly necessary to do that, just nice to have.

> 
>>  Upstream status?
> Not sure if I understand your question. The patch was taken from upstream.

 Sorry, my bad, the commit sha is indeed at the beginning of the patch.

> 
>>> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
>>> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
> 
>>  Basically it _may_ also work with lower kernel headers but hasn't been tested,
>> right? Ideally, it would be nice to do a (build-)test with 2.6.34-ish.
> Why 2.6.34-ish? The minimum kernel version in toolchain/toolchain-common.in after
> BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 is 2.6, which is unspecified.

 Indeed, we consider everything pre-3.0 as ancient. 2.6.34 is just a random
pre-3.0 version that I have seen in use recently.

> 
>> Or else, you could add a comment saying that it could work with lower headers. The
>> minimal headers version was anyway only introduced to fix an autobuild failure.
> Do you mean to keep BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7 and mention in "help" lower
> versions?

 No, I mean: change it to 3.2 and mention in a comment that it might work on
lower versions. Like:

	# Tested with 3.2, but may even work with earlier versions
	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
