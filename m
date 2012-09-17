From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Sep 2012 22:58:46 +0200
Subject: [Buildroot] [PATCH v2 2/2] Add FAQ entry how to properly add
	package from github.
In-Reply-To: <1347914801-20681-1-git-send-email-marek.belisko@open-nandra.com>
References: <1347746247-12033-2-git-send-email-marek.belisko@open-nandra.com>
 <1347914801-20681-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <201209172258.46415.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marek, All,

On Monday 17 September 2012 22:46:41 Marek Belisko wrote:
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  docs/manual/faq.txt |   23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/docs/manual/faq.txt b/docs/manual/faq.txt
> index 575d019..d2ffb07 100644
> --- a/docs/manual/faq.txt
> +++ b/docs/manual/faq.txt
> @@ -36,3 +36,26 @@ then probably you are running a Fedora (or similar) distribution, and
>  you should install the +glibc-static+ package. This is because the
>  +module-init-tools+ build process wants to link statically against the
>  C library.
> +
> +How to add package from github
> +------------------------------
> +
> +If the package has no release version, or its version cannot be
> +identified using tag, then the sha1 of the particular commit should be
> +used to identify the version (the first 7 characters of the sha1 are
> +enough):
> +
> +------------------------
> +FOO_VERSION = 1234567
> +FOO_SOURCE = <user>-<package>-$(FOO_VERSION).tar.gz
> +FOO_SITE = http://github.com/<user>/<package>/tarball/<branch>
> +------------------------
> +
> +If the package version matches a tag, then this tag should be used to
> +identify the version:
> +
> +------------------------
> +FOO_VERSION = v1.0
> +FOO_SOURCE = <user>-<package>-$(FOO_VERSION).tar.gz
> +FOO_SITE = http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
> +------------------------
> -- 
> 1.7.9.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
