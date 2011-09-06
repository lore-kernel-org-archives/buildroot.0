From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Sep 2011 18:16:29 +0200
Subject: [Buildroot] [PATCH 1/2] grub: build for host
In-Reply-To: <20110905085731.60859d50@skate>
References: <20110821165154.25078.86917.stgit@darius-desktop>
 <20110905085731.60859d50@skate>
Message-ID: <201109061816.30410.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Monday 05 September 2011 08:57:31, Thomas Petazzoni wrote:
> Hello,
> 
> Le Sun, 21 Aug 2011 19:51:54 +0300,
> 
> Darius Augulis <augulis.darius@gmail.com> a ?crit :
> > +GRUB_DEPENDENCIES = host-grub
> 
> This raises a question similar to the one I asked for syslinux, but in
> the opposite side. I don't think host-grub is a build dependency of the
> target grub (i.e the target grub *can* be compiled without host-grub
> being compiled), even though host-grub might be useful when grub is
> enabled.

 In the case of grub, the dependency is in fact the inverse: you need staging-
grub to have properly cross-compiled stageXXX files.  (Well, actually, that 
didn't work for me at all so I just installed grub-legacy on my build machine; 
but I hope that is fixed with Darius' patches.)

> 
> What should we do in this case? At least we should have a consistent
> decision between syslinux (patches by Arnout) and grub (patches by
> Darius).

 Actually it's a bit similar to host-gdb: it's not used by buildroot itself, 
it's supposed to be used by the developer.  So it probably should be a 
configuration option to build host-bootloader-installers.

> I think we should create in the documentation a "Package specific
> comments" part, in which we could detail some subtleties of various
> packages.

 Yep.  After the asciidoc conversion :-)


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
