From: Crane, Matthew <mcrane03@harris.com>
Date: Tue, 25 Sep 2007 10:37:49 -0400
Subject: [Buildroot] Linux kernel 2.4
In-Reply-To: <34563.69.65.92.71.1190725767.squirrel@webmail.learningsoft.net>
References: <34563.69.65.92.71.1190725767.squirrel@webmail.learningsoft.net>
Message-ID: <E496871456016F4CA8959BE4105D2A890E8D06@troe2k1.cs.myharris.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi, 

I haven't tried it, but I expect you need to modify
target/linux/Config.in and target/linux/Makefile.in to add a option to
build and patch your specific kernel.    I used my own 2.6 kernel and it
seemed to pick it up correctly for the kernel headers, but I used an
existing version.  If the kernel headers don't make properly then you
might need to modify the config and makefile in
toolchain/kernel-headers.

But I think it's fair to say if you have a 2.4 configuartion of sources
that you know builds and works outside of buildroot, you can modify
buildroot to use them.

Matt
 

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of Sunil Gupta
Sent: Tuesday, September 25, 2007 9:09 AM
To: buildroot at uclibc.org
Subject: [Buildroot] Linux kernel 2.4

My project uses a 2.4 kernel (2.4.21, specifically). For many reasons,
we are tied to this version. However, I see that the current buildroot
only supports 2.6. Is is possible to add 2.4 support back in?

-- sg

_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
