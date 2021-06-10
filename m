From: Markus Mayer <mmayer@broadcom.com>
Date: Thu, 10 Jun 2021 11:56:43 -0700
Subject: [Buildroot] [PATCH 1/1] mtd-utils-2.1.2: ubihealthd depends on
 ubifs support
In-Reply-To: <CAEyMn7Z8NzQxdGWE59vRoJG3uS5xcNt9pqhArthgTvh_zA76vA@mail.gmail.com>
References: <20210609234819.1860554-1-mmayer@broadcom.com>
 <20210609234819.1860554-2-mmayer@broadcom.com>
 <CAEyMn7Z8NzQxdGWE59vRoJG3uS5xcNt9pqhArthgTvh_zA76vA@mail.gmail.com>
Message-ID: <CAGt4E5spf8eE7x_y7k3-vP4zCL4+R8oK58RMoMUWHGkOkLwkdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 9 Jun 2021 at 21:36, Heiko Thiery <heiko.thiery@gmail.com> wrote:

> > ubihealthd is only being built, if mtd-utils are being built
> > --with-ubifs. Reflect that dependency within buildroot.
> >
>
> This seems to fix the issue reported to the commiter:
> http://lists.busybox.net/pipermail/buildroot/2021-June/311951.html

Yes, it does look like it would address this issue. Have you been able
to confirm that it addresses the problem? If so, can you reply with a
Tested-by?

Thanks,
-Markus

> > Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> > ---
> >  package/mtd/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/mtd/Config.in b/package/mtd/Config.in
> > index c7ad3b3cdc9c..64a7ae19a7e2 100644
> > --- a/package/mtd/Config.in
> > +++ b/package/mtd/Config.in
> > @@ -139,6 +139,7 @@ config BR2_PACKAGE_MTD_UBIFORMAT
> >
> >  config BR2_PACKAGE_MTD_UBIHEALTHD
> >         bool "ubihealthd"
> > +       depends on BR2_PACKAGE_MTD_UBIFS_UTILS
> >         default y
> >
> >  config BR2_PACKAGE_MTD_UBIMKVOL
>
> Thanks
> --
> Heiko
