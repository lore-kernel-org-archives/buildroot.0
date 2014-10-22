From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Oct 2014 18:14:21 +0200
Subject: [Buildroot] [PATCH v2 04/30] gst-ffmpeg: use the new
 BR2_ARM_CPU_ARM* options
In-Reply-To: <20141022093400.2bc39e83@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1413923237-2861-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141021211811.GF23999@free.fr> <20141022093400.2bc39e83@free-electrons.com>
Message-ID: <5447D7DD.5090200@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/10/14 09:34, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
> 
> On Tue, 21 Oct 2014 23:18:11 +0200, Yann E. MORIN wrote:
> 
>>> -ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s),y)
>>> +ifeq ($(BR2_ARM_CPU_ARMV6),y)
>>>  GST_FFMPEG_CONF_EXTRA_OPTS += --enable-armv6
>>>  else
>>>  GST_FFMPEG_CONF_EXTRA_OPTS += --disable-armv6 --disable-armv6t2
>>
>> armv6t2: does that hint that we can tune to use Thumb-2 ?
> 
> I thought Thumb-2 was only introduced with ARMv7, but it turns out it's
> not the case. It has in fact been introduced in ARM1156, part of the
> ARMv6 architecture.
> 
> However, this ARM1156 is not supported in Buildroot, and I have never
> heard of it in any publicly available SoC.
> 
> However, this means that --enable-armv6t2 can be used for ARMv7.

 I wouldn't want to actually use it unless tested on real hardware, however.

 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
