From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Oct 2009 11:13:26 +0100
Subject: [Buildroot] busybox question
In-Reply-To: <4AE7C7C5.8090001@cs.ucsb.edu> (Roman Chertov's message of "Tue\,
	27 Oct 2009 21\:25\:41 -0700")
References: <20091027211438.BEC2B7773A@busybox.osuosl.org>
	<4AE7C7C5.8090001@cs.ucsb.edu>
Message-ID: <877hufddx5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Roman" == Roman Chertov <rchertov@cs.ucsb.edu> writes:

 Roman> Hello,
 Roman> I have an ARM920T board that I am trying to get going with buildroot and
 Roman> uClibc.  I managed to compile the kernel, and it boots up to the point
 Roman> where the login must happen.  Nothing happens at that point.  However,
 Roman> the machine runs as I can ping it.  I have tried to init=/bin/sh
 Roman> init=/bin/ethtool, but I did not get any output to indicate that
 Roman> something started.

And you have set console= to something sensible? What is the last output
you get from the kernel?

Do you have software floating point support enabled in buildroot?
(toolchain->Use software floating point by default)

 Roman> I have the following question.  I can build the default image on the
 Roman> board (Debian 2.4, glibc) and mount the buildroot root fs over NFS.
 Roman> However, if I try to execute any program, I get the following errors:

 Roman> root at ts7000:bin# ./busybox
 Roman> -bash: ./busybox: No such file or directory

You'll probably have to chroot into the nfs dir to get the dynamic
linker to work.


-- 
Bye, Peter Korsgaard
