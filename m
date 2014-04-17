From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 17 Apr 2014 16:54:28 +0200
Subject: [Buildroot] [PATCH 13/13] package/vlc: depends on the virtual
 package libgl
In-Reply-To: <an552bx168.ln2@ID-313208.user.individual.net>
References: <cover.1396699629.git.yann.morin.1998@free.fr>
 <55d8bed0fa397c30345e1ba8318eeeb76fac7a3a.1396699629.git.yann.morin.1998@free.fr>
 <an552bx168.ln2@ID-313208.user.individual.net>
Message-ID: <20140417145428.GA3270@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-04-17 16:40 +0200, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
> news:55d8bed0fa397c30345e1ba8318eeeb76fac7a3a.1396699629.git.yann.morin.199
> 8 at free.fr: 
> 
> > We now have a virtual package, libgl, which ensures openGL is available.
> 
> Hi,
> 
> a similar patch should be included in your patch series to fix
> http://autobuild.buildroot.net/results/f7a/f7af081048ad967ed4a76afd8c527395f7
> b0c2dc/

Sure! Care to add your SoB-line and a proper commit-log, so I can add
it to my series?

Regards,
Yann E. MORIN.

> --- a/package/x11r7/xapp_xdriinfo/Config.in
> +++ b/package/x11r7/xapp_xdriinfo/Config.in
> @@ -2,6 +2,9 @@ config BR2_PACKAGE_XAPP_XDRIINFO
>         bool "xdriinfo"
>         select BR2_PACKAGE_XLIB_LIBX11
>         select BR2_PACKAGE_XPROTO_GLPROTO
> -       depends on BR2_PACKAGE_MESA3D
> +       depends on BR2_PACKAGE_HAS_LIBGL
>         help
>           query configuration information of DRI drivers
> +
> +comment "xdriinfo depends on OpenGL"
> +       depends on !BR2_PACKAGE_HAS_LIBGL
> 
> 
> Regards, Bernd
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
