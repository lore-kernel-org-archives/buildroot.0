From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 24 Feb 2015 00:00:23 +0100
Subject: [Buildroot] [PATCH v8] wine: New package
In-Reply-To: <54EB7E36.6060303@dawncrow.de>
References: <54EB7E36.6060303@dawncrow.de>
Message-ID: <20150223230023.GB3950@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andre, All,

On 2015-02-23 20:23 +0100, Andr? Hentschel spake thusly:
> Adds new package: wine

I have a very minor comment that can be fixed when the patch is applied,
no need to resend it...

[--SNIP--]
> diff --git a/package/wine/Config.in b/package/wine/Config.in
> new file mode 100644
> index 0000000..9a3b87f
> --- /dev/null
> +++ b/package/wine/Config.in
> @@ -0,0 +1,21 @@
> +config BR2_PACKAGE_WINE
> +	bool "wine"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	# Wine only builds on certain architectures
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
> +	# Wine has much CPU specific code and mostly makes sense on x86
> +	depends on BR2_i386
> +	help
> +	  Wine is a compatibility layer capable of running Windows
> +	  applications on Linux. Instead of simulating internal
> +	  Windows logic like a virtual machine or emulator, Wine
> +	  translates Windows API calls into POSIX calls on-the-fly,
> +	  eliminating the performance and memory penalties of other
> +	  methods.
> +
> +	  http://www.winehq.org
> +
> +comment "wine needs a (e)glibc toolchain w/ IPv6, threads"

You indeed removed the dependency on threads and IPv6, but forgot to
update the comment; stating "wine needs an (e)glibc toolchain" is
enough.

That's about all I have to say about this version. With the above fixed
before commiting:

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Only build-tested, not run-time tested y lack of Windows apps]
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thank you for your persistence in this adventure! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
