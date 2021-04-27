From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 Apr 2021 21:51:18 +0200
Subject: [Buildroot] [PATCH] docs/manual: document KBUILD_VERBOSE
 environment variable
In-Reply-To: <20210419160346.6393-1-scileont@gmail.com>
References: <20210419160346.6393-1-scileont@gmail.com>
Message-ID: <20210427195118.GA2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Anton, All,

Thanks for this contribution.

On 2021-04-19 19:03 +0300, Anton Leontiev spake thusly:
> Signed-off-by: Anton Leontiev <scileont@gmail.com>
> ---
>  docs/manual/common-usage.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
> index 9ba87a8339..699a20fe40 100644
> --- a/docs/manual/common-usage.txt
> +++ b/docs/manual/common-usage.txt
> @@ -69,6 +69,9 @@ to +make+ or set in the environment:
>  
>  * +HOSTCXX+, the host C++ compiler to use
>  * +HOSTCC+, the host C compiler to use
> +* +KBUILD_VERBOSE+, KBuild verbosity; it is essentially the same as specifying
> +  +V=1+ in make arguments. If set, exports itself and +VERBOSE=1+ to all
> +  subprocesses.

The naming of the KBUILD_VERBOSE variable is just an implementation
detail. That it has a similar purpose as a variable of the same name in
Kbuild (the linux kernel buildsystem) is just happenstance.

Buildroot is not using Kbuild, nor is it even remotely based on Kbuild.

After discussing among maintainers, we decided that we did not want to
officially expose that variable.

Regards,
Yann E. MORIN.

>  * +UCLIBC_CONFIG_FILE=<path/to/.config>+, path to
>    the uClibc configuration file, used to compile uClibc, if an
>    internal toolchain is being built.
> -- 
> 2.31.1
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
