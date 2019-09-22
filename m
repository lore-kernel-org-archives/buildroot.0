From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 22 Sep 2019 20:28:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/f2fs-tools: fix build without
 blkid
In-Reply-To: <4fcb4ac2-7e52-4648-597f-3384d9134fe5@mind.be>
References: <20190922083559.589-1-fontaine.fabrice@gmail.com>
 <4fcb4ac2-7e52-4648-597f-3384d9134fe5@mind.be>
Message-ID: <CAPi7W82y_vepwQe8KrEKu=unRUeEhnhY5VKOriv_uaDTRRnqMQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

Le dim. 22 sept. 2019 ? 20:17, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>
>
>
> On 22/09/2019 10:35, Fabrice Fontaine wrote:
> > Fixes:
> >  - http://autobuild.buildroot.org/results/c126cb419709367479578b6f118ac9f0d6622689
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
>  Applied to master, thanks.
>
>  I assume you sent the patch upstream?
Nope, I didn't find where to sent it.
>
>  Regards,
>  Arnout
>
> > ---
> >  ...-Makefile.am-fix-build-without-blkid.patch | 30 +++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> >  create mode 100644 package/f2fs-tools/0001-mkfs-Makefile.am-fix-build-without-blkid.patch
> >
> > diff --git a/package/f2fs-tools/0001-mkfs-Makefile.am-fix-build-without-blkid.patch b/package/f2fs-tools/0001-mkfs-Makefile.am-fix-build-without-blkid.patch
> > new file mode 100644
> > index 0000000000..aac60e70b6
> > --- /dev/null
> > +++ b/package/f2fs-tools/0001-mkfs-Makefile.am-fix-build-without-blkid.patch
> > @@ -0,0 +1,30 @@
> > +From 7727b6fe0897849d4fc8f75a48326e902f0ab8b2 Mon Sep 17 00:00:00 2001
> > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Date: Sun, 22 Sep 2019 10:06:35 +0200
> > +Subject: [PATCH] mkfs/Makefile.am: fix build without blkid
> > +
> > +Commit d56232bc1640e2a3ffc412faff42cd8e77dbb8dd hardcoded -lblkid in
> > +libf2fs_format_la_LDFLAGS which breaks the build with --without-blkid
> > +option so use ${libblkid_LIBS} instead
> > +
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +---
> > + mkfs/Makefile.am | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/mkfs/Makefile.am b/mkfs/Makefile.am
> > +index cae2f93..83e2389 100644
> > +--- a/mkfs/Makefile.am
> > ++++ b/mkfs/Makefile.am
> > +@@ -12,7 +12,7 @@ lib_LTLIBRARIES = libf2fs_format.la
> > + libf2fs_format_la_SOURCES = f2fs_format_main.c f2fs_format.c f2fs_format_utils.c
> > + libf2fs_format_la_CFLAGS = -DWITH_BLKDISCARD
> > + libf2fs_format_la_CPPFLAGS = -I$(top_srcdir)/include
> > +-libf2fs_format_la_LDFLAGS = -lblkid -luuid -L$(top_builddir)/lib -lf2fs \
> > ++libf2fs_format_la_LDFLAGS = ${libblkid_LIBS} -luuid -L$(top_builddir)/lib -lf2fs \
> > +     -version-info $(FMT_CURRENT):$(FMT_REVISION):$(FMT_AGE)
> > +
> > + install-exec-hook:
> > +--
> > +2.23.0
> > +
> >
Best Regards,

Fabrice
