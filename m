From: Vadym Kochan <vadim4j@gmail.com>
Date: Mon, 20 May 2019 12:40:28 +0300
Subject: [Buildroot] [PATCH 1/1] package/suricata: fix static build with
 pcap
In-Reply-To: <CAPi7W8258vYdxOuRoS+gkmz987xdh2B5QDQ1cZgnusNtKGnTjA@mail.gmail.com>
References: <20190519200854.8933-1-vadim4j@gmail.com>
 <CAPi7W8258vYdxOuRoS+gkmz987xdh2B5QDQ1cZgnusNtKGnTjA@mail.gmail.com>
Message-ID: <20190520094028.GA4860@lwo1-lhp-f71841>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Fabrice,

On Sun, May 19, 2019 at 11:43:26PM +0200, Fabrice Fontaine wrote:
> Dear Vadim,
> 
> Le dim. 19 mai 2019 ? 22:09, Vadim Kochan <vadim4j@gmail.com> a ?crit :
> >
> > Build of suricata fails with BR2_STATIC_LIBS=y because pcap
> > requires libnl which can't be found, so use pkg-config to obtain
> > libpcap dependencies.
> Thanks for your patch however I already sent a patch's serie one month
> ago that also fixed this pcap issue:
> https://patchwork.ozlabs.org/project/buildroot/list/?series=104482.
> I think it's time to merge it.
> >

OK, I marked it as 'Superseded' :)

> > Fixes:
> >         http://autobuild.buildroot.net/results/b5fdf31db6897a9612a0badc7c4bd3e54f031308/
> >
> > Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> > ---
> >  package/suricata/suricata.mk | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
> > index e5884cdfe4..503d76e6a8 100644
> > --- a/package/suricata/suricata.mk
> > +++ b/package/suricata/suricata.mk
> > @@ -123,4 +123,6 @@ define SURICATA_INSTALL_INIT_SYSTEMD
> >                 $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/suricata.service
> >  endef
> >
> > +SURICATA_CONF_OPTS += LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libpcap`"
> > +
> >  $(eval $(autotools-package))
> > --
> > 2.21.0
> >
> Best Regards,
> 
> Fabrice

Regards,
Vadim Kochan
