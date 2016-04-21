From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 22 Apr 2016 01:05:05 +0200
Subject: [Buildroot] [PATCH] i386: properly define BR2_ARCH for all x86
 subarchitectures
In-Reply-To: <20160421230228.0e8c6663@free-electrons.com>
References: <1461268365-13922-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <57193EB1.5060509@mind.be> <20160421230228.0e8c6663@free-electrons.com>
Message-ID: <57195CA1.9040106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/21/16 23:02, Thomas Petazzoni wrote:
> Hello,
>
> On Thu, 21 Apr 2016 22:57:21 +0200, Arnout Vandecappelle wrote:
>
>> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
> Thanks!
>
>>    It would be nice if we would have a way to check something like that...
>
> ifeq ($(call qstrip,$(BR2_ARCH)),)
> $(error Blurp!)
> endif

  I meant statically, somehow. This will only be hit by users who actually 
select that arch option, not by autobuilders.

  Regards,
  Arnout

>
>   ?
>
> Thomas
>

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
