From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Mar 2012 10:41:46 +0100
Subject: [Buildroot] [PATCH 1/2] Add (Freescale) elftosb host package
In-Reply-To: <201203140105.44719.arnout@mind.be>
References: <1331643131-31435-1-git-send-email-eric.jarrige@armadeus.org>
 <1331643131-31435-2-git-send-email-eric.jarrige@armadeus.org>
 <201203140105.44719.arnout@mind.be>
Message-ID: <20120314104146.0e75b488@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Wed, 14 Mar 2012 01:05:44 +0100,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> On Tuesday 13 March 2012 13:52:10 Eric Jarrige wrote:
> > +define HOST_ELFTOSB_CLEAN_CMDS
> > +       rm -rf $(@D)/bld/linux
> > +       rm -f $(HOST_DIR)/usr/bin/elftosb
> > +       rm -f $(HOST_DIR)/usr/bin/keygen
> > +       rm -f $(HOST_DIR)/usr/bin/sbtool
> > +endef
> 
>  These look like UNINSTALL commands, not CLEAN commands.

Ah right. Actually the first line should be part of CLEAN commands, and
the three last lines should be part of the UNINSTALL commands.

Are they people who actually care about those CLEAN and UNINSTALL
commands? Is it worth keeping support for them?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
