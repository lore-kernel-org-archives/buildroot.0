From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Sep 2013 23:12:55 +0200
Subject: [Buildroot] Is GPLv2 the right license for Buildroot?
In-Reply-To: <20130916182101.3844a686@skate> (Thomas Petazzoni's message of
 "Mon, 16 Sep 2013 18:21:01 +0200")
References: <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr> <20130916182101.3844a686@skate>
Message-ID: <87vc20fp2g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> So, I believe that we should either:

 Thomas>  (1) Clarify and document how we believe the GPL terms apply to
 Thomas>      Buildroot (this would probably be a long discussion process, in
 Thomas>      which the SFLC should probably participate). When I see the
 Thomas>      discussions around BR2_EXTERNAL where the package .mk files and
 Thomas>      Config.in files may be seen as derivative work, but not the root
 Thomas>      filesystem overlay, or that package .mk files for GPL packages
 Thomas>      should be under the GPL, but not necessarily .mk files for non-GPL
 Thomas>      packages, I believe it is way too complicated for users. To me, it
 Thomas>      seems like complying with the Buildroot license is more
 Thomas>      complicated than using Buildroot itself, which is kind of silly.

We have already tried to clarify it in the user manual:

http://buildroot.net/downloads/manual/manual.html#_complying_with_the_buildroot_license

E.G. Buildroot should be handled just like how you handle the Linux
kernel and Busybox.


 Thomas>  (2) Change the Buildroot license to a non-copyleft license. Of course,
 Thomas>      that requires contacting a lot of people, but maybe not so much:
 Thomas>      over the last 3-4 years, the vast majority of the Buildroot code
 Thomas>      base has been rewritten, and many of the people having worked on
 Thomas>      that are still around today.

It's imho still too many people to be realistic:

git shortlog -s --since='3 years' | wc -l
230


 Thomas> What other build systems are doing:

 Thomas>  * Yocto/OpenEmbeded: bitbake is under GPLv2, the rest (package
 Thomas>    recipes) is under MIT.

 Thomas>  * PTXdist is under GPLv2, but has a small license clarification "Note:
 Thomas>    PTXdist is a build system which generates a distribution for
 Thomas>    embedded systems. This license does only cover the build system
 Thomas>    itself and doesn't affect the license of managed software in any
 Thomas>    way, even if it might be distributed together with the build
 Thomas>    system." I believe it doesn't really clarify completely how the GPL
 Thomas>    applies to a build system.

 Thomas>  * OpenBricks is under GPLv2.

 Thomas>  * OpenWRT is under GPLv2, since it is originally a fork of Buildroot.

 Thomas>  * LTIB is under GPLv2.

So they are basically all in the same boat as us.

-- 
Bye, Peter Korsgaard
