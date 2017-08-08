From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Aug 2017 18:03:34 +0200
Subject: [Buildroot] [PATCH] glibc: add patch to fix build on x86
In-Reply-To: <20170805134618.26880-1-thomas.petazzoni@free-electrons.com>
References: <20170805134618.26880-1-thomas.petazzoni@free-electrons.com>
Message-ID: <7d43e6bc-7c45-b220-65b7-40a33d58a3ad@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-08-17 15:46, Thomas Petazzoni wrote:
> This fixes the following build issues:
> 
> In file included from ../sysdeps/x86_64/multiarch/varshift.c:19:0,
>                  from ../sysdeps/i386/i686/multiarch/varshift.c:1:
> ../sysdeps/x86_64/multiarch/varshift.h: In function '__m128i_shift_right':
> ../sysdeps/x86_64/multiarch/varshift.h:26:1: error: SSE vector return without SSE enabled changes the ABI [-Werror=psabi]
>  {
> 
> [...]
> 
> .../lib/gcc/i686-buildroot-linux-gnu/7.1.0/include/tmmintrin.h:136:1: error: inlining failed in call to always_inline '_mm_shuffle_epi8': target specific option mismatch
> 
> The patch has been taken from glibc's patchwork at
> https://patchwork.sourceware.org/patch/21003/.
> 
> Fixes bug #10156.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 Applied to master, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
