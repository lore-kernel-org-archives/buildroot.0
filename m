From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 7 Jun 2020 20:43:00 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: remove /usr/lib/rpm directory
 on target
In-Reply-To: <CADYdroPxh5nVuYj_6G3vdL0MoG6yu++oyxA1rowBNELwbGS3Mw@mail.gmail.com>
References: <20200605224858.12870-1-nolange79@gmail.com>
 <20200606223946.1358ed82@windsurf>
 <CADYdroPxh5nVuYj_6G3vdL0MoG6yu++oyxA1rowBNELwbGS3Mw@mail.gmail.com>
Message-ID: <CADYdroMA8GLpdvDqdB_yAp8F8zdaLODqkF6XUvyesbdzgtqQJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am So., 7. Juni 2020 um 00:51 Uhr schrieb Norbert Lange <nolange79@gmail.com>:
>
> Am Sa., 6. Juni 2020 um 22:39 Uhr schrieb Thomas Petazzoni
> <thomas.petazzoni@bootlin.com>:
> >
> > On Sat,  6 Jun 2020 00:48:56 +0200
> > Norbert Lange <nolange79@gmail.com> wrote:
> >
> > > this is only relevant for staging (if at all)
> > >
> > > Signed-off-by: Norbert Lange <nolange79@gmail.com>
> > > ---
> > >  Makefile | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index ce1c08a6f6..6a76e87b5e 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -748,7 +748,7 @@ target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
> > >       rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
> > >               $(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
> > >               $(TARGET_DIR)/usr/lib/cmake $(TARGET_DIR)/usr/share/cmake \
> > > -             $(TARGET_DIR)/usr/doc
> > > +             $(TARGET_DIR)/usr/lib/rpm $(TARGET_DIR)/usr/doc
> >
> > What have you found installed in $(TARGET_DIR)/usr/lib/rpm ? Why does
> > this needs to be done in target-finalize and not in the rpm package ?
> > Is it because other packages install stuff in /usr/lib/rpm ? If so,
> > what ?
>
> I believe this to be a common occurrence, like /usr/share/aclocal. But
> I need to check that again
>

Turns out that systemd drops some "macros" there.

Norbert
