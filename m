From: Steve Calfee <nospamcalfee@yahoo.com>
Date: Wed, 25 Mar 2009 11:46:42 -0700 (PDT)
Subject: [Buildroot] Buildroot presentation at Embedded Linux Conference
	2009
In-Reply-To: <20090325174654.76057513@surf>
Message-ID: <80864.26513.qm@web58205.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


--- On Wed, 3/25/09, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> 
> A first draft of the slides is available at :
> 
> 
> http://free-electrons.com/~thomas/buildroot-conf/buildroot.pdf
> 

Very nice, and when all done, make sure you get it put on the buildroot.org website as documentation.

It seems to me that buildroot is a union of multiple builds.

1) Gcc and uclibc
2) Busybox
3) root file system and source packages
4) Linux kernel
5) bootstrap -u-boot, grub etc.

1 and 2 are configurable, but I don't think most people do much customization. They are reasonably stable packages and seem to integrate well.

3 is now under control with Peter fixing the packages and for the first time really reliably building with at least the defaults.

4 and 5 are configurable, but not really within the buildroot menu/make system. I think a slide or two describing how you, in your demo customize and build the kernel and bootstrap would be great. Also how you knit together the root file system and the bootstrap and kernel via a multiple flash filesystem or single disk image. I think many people just copy the files together into some final nfs or flash form, but I don't think it is well described or documented.

What I think would be great for people learning and evaluating buildroot is a documented procedure to do a minimal, default build that would generate an x86 image (using grub?) that could be run tested via qemu or vmware. This would also allow people to work on their application while the real embedded hardware was being "brought up". It would also be a more automated way to test new buildroot releases.

My $.02

Regards, Steve


      
