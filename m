From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Aug 2016 21:46:18 +0200
Subject: [Buildroot] [PATCH/next v2 1/2] valgrind: let the valgrind
 configure script detect TLS availability
In-Reply-To: <1472592808-18270-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1472592808-18270-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160831214618.3ea0ef87@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 Aug 2016 23:33:27 +0200, Thomas Petazzoni wrote:
> Back in 2005, in commit
> a2c326396a43ecbc8d02c3d815d4010a7ba2e004 ("update valgrind to the latest
> and greatest"), an explicit --disable-tls option was added. More
> recently, in commit 31a3f4bd54e12b8d6de286ab8fb6d9651990e2f5 ("valgrind:
> enable tls support") changed this to be conditional on
> BR2_GCC_ENABLE_TLS.
> 
> However, the configure script of valgrind is perfectly capable of
> detecting TLS support, even in a cross-compilation case: it tries to
> compile a program that uses __thread and sees if it works.
> 
> Since we're about to modify how BR2_GCC_ENABLE_TLS is handled, we'd
> better remove its usage from packages, and valgrind is the only package
> using this config option.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changes since v1:
>  - Added Arnout Reviewed-by.
> ---
>  package/valgrind/valgrind.mk | 6 ------
>  1 file changed, 6 deletions(-)

I've applied both patches to next.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
