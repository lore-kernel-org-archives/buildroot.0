From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 May 2016 23:31:32 +0200
Subject: [Buildroot] Analysis of build results for 2016-05-16
In-Reply-To: <573E0B51.7010000@zacarias.com.ar>
References: <20160517063022.7001A10142D@stock.ovh.net>
 <20160517153611.2a3b4199@free-electrons.com>
 <573E0B51.7010000@zacarias.com.ar>
Message-ID: <4784d6a9-fc6a-de4c-9e4f-7d7daf418d91@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/19/16 20:52, Gustavo Zacarias wrote:
> On 17/05/16 10:36, Thomas Petazzoni wrote:
> 
>>>       powerpc |        gadgetfs-test-undefined | NOK |
>>> http://autobuild.buildroot.net/results/163fbc2ccd88282be2f5d5354b125429bfb4ff4b/
>>
>> Gustavo, another _restgpr_29_x issue, and this is with a Buildroot
>> toolchain, so we can't blame an old CT-NG or Sourcery toolchain here :)
> 
> Hi.
> No no no, the other was a _restgpr_31_x issue ;)
> The recurring problem is that gcc targetting powerpc has bugs when using -Os.
> We could override per-package given this condition, or simply switch to -O2 as
> default for powerpc. I'm more inclined for the second option.

 Even better: disallow -Os completely for powerpc. If it's fixed in recent gcc
we can add a gcc version dependency as well.

 Regards,
 Arnout

> I believe there are patches floating around the internets to fix this but they
> were never committed upstream.
> Regards.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
