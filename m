From: Adrian Sweet <asweet@thegoodpenguin.co.uk>
Date: Mon, 1 Mar 2021 16:55:49 +0000
Subject: [Buildroot] [PATCH 1/1] package/cog: add
 BR2_PACKAGE_COG_USE_SYSTEM_DBUS
In-Reply-To: <20210204223323.GB441747@momiji>
References: <20210202115721.4136447-1-asweet@thegoodpenguin.co.uk>
 <20210204223323.GB441747@momiji>
Message-ID: <CAH=7X1AyXmWKnV+57tX9w_Smgz413jsYYVJfzv1X8arz7Bs1zA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,
Is there anything preventing this being merged? Can I help with any issues?
Thanks, Adrian

On Thu, 4 Feb 2021 at 20:33, Adrian Perez de Castro <aperez@igalia.com>
wrote:

> Hi Adrian,
>
> Thanks for the patch, I think adding the option is fine given that there
> are people around who would use it?which seems to be the case.
>
> Unless somebody else has an opinion against, I think we could merge this
> change =]
>
> On Tue, 02 Feb 2021 11:57:21 +0000 Adrian Sweet <
> asweet at thegoodpenguin.co.uk> wrote:
> > Added config option to expose browser remote control on the D-Bus system
> bus
> >
> > Signed-off-by: Adrian Sweet <asweet@thegoodpenguin.co.uk>
>
> Reviewed-by: Adrian Perez de Castro <aperez@igalia.com>
>
> > ---
> >  package/cog/Config.in | 6 ++++++
> >  package/cog/cog.mk    | 6 ++++++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/package/cog/Config.in b/package/cog/Config.in
> > index a9ca7473a9..c19f1c200e 100644
> > --- a/package/cog/Config.in
> > +++ b/package/cog/Config.in
> > @@ -47,6 +47,12 @@ config BR2_PACKAGE_COG_PLATFORM_DRM
> >         with video drivers that support kernel mode-setting (KMS)
> >         via the DRM user-space API.
> >
> > +config BR2_PACKAGE_COG_USE_SYSTEM_DBUS
> > +     bool "Use D-Bus system bus"
> > +     default n
> > +     help
> > +       Expose remote control interface on system bus
> > +
> >  comment "DRM platform needs mesa3d w/ EGL driver and GBM"
> >       depends on !BR2_PACKAGE_MESA3D_OPENGL_EGL
> >
> > diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> > index 47a5573dda..c5a1cc0df2 100644
> > --- a/package/cog/cog.mk
> > +++ b/package/cog/cog.mk
> > @@ -31,4 +31,10 @@ else
> >  COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_COG_USE_SYSTEM_DBUS),y)
> > +COG_CONF_OPTS += -DCOG_DBUS_SYSTEM_BUS=ON
> > +else
> > +COG_CONF_OPTS += -DCOG_DBUS_SYSTEM_BUS=OFF
> > +endif
> > +
> >  $(eval $(cmake-package))
> > --
> > 2.25.1
> >
>


-- 
Adrian Sweet, Software Engineer
https://www.thegoodpenguin.co.uk

The Good Penguin Ltd is a company registered in England and Wales with
company number 12374667 and VAT number 341687879. Registered office: The
Good Penguin Ltd, Westcott, Glasllwch Lane, Newport, NP20 3PS.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210301/b9687bea/attachment.html>
