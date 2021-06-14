From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jun 2021 22:17:33 +0200
Subject: [Buildroot] [PATCH] package/intel-microcode: security bump to
 version 20210608
In-Reply-To: <20210613211011.23696-1-peter@korsgaard.com>
References: <20210613211011.23696-1-peter@korsgaard.com>
Message-ID: <20210614201733.GH2610983@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-06-13 23:10 +0200, Peter Korsgaard spake thusly:
> Fixes the following security issues:
> 
> - CVE-2020-24489: A potential security vulnerability in some Intel?
>   Virtualization Technology for Directed I/0 (VT-d) products may allow
>   escalation of privilege.  Intel is releasing firmware updates to mitigate
>   this potential vulnerability.
>   https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00442.html
> 
> - CVE-2020-24511: Potential security vulnerabilities in some Intel?
>   Processors may allow information disclosure.  Intel is releasing firmware
>   updates to mitigate these potential vulnerabilities.
>   https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00464.html
> 
> - CVE-2020-24513: A potential security vulnerability in some Intel Atom?
>   Processors may allow information disclosure.  Intel is releasing firmware
>   updates to mitigate this potential vulnerability.
>   https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00465.html
> 
> For more details, see the release notes:
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20210608
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
> index 23191d9531..6687d4c0eb 100644
> --- a/package/intel-microcode/intel-microcode.hash
> +++ b/package/intel-microcode/intel-microcode.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  b855c81f78705f35341248a0603aa1a6e199ca7f59cd425e061b579329aa9eaa  intel-microcode-20210216.tar.gz
> +sha256  fd85b6b769efd029dec6a2c07106fd18fb4dcb548b7bc4cde09295a8344ef6d7  intel-microcode-20210608.tar.gz
>  sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
> diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
> index 2089003880..af7f6fa804 100644
> --- a/package/intel-microcode/intel-microcode.mk
> +++ b/package/intel-microcode/intel-microcode.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -INTEL_MICROCODE_VERSION = 20210216
> +INTEL_MICROCODE_VERSION = 20210608
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
