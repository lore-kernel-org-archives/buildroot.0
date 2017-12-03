From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sun, 3 Dec 2017 13:40:59 +0200
Subject: [Buildroot] [PATCH] package/avahi: fix build failures
In-Reply-To: <20171203111344.8661-1-s.martin49@gmail.com>
References: <20171203111344.8661-1-s.martin49@gmail.com>
Message-ID: <20171203134059.GC19380@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  3 Dec 2017 12:13:44 +0100, Samuel Martin <s.martin49@gmail.com> wrote:
> Since [1], avahi uses/checks for pygobject instead of pygtk, so update
> the configure options accordingly.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/ffea97dc13d379d32f9e33ae6f9e986b2c435ea9
>   and many others
> 
> [1] https://github.com/lathiat/avahi/commit/142124dae6f043085aba59fca4657c56b2b23b65
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/avahi/avahi.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
> index b89887b4c7..c8f1af9a9d 100644
> --- a/package/avahi/avahi.mk
> +++ b/package/avahi/avahi.mk
> @@ -77,7 +77,7 @@ AVAHI_CONF_OPTS = \
>  	--disable-gtk \
>  	--disable-gtk3 \
>  	--disable-gdbm \
> -	--disable-pygtk \
> +	--disable-pygobject \
>  	--disable-mono \
>  	--disable-monodoc \
>  	--disable-stack-protector \
> -- 
> 2.15.1

Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>


--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171203/4f48a9ab/attachment.asc>
