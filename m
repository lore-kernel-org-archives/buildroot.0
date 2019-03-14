From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 14:49:07 +0100
Subject: [Buildroot] [PATCH v2 02/13] qt5: Convert to generic target
 install command
In-Reply-To: <269608ba-7e70-ca69-b0c8-52fb70dfae26@andin.de>
References: <20190314094024.1961-1-anaumann@ultratronik.de>
 <20190314094024.1961-3-anaumann@ultratronik.de>
 <20190314111311.48cda006@windsurf>
 <580bc2fc-615a-f200-0428-1096d2dcdf63@mind.be>
 <20190314120610.4ee82dd9@windsurf>
 <b04bf76c-a3c4-1601-10c0-78ad61dffdc7@mind.be>
 <269608ba-7e70-ca69-b0c8-52fb70dfae26@andin.de>
Message-ID: <20190314144907.22c81f6f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 14 Mar 2019 14:35:39 +0100
Andreas Naumann <dev@andin.de> wrote:

> Ok, I oversaw this because I was focused on ppsh, where it is much less
> of a problem.

Indeed.

> After my original post, I tried very hard to tweak qt.conf to help us
> here without the need for patching the generated Makefiles. First it
> looked promising but unfortunately it seem that it's not possible to
> install into a temporary sysroot because it automoatically is used to
> pull -I includes from.

Yeah, I also tried quite hard to make the installation with
INSTALL_ROOT work properly, but couldn't find a good solution.

> > So my point is: using this pattern for a few packages is a good step
> >  in that direction, because it teaches us something about the 
> > implications.  
> 
> My personal impression is, that it might be less "huge" after having 
> converted to per-package staging.

The thing is that per-package directories is going to remain optional
for a bit of time. It is a fairly radical change, probably going to
break a bunch of things. So we'll have to live with the two
possibilities (per-package disabled, per-package enabled) for at least
a few release I believe.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
