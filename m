From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Oct 2009 20:36:06 +0100
Subject: [Buildroot] busybox question
In-Reply-To: <4AE870AC.6070601@cs.ucsb.edu> (Roman Chertov's message of "Wed\,
	28 Oct 2009 09\:26\:20 -0700")
References: <20091027211438.BEC2B7773A@busybox.osuosl.org>
	<4AE7C7C5.8090001@cs.ucsb.edu> <877hufddx5.fsf@macbook.be.48ers.dk>
	<4AE870AC.6070601@cs.ucsb.edu>
Message-ID: <873a53cnvd.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Roman" == Roman Chertov <rchertov@cs.ucsb.edu> writes:

 Roman> Peter Korsgaard wrote:
 >>>>>>> "Roman" == Roman Chertov <rchertov@cs.ucsb.edu> writes:
 >> 
 Roman> Hello,
 Roman> I have an ARM920T board that I am trying to get going with buildroot and
 Roman> uClibc.  I managed to compile the kernel, and it boots up to the point
 Roman> where the login must happen.  Nothing happens at that point.  However,
 Roman> the machine runs as I can ping it.  I have tried to init=/bin/sh
 Roman> init=/bin/ethtool, but I did not get any output to indicate that
 Roman> something started.
 >> 
 >> And you have set console= to something sensible? What is the last output
 >> you get from the kernel?

 Roman> console=ttyAM0,115200 ip=dhcp noinitrd root=/dev/nfs init=/sbin/init
 Roman> nfsroot=192.168.0.1:/proj/tools/buildroot-2009.08/project_build_arm/uclibc/root/

That's your problem then - The files under project_build_arm/uclibc/root
don't have the right permissions and device nodes are not
created. Instead select tarball under target filesystem options, and
unpack it as root on your NFS server.

-- 
Bye, Peter Korsgaard
