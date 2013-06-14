From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jun 2013 22:22:54 +0200
Subject: [Buildroot] [RFC] ti-gfx: add new package
In-Reply-To: <CALo-6+jEOu+5pTr2oizokQexOdm1EimxYhM-Q1sHEnJ_oBFMog@mail.gmail.com>
References: <CALo-6+j77P2RsdYRO9BR04rUX-j0HmxzXtBuHzo_UQ1wDjXbHQ@mail.gmail.com>
 <1370636307-23089-1-git-send-email-spenser@gillilanding.com>
 <CALo-6+ihs6caa98RCvZmZKZ5pUsfXjXPPBJn_zG4J6eBBpsuAw@mail.gmail.com>
 <CAEBucnC-HdSyDttBo4te_=eOR259ebSAwWQuE_W3zcyLVjwSQA@mail.gmail.com>
 <EE4E4767751A8B40949306E403F4DDD802EEB1D7@sv03ultra002.ultratronik.de>
 <CALo-6+jEOu+5pTr2oizokQexOdm1EimxYhM-Q1sHEnJ_oBFMog@mail.gmail.com>
Message-ID: <20130614222254.56e49fcb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Charles Krinke,

On Thu, 13 Jun 2013 07:11:18 -0700, Charles Krinke wrote:

> On Spenser's patch, my comments to the RFC remain the same and those
> are 1) Graphics_SDK should not be a part of buildroot and 2) A kernel
> build should be independent of the root file system.

Sorry, but you're wrong on both points I believe:

 (1) The whole point of the ti-gfx package that Spenser is doing, and
     the whole point of the GSoC project Spenser is working on is
     *precisely* to create Buildroot packages for many binary blobs /
     special kernel modules that are needed to enable OpenGL, EGL and
     other similar technologies on ARM SoCs. So, we definitely want
     such packages to automatically download, extract, configure, build
     and install whatever is necessary to enable the usage of such
     technologies, and this, without requiring special intervention
     from the Buildroot user. Just like all the other packages we have.

     The fact that the Graphics_SDK thing is pretty huge to download is
     just due to the poor TI practices in terms of packaging and
     releases, and there's not much we can do about it. And anyway,
     Buildroot users willing to enable complex technologies such as
     OpenGL are most likely ready to download fairly large packages.

 (2) The Graphics_SDK contains some kernel modules. They have to be
     built against a Linux kernel tree that has been configured and
     built. The only way to do that in Buildroot is to depend on the
     'linux' package, which triggers a build of the Linux kernel. This
     is completely normal, and I really don't see how it could be done
     otherwise. That's already what we do for a number of other
     packages that contain kernel modules, such as linux-fusion,
     lttng-modules or rtai.

     So the build of the root filesystem (which contains kernel
     modules) cannot be fully independent from the build of the kernel.

It would be interesting if you could expand on why (1) or (2) are
causing problems for you, in the light of the above explanations.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
