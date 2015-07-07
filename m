From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Jul 2015 22:32:06 +0200
Subject: [Buildroot] [V4 1/2] A20-OLinuXino-Lime: new board (mainline)
In-Reply-To: <20150628222402.4d3ded80@free-electrons.com>
References: <1435313217-12871-1-git-send-email-francois.perrad@gadz.org>
 <1435313217-12871-2-git-send-email-francois.perrad@gadz.org>
 <558D7D84.1000605@lucaceresoli.net>
 <CAB0FRstYj+N0T20YcFmUv+U5_HB1S1HuGtmoh-=jrzxu2HNCjQ@mail.gmail.com>
 <559050F1.1030101@lucaceresoli.net>
 <20150628222402.4d3ded80@free-electrons.com>
Message-ID: <559C3746.7050200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/28/15 22:24, Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
> 
> On Sun, 28 Jun 2015 21:54:25 +0200, Luca Ceresoli wrote:
> 
> 
>> In fact, we have several Cortex-A defconfigs that enable NEON (5 out of
>> 26) and EABIHF (9 out of 26):
>>
>> $ git grep -l  cortex_a -- configs/ |wc
>>       26      26     878
>> $ git grep -l  cortex_a -- configs/ | xargs grep -l EABIHF|wc
>>        9       9     308
>> $ git grep -l  cortex_a -- configs/ | xargs grep -l NEON|wc
>>        5       5     158
>> $
>>
>> But as I said, my understanding might be wrong.
>>
>> Any authoritative opinions on this?
> 
> We don't have any strong position on this I believe. From my point of
> view, enabling EABIhf definitely makes sense when it is possible. And
> enabling NEON support also makes sense. However, using NEON as the FPU
> is a bad idea (i.e BR2_ARM_FPU_NEON=y is a bad idea).

 I agree. In Config.in.arm, we already default to the "best" floating point
where possible, so it's just for the _MAYBE_ variants that it's necessary to do
the right thing depending on the specific SoC.

 As to EABIHF, there we should probably switch the default in Config.in.arch.
It's good that we didn't do this earlier, to give people time to migrate their
configs, but EABIHF was introduced in 2013.08 so it should be safe now.

 And of course, in the defconfigs, it's best to make it explicit.


 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
