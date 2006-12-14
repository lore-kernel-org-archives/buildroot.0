From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 14 Dec 2006 10:27:44 +0100
Subject: [Buildroot] issues with svn version
References: <Pine.LNX.4.64.0612131637012.24865@q7.q7.com>
	<Pine.LNX.4.64.0612131649100.24865@q7.q7.com>
Message-ID: <025d01c71f71$660704d0$634665d5@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> following up to myself.  i changed the destination to be the staging area, 
> but it still failed.  looking closer i see that the issue was the compound 
> command to check for the existence of asm-generic is the last part of the 
> if clause so it becomes the return value and since asm-generic doesn't 
> exist for me, that is false.  for now i have hacked a - on the front of 
> the if, but that's probably not the best solution, but things are building 
> much better now.  not finished yet, but things are flying by...
> 

Might not be related, but I have noticed that 
a lot of the makefile fragments in the packages/* directories
does not set CFLAGS to include the kernel headers, and
this cause rebuilds to fail, typically when trying to include 
asm-generic.h

Best Regards
Ulf Samuelsson
