From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 13 Aug 2015 22:55:55 +0300
Subject: [Buildroot] [PATCH] [autobuild] package/lightning: fix build
 for static-only
In-Reply-To: <1439477908-24088-1-git-send-email-yann.morin.1998@free.fr>
References: <1439477908-24088-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150813195555.GA25261@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thu, Aug 13, 2015 at 04:58:28PM +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/019/019b6f2ac034766a4266e20e5dcc229bec4a7222/
>     http://autobuild.buildroot.org/results/55d/55d30db7212863d9f898bb929f0c75d529036bad/
>     http://autobuild.buildroot.org/results/459/459ab12bc3eeb493f39efa2450bc829a351ee3a3/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Paul Cercueil <paul@crapouillou.net>
> ---
>  package/lightning/0003-no-check-no-doc.patch | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 package/lightning/0003-no-check-no-doc.patch
> 
> diff --git a/package/lightning/0003-no-check-no-doc.patch b/package/lightning/0003-no-check-no-doc.patch
> new file mode 100644
> index 0000000..91a1684
> --- /dev/null
> +++ b/package/lightning/0003-no-check-no-doc.patch
> @@ -0,0 +1,21 @@
> +Makefile: do not build checks or docs
> +
> +checks require a toolchain with shared libs, so they FTBFS when the
> +build is static-only.
> +
> +Docs we don't care about in Buildroot.

In http://patchwork.ozlabs.org/patch/505871/ I opted for disabling static 
build support entirely. I see the value in preserving static build ability, 
but this patch is not upstreamable in its current form. I'm fine both ways.

> +
> +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> +
> +diff -durN lightning-2.0.5.orig/Makefile.am lightning-2.0.5/Makefile.am
> +--- lightning-2.0.5.orig/Makefile.am	2013-09-24 05:37:46.000000000 +0200
> ++++ lightning-2.0.5/Makefile.am	2015-08-13 16:27:20.626730913 +0200
> +@@ -17,8 +17,6 @@
> + ACLOCAL_AMFLAGS = -I m4
> + 
> + SUBDIRS =		\
> +-	check		\
> +-	doc		\
> + 	include		\
> + 	lib

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
