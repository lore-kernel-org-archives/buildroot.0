From: Dan Lyke <danlyke@flutterby.com>
Date: Mon, 3 Aug 2009 13:49:49 -0700
Subject: [Buildroot] Building Linux system - Beginner Q2
In-Reply-To: <BAY136-W9F7845E64DF97AA4705DDCE0F0@phx.gbl>
References: <mailman.16140.1249312217.24852.buildroot@busybox.net>
	<BAY136-W9F7845E64DF97AA4705DDCE0F0@phx.gbl>
Message-ID: <20090803134949.59f5dcc0@danhplaptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 3 Aug 2009 20:36:00 +0100
> I found in the dl the kernel package. Do i have to extract it and
> "make linux26-menuconfig" and then "make" ?? I am asking this because
> oi found an extracted kernel inside toolchain_build_i686 directory.
> thanks

I believe that the one you're looking for to modify is in
project_build_arm/*/linux-* . I find that when I've modified files
in there (it's been several months since I've had to do that), I've
needed to do a

   pushd project_build_arm/*/linux-*
   make clean
   popd
   make

To make sure that the kernel gets rebuilt properly, but there's a good
chance that since I've last played with this the dependency checking
stuff has gotten better.

You shouldn't have to extract any files manually, Buildroot should do
that for you. And if you do a "make menuconfig" at the highest level,
you can then go to "Kernel->Linux Kernel Configuration", that should be
the equivalent of just typing "make linux26-menuconfig" directly.

Dan
