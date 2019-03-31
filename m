From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 31 Mar 2019 15:27:38 +0200
Subject: [Buildroot] [PATCH v2,
 2/2] package/jq: add oniguruma optional dependency
In-Reply-To: <20190331151432.52efa3b8@windsurf>
References: <20190320203617.27496-1-fontaine.fabrice@gmail.com>
 <20190320203617.27496-2-fontaine.fabrice@gmail.com>
 <20190331151432.52efa3b8@windsurf>
Message-ID: <CAPi7W82rGMuVdjVtgS2DbuqoFg2RWtU5YYembKoXiBot3P=01Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le dim. 31 mars 2019 ? 15:14, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Wed, 20 Mar 2019 21:36:17 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> >  # jq explicitly enables maintainer mode, which we don't need/want
> > -JQ_CONF_OPTS += --disable-maintainer-mode --without-oniguruma
> > -HOST_JQ_CONF_OPTS += --disable-maintainer-mode --without-oniguruma
> > +JQ_CONF_OPTS += --disable-maintainer-mode
> > +HOST_JQ_CONF_OPTS += --disable-maintainer-mode
> > +
> > +HOST_JQ_CONF_OPTS += --with-oniguruma
> > +HOST_JQ_DEPENDENCIES += host-oniguruma
>
> What decided you to add onigurama as a mandatory dependency for
> host-jq ? What feature does it bring ? Do we really need it as a
> mandatory dependency ?
I decided to keep it because it's enabled by default in upstream but I
can send a v2 without it as no package depends on this feature.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
