From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Sep 2013 06:44:05 +0200
Subject: [Buildroot] Is GPLv2 the right license for Buildroot?
In-Reply-To: <87vc20fp2g.fsf@dell.be.48ers.dk>
References: <20130911091700.0b24df41@skate>
 <OFA3C6DE52.DF6BBCA7-ON86257BE3.0054A3F9-86257BE3.00577394@rockwellcollins.com>
 <20130911172709.GB3410@free.fr>
 <CAAXf6LVD590fVudge3Fk+2B8pSzvUEV2GQLTcbz=VpOB2HCmtQ@mail.gmail.com>
 <20130912202157.536e5904@skate>
 <F9C551623D2CBB4C9488801D14F864C639AC8DAF@ex-mb1.corp.adtran.com>
 <20130912203359.7e650ebe@skate> <52323A54.7020808@mind.be>
 <20130912221256.GE3362@free.fr> <523388B6.7090305@mind.be>
 <20130914221613.GA3444@free.fr> <20130916182101.3844a686@skate>
 <87vc20fp2g.fsf@dell.be.48ers.dk>
Message-ID: <20130917064405.6300d72b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Mon, 16 Sep 2013 23:12:55 +0200, Peter Korsgaard wrote:

> We have already tried to clarify it in the user manual:
> 
> http://buildroot.net/downloads/manual/manual.html#_complying_with_the_buildroot_license
> 
> E.G. Buildroot should be handled just like how you handle the Linux
> kernel and Busybox.

I think it's not really as clear as some other explanations that Yann
gave. Especially that:

 *) Distributing Buildroot as part of the "scripts needed for
 compilation" requirement is not due to the fact that Buildroot is
 under the GPL, but because most likely the embedded Linux system
 produced does contain GPL packages.

 *) That an alternate possibilities to distributing Buildroot is to
 provide a large shell script that runs the same commands that
 Buildroot is doing, but that this is probably much more complicated
 than providing the Buildroot source code.

 *) That package recipes for non-GPL packages can be removed from the
 Buildroot tree before it is distributed (especially the package
 recipes for proprietary applications)

 *) That the .config should be included as well, but that references to
 non-GPL applications can be removed from the .config if necessary.

>  Thomas>  (2) Change the Buildroot license to a non-copyleft license.
>  Thomas> Of course, that requires contacting a lot of people, but
>  Thomas> maybe not so much: over the last 3-4 years, the vast
>  Thomas> majority of the Buildroot code base has been rewritten, and
>  Thomas> many of the people having worked on that are still around
>  Thomas> today.
> 
> It's imho still too many people to be realistic:
> 
> git shortlog -s --since='3 years' | wc -l
> 230

It's not so many people in fact :)


> 
> 
>  Thomas> What other build systems are doing:
> 
>  Thomas>  * Yocto/OpenEmbeded: bitbake is under GPLv2, the rest
>  Thomas> (package recipes) is under MIT.
> 
>  Thomas>  * PTXdist is under GPLv2, but has a small license
>  Thomas> clarification "Note: PTXdist is a build system which
>  Thomas> generates a distribution for embedded systems. This license
>  Thomas> does only cover the build system itself and doesn't affect
>  Thomas> the license of managed software in any way, even if it might
>  Thomas> be distributed together with the build system." I believe it
>  Thomas> doesn't really clarify completely how the GPL applies to a
>  Thomas> build system.
> 
>  Thomas>  * OpenBricks is under GPLv2.
> 
>  Thomas>  * OpenWRT is under GPLv2, since it is originally a fork of
>  Thomas> Buildroot.
> 
>  Thomas>  * LTIB is under GPLv2.
> 
> So they are basically all in the same boat as us.

Yes, but I do believe that no company is actually complying to the GPL
requirements by providing the build system source code. So yes, they
are under GPLv2, now whether that makes sense or not is a different
question :-)

But ok, my question "Is GPLv2 the right license for Buildroot" was
mainly a rhetoric question, I am really not that much interested in
working on a license change process, but I continue to think that
additional clarifications on how the license requirements apply to
Buildroot would be nice.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
