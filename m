From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 22 Apr 2008 19:59:09 +1000
Subject: [Buildroot] Improper device nodes created
	inside	project_build_arm/uclibc/root/dev/
In-Reply-To: <8763uaqs3b.fsf@macbook.be.48ers.dk>
References: <16803332.post@talk.nabble.com>
	<20080421140757.GC21702@cloud.net.au>
	<16819059.post@talk.nabble.com>
	<20080422005042.GA19794@cloud.net.au>
	<8763uaqs3b.fsf@macbook.be.48ers.dk>
Message-ID: <20080422095909.GA31643@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 22, 2008 at 09:14:16AM +0200, Peter Korsgaard wrote:
> >>>>> "Hamish" == Hamish Moffatt <hamish@cloud.net.au> writes:
> 
> Hi,
> 
>  >> If this is what it is suppose to do, then how to mount the same for NFS
>  >> boot. 
> 
>  Hamish> You could mount a generated image file somewhere via the loopback
>  Hamish> device. Then you would have the devices that are in the image. ext2
>  Hamish> would be a good choice. Do you want to write back to the root or not?
> 
>  Hamish> Alternatively you could add a new target output format for NFS root.
> 
> We already have that - tarball creation.

Good point. So, Hebbar: just use the tarball target, and extract it somewhere
(as root) for use by your target system. Don't mount the
buildroot/project_build.../.../root directory directly as it won't
contain the real devices.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
