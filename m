From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Feb 2021 19:22:42 +0100
Subject: [Buildroot] [PATCH] package/intel-microcode: security bump to
 version 20201118
In-Reply-To: <20210209163641.26115-1-peter@korsgaard.com>
References: <20210209163641.26115-1-peter@korsgaard.com>
Message-ID: <20210209182242.GB1679218@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pter, All,

On 2021-02-09 17:36 +0100, Peter Korsgaard spake thusly:
> Fixes the following security issues:
> 
> - CVE-2020-8694: Insufficient access control in the Linux kernel driver for
>   some Intel(R) Processors may allow an authenticated user to potentially
>   enable information disclosure via local access.
> 
>   https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00389.html
> 
> - CVE-2020-8695: Observable discrepancy in the RAPL interface for some
>   Intel(R) Processors may allow a privileged user to potentially enable
>   information disclosure via local access.
> 
>   https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00389.html
> 
> - CVE-2020-8698: Improper removal of sensitive information before storage or
>   transfer in some Intel(R) Processors may allow an authenticated user to
>   potentially enable information disclosure via local access.
> 
>   https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00381.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/intel-microcode/intel-microcode.hash | 2 +-
>  package/intel-microcode/intel-microcode.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
> index e8005bcff6..289428b4b3 100644
> --- a/package/intel-microcode/intel-microcode.hash
> +++ b/package/intel-microcode/intel-microcode.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  eb4f939421ac6cdea3c586c9d984ec518320f00c07eb2b3d6754309c83c93371  intel-microcode-20200616.tar.gz
> +sha256  e42a264b7b86e80d013d6d00062467352c1f37e0aaea10fe5b51e4d8687921ab  intel-microcode-20201118.tar.gz
>  sha256  d9e989e1a7747f3ce93cb749aceca67a430d36c9bebc6e3205e0b3af3ca6304b  license
> diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
> index 043367770b..5a13ca2cbe 100644
> --- a/package/intel-microcode/intel-microcode.mk
> +++ b/package/intel-microcode/intel-microcode.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -INTEL_MICROCODE_VERSION = 20200616
> +INTEL_MICROCODE_VERSION = 20201118
>  INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
>  INTEL_MICROCODE_LICENSE = PROPRIETARY
>  INTEL_MICROCODE_LICENSE_FILES = license
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
