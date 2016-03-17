From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Mar 2016 23:34:16 +0100
Subject: [Buildroot] [PATCH 02/16] arch/arm: Cortex-M3 provides only
 Thumb-2
In-Reply-To: <20160317213630.54f60dd6@free-electrons.com>
References: <1458164602-16983-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1458164602-16983-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <56E9E177.5000606@mind.be> <20160317213630.54f60dd6@free-electrons.com>
Message-ID: <56EB30E8.2010008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/17/16 21:36, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 16 Mar 2016 23:43:03 +0100, Arnout Vandecappelle wrote:
>> On 03/16/16 22:43, Thomas Petazzoni wrote:
>>> The Cortex-M cores only support Thumb-2, not Thumb. In fact, Thumb-2
>>> is a superset of Thumb,
>>
>>    If thumb2 is a superset of thumb, then CPU_HAS_THUMB2 should select
>> CPU_HAS_THUMB. And according to [1], it really is a superset.
>
> Thinking more about this, I don't see the point.
>
> Even if Thumb2 is strictly speaking a superset of Thumb1, there is no
> gcc flag or mechanism that will allow you to generate Thumb1 code on a
> Thumb2-capable core.
>
> Therefore, it IMO doesn't bring any benefit to select CPU_HAS_THUMB
> from CPU_HAS_THUMB2.

  Well, my idea was that a package that needs a specific config option to use 
some thumb assembly (in an otherwise arm build) could just have a .mk condition 
on CPU_HAS_THUMB instead of CPU_HAS_THUMB or CPU_HAS_THUMB2. But that's not a 
situation we have at the moment anyway.

  Regards,
  Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
