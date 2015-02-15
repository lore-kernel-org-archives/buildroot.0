From: Steve Kenton <skenton@ou.edu>
Date: Sun, 15 Feb 2015 16:04:54 -0600
Subject: [Buildroot] [PATCH v4] Allow a single DHCP configuration via
 the system configuration submenu
In-Reply-To: <87y4nzx7bh.fsf@dell.be.48ers.dk>
References: <98184085.31058823.1422895105455.JavaMail.root@openwide.fr>
 <54DF7567.7090308@ou.edu> <87y4nzx7bh.fsf@dell.be.48ers.dk>
Message-ID: <54E11806.2060109@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2/15/2015 2:12 PM, Peter Korsgaard wrote:
>>>>>> "Steve" == Steve Kenton<skenton@ou.edu>  writes:
>   >>>
>   >>>>  +config BR2_SIMPLE_DHCP
>   >>>
>   >>>  We're not completely consist with this, but the new system options
>   >>>  are
>   >>>  called BR2_SYSTEM_*, so I've renamed to the option.
>   >>>
>   >  On this topic, what about the following idea?
>
>   >  If the interface name is blank do not perform DHCP as currently
>   >  If the interface name is "*" then run something like this script
>   >  to automatically find and use the first network interface for DHCP
>   >  I'd like to be able to use the same BR config on slightly different
>   >  boards that may sometimes have different network interface names/orders
>   >  The kernel handles that OK with modules so maybe buildroot could to?
>
> So those boards have network interfaces not using eth%d names? That
> sounds pretty uncommon to me. Another approach would simply be add an
> init script to rename those to eth0 with nameif.
Yes, two I have to test right now are an Asrock and an ECS mini-ITX and 
on both
the kernel built with buildroot 2015.02-rc1 calls the network interface 
"sit0"

Given that the name(s) are available why not just use it/them instead of 
requiring the
entering of a configuration value for an interface name to use  
BR2_SIMPLE_DHCP?

Steve
>
