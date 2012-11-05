From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 05 Nov 2012 13:38:58 +0100
Subject: [Buildroot] Fwd: Re:  mesa3d:  "ImportError: No module named
In-Reply-To: <5097B350.8020701@free-electrons.com>
References: <5097B350.8020701@free-electrons.com>
Message-ID: <5097B362.4010908@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net




-------- Message original --------
Sujet: Re: [Buildroot] mesa3d:  "ImportError: No module named
Date : Mon, 05 Nov 2012 13:38:40 +0100
De : Maxime Ripard <maxime.ripard@free-electrons.com>
Pour : Vellemans, Noel <Noel.Vellemans@visionBMS.com>

Hi,

(Please keep the mailing list in CC)

Le 05/11/2012 11:20, Vellemans, Noel a ?crit :
> Hi Maxime,
> 
> 
> I'm still trying to dig a little deeper into the problem.
> 
> Is this reproducible? 
> Yes, if you delete de mesa3d output directory completely you also run
> into the same problem (so there is no need to have a CLEAN output
> directory)
> 
> 
> Some info:
> TARGET : ARM - imx537
> 
> HOST: Ubuntu 64 bit 
> HOST-Python: 2.6.6 (see HOST-python_version.txt)
> 
>>> Also, do you know what python interpreter it is actually using? 
>>> The one found in your distribution or host-python built by Buildroot?
> 
> At this time  (as test) I did rename the host-python [ sudo mv
> /usr/bin/python /usr/bin/_python ] 
> and buildroot bails out with you must install python on your
> build-machine.
> So I "guess" (which is not my best) buildroot is using the host-python
> (2.6.6). 

Ok, so basically, you will probably need to do a few things here to get
that fixed I guess:
  - In libxml2, remove the --without-python option if python emulator is
selected
  - Make the mesa3d package depends on host-python and host-libxml2 (I
guess?) (basically, just add these two packages to MESA3D_DEPENDENCIES)
  - Make mesa3d use the host-python package we just built instead of the
one found on our distribution

I guess something like that would work. But what are the others think on
making mesa depends on host-python? It looks a bit oe-ish, but I don't
quite see a better way.

Maxime
-- 
Maxime Ripard, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
