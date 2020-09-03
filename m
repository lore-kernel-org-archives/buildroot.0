From: Paul Cercueil <paul@crapouillou.net>
Date: Thu, 03 Sep 2020 22:52:58 +0200
Subject: [Buildroot] [PATCH] package/libzip: add patch from upstream to
 fix build
In-Reply-To: <20200903221649.630985a2@windsurf.home>
References: <20200902201431.2197792-1-paul@crapouillou.net>
 <20200903221649.630985a2@windsurf.home>
Message-ID: <AOO3GQ.FY23C476LQ1Z@crapouillou.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Le jeu. 3 sept. 2020 ? 22:16, Thomas Petazzoni 
<thomas.petazzoni@bootlin.com> a ?crit :
> On Wed,  2 Sep 2020 22:14:30 +0200
> Paul Cercueil <paul@crapouillou.net> wrote:
> 
>>  Cherry-pick a patch from upstream project that fixes the build.
>> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> Which build issue is this fixing ? What toolchain/C library ? Since
> when is this happening ? Do we need to backport this fix to our stable
> branches ? Do we have autobuilder failures for this ?

Buildroot toolchain, GCC 10, uClibc-ng. Doesn't build because it uses 
INT_MAX without including <limits.h>.

Backport the change to the next 2020.08 point release, I think. About 
autobuilder failures, I didn't see any. It failed locally.

> 
>>  diff --git a/package/libzip/0002-Include-limits.h-for-INT_MAX.patch 
>> b/package/libzip/0002-Include-limits.h-for-INT_MAX.patch
>>  new file mode 100644
>>  index 0000000000..e1d728158e
>>  --- /dev/null
>>  +++ b/package/libzip/0002-Include-limits.h-for-INT_MAX.patch
>>  @@ -0,0 +1,27 @@
>>  +From fd89e242d16128dedef08f47d99ae56aa19b0591 Mon Sep 17 00:00:00 
>> 2001
>>  +From: =?UTF-8?q?=C3=98rjan=20Malde?= <red@foxi.me>
>>  +Date: Wed, 15 Jul 2020 12:16:16 +0200
>>  +Subject: [PATCH] Include limits.h for INT_MAX
>>  +
>>  +[Retrieved from:
>>  
>> +https://github.com/pcercuei/libzip/commit/fd89e242d16128dedef08f47d99ae56aa19b0591]
> 
> This URL gives me a 404.

I forked the upstream project just to notice afterwards that they 
already had a fix, so I deleted my project.
The real URL is s/pcercuei/nih-at/, so:
https://github.com/nih-at/libzip/commit/fd89e242d16128dedef08f47d99ae56aa19b0591

-Paul

> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
