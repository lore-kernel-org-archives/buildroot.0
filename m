From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Dec 2014 22:03:19 +0100
Subject: [Buildroot] [PATCH v2 1/4] libfm-extra: new package
In-Reply-To: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141210210319.GF3926@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

Some further review I previously missed...

On 2014-11-21 15:33 +0000, Vicente Olivert Riera spake thusly:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[--SNIP--]
> diff --git a/package/libfm-extra/Config.in b/package/libfm-extra/Config.in
> new file mode 100644
> index 0000000..f0e0b63
> --- /dev/null
> +++ b/package/libfm-extra/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_LIBFM_EXTRA
> +	bool "libfm-extra"
> +	select BR2_PACKAGE_LIBGLIB2
> +	depends on BR2_USE_WCHAR # libglib2
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
> +	depends on BR2_USE_MMU # libglib2
> +	help
> +	  The libfm-extra package contains a library and other files
> +	  required by menu-cache-gen libexec of menu-cache-1.0.0
> +
> +	  http://wiki.lxde.org/en/Libfm
> +
> +comment "libfm-extra needs a toolchain w/ wchar, threads, C++"

"C++" is not needed. Stray copy-paste? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
