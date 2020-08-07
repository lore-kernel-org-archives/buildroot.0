From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 Aug 2020 21:40:01 +0200
Subject: [Buildroot] [PATCH 1/1] package/smstools3: fix build with gcc
 10.x
In-Reply-To: <20200807125852.3739-1-mf@go-sys.de>
References: <20200807125852.3739-1-mf@go-sys.de>
Message-ID: <20200807194001.GK2186@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michael, All,

On 2020-08-07 14:58 +0200, Michael Fischer spake thusly:
> 0001-fix-build-with-gcc-10.x.patch: Add patch to fix build with gcc 10.x
> Fetch from: https://salsa.debian.org/debian-mobcom-team/smstools/-/blob/57a358a9eebbe2ca5639cc526f7027944ed95ea1/debian/patches/gcc10.patch
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Applied to master, thanks.

But see a little nit, below...

> ---
>  .../0002-fix-build-with-gcc-10.x.patch        | 753 ++++++++++++++++++
>  1 file changed, 753 insertions(+)
>  create mode 100644 package/smstools3/0002-fix-build-with-gcc-10.x.patch
> 
> diff --git a/package/smstools3/0002-fix-build-with-gcc-10.x.patch b/package/smstools3/0002-fix-build-with-gcc-10.x.patch
> new file mode 100644
> index 0000000000..3ef6bba0f0
> --- /dev/null
> +++ b/package/smstools3/0002-fix-build-with-gcc-10.x.patch
> @@ -0,0 +1,753 @@
> +Description: fix of FTBFS with gcc10
> +Author: Thorsten Alteholz <debian@alteholz.de>
> +Index: smstools/src/smsd_cfg.h

This 'Index:' line belongs...

> +Fetch from: <https://salsa.debian.org/debian-mobcom-team/smstools/-/blob/57a358a9eebbe2ca5639cc526f7027944ed95ea1/debian/patches/gcc10.patch>
> +
> +Signed-off-by: Michael Fischer <mf@go-sys.de>
> +

... here, just before that '====' line:

> +===================================================================
> +--- smstools.orig/src/smsd_cfg.h	2020-08-05 19:02:50.536596441 +0000
> ++++ smstools/src/smsd_cfg.h	2020-08-05 19:33:22.915005150 +0000

Fixed when applying, thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
