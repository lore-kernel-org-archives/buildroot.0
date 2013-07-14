From: Markos Chandras <markos.chandras@gmail.com>
Date: Sun, 14 Jul 2013 23:07:02 +0100
Subject: [Buildroot] [PATCH v2] Makefile: Symlink lib32 to lib for
	MIPS64/n32
In-Reply-To: <20130712101057.35cf1751@skate>
References: <1372856816-12493-1-git-send-email-markos.chandras@gmail.com>
 <CAAXf6LXK+7zWMGYd8n-kM5yNEE8YqTm30XGJD6A3zdd0nnBE5Q@mail.gmail.com>
 <20130711125908.55bcb3b3@skate>
 <CAG2jQ8ikuHv=zgoRN3Y6pyyGo8E49taW6M1ZMfbv6+xQ8r58cg@mail.gmail.com>
 <CAAXf6LVN60LcoCDooO8N7wj_N-CRASJbofxk_LDi1qEdkXuaMA@mail.gmail.com>
 <CAG2jQ8iHKiuRCGvMPOpgqmXdAuYgzJP6C4+CGq=dUz6p6JMTJw@mail.gmail.com>
 <20130711154018.3ee37e86@skate>
 <CAG2jQ8ij_NnerC79h_NL4EpS9Sawv1EszOQp-iZW2W38nkeV6w@mail.gmail.com>
 <CAAXf6LUxijfeiv7mrMKNbq64nOXDgzTfY7d0Ri7Kp=LSTG=7nw@mail.gmail.com>
 <20130712101057.35cf1751@skate>
Message-ID: <CAG2jQ8gGknhkdoKwu20Tv9a6bsaeu_UsUcK8jgF4DScgSwdxpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12 July 2013 09:10, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Thu, 11 Jul 2013 16:19:31 +0200, Thomas De Schampheleire wrote:
>
>> It's not even uClibc-specific, same holds for glibc-based toolchains.
>> From gcc/config/mips/linux64.h:
>>
>> #define GLIBC_DYNAMIC_LINKER32 "/lib/ld.so.1"
>> #define GLIBC_DYNAMIC_LINKER64 "/lib64/ld.so.1"
>> #define GLIBC_DYNAMIC_LINKERN32 "/lib32/ld.so.1"
>> #define UCLIBC_DYNAMIC_LINKERN32 "/lib32/ld-uClibc.so.0"
>
> Ok, I was mistaken by http://patchwork.ozlabs.org/patch/256596/. But
> this patch is the one that makes uClibc actually match the program
> interpreter path with the one used by gcc. So yeah, those symbolic
> links are also needed.
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

Hi,

Is there anything else pending to be done for this patch in order to
be committed?

--
Regards,
Markos Chandras
