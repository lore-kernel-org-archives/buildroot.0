From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Sun, 21 Sep 2014 14:40:51 +0200
Subject: [Buildroot] [PATCH] package/openvmtools: do not force
 -I/usr/include in CPPFLAGS
In-Reply-To: <1411297275-6888-1-git-send-email-yann.morin.1998@free.fr>
References: <1411297275-6888-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CABbD_XDWpL8xoY0EVB7AtVu+O5AVuVV-kfiCMZvsNvpX=z+yUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

I was just looking for the same problem at
http://autobuild.buildroot.net/results/2e0/2e0c15fded8b1043e916c34a795da0a06c8534fb/build-end.log
. Thanks for the fix - the patch number should become 05 I think if applied
committed after http://patchwork.ozlabs.org/patch/389396/ .

BR,
Karoly

On Sun, Sep 21, 2014 at 1:01 PM, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Fixes:
>
> http://autobuild.buildroot.net/results/447/4473d8a99ffec1fde491d172520e86ae1e69fae7/
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  .../openvmtools-04-dont-force-cppflags.patch       | 22
> ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644
> package/openvmtools/openvmtools-04-dont-force-cppflags.patch
>
> diff --git a/package/openvmtools/openvmtools-04-dont-force-cppflags.patch
> b/package/openvmtools/openvmtools-04-dont-force-cppflags.patch
> new file mode 100644
> index 0000000..8f904b1
> --- /dev/null
> +++ b/package/openvmtools/openvmtools-04-dont-force-cppflags.patch
> @@ -0,0 +1,22 @@
> +m4: do not force -I/usr/include in CPPFLAGS
> +
> +This is so horribly broken for cross-compilation. :-(
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +
> +diff -durN openvmtools-9.4.6-1770165.orig/m4/vmtools.m4
> openvmtools-9.4.6-1770165/m4/vmtools.m4
> +--- openvmtools-9.4.6-1770165.orig/m4/vmtools.m4       2014-07-02
> 00:21:14.000000000 +0200
> ++++ openvmtools-9.4.6-1770165/m4/vmtools.m4    2014-09-21
> 12:39:15.901659888 +0200
> +@@ -281,10 +281,10 @@
> +       if test "$os" = freebsd; then
> +          CUSTOM_$1_CPPFLAGS="-I/usr/local/include"
> +       else
> +-         CUSTOM_$1_CPPFLAGS="-I/usr/include"
> ++         CUSTOM_$1_CPPFLAGS=" "
> +       fi
> +       if test -n "$2"; then
> +-         CUSTOM_$1_CPPFLAGS="${CUSTOM_$1_CPPFLAGS}/$2"
> ++         : CUSTOM_$1_CPPFLAGS="${CUSTOM_$1_CPPFLAGS}/$2"
> +       fi
> +    fi
> + ])
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 

?dv,
KK
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140921/6bbd3f9a/attachment.html>
