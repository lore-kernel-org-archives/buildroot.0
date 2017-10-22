From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 14:05:10 +0200
Subject: [Buildroot] [PATCH] lame: security bump to version 3.100
In-Reply-To: <20171022111508.5361-1-peter@korsgaard.com>
References: <20171022111508.5361-1-peter@korsgaard.com>
Message-ID: <20171022140510.6fb2b878@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Oct 2017 13:15:08 +0200, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> CVE-2017-9410: fill_buffer_resample function in libmp3lame/util.c heap-based
> buffer over-read and ap
> 
> CVE-2017-9411: fill_buffer_resample function in libmp3lame/util.c invalid
> memory read and application crash
> 
> CVE-2017-9412: unpack_read_samples function in frontend/get_audio.c invalid
> memory read and application crash
> 
> Drop patches now upstream or no longer needed:
> 
> 0001-configure.patch: Upstream as mentioned in patch description
> 
> 0002-gtk1-ac-directives.patch: Upstream as mentioned in patch
> description/release notes:
> 
> Resurrect Owen Taylor's code dated from 97-11-3 to properly deal with GTK1.
> This was transplanted back from aclocal.m4 with a patch provided by Andres
> Mejia. This change makes it easy to regenerate autotools' files with a simple
> invocation of autoconf -vfi.
> 
> 0003-msse.patch: Not needed as -march <x86-variant-with-msse-support>
> nowadays implies -msse.
> 
> With these removed, autoreconf is no longer needed.
> 
> Also add a hash for the license file while we're at it.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/lame/0001-configure.patch          |  69 ----------
>  package/lame/0002-gtk1-ac-directives.patch | 210 -----------------------------
>  package/lame/0003-msse.patch               |  24 ----
>  package/lame/lame.hash                     |   3 +-
>  package/lame/lame.mk                       |   6 +-
>  5 files changed, 4 insertions(+), 308 deletions(-)
>  delete mode 100644 package/lame/0001-configure.patch
>  delete mode 100644 package/lame/0002-gtk1-ac-directives.patch
>  delete mode 100644 package/lame/0003-msse.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
