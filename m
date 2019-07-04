From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Thu, 04 Jul 2019 19:31:01 +0200
Subject: [Buildroot] [PATCH v3 3/3] package/mpd: bump to version 0.21.7
In-Reply-To: <91452a65-49d5-a479-6cf8-eb9e0eef1897@mind.be>
References: <20190704104321.2598-1-joerg.krause@embedded.rocks>
 <20190704104321.2598-4-joerg.krause@embedded.rocks>
 <91452a65-49d5-a479-6cf8-eb9e0eef1897@mind.be>
Message-ID: <d5afdd42c243c540364a10373fd0944671130165.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Thu, 2019-07-04 at 19:21 +0200, Arnout Vandecappelle wrote:
> 
> On 04/07/2019 12:43, J?rg Krause wrote:
> > MPD changed from Autotools to the Meson build system.
> > 
> > Add config options for the qobuz and tidal plugins and group them together
> > with the soundcloud plugin under "Commercial services".
> > 
> > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  Is there any reason why you didn't do the bump to 0.21.11 already?

The only reason is that the patch was first proposed when version
0.21.7 was the most recent version back then. Shall I bump to version
0.21.11 instead (and change the commit message)?

> >  ifeq ($(BR2_PACKAGE_MPD_TREMOR),y)
> >  MPD_DEPENDENCIES += tremor
> > -# Help mpd to find tremor in static linking scenarios
> > -MPD_CONF_ENV += \
> > -	TREMOR_LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs vorbisidec`"
> > -MPD_CONF_OPTS += --with-tremor=$(STAGING_DIR)/usr
> 
>  I guess this is no longer needed because meson properly uses pkg-config. Have
> you tested that?

You're right, this is no longer needed and can safely be removed.

J?rg
