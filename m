From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Sep 2020 15:39:10 +0200
Subject: [Buildroot] [PATCH] dvb-apps: fix build failure with glibc 2.31
In-Reply-To: <20200926095550.27437-1-daggs@gmx.com>
References: <20200926095550.27437-1-daggs@gmx.com>
Message-ID: <20200926153910.009ca5ed@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for the patch. There are however a few coding style issues.
First, the commit title must always have the following format:

	package/<foo>: <something>

I.e you forgot the package/ prefix.

On Sat, 26 Sep 2020 12:55:50 +0300
Dagg Stompler <daggs@gmx.com> wrote:

> dvb-apps fails to build with glibc 2.31 with the following error:
> | dvbdate.c: In function set_time:
> | dvbdate.c:312:6: warning: implicit declaration of function stime; did you mean ctime? [-Wimplicit-function-declaration]
> |   312 |  if (stime(new_time)) {
> |       |      ^~~~~
> |       |      ctime
> 
> this patch takes from the first entry in the reference fixes it.
> 
> reference:
>  1. https://gitweb.gentoo.org/repo/gentoo.git/commit/media-tv/linuxtv-dvb-apps/files/linuxtv-dvb-apps-glibc-2.31.patch?id=eb705f892eae45b93306c1de1407c1c22ac23956
>  2. https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=964223

Please add a reference to the autobuilder failure, like this:

Fixes:

  http://autobuild.buildroot.net/results/95f30c5e6af2274418bb44a20da7caac69f1dd68/

> diff --git a/package/dvb-apps/0006-fix-glibc-2.31.patch b/package/dvb-apps/0006-fix-glibc-2.31.patch
> new file mode 100644
> index 0000000000..d404212b5e
> --- /dev/null
> +++ b/package/dvb-apps/0006-fix-glibc-2.31.patch

All patches must have a description and Signed-off-by.

Could you fix those details, and send an updated version? Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
