From: Alexander Khryukin <alexander@mezon.ru>
Date: Mon, 18 Mar 2013 22:58:52 +0400
Subject: [Buildroot] nspr and aarch64 build issue
In-Reply-To: <CABtOAfxbXDUq8XXPnMzpz7AEE9ZNfB1Kn--szudRnRbsiMySMA@mail.gmail.com>
References: <CABtOAfxeHbNeKc8eWfxaTLPgOeh10HmF2psbXnvZh9mLF0hKTg@mail.gmail.com>
 <20130318162033.30fbd920@skate>
 <CABtOAfxbXDUq8XXPnMzpz7AEE9ZNfB1Kn--szudRnRbsiMySMA@mail.gmail.com>
Message-ID: <CABtOAfypfXXGA2rVX57bw1of-d9bO8zCDRK9Q_kmZPkS8aXOGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/3/18 Alexander Khryukin <alexander@mezon.ru>

> Yes, fixed. I'll send patch in a short time
> 18.03.2013 19:20 ???????????? "Thomas Petazzoni" <
> thomas.petazzoni at free-electrons.com> ???????:
>
> Dear Alexander Khryukin,
>>
>> On Mon, 18 Mar 2013 01:53:38 +0400, Alexander Khryukin wrote:
>>
>> >  drbg.c: In function 'RNG_RandomUpdate':
>> >  *drbg.c:516:5: error: size of array 'arg' is negative*
>> >  make[4]: ***
>> > [Linux2.6_aarch64_glibc_PTH_OPT.OBJ/Linux_SINGLE_SHLIB/drbg.o] Error 1
>> >  make[4]: Leaving directory
>> >
>> `/home/user/buildroot/output/build/libnss-3.12.9/mozilla/security/nss/lib/freebl'
>>
>> I sent a patch that should hopefully fix this. The BR2_ARCH_IS_64 was
>> not selected on the AArch64 architecture, so the following bit of code
>> in libnss.mk was not being triggered:
>>
>> ifeq ($(BR2_ARCH_IS_64),y)
>> LIBNSS_BUILD_VARS += USE_64=1
>> endif
>>
>> However, I am rather surprised, because here, the build of libnspr
>> (which is a dependency of libnss) doesn't work. I get:
>>
>> In file included from ../../../dist/include/nspr/prtypes.h:26:0,
>>                  from ../../../dist/include/nspr/pratom.h:14,
>>                  from ../../../dist/include/nspr/nspr.h:9,
>>                  from ../../../pr/include/private/primpl.h:39,
>>                  from prfdcach.c:6:
>> ../../../dist/include/nspr/prcpucfg.h:817:2: error: #error "Unknown CPU
>> architecture"
>>
>> Have you fixed this?
>>
>> Thanks,
>>
>> Thomas
>> --
>> Thomas Petazzoni, Free Electrons
>> Kernel, drivers, real-time and embedded Linux
>> development, consulting, training and support.
>> http://free-electrons.com
>>
>
patch: nspr-prcpucfg-aarch64.patch
http://pastie.org/6606946
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130318/b9edba3b/attachment.html>
