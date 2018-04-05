From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Apr 2018 22:29:33 +0200
Subject: [Buildroot] [PATCH 01/23] support/config-fragments/autobuild:
 remove Blackfin configuration
In-Reply-To: <20180405195037.32641-2-thomas.petazzoni@bootlin.com>
References: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
 <20180405195037.32641-2-thomas.petazzoni@bootlin.com>
Message-ID: <20180405202933.GB22364@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-04-05 21:50 +0200, Thomas Petazzoni spake thusly:
> In preparation for the removal of the Blackfin architecture, drop the
> autobuilder toolchain configuration that was testing Blackfin.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[--SNIP--]
> diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
> index 1bce7ac577..64abfb3fd4 100644
> --- a/support/config-fragments/autobuild/toolchain-configs.csv
> +++ b/support/config-fragments/autobuild/toolchain-configs.csv
> @@ -15,9 +15,6 @@ support/config-fragments/autobuild/br-arm-cortex-m4-full.config,x86_64
>  # Test a musl toolchain
>  support/config-fragments/autobuild/br-x86-64-musl.config,x86_64
>  
> -# Test a noMMU toolchain with dynamic library support
> -support/config-fragments/autobuild/br-bfin-full.config,x86_64

Do we plan on adding back another noMMU target with dynamic library
support instead of that one?

>  # Test a MMU toolchain without dynamic library support
>  support/config-fragments/autobuild/br-arm-full-static.config,x86_64
>  
> diff --git a/utils/test-pkg b/utils/test-pkg
> index 2e069b6005..54951276fa 100755
> --- a/utils/test-pkg
> +++ b/utils/test-pkg
> @@ -75,7 +75,7 @@ main() {
>      # Default mode is to test the N first toolchains, which have been
>      # chosen to be a good selection of toolchains.
>      if [ ${mode} -eq 0 ] ; then
> -        number=7
> +        number=6

Otherwise, toolchain-configs.csv is only used in genrandconfig, and that
one does not care about the number of "default" toolchains.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>      elif [ ${mode} -gt 1 ] ; then
>          printf "error: --all, --number and --random are mutually exclusive\n" >&2; exit 1
>      fi
> -- 
> 2.14.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
