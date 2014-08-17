From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 15:57:01 +0200
Subject: [Buildroot] [PATCH] package/nut: fix parallel install
In-Reply-To: <1408269792-5553-1-git-send-email-yann.morin.1998@free.fr>
References: <1408269792-5553-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140817135701.GG5274@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2014-08-17 12:03 +0200, Yann E. MORIN spake thusly:
> Fixes:
>     http://autobuild.buildroot.net/results/256/2567e13cd5bc702bc3a38a1d6fc8e34022cc7db5/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/nut/nut-0002-parallel-build.patch | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 package/nut/nut-0002-parallel-build.patch
> 
> diff --git a/package/nut/nut-0002-parallel-build.patch b/package/nut/nut-0002-parallel-build.patch
> new file mode 100644
> index 0000000..f979c19
> --- /dev/null
> +++ b/package/nut/nut-0002-parallel-build.patch
> @@ -0,0 +1,24 @@
> +conf: fix parallel install
> +
> +Do not reference the upsmon.conf.sample twice, otherwise install, with
> +a high number of make jobs, may fail, like so:
> +    http://autobuild.buildroot.net/results/256/2567e13cd5bc702bc3a38a1d6fc8e34022cc7db5/build-end.log
> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +
> +---
> +Upstream status:
> +    https://github.com/networkupstools/nut/pull/147

Accepted upstream; ref. the URL above.

Regards,
Yann E. MORIN.

> +diff -durB nut-2.7.2.orig/conf/Makefile.am nut-2.7.2/conf/Makefile.am
> +--- nut-2.7.2.orig/conf/Makefile.am	2014-02-14 09:56:53.000000000 +0100
> ++++ nut-2.7.2/conf/Makefile.am	2014-08-17 11:33:46.804439240 +0200
> +@@ -2,7 +2,7 @@
> + 
> + INSTALL_0600 = $(INSTALL) -m 0600
> + 
> +-SECFILES = upsmon.conf.sample upsd.conf.sample upsd.users.sample
> ++SECFILES = upsd.conf.sample upsd.users.sample
> + PUBFILES = nut.conf.sample ups.conf.sample
> + CGIPUB = hosts.conf.sample upsset.conf.sample upsstats.html.sample	\
> +  upsstats-single.html.sample
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
