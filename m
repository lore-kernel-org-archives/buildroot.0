From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Aug 2020 23:38:39 +0200
Subject: [Buildroot] [PATCH 1/3] support/config-fragments/autobuild:
 stop testing Sourcery AMD64 toolchain
In-Reply-To: <20200823111515.119215-1-thomas.petazzoni@bootlin.com>
References: <20200823111515.119215-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200824213839.GD2246@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-08-23 13:15 +0200, Thomas Petazzoni spake thusly:
> This toolchain uses an old gcc 6.2.0, and newer versions of the
> toolchain are no longer publicly available. This old gcc 6.2.0 causes
> build issues of Boost, which are unfixable without updating the
> toolchain. As we're about to drop support for this toolchain entirely,
> we must stop testing it in our autobuilder infrastructure.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

All three applied to master.

Initially, I was not too keen on doing so so late in the freeze window,
but there is no alternative solution...

Thanks.

Regards,
Yann E. MORIN.

> ---
>  support/config-fragments/autobuild/sourcery-x86-64.config | 4 ----
>  support/config-fragments/autobuild/toolchain-configs.csv  | 1 -
>  2 files changed, 5 deletions(-)
>  delete mode 100644 support/config-fragments/autobuild/sourcery-x86-64.config
> 
> diff --git a/support/config-fragments/autobuild/sourcery-x86-64.config b/support/config-fragments/autobuild/sourcery-x86-64.config
> deleted file mode 100644
> index 6c7ad4c5b7..0000000000
> --- a/support/config-fragments/autobuild/sourcery-x86-64.config
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -BR2_x86_64=y
> -BR2_x86_steamroller=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64=y
> diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
> index 7f05064475..eaaac3d24b 100644
> --- a/support/config-fragments/autobuild/toolchain-configs.csv
> +++ b/support/config-fragments/autobuild/toolchain-configs.csv
> @@ -69,4 +69,3 @@ support/config-fragments/autobuild/sourcery-arm-thumb2.config,x86
>  support/config-fragments/autobuild/sourcery-mips64.config,x86
>  support/config-fragments/autobuild/sourcery-mips.config,x86
>  support/config-fragments/autobuild/sourcery-nios2.config,x86
> -support/config-fragments/autobuild/sourcery-x86-64.config,x86
> -- 
> 2.26.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
