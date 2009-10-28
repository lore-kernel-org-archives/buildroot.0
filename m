From: Roman Chertov <rchertov@cs.ucsb.edu>
Date: Tue, 27 Oct 2009 21:25:41 -0700
Subject: [Buildroot] busybox question
In-Reply-To: <20091027211438.BEC2B7773A@busybox.osuosl.org>
References: <20091027211438.BEC2B7773A@busybox.osuosl.org>
Message-ID: <4AE7C7C5.8090001@cs.ucsb.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have an ARM920T board that I am trying to get going with buildroot and
uClibc.  I managed to compile the kernel, and it boots up to the point
where the login must happen.  Nothing happens at that point.  However,
the machine runs as I can ping it.  I have tried to init=/bin/sh
init=/bin/ethtool, but I did not get any output to indicate that
something started.

I have the following question.  I can build the default image on the
board (Debian 2.4, glibc) and mount the buildroot root fs over NFS.
However, if I try to execute any program, I get the following errors:

root at ts7000:bin# ./busybox
-bash: ./busybox: No such file or directory

I would expect that at least the program would start and then an error
would occur due to the fact that uClibc is not present.  I am correct in
assuming this?  I am trying to debug if I screwed the cross compiling
(although Linux kernel boots), or if there is a problem with the init
process.


I would appreciate some insight into this issue.

Thanks,

Roman
