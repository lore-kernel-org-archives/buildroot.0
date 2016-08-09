From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Aug 2016 15:50:25 +0200
Subject: [Buildroot] [PATCH] libsigsegv: make the architecture
 dependencies more robust
In-Reply-To: <1470661864-15936-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470661864-15936-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160809155025.615afd36@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Aug 2016 15:11:04 +0200, Thomas Petazzoni wrote:
> While musl and glibc provide the ucontext structure definition on all
> architectures they support, it is not the case of uClibc. We have been
> excluding more and more architectures over time, but this isn't really
> nice as we continuously need to add more. Latest example: the fact that
> ucontext on ARM is only available on ARM platforms that support the ARM
> instruction set (i.e not on the Thumb-2 only Cortex-M platforms).
> 
> Therefore, we introduce a BR2_PACKAGE_LIBSIGSEGV_ARCH_SUPPORTS variable,
> which:
> 
>  - is set to 'y' for musl and glibc
> 
>  - is set to 'y' for uClibc for the only architectures that are known to
>    provide ucontext (those are the ones that select ARCH_HAS_UCONTEXT in
>    uClibc.
> 
> Note that we remove the comment, as it would become a way too
> complicated comment, and we usually don't add comment for such
> complicated situations (see libunwind for a similar example).
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/b1e40b3ec64cd98b535d83e89e5780c46680e095/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libsigsegv/Config.in | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
