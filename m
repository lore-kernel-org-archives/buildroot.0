From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Feb 2013 22:41:37 +0100
Subject: [Buildroot] [PATCH] new package: libcanberra
In-Reply-To: <1361471297-23210-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1361471297-23210-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <201302212241.37780.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan, All,

On Thursday 21 February 2013 Stefan Fr?berg wrote:
> libcanberra
  ^^^
Useless line.

> Portable sound event library
> 
> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
[--SNIP--]
> diff --git a/package/libcanberra/Config.in b/package/libcanberra/Config.in
> new file mode 100644
> index 0000000..59accd0
> --- /dev/null
> +++ b/package/libcanberra/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_LIBCANBERRA
> +	bool "libcanberra"
> +	select	BR2_PACKAGE_ALSA_LIB

You need to inherit the depndencies of alsa-lib:
    depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib

(add a comment when it's not availalbe.)

Also, single-space between 'select' and the symbol name.

> +	select	BR2_PACKAGE_LIBGTK2

Ditto the previous patch: I'd prefer a 'depends on' rather than a
'select'

> +	select	BR2_PACKAGE_LIBVORBIS
> +	help
> +	  Portable sound event library
> +
> +	  http://0pointer.de/lennart/projects/libcanberra

Ah-ah! Yet another poetteringy lib. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
