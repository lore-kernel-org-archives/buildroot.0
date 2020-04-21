From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Apr 2020 11:57:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/ibm-sw-tpm2: enable only on
 supported architectures
In-Reply-To: <20200421114115.097bcfe6@windsurf.home>
References: <20200421092647.2452590-1-fontaine.fabrice@gmail.com>
 <20200421114115.097bcfe6@windsurf.home>
Message-ID: <CAPi7W83NRXNycpvC5bAjTXV=mEaWvE7wSZwgFd--BGrgbwHZug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le mar. 21 avr. 2020 ? 11:41, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> On Tue, 21 Apr 2020 11:26:47 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Fixes:
> >  - http://autobuild.buildroot.org/results/12d2c27c38cc52248d3277995a9bb5eae4b8bb9e
> >  - http://autobuild.buildroot.org/results/34151bded9737f7c128b7a2d763c9e0af8018068
> >  - http://autobuild.buildroot.org/results/9abbbdd2735991277c0b821a47c579b053335caf
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> I was also looking at this issue, and I believe it might be easier to
> really fix the problem.
>
> Indeed, it's just:
>
> #ifndef RADIX_BITS
> #   if defined(__x86_64__) || defined(__x86_64)                         \
>     || defined(__amd64__) || defined(__amd64) || defined(_WIN64) || defined(_M_X64) \
>     || defined(_M_ARM64) || defined(__aarch64__) \
>     || defined(__powerpc64__) || defined(__ppc64__)
> #       define RADIX_BITS                      64
> #   elif defined(__i386__) || defined(__i386) || defined(i386)          \
>     || defined(_WIN32) || defined(_M_IX86)                              \
>     || defined(_M_ARM) || defined(__arm__) || defined(__thumb__)
> #       define RADIX_BITS                      32
> #   else
> #       error Unable to determine RADIX_BITS from compiler environment
> #   endif
> #endif // RADIX_BITS
>
> that causes problems.
>
> And this crap can most likely be replaced by:
>
> #define RADIX_BITS __WORDSIZE
Indeed, then feel free to set my patch as not applicable. Your
solution is better than mine.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
