From: Fathi Boudra <fboudra@gmail.com>
Date: Fri, 15 Feb 2008 10:38:44 +0100
Subject: [Buildroot] binutils ftbfs on x86_amd64 host
In-Reply-To: <6a2e33620802140655u4988c66du32168b2c956c0dbb@mail.gmail.com>
References: <6a2e33620802131426g4ef22451k8f0a9e80e7ad0ba8@mail.gmail.com>
	<20080213234203.GC30407@cloud.net.au>
	<6a2e33620802140014x1acfccf6n2eb27d93669f061@mail.gmail.com>
	<20080214124011.GA9252@cloud.net.au>
	<6a2e33620802140655u4988c66du32168b2c956c0dbb@mail.gmail.com>
Message-ID: <6a2e33620802150138l6405c84ck63ddee56d16c1581@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

binutils 2.18 ftbfs is a known issue.
1) you must have texinfo installed
2) makeinfo parameters changed

 It's fixed in binutils snapshot.

btw, I can reproduce the 2nd ftbfs and is related to uClibc thread library
implementation:
libpthread/linuxthreads/sysdeps/pthread/errno-loc.c:23:27: error:
sysdep-cancel.h: No such file or directory

This is reproducible for powerpc target and NPTL support option.
Switching to another thread library implementation workarounds the issue.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080215/0a3b706d/attachment.htm 
