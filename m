From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Dec 2017 09:13:26 +0100
Subject: [Buildroot] [PATCH 3/3] package/vlc: switch to libupnp-1.8
In-Reply-To: <20171214073134.28696-3-bernd.kuhls@t-online.de>
References: <20171214073134.28696-1-bernd.kuhls@t-online.de>
 <20171214073134.28696-3-bernd.kuhls@t-online.de>
Message-ID: <CAPi7W81zkH=n-1yXvuCri+99H7WGvQM5Gv9BbKa6Vj7Bt027rA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd,

I don't think this is the right fix, vlc is compatible with both versions
of libupnp (1.6.x and 1.8.x).
However, libupnp 1.6.23 added its own compat code so I think we should
apply this commit (from mainstream) to fix the issue with 1.6.x:
https://github.com/videolan/vlc/commit/f9c5a343f1a8cad9c2c153f9c05e4e7201675a43#diff-99aaf215e619208a327a2e41f97c59c1
.

Best regards,

Fabrice


2017-12-14 8:31 GMT+01:00 Bernd Kuhls <bernd.kuhls@t-online.de>:

> Vlc now supports libupnp-1.8:
> http://git.videolan.org/?p=vlc/vlc-2.2.git;a=commitdiff;h=
> 825dca78be3a81e2a1c5d04137aa01b1cb32dfd3
>
> Fixes
> http://autobuild.buildroot.net/results/d98/d98bdcc745a2480d4664db2427f0ae
> 1c9c5ea71e/
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/vlc/vlc.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
> index 30520c3072..84693588fd 100644
> --- a/package/vlc/vlc.mk
> +++ b/package/vlc/vlc.mk
> @@ -281,9 +281,9 @@ else
>  VLC_CONF_OPTS += --disable-theora
>  endif
>
> -ifeq ($(BR2_PACKAGE_LIBUPNP),y)
> +ifeq ($(BR2_PACKAGE_LIBUPNP18),y)
>  VLC_CONF_OPTS += --enable-upnp
> -VLC_DEPENDENCIES += libupnp
> +VLC_DEPENDENCIES += libupnp18
>  else
>  VLC_CONF_OPTS += --disable-upnp
>  endif
> --
> 2.11.0
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171214/1b99f608/attachment.html>
