From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Mon, 16 Feb 2015 09:46:28 +0100 (CET)
Subject: [Buildroot] [PATCH v4] Allow a single DHCP configuration
	via	the system configuration submenu
In-Reply-To: <87y4nzx7bh.fsf@dell.be.48ers.dk>
Message-ID: <81393811.181114.1424076388497.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


----- Mail original -----
> >>>>> "Steve" == Steve Kenton <skenton@ou.edu> writes:
> 
>  >>> 
>  >>>> +config BR2_SIMPLE_DHCP
>  >>> 
>  >>> We're not completely consist with this, but the new system
>  >>> options
>  >>> are
>  >>> called BR2_SYSTEM_*, so I've renamed to the option.
>  >>> 
>  > On this topic, what about the following idea?
> 
>  > If the interface name is blank do not perform DHCP as currently
>  > If the interface name is "*" then run something like this script
>  > to automatically find and use the first network interface for DHCP
>  > I'd like to be able to use the same BR config on slightly
>  > different
>  > boards that may sometimes have different network interface
>  > names/orders
>  > The kernel handles that OK with modules so maybe buildroot could
>  > to?
> 
> So those boards have network interfaces not using eth%d names? That
> sounds pretty uncommon to me. Another approach would simply be add an
> init script to rename those to eth0 with nameif.
> 

there is the (still pretty uncommon) case of networkd that does interface
naming based on the physical layout and not the module loading order

interfaces are never named eth* in that case.



Regards

Jeremy Rosen
