From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Tue, 21 Oct 2014 10:50:01 +0200 (CEST)
Subject: [Buildroot] [PATCH v2] set simple network setup via the system
 configuration submenu
In-Reply-To: <20141021103611.7e43d2b4@free-electrons.com>
Message-ID: <1111084647.26814618.1413881401004.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


----- Mail original -----

[<snip>]

> 
> I certainly don't like to push back stuff, but I'm wondering if this
> isn't too much complexity compared to just having people use an
> overlay
> containing their own /etc/network/interfaces. We will never be able
> to
> handle all the possible cases, with multiple network interfaces, hook
> scripts called before/after bringing up/down interfaces, etc.
> 
> What is the opinion of other Buildroot developers?
> 


just to clarify...

the point of the patch is not to allow all possible configurations that
network/interfaces can handle, but just allow to easily set an IP address
or enable DHCP without having to add an overlay. For anything more
complex an overlay is the way to go.

I originally thought that putting more stuff in would be a good
idea but I have revised my position on that and now I think it
should be limited to the minimal required subset

* static ipv4
* ipv4 dhcp
* networkd support

if ipv6 becomes popular enough it could trivially be added but 
let's keep this for a followup


Regards

J?r?my
