From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Oct 2009 09:14:31 +0200
Subject: [Buildroot] NFS file system problem
In-Reply-To: <1D6034426110564DA0DEA9EE9793B38357C8B02E91@NBE-MBX01.americas.swk.pri>
	(Carl Heyendal's message of "Fri\, 16 Oct 2009 08\:49\:07 -0400")
References: <1D6034426110564DA0DEA9EE9793B38357C8B02E91@NBE-MBX01.americas.swk.pri>
Message-ID: <87d44luqaw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carl" == Heyendal, Carl <CHeyendal@stanleyworks.com> writes:

 Carl> I can't seem to get Linux to mount an NFS root file system. It
 Carl> doesn't even attempt to try and mount it. It actually is mounting
 Carl> the resident file system which is what I'm trying to bypass. I'm
 Carl> pretty sure the bootargs passed from U-Boot are correct.

 Carl> Here's my output during bootup. Can anyone spot what is wrong?
 

Carl> Kernel command line: console=ttyS0,115200 root=/dev/nfs rw nfsroot=10.10.1.16:/home/heyendal/buildroot/buildroot-2009.08/project_build_arm/ILS_CM/root ip=10.10.1.8:10.10.1.16:10.10.1.1:255.255.252.0:cm_carlh::off

Don't do that. The project_build_arm/<project>/root directory shouldn't
be used directly as the permissions are not set / device nodes not
created (because we want to be able to build without being
root). Instead select tarball under target options and extract that
tarball on your nfsroot as root to get the proper permissions.

-- 
Bye, Peter Korsgaard
