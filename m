From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Jul 2016 18:00:54 +0200
Subject: [Buildroot] [PATCH v2 3/6] docs/manual: Document the variable
 $(PKG)_DL_OPTS
In-Reply-To: <1468315820-9341-4-git-send-email-romain.perier@free-electrons.com>
References: <1468315820-9341-1-git-send-email-romain.perier@free-electrons.com>
 <1468315820-9341-4-git-send-email-romain.perier@free-electrons.com>
Message-ID: <20160715160054.GE3692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-07-12 11:30 +0200, Romain Perier spake thusly:
> This adds a description of the optional variable $(PKG)_DL_OPTS. When it
> is set, this option passes additional options to the downloader.
> 
> Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
> ---
> 
> Changes in v2:
>  - Don't include the example in the snippet of code
>  - Replaced $(PKG)_DL_REFERER by $(PKG)_DL_OPTS
> 
>  docs/manual/adding-packages-generic.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> index 8ed7fe8..1ee983f 100644
> --- a/docs/manual/adding-packages-generic.txt
> +++ b/docs/manual/adding-packages-generic.txt
> @@ -250,6 +250,11 @@ information is (assuming the package name is +libfoo+) :
>      +LIBFOO_SITE=/opt/software/libfoo.tar.gz+ +
>      +LIBFOO_SITE=$(TOPDIR)/../src/libfoo+
>  
> +* +LIBFOO_DL_OPTS+ is a space-separated list of additional options to
> +  pass to the downloader. Useful for retrieving documents with
> +  server-side checking for user logins and passwords, or to use a proxy.
> +  All download methods are supported.

With the last sentence, I'd also say something like:

    All download methods valid for +LIBFOO_SITE_METHOD+ are supported;
    valid options depend on the download method (consult the man page
    for the respective download utilities).

Regards,
Yann E. MORIN.

>  * +LIBFOO_EXTRA_DOWNLOADS+ is a space-separated list of additional
>    files that Buildroot should download. If an entry contains +://+
>    then Buildroot will assume it is a complete URL and will download
> -- 
> 2.8.1
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
