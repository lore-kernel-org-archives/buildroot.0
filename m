From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 28 Nov 2017 14:06:15 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/avahi: configure option
 pygtk was renamed to pygobject
In-Reply-To: <20171127202700.28697-1-bernd.kuhls@t-online.de>
References: <20171127202700.28697-1-bernd.kuhls@t-online.de>
Message-ID: <20171128130615.GG2889@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-11-27 21:27 +0100, Bernd Kuhls spake thusly:
> See corresponding commit:
> https://github.com/lathiat/avahi/commit/142124dae6f043085aba59fca4657c56b2b23b65
> 
> Fixes
> http://autobuild.buildroot.net/results/1e9/1e974c814ae4236077a869339be1143a9af7e5cd/
> http://autobuild.buildroot.net/results/010/0101b1205aec5a0c9c6509edf3d302aeaa3bd0ca/
> http://autobuild.buildroot.net/results/572/5721634ffa2a4544a82dda08c1fcea331ecdadaf/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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

This is incorrect, because then this disables the full python support.

So, either we do without python-gobject and we remove all the python
handling in avahi.mk, or we bump python-gobject and fix the dependency
chain.

Regards,
Yann E. MORIN.

>  	--disable-mono \
>  	--disable-monodoc \
>  	--disable-stack-protector \
> -- 
> 2.11.0
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
