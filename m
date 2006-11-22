From: Philippe Ney <philippe.ney@pardes.ws>
Date: Wed, 22 Nov 2006 08:53:53 +0100
Subject: [Buildroot] patch: target/cpio
In-Reply-To: <20061121095514.GK3065@priv.blacknet.de>
References: <20061120154423.GG3065@priv.blacknet.de>
	<20061120180143.456f1bd0.philippe.ney@pardes.ws>
	<20061121095514.GK3065@priv.blacknet.de>
Message-ID: <20061122085353.a872873b.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > > this patch adds a simple cpio target, to be used with an initramfs
>  
> > In my application, as I also use cpio on the target, then I added a cpio
> > package that provide target and host cpio.
> > I use it to update the initramfs and have a simple dynamic RIM system w/o
> > use of cramfs/unionfs.
> > 
> > If this could be useful, I will make a patch.
> 
> Shure, please provide a patch.
> 
> BTW: I wonder why there are hundrets^Wdozens of buildroot forkes, all
>      with more up to date/additional packages and noone ever seams to
>      provide patches on their own. 
>      Do they think that buildroot is to unmodular that additional stuff
>      would make it to bloated for the rest? Or is the addition just a
>      hack, they always wanted to clean up, just never found the time to
>      do so? Or do they simply not care?
>      - Just wondering. 

I use a old version of buildroot that I modified/simplified for my own
needs. I don't know at this time if my additional stuff works with the
current one.

It's mainly hack that often don't build automatically but need manual
action. Which is sufficient for my own needs but I think it's not for
beeing added in the buildroot trunk. It is also only tested on an i386
target which seems not sufficient for me to be added in buildroot, isn't
it ?

For example I worked on porting perl but I didn't succeeded on having it
working with dynamic loading (for modules). I have a working static perl
(with static modules built-in) but it need to have a special config file
that contains the static built-in modules whereas this should be more
flexible. The Crypt:SSLay module need the path to OpenSSL and I give it
manually, et coetera.

Philippe
