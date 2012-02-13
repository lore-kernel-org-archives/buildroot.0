From: Fabio Porcedda <Fabio.Porcedda@telit.com>
Date: Mon, 13 Feb 2012 08:45:48 +0000
Subject: [Buildroot] [PATCH v3] busybox: add watchdog daemon startup
	script
In-Reply-To: <201202111625.38679.arnout@mind.be>
References: <1328892725-25364-1-git-send-email-fabio.porcedda@telit.com>
 <201202111625.38679.arnout@mind.be>
Message-ID: <1329122702.1940.3.camel@lvd2036>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2012-02-11 at 16:25 +0100, Arnout Vandecappelle wrote:
> On Friday 10 February 2012 17:52:05 Fabio Porcedda wrote:
> > Signed-off-by: Fabio Porcedda <fabio.porcedda@telit.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>  It may be useful to force-enable the watchdog in the buildroot config
> it this option is selected.  For me, that's not necessary though.
> 
>  It would look something like this:
> 
> ifeq ($(BR2_PACKAGE_BUSYBOX_WATCHDOG),y)
> define BUSYBOX_SET_WATCHDOG
>         $(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG,$(BUSYBOX_BUILD_CONFIG))
> endef
> endif
> 
> and then add BUSYBOX_SET_WATCHDOG to the rest of the config modifiers.

Ok, i'm making an updated patch following this suggestion.
 
> 
>  Regards,
>  Arnout
> 

-- 
Fabio Porcedda
Software Developer - R&D Cagliari

Telit Communications S.p.A.
Loc. Sa Illetta, SS 195, Km 2.300
09122 Cagliari - Italy
Phone: +39 070 4603 247
Fax:   +39 070 4603 250
Skype: fabiopo_telit
http://www.telit.com
