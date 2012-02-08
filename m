From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 9 Feb 2012 00:04:34 +0100
Subject: [Buildroot] [PATCH] busybox: add watchdog daemon startup script
In-Reply-To: <20120208222639.36359e6a@skate>
References: <1328686893-6841-1-git-send-email-fabio.porcedda@telit.com>
 <20120208222639.36359e6a@skate>
Message-ID: <201202090004.34325.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 08 February 2012 22:26:39 Thomas Petazzoni wrote:
> Le Wed,  8 Feb 2012 08:41:33 +0100,
> Fabio Porcedda <fabio.porcedda@telit.com> a ?crit :
> 
> > +config BR2_PACKAGE_BUSYBOX_WATCHDOG
> > +	bool "Install watchdog daemon startup script"
> > +	help
> > +	  Install the watchdog daemon startup script,
> > +	  that just start at the boot the busybox watchdog daemon.
> > +
> 
> Maybe instead of creating a new configuration option, we can just make
> the installation of the S15watchdog script automatic if the Busybox
> configuration file has enabled CONFIG_WATCHDOG=y?
> 
> The current default Busybox configuration file in Buildroot has
> CONFIG_WATCHDOG=y, so we may want to change this default to disable
> CONFIG_WATCHDOG.

 NACK.  Many people will want to use watchdog in a different way.  And it
may be installed as S<someothernumber>watchdog so the check if it exists
already doesn't help.

 Having the start script _is_ relevant, even if it is just as an example.
It would be even better if the config option allowed to set the reset
frequency.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
