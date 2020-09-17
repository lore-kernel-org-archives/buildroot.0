From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 17 Sep 2020 19:15:57 +0200
Subject: [Buildroot] [PATCH 1/3 v4] package/qt5/qt5webengine: fix
 ffmpeg/codec/alsa option handling for latest
In-Reply-To: <20200917153910.GG2422@scaer>
References: <cover.1600290685.git.yann.morin.1998@free.fr>
 <73c8adc83c7e856136f5eacd8aab44631b0a64cc.1600290685.git.yann.morin.1998@free.fr>
 <20200917145551.3f4a7187@windsurf.hq.k.grp>
 <20200917153910.GG2422@scaer>
Message-ID: <20200917191557.595453fe@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Thu, 17 Sep 2020 17:39:10 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Thomas, All,
>
> On 2020-09-17 14:55 +0200, Thomas Petazzoni spake thusly:
> > On Wed, 16 Sep 2020 23:11:32 +0200
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > diff --git a/package/qt5/qt5webengine/qt5webengine.mk b/package/qt5/qt5webengine/qt5webengine.mk
> > > index 9101f35937..5df6942977 100644
> > > --- a/package/qt5/qt5webengine/qt5webengine.mk
> > > +++ b/package/qt5/qt5webengine/qt5webengine.mk
> > > @@ -29,16 +29,16 @@ endif
> > >
> > >  QT5WEBENGINE_DEPENDENCIES += host-libpng host-libnss libnss
> > >
> > > -QT5WEBENGINE_CONF_OPTS += WEBENGINE_CONFIG+=use_system_ffmpeg
> > > +QT5WEBENGINE_CONF_OPTS = -webengine-ffmpeg
> > >
> > >  ifeq ($(BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS),y)
> > > -QT5WEBENGINE_CONF_OPTS += WEBENGINE_CONFIG+=use_proprietary_codecs
> > > +QT5WEBENGINE_CONF_OPTS += -webengine-proprietary-codecs
> > >  endif
> > >
> > >  ifeq ($(BR2_PACKAGE_QT5WEBENGINE_ALSA),y)
> > >  QT5WEBENGINE_DEPENDENCIES += alsa-lib
> > >  else
> > > -QT5WEBENGINE_CONF_OPTS += QT_CONFIG-=alsa
> > > +QT5WEBENGINE_CONF_OPTS += -no-webengine-alsa
> > >  endif
> >
> > In the original patch, there was a "--" that was added to separate
> > these webengine options from the main options. You have not kept that.
> > Are you sure this is OK ?
>
> I am not sure, hence I said in the cover-letter "Note: this is not even
> build-tested; it's just a refresh-n-respin."
>
> I'll do a test-build tonight (I did not have spare CPU cycles yesterday,
> but tonight I should have some.)
>
> However, none of the qmake-package we have use that '--'.

I believe Thomas is right, all other qmake-packages set
an option <name>=|-=|+=<value> as the old behavior before
the patch and not the 'real' option one after the patch
(see above 'QT_CONFIG-=alsa' vs. '-no-webengine-alsa' or
in case for the first one '-- -webengine-ffmpeg'...

Regards,
Peter

>
> Regards,
> Yann E. MORIN.
>
