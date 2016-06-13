From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jun 2016 22:29:51 +0200
Subject: [Buildroot] [PATCH 1/6] Replace (e)glibc by glibc
In-Reply-To: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160613202951.GB3786@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Besides the nit-pick by Romain, I have my owns to point out... ;-)

On 2016-06-08 23:40 +0200, Thomas Petazzoni spake thusly:
> Following the removal of eglibc support, this commit replaces all
> occurences of "(e)glibc" by just "glibc". Most of the occurences are in
> package Config.in comments.
> 
> In addition, when the form "an (e)glibc ..." was used, it is replaced by
> "a glibc ...".
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[--SNIP--]
> diff --git a/package/liquid-dsp/Config.in b/package/liquid-dsp/Config.in
> index a2cd21c..4b94eda 100644
> --- a/package/liquid-dsp/Config.in
> +++ b/package/liquid-dsp/Config.in
> @@ -1,4 +1,4 @@
> -comment "liquid-dsp requires a (e)glibc/musl toolchain w/ dynamic library"
> +comment "liquid-dsp requires a glibc/musl toolchain w/ dynamic library"

Not related to this patch, but we don;t ususaly use "glibc/musl" but
"glibc or musl".

[--SNIP--]
> diff --git a/system/Config.in b/system/Config.in
> index 9441467..5a90b11 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -95,7 +95,7 @@ config BR2_INIT_SYSTEMD
>  	select BR2_ROOTFS_MERGED_USR
>  	select BR2_PACKAGE_SYSTEMD
>  
> -comment "systemd needs (e)glibc toolchain, headers >= 3.10"
> +comment "systemd needs glibc toolchain, headers >= 3.10"

... needs *a* glibc ...

Otherwise:

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
