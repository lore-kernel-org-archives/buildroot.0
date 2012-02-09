From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2012 16:11:50 +0100
Subject: [Buildroot] segfault when running a simple c program on env
 build with buildroot
In-Reply-To: <4F33DCBE.7080606@scalemp.com>
References: <4F33DCBE.7080606@scalemp.com>
Message-ID: <20120209161150.36d6c6d6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 09 Feb 2012 16:48:30 +0200,
Eial Czerwacki <eial@scalemp.com> a ?crit :

> sh-4.1# gcc -o a test.c

You're using the native gcc on the target, while Buildroot is mostly
designed for cross-compilation. Our native gcc on the target mechanism
isn't used/tested a lot, so I would really recommend using the
cross-compiler on the build machine to build your applications.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
