From: Stephen Thomas <scjthm@live.com>
Date: Mon, 3 Nov 2014 02:03:34 +0000
Subject: [Buildroot] Problem building buildroot toolchain with some
	libraries installed
Message-ID: <SNT146-W9127CC1B7CEAE6DD52A694A8990@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All
I am seeing an error of this type (below) when configuring gcc 4.9.2:Inconsistency detected by ld.so: dl-version.c: 224: _dl_check_map_versions: Assertion `needed != ((void *)0)' failed!
This only appears since I upgraded the gentoo 4.9 compiler to 4.9.2 (from 4.9.1).  I have gcc on gentoo linked in with cloog-0.18.1, yet the buildroot version in the buildroot toolchain is using  cloog-0.18.2. 
My investigation has lead me to believe that the LD_LIBRARY_PATH set in the environment in package/Makefile.in for the host tools is causing the gcc on the host that is being used to compile the gcc for the target is loading this library.
I can work around this issue by using the LB_LIBRARY_PATH antidote, namely an LD_PRELOAD=/usr/lib/libcloog-isl.so and it all works fine. But I still believe that this might be a problem.
Cheers
Stevo

 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141103/478040b4/attachment.html>
