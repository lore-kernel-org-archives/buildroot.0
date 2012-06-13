From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 14 Jun 2012 00:38:23 +0200
Subject: [Buildroot] [PATCH v3 1/6] target: add symbols for i386/x86_64
 cpu features
In-Reply-To: <4FD6DC22.8050900@mind.be>
References: <1339328813-6269-1-git-send-email-s.martin49@gmail.com>
 <1339328813-6269-4-git-send-email-s.martin49@gmail.com>
 <4FD6DC22.8050900@mind.be>
Message-ID: <CAHXCMM+vaYp=9Kf4T9qAOXdXOB80Gzzc0FHCS3w-iK0DyMGo1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

2012/6/12 Arnout Vandecappelle <arnout@mind.be>:
> On 06/10/12 13:46, Samuel Martin wrote:
>>
>> ?config BR2_x86_geode
>> ? ? ? ?bool "geode"
>> + ? ? ? # Don't include MMX support because there several variant of geode
>> + ? ? ? # processor, some with MMX support, some without.
>> + ? ? ? # See:http://en.wikipedia.org/wiki/Geode_%28processor%29
>> + ? ? ? select BR2_X86_CPU_HAS_3DNOW
>
>
> ?Maybe it makes sense to have a config BR2_x86_geode_mmx ?
Actually, I made this choice after talking about it with Peter and
ThomasP on IRC (that's Peter who gave me the link).

BTW, packages that may take benefit from MMX features (like libevas or
sdl_{gfx,sounds}) did not turn it on before, neither after this patch
series.

IMHO, I prefer keeping things in a safe shape like this.


Regards,

-- 
Sam
