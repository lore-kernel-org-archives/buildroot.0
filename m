From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 06 Feb 2013 20:40:59 +0100
Subject: [Buildroot] [PATCH 4/7] package/libedit2: new package
In-Reply-To: <201302062000.10836.yann.morin.1998@free.fr>
References: <cover.1359993560.git.yann.morin.1998@free.fr>
 <d4a01f43840a933d1829c6e453378c995be77f4e.1359993560.git.yann.morin.1998@free.fr>
 <5110390A.1040708@mind.be> <201302062000.10836.yann.morin.1998@free.fr>
Message-ID: <5112B1CB.4030203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/02/13 20:00, Yann E. MORIN wrote:
> Arnout, All,
>
> On Monday 04 February 2013 Arnout Vandecappelle wrote:
>> On 04/02/13 17:01, Yann E. MORIN wrote:
[snip]
>>> +define LIBEDIT2_FIX_VIS_H_INCLUDE
>>> +	$(SED) 's/^#include <vis.h>$$/#include <bsd\/vis.h>/;' $(@D)/libedit/filecomplete.c
>>
>>    If you use s,foo,bar, instead of s/foo/bar/ you don't need to quote /.
>
> Granted. I usualy do not do that, as I sometime have paths that do contain
> commas, and would broke anyway, so I always explicitly quote '/'.

  @ is a good alternative. But feel free to keep the quoting if you prefer.

>
>> Also, the ; is redundant.
>
> I like it that all my sed expressions are properly terminated, even if
> it is not mandatory. It is very annoying to me that, when there are two
> or more expressions, they are all terminated, save for the last one...

  OK, I thought it was a mistake.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
