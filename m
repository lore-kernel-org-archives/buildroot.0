From: Nuno da Costa Ferro <nferro@nfive.com>
Date: Wed, 4 Jul 2007 16:40:55 +0100
Subject: [Buildroot] X11R7 packages available
References: <f0528b5b0707040129j262b9e24i774fd06d8d579a2a@mail.gmail.com>
	<1c2701c7be1c$3af895c0$2311a8c0@OneWorld.local>
	<1c5a01c7be32$3adaf9a0$2311a8c0@OneWorld.local>
	<f0528b5b0707040832j7ae99465hd987b10fc6c85476@mail.gmail.com>
Message-ID: <1c8c01c7be51$b5aef900$2311a8c0@OneWorld.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nferro at n5nferro-linux:/build/firmware/buildroot$ make xlib_libX11
make: *** No rule to make target `xlib_libX11'.  Stop.

Anyway I'm going to try everything from scratch with the new packages. I 
remember that the autotools patch gave an error/warning that I ignored, I'll 
mail you when I reproduce it again.


Kind regards,

Nuno da Costa Ferro
---------------------------
Number Five Software, S.A.
Development & IT Management
Email: nferro at nfive.com
DDI: +351 261 860 472


----- Original Message ----- 
From: Julien Letessier
To: Nuno da Costa Ferro
Cc: Buildroot mailing list
Sent: Wednesday, July 04, 2007 4:32 PM
Subject: Re: [Buildroot] X11R7 packages available


Did you apply the autotools4 patch (first mail in this thread, also at 
http://bazaar.mezis.net/buildroot_autotools4.patch.bz2)?
All my X11R7 packages use it.

Else it's hard to diagnose...
You can try to "make xlib_libX11" manually, for instance. If this doesn't 
work you have a make or makefile problem. Are you using GNU make?

If it works its a different problem. If you have applied my show-var patch 
( http://bazaar.mezis.net/buildroot_show-var.patch) you can "make show-var 
VARNAME=TARGETS" and check if the X packages are in the TARGETS. 
