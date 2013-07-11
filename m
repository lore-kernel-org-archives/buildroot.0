From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 11 Jul 2013 16:19:31 +0200
Subject: [Buildroot] [PATCH v2] Makefile: Symlink lib32 to lib for
	MIPS64/n32
In-Reply-To: <CAG2jQ8ij_NnerC79h_NL4EpS9Sawv1EszOQp-iZW2W38nkeV6w@mail.gmail.com>
References: <1372856816-12493-1-git-send-email-markos.chandras@gmail.com>
 <CAAXf6LXK+7zWMGYd8n-kM5yNEE8YqTm30XGJD6A3zdd0nnBE5Q@mail.gmail.com>
 <20130711125908.55bcb3b3@skate>
 <CAG2jQ8ikuHv=zgoRN3Y6pyyGo8E49taW6M1ZMfbv6+xQ8r58cg@mail.gmail.com>
 <CAAXf6LVN60LcoCDooO8N7wj_N-CRASJbofxk_LDi1qEdkXuaMA@mail.gmail.com>
 <CAG2jQ8iHKiuRCGvMPOpgqmXdAuYgzJP6C4+CGq=dUz6p6JMTJw@mail.gmail.com>
 <20130711154018.3ee37e86@skate>
 <CAG2jQ8ij_NnerC79h_NL4EpS9Sawv1EszOQp-iZW2W38nkeV6w@mail.gmail.com>
Message-ID: <CAAXf6LUxijfeiv7mrMKNbq64nOXDgzTfY7d0Ri7Kp=LSTG=7nw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 11, 2013 at 4:00 PM, Markos Chandras
<markos.chandras@gmail.com> wrote:
> On 11 July 2013 14:40, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Markos Chandras,
>>
>> On Thu, 11 Jul 2013 12:22:32 +0100, Markos Chandras wrote:
>>
>>> > Are you experiencing this problem with a toolchain built via buildroot?
>>> > In my case, it is with an external toolchain, so package/gcc/gcc.mk
>>> > isn't used then.
>>>
>>> Yeah you are correct. This problem is not specific to buildroot
>>> toolchains that's why I added
>>> the fix in the root Makefile.
>>
>> So, it would be needed for both the internal toolchain backend and the
>> external toolchain backend?
>>
>
> I presume it's needed for every uClibc based toolchain. It's
> definitely needed by the buildroot toolchain which is the one I use.

It's not even uClibc-specific, same holds for glibc-based toolchains.
From gcc/config/mips/linux64.h:

#define GLIBC_DYNAMIC_LINKER32 "/lib/ld.so.1"
#define GLIBC_DYNAMIC_LINKER64 "/lib64/ld.so.1"
#define GLIBC_DYNAMIC_LINKERN32 "/lib32/ld.so.1"
#define UCLIBC_DYNAMIC_LINKERN32 "/lib32/ld-uClibc.so.0"
