From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Sep 2013 18:21:01 +0200
Subject: [Buildroot] Is GPLv2 the right license for Buildroot?
In-Reply-To: <20130914221613.GA3444@free.fr>
References: <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr>
Message-ID: <20130916182101.3844a686@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 15 Sep 2013 00:16:13 +0200, Yann E. MORIN wrote:

> Since Buildroot's license is the GPLv2, BR2_EXTERNAL is covered by the
> GPLv2.

Probably going to make waves, but I'm wondering if the GPLv2 is the
right license for Buildroot. I believe it is not very easy to
understand how the terms of the GPL apply to something such as a build
system, and I am not sure that the GPL copyleft requirements are really
benefiting to Buildroot in any way. I am pretty sure that the vast
majority of companies using Buildroot are not really realizing it's
licensed under the GPL and therefore are not complying with the
Buildroot license terms (while they probably do realize that the
kernel, U-Boot, etc. are under the GPL and comply with their terms). Of
course that's not an argument to change the license, but I believe it
also highlights how hard it is to understand the GPL requirements on
the Buildroot case.

So, I believe that we should either:

 (1) Clarify and document how we believe the GPL terms apply to
     Buildroot (this would probably be a long discussion process, in
     which the SFLC should probably participate). When I see the
     discussions around BR2_EXTERNAL where the package .mk files and
     Config.in files may be seen as derivative work, but not the root
     filesystem overlay, or that package .mk files for GPL packages
     should be under the GPL, but not necessarily .mk files for non-GPL
     packages, I believe it is way too complicated for users. To me, it
     seems like complying with the Buildroot license is more
     complicated than using Buildroot itself, which is kind of silly.

 (2) Change the Buildroot license to a non-copyleft license. Of course,
     that requires contacting a lot of people, but maybe not so much:
     over the last 3-4 years, the vast majority of the Buildroot code
     base has been rewritten, and many of the people having worked on
     that are still around today.

Thoughts?

What other build systems are doing:

 * Yocto/OpenEmbeded: bitbake is under GPLv2, the rest (package
   recipes) is under MIT.

 * PTXdist is under GPLv2, but has a small license clarification "Note:
   PTXdist is a build system which generates a distribution for
   embedded systems. This license does only cover the build system
   itself and doesn't affect the license of managed software in any
   way, even if it might be distributed together with the build
   system." I believe it doesn't really clarify completely how the GPL
   applies to a build system.

 * OpenBricks is under GPLv2.

 * OpenWRT is under GPLv2, since it is originally a fork of Buildroot.

 * LTIB is under GPLv2.

Any other build system around worth having a look at?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
