From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 Feb 2012 16:25:38 +0100
Subject: [Buildroot] [PATCH v3] busybox: add watchdog daemon startup
	script
In-Reply-To: <1328892725-25364-1-git-send-email-fabio.porcedda@telit.com>
References: <1328892725-25364-1-git-send-email-fabio.porcedda@telit.com>
Message-ID: <201202111625.38679.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 10 February 2012 17:52:05 Fabio Porcedda wrote:
> Signed-off-by: Fabio Porcedda <fabio.porcedda@telit.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 It may be useful to force-enable the watchdog in the buildroot config
it this option is selected.  For me, that's not necessary though.

 It would look something like this:

ifeq ($(BR2_PACKAGE_BUSYBOX_WATCHDOG),y)
define BUSYBOX_SET_WATCHDOG
        $(call KCONFIG_ENABLE_OPT,CONFIG_WATCHDOG,$(BUSYBOX_BUILD_CONFIG))
endef
endif

and then add BUSYBOX_SET_WATCHDOG to the rest of the config modifiers.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
