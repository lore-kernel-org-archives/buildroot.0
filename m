From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Apr 2021 20:31:10 +0200
Subject: [Buildroot] Xeon variant for x86_64 target
In-Reply-To: <CACTZKX66V9a2xBXnw_f7esQoWGnw99t2uwX=CaefkXPffwfPrw@mail.gmail.com>
References: <CACTZKX66V9a2xBXnw_f7esQoWGnw99t2uwX=CaefkXPffwfPrw@mail.gmail.com>
Message-ID: <23a058d3-46dc-20d4-0e2f-eefda5c16bc3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Atilla,

On 22/03/2021 12:23, Atilla Filiz wrote:
> Hello
> 
> I am preparing a config for an Intel Xeon D based target. There is no Xeon
> variant available in the 2021.02 release. I am not very familiar with the x86
> family but I want to create a pro[er variant if possible.
> 
> I see the build variant selects certain flags. E.g. Atom selects
> BR2_X86_CPU_HAS_MMX [=y] && BR2_X86_CPU_HAS_SSE [=y] && BR2_X86_CPU_HAS_SSE2
> [=y] && BR2_X86_CPU_HAS_SSE3 [=y] && BR2_X86_CPU_HAS_SSSE3 [=y]
> 
> What else does this variant selection affect? I assume a few additional build
> flags to pass on GCC? Maybe some?kernel?build options?
> 
> How does one go about creating a proper x86_64 variant?

 The only thing that is relevant, really, is the gcc -march option. You have to
find out what the Xeon corresponds to. This determines the BR2_GCC_TARGET_ARCH
option. Of course, the easiest for everybody is if you name the buildroot option
the same as the -march option. There's a StackOverflow answer [1] that lists the
recent Xeons, but only Xeon E, not Xeon D. So you'll have to browse through
Intel's websites to find which type it is.

 As to the SSE stuff: that's only relevant to pass in configure options to
ffmpeg and the like. I believe it's just to tell ffmpeg which assembly code it's
allowed to use. You can easily find which instruction types are supported in the
GCC man page, and in /proc/cpuinfo if you have a running kernel.

 Regards,
 Arnout


[1]
https://stackoverflow.com/questions/943755/gcc-optimization-flags-for-xeon#25095818
