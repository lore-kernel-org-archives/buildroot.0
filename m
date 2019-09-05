From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 05 Sep 2019 08:48:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/libgpg-error: fix build with
 gawk 5.0
In-Reply-To: <20190901100733.26379-1-bernd.kuhls@t-online.de>
References: <20190901100733.26379-1-bernd.kuhls@t-online.de>
Message-ID: <8ce46069b7babc8f010f7972bfa17fd8fd8abcdd.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 2019-09-01 at 12:07 +0200, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/e81/e815bed0e7b3d9cbf50ebf605666a50e7032e5a1/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libgpg-error/0001-gawk5-support.patch | 162 ++++++++++++++++++
>  package/libgpg-error/libgpg-error.mk          |   2 +
>  2 files changed, 164 insertions(+)
>  create mode 100644 package/libgpg-error/0001-gawk5-support.patch
> 
> diff --git a/package/libgpg-error/0001-gawk5-support.patch b/package/libgpg-error/0001-gawk5-support.patch
> new file mode 100644
> index 0000000000..09d114c45f
> --- /dev/null
> +++ b/package/libgpg-error/0001-gawk5-support.patch
> @@ -0,0 +1,162 @@
> +From 7865041c77f4f7005282f10f9b6666b19072fbdf Mon Sep 17 00:00:00 2001
> +From: NIIBE Yutaka <gniibe@fsij.org>
> +Date: Mon, 15 Apr 2019 15:10:44 +0900
> +Subject: [PATCH] awk: Prepare for Gawk 5.0.
> +
> +* src/Makefile.am: Use pkg_namespace (instead of namespace).
> +* src/mkerrnos.awk: Likewise.
> +* lang/cl/mkerrcodes.awk: Don't escape # in regexp.
> +* src/mkerrcodes.awk, src/mkerrcodes1.awk, src/mkerrcodes2.awk: Ditto.
> +
> +Downloaded from
> +https://gitweb.gentoo.org/repo/gentoo.git/tree/dev-libs/libgpg-error/files/libgpg-error-1.36-gawk5-support.patch
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Fixes the build on my Arch Linux system after host version of gawk
bumped to 5.0.1.

Tested-by: J?rg Krause <joerg.krause@embedded.rocks>
