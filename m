From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 22 Apr 2008 11:56:01 +1000
Subject: [Buildroot] Improper device nodes
	created	insideproject_build_arm/uclibc/root/dev/
In-Reply-To: <5BF78BCE8D9BF14A83F836BD9E3916BA0DDC58@blrms.slti.sanyo.co.in>
References: <16803332.post@talk.nabble.com>
	<20080421140757.GC21702@cloud.net.au>
	<16819059.post@talk.nabble.com>
	<20080422005042.GA19794@cloud.net.au>
	<5BF78BCE8D9BF14A83F836BD9E3916BA0DDC58@blrms.slti.sanyo.co.in>
Message-ID: <20080422015601.GA20995@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Apr 22, 2008 at 07:28:49AM +0530, Gururaja Hebbar K R wrote:
> > The build process is not intended to create proper device nodes on
> desk (non-root user can't do that)
> i have logged into console with su root. i am using root shell for this
> 
> root at guru_vlinux:/opt/buildroot_plain# whoami
> root

It doesn't matter, buildroot will use fakeroot anyway. It's not a good
idea to do development as the root user.

Also, some of the target methods don't create the device entries in the
project_build_$arch/$project/root directory at all - they are added to
the image by the generator tool without ever being on disk.

> >Finally you could use something other than NFS root, if you don't need
> to write back to it. Perhaps have your boot loader load a ramdisk via
> tftp.
> yes i tried this and this is working fine. But i am doing a development
> project and i need to update the root all the time. so i use NFS boot.

Although your changes will be lost when you rebuild the project anyway?
The project_build_$arch/$project/root is temporary.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
