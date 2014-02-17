From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Feb 2014 00:10:28 +0100
Subject: [Buildroot] [PATCH 04/10] toolchain/external: add choice to
 select 'AT_LEAST_XXX' header version
In-Reply-To: <20140217234923.3379fed1@skate>
References: <cover.1392571021.git.yann.morin.1998@free.fr>	<74d76e7816e2de0eccb9a24acd0b768c22078dfa.1392571021.git.yann.morin.1998@free.fr>	<8fdcf8b3-c275-4250-be9c-11bcf4feaa11@email.android.com>	<20140216204721.GD3417@free.fr>	<CAAXf6LVOiOQ1jwWX4wT-NjB3gnE=YrroKMhjwsn9Cxa4F=9o5Q@mail.gmail.com>	<20140217113023.7e5a0845@skate>	<20140217180440.GB3411@free.fr>
 <20140217234923.3379fed1@skate>
Message-ID: <530296E4.308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/02/14 23:49, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
> 
> On Mon, 17 Feb 2014 19:04:40 +0100, Yann E. MORIN wrote:
> 
>> Yes, I already added such a check later after sending the series. It
>> will be part of the next submission.
>>
>> Basically, I check that the specified headers version is no more recent
>> than the one actually used in the toolchain.
> 
> I think the specified headers version should match the one actually
> used in the toolchain. Otherwise, the user may have messages such as
> "package foo needs headers >= 3.3" even if he is using a toolchain with
> kernel headers of kernel 3.6.
> 
> This behavior would also match what we currently do: if a toolchain has
> thread support, but the user forgets to indicate in menuconfig that the
> toolchain has thread support, then we abort with an error. Even if
> technically speaking, we could simply continue, since building a
> configuration with no thread support would work entirely fine with a
> toolchain that has thread support.

 +1


 Regards,
 Arnout

> 
> Best regards,
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
