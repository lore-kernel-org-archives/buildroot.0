From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Fri, 07 Mar 2014 07:03:46 +0100
Subject: [Buildroot] [v2,
	5/7] mesa3d: modularize and bump to version 10.0.3
References: <BLU0-SMTP47875A4E6642624302CE843D9AA0@phx.gbl>
 <5318B183.60005@savoirfairelinux.com>
 <4homuaxdgh.ln2@ID-313208.user.individual.net>
 <20140306224559.080a6fb3@skate>
Message-ID: <134ouaxlpp.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140306224559.080a6fb3 at skate: 

> So you will resubmit a new version?

Hi,

yes, but I need several days for testing the several combinations of 
Config.in-options. During yesterdays testing some questions came up:

Is it correct that buildroot lacks llvm support?
If true, I have to remove some radeon-related options Spenser added:
http://www.linuxfromscratch.org/blfs/view/svn/x/mesalib.html

Also I could not find libclc/OpenCL as buildroot package:
http://cgit.freedesktop.org/mesa/mesa/commit/?
id=a64d3dd1358fe0f69ebbf10da35c9ebd672e6f9d

The current mesa3d.mk in buildroot only builds the swrast driver, my personal 
need is to extend the package to compile the i965 drm driver so I will 
concentrate on this. It does not need the dependencies I mentioned above.

Regards, Bernd
