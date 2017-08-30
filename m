From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 30 Aug 2017 22:57:05 +0200
Subject: [Buildroot] [PATCH 3/7] package/mesa3d: fix build issue with
 glibc >= 2.26
In-Reply-To: <20170830224910.048d0e59@windsurf.lan>
References: <20170827173606.13144-1-romain.naour@gmail.com>
 <20170827173606.13144-4-romain.naour@gmail.com>
 <20170830224910.048d0e59@windsurf.lan>
Message-ID: <29487dea-0e18-3076-ab11-0166f7f8b00d@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 30/08/2017 ? 22:49, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sun, 27 Aug 2017 19:36:02 +0200, Romain Naour wrote:
> 
>> ++/* This workaround is not necessary since Glibc 2.26
>> ++ * https://sourceware.org/git/?p=glibc.git;a=commit;h=2072f5c34ede81dde9e0d953d57a0690a66b0f12
>> ++ */
>> ++#if (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 25)
> 
> How does this behaves with uClibc and musl? I guess with uClibc it
> should be fine, because it pretends to be glibc 2.2.
> 
> However, musl doesn't define __GLIBC__, so it means that this code,
> that used to be defined for musl, we no longer be defined. Can check if
> mesa3d still builds fine with musl after this change ? Or perhaps musl
> didn't had the original issue ?

This code wasn't used with musl toolchain, it's already protected by a __GLIBC__.

Look at the file include/c99_math.h in mesa3d sources.
https://github.com/mesa3d/mesa/blob/master/include/c99_math.h#L193

I wanted to be safe for toolchains using glibc < 2.26.
It should be fine with musl toolchain.

Best regards,
Romain

> 
> Thomas
> 
