From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 12:02:19 +0100
Subject: [Buildroot] [v2,
 5/7] mesa3d: modularize and bump to version 10.0.3
In-Reply-To: <134ouaxlpp.ln2@ID-313208.user.individual.net>
References: <BLU0-SMTP47875A4E6642624302CE843D9AA0@phx.gbl>
 <5318B183.60005@savoirfairelinux.com>
 <4homuaxdgh.ln2@ID-313208.user.individual.net>
 <20140306224559.080a6fb3@skate>
 <134ouaxlpp.ln2@ID-313208.user.individual.net>
Message-ID: <20140307120219.246db8ce@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 07 Mar 2014 07:03:46 +0100, Bernd Kuhls wrote:

> yes, but I need several days for testing the several combinations of 
> Config.in-options. During yesterdays testing some questions came up:
> 
> Is it correct that buildroot lacks llvm support?

Indeed, we don't have LLVM support.

> If true, I have to remove some radeon-related options Spenser added:
> http://www.linuxfromscratch.org/blfs/view/svn/x/mesalib.html

Probably yes, I am clearly not very knowledgeable about Mesa
dependencies.

> Also I could not find libclc/OpenCL as buildroot package:
> http://cgit.freedesktop.org/mesa/mesa/commit/?
> id=a64d3dd1358fe0f69ebbf10da35c9ebd672e6f9d

This is only when --enable-opencl is used, no?

> The current mesa3d.mk in buildroot only builds the swrast driver, my personal 
> need is to extend the package to compile the i965 drm driver so I will 
> concentrate on this. It does not need the dependencies I mentioned above.

Yes, that's fine. As long as we make progress by bumping mesa, allow to
build it outside of X11, there is no need to support each and every
possible combinations from the beginning. The package can be
progressively improved.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
