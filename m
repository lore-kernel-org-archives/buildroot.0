From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 5 Apr 2021 12:17:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: enable qcom-soc
 if libqrtr-glib enabled
In-Reply-To: <20210405110250.1e48e10f@windsurf.home>
References: <20210404184126.974098-1-petr.vorel@gmail.com>
 <20210405110250.1e48e10f@windsurf.home>
Message-ID: <YGrjwp8R7/J4vW9q@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Sun,  4 Apr 2021 20:41:26 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:

> > This plugin makes sense only for Qualcomm MSM phone.
> > Although there is currently no such device defconfig in Buildroot yet,
> > it makes sense to prepare modem-manager for it.

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> > ---
> >  package/modem-manager/modem-manager.mk | 6 ++++++
> >  1 file changed, 6 insertions(+)

> > diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> > index 2cc45d266b..d62d13cf45 100644
> > --- a/package/modem-manager/modem-manager.mk
> > +++ b/package/modem-manager/modem-manager.mk
> > @@ -34,6 +34,12 @@ else
> >  MODEM_MANAGER_CONF_OPTS += --without-mbim
> >  endif

> > +ifeq ($(BR2_PACKAGE_LIBQRTR_GLIB),y)
> > +MODEM_MANAGER_CONF_OPTS += --enable-plugin-qcom-soc

> Isn't that missing a MODEM_MANAGER_DEPENDENCIES += libqrtr-glib line ?
> Or is it really a runtime dependency ?
error: Couldn't find libqmi-glib >= 1.29.3
when building locally.
=> you're right it probably requires MODEM_MANAGER_DEPENDENCIES += libqrtr-glib
I'll test it and probably sent v2.
Thanks for catching error!

Kind regards,
Petr

> Thomas
