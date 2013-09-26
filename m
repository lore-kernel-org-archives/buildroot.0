From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Thu, 26 Sep 2013 20:34:40 +0000
Subject: [Buildroot] [PATCH] Allow Buildroot to update toolchain
In-Reply-To: <87vc1n49b9.fsf@dell.be.48ers.dk>
References: <F9C551623D2CBB4C9488801D14F864C639AD62E9@ex-mb1.corp.adtran.com>
 <87vc1n49b9.fsf@dell.be.48ers.dk>
Message-ID: <F9C551623D2CBB4C9488801D14F864C639AD653F@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter Korsgaard
> Sent: Thursday, September 26, 2013 3:28 PM
> To: ANDY KENNEDY
> Cc: 'buildroot at busybox.net'
> Subject: Re: [PATCH] Allow Buildroot to update toolchain
> 
> >>>>> "ANDY" == ANDY KENNEDY <ANDY.KENNEDY@adtran.com> writes:
> 
>  ANDY> Sometimes it is useful to self contain a toolchain.  To do this, one
>  ANDY> must somehow build in the extra libraries needed to make the toolchain
>  ANDY> complete.  This patch adjusts Buildroot to, by configuration, modify the
>  ANDY> external toolchain while building additional libraries.
> 
> I'm not sure I understand the use case here. How is it different that
> setting BR2_HOST_DIR to something, do a build and then use the toolchain
> in BR2_HOST_DIR/usr/bin outside buildroot?

Oh, my bad.  I mean for when one uses an external toolchain.  For example:

I build a toolchain using Crosstool-NG.  I have a few libraries in there, but
to fully use this as a cross compiler I need things like ncurses, pcap, lttng,
etc.  In this case, I would either need to have some sort of SYSROOT configured.
It is not always desirable to have those two items disjoined.  So, I dump my
additional libraries into the toolchain.

I've been carrying this patch along for a long time now (3 years +), but I
thought maybe someone else would like the ability to do so as well.

I'm sure I haven't done the description in the Config.in file justice.  I
toyed with the idea of make some comment that shows up if this is selected
to warn of what the person was actually doing, but I thought better of it.

Another concern I have is that, if one builds using an external toolchain and
does a 'make allyesconfig' then this option would also be selected, thereby
polluting their original toolchain.

I dunno, if you don't like this, I'll continue to drag it along outside of
BR.

Andy
