From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Jul 2012 20:59:39 +0200
Subject: [Buildroot] syslinux fails to build
In-Reply-To: <20120704131306.46f9e3bd@skate>
References: <CAJkQPOmE5CcY=sAp-+TmuYEov_QTSe1-qsqj8fRjtOQNvDoWnA@mail.gmail.com>
 <20120704131306.46f9e3bd@skate>
Message-ID: <4FF5E41B.2070105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/04/12 13:13, Thomas Petazzoni wrote:
> Le Wed, 4 Jul 2012 11:53:30 +0100,
> Aras Vaichas<aras.vaichas@gmail.com>  a ?crit :
>
> > make[3]: Entering directory
> > `/home/aras/buildroot/buildroot/output/build/syslinux-4.04/diag/geodsp'
> > ./mk-lba-img lba.img
> > ./mk-lba-img: 1: ./mk-lba-img: Syntax error: "(" unexpected
> > make[3]: *** [lba.img] Error 2
> > make[3]: Leaving directory
> > `/home/aras/buildroot/buildroot/output/build/syslinux-4.04/diag/geodsp'
> > make[2]: *** [all] Error 2
> > make[2]: Leaving directory
> > `/home/aras/buildroot/buildroot/output/build/syslinux-4.04/diag'
> > make[1]: *** [all] Error 2
> > make[1]: Leaving directory
> > `/home/aras/buildroot/buildroot/output/build/syslinux-4.04'
> > make: *** [/home/aras/buildroot/buildroot/output/build/syslinux-4.04/.stamp_built]
> > Error 2
> >
> > Is this a known problem?
>
> Not to my knowledge, but I don't use syslinux myself. The bump to 4.04
> was done by Arnout Vandecappelle in January this year, so maybe he will
> comment on this.

   mk-lba-img is a host binary.  However, the tar file already contains a 64-bit binary,
so it will not be rebuilt...  And I guess you try to build it on a 32-bit PC.  I only tried
it on a 64-bit PC myself.

  syslinux is full of this kind of crap :-(

  You can try running a 'make -C output/build/syslinux-4.04 clean', but if I remember
correctly that failed for other reasons.

  So the problem is fixed with syslinux-4.05?  That's nice!  Please do submit a patch.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
