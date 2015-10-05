From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Oct 2015 16:02:16 +0100
Subject: [Buildroot] [PATCH] gcc: backport xtensa libgcc stack unwinding
 fixes
In-Reply-To: <1439872838-10596-1-git-send-email-jcmvbkbc@gmail.com>
References: <1439872838-10596-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20151005160216.69bac421@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Tue, 18 Aug 2015 07:40:38 +0300, Max Filippov wrote:
> These backported patches fix the following failing uClibc-ng tests:
>   nptl/tst-cancelx4,
>   nptl/tst-cancelx16,
>   nptl/tst-cancelx18,
>   nptl/tst-cancelx20,
>   nptl/tst-cancelx21,
>   nptl/tst-cleanupx1,
>   nptl/tst-cleanupx3,
>   nptl/tst-oncex3,
>   nptl/tst-oncex4.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  .../871-xtensa-reimplement-register-spilling.patch | 76 ++++++++++++++++++++++
>  ...unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch | 33 ++++++++++
>  .../gcc/4.8.5/873-xtensa-fix-_Unwind_GetCFA.patch  | 40 ++++++++++++
>  .../871-xtensa-reimplement-register-spilling.patch | 76 ++++++++++++++++++++++
>  ...unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch | 33 ++++++++++
>  .../gcc/4.9.3/873-xtensa-fix-_Unwind_GetCFA.patch  | 40 ++++++++++++
>  .../871-xtensa-reimplement-register-spilling.patch | 76 ++++++++++++++++++++++
>  ...unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch | 31 +++++++++
>  .../gcc/5.2.0/873-xtensa-fix-_Unwind_GetCFA.patch  | 40 ++++++++++++
>  9 files changed, 445 insertions(+)
>  create mode 100644 package/gcc/4.8.5/871-xtensa-reimplement-register-spilling.patch
>  create mode 100644 package/gcc/4.8.5/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
>  create mode 100644 package/gcc/4.8.5/873-xtensa-fix-_Unwind_GetCFA.patch
>  create mode 100644 package/gcc/4.9.3/871-xtensa-reimplement-register-spilling.patch
>  create mode 100644 package/gcc/4.9.3/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
>  create mode 100644 package/gcc/4.9.3/873-xtensa-fix-_Unwind_GetCFA.patch
>  create mode 100644 package/gcc/5.2.0/871-xtensa-reimplement-register-spilling.patch
>  create mode 100644 package/gcc/5.2.0/872-xtensa-use-unwind-dw2-fde-dip-instead-of-unwind-dw2-.patch
>  create mode 100644 package/gcc/5.2.0/873-xtensa-fix-_Unwind_GetCFA.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
