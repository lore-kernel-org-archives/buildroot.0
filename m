From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 14:55:03 -0300
Subject: [Buildroot] Blackfin Buildroot toolchain issue
In-Reply-To: <20150317161320.50559502@free-electrons.com>
References: <20150315221722.3645eb35@free-electrons.com>	<20150315221813.173a36e2@free-electrons.com>	<5508382D.7080008@zacarias.com.ar>	<20150317153028.66788805@free-electrons.com>	<55084360.1070405@zacarias.com.ar>
 <20150317161320.50559502@free-electrons.com>
Message-ID: <55086A77.6060907@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/17/2015 12:13 PM, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
> 
> On Tue, 17 Mar 2015 12:08:16 -0300, Gustavo Zacarias wrote:
> 
>> There's this as well:
>> https://bugs.busybox.net/show_bug.cgi?id=7921
>> Which basically boils down to uclibc NPTL requiring TLS.
>> I'll check for space savings to see if it makes sense for it to even be
>> an option.
> 
> I think it might make sense to keep it a blind option so that we don't
> do --enable-tls on architectures that don't have TLS support at all (if
> that even exists).

If blackfin supports it, everyone does ;)

>  config BR2_GCC_ENABLE_TLS
> -       bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
> +       bool
>         default y
>         depends on BR2_PTHREADS_NATIVE || BR2_TOOLCHAIN_BUILDROOT_EGLIBC || BR2_TOOLCHAIN_BUILDROOT_GLIBC
> -       help
> -         Enable the compiler to generate code for accessing
> -         thread local storage variables

Makes sense, the previous conditions were flawed as blackfin showed us,
no nptl but tls was there just fine.
Regards.
