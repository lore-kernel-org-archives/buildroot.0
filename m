From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Apr 2012 11:12:47 +0200
Subject: [Buildroot] [PATCH] Added the empty package
In-Reply-To: <CAAfyv35D5smQx4TXHgSgBTJA18Dg69g5c2tucR5AuAiOr19FBA@mail.gmail.com>
References: <1334047948-7325-1-git-send-email-spdawson@gmail.com>
 <CAAfyv35D5smQx4TXHgSgBTJA18Dg69g5c2tucR5AuAiOr19FBA@mail.gmail.com>
Message-ID: <20120410111247.13c692ca@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 10 Apr 2012 11:06:57 +0200,
Belisko Marek <marek.belisko@gmail.com> a ?crit :

> > +define EMPTY_INSTALL_TARGET_CMDS
> > + ? ? ? $(INSTALL) -D $(@D)/empty $(TARGET_DIR)/usr/bin
> You need to specify name also for target directory so then:
>    +       $(INSTALL) -D $(@D)/empty $(TARGET_DIR)/usr/bin/empty
> 
> > + ? ? ? -$(STRIPCMP) $(STRIP_STRIP_UNNEEDED)
> > $(TARGET_DIR)/usr/bin/empty +endef

No need to call $(STRIPCMP), this is done automatically by Buildroot.

> > +$(eval $(call GENTARGETS,package,empty))

The GENTARGETS arguments are useless.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
