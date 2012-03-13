From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Mar 2012 00:25:23 +0100
Subject: [Buildroot] [PATCH 4/5] Microblaze: build kernel with device
	tree
In-Reply-To: <20120312231055.5ba3a3be@skate>
References: <4F5CD7C9.40505@relinux.de> <20120312231055.5ba3a3be@skate>
Message-ID: <201203140025.24202.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 12 March 2012 23:10:55 Thomas Petazzoni wrote:
> > Device Tree and SimpleImage will be handled in buildroot in the
> > future. Until then, this patch is needed.
> > 
> > Signed-off-by: Stephan Hoffmann <sho@relinux.de>
> 
> I am not yet familiar with how the device tree blob is generated, but I
> don't like the fact that this patch is Microblaze specific. Other
> architectures such as ARM or PowerPC have device tree support, and I
> think the build procedure of the device tree blob is the same
> regardless of the architecture.

 I fully agree that we should have DTS support in buildroot.  However:

- Stephan doesn't see how to do it, and

- for microblaze, the kernel source provides slightly different targets 
than for arm/powerpc.

 If I understand correctly, for microblaze, you *have* to use a 
simpleImage, which is a uImage with a DTB subimage.  In other words,
unless we have some kind of DTS support in buildroot, we can't support
microblaze.

 Since nobody seems to be stepping up to add generic DTS support, that
means microblaze is blocked.  That, I think, is stupid.  If we have
working patches for microblaze now, why not accept them?  We can
always add DTS support later and refactor the microblaze-specific stuff
away.  In fact, this microblaze-specific stuff makes it easier to add
generic DTS support, because you already get a defconfig that uses it
and that you can use for testing.


 That said, your other comments are still valid and this patch is not yet
ready for inclusion.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
