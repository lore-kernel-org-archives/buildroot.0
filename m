From: Philippe Ney <philippe.ney@pardes.ws>
Date: Thu, 16 Nov 2006 10:44:41 +0100
Subject: [Buildroot] C++ cross compiler]
In-Reply-To: <29305.82.171.61.116.1163624395.squirrel@webmail.aerende.com>
References: <29305.82.171.61.116.1163624395.squirrel@webmail.aerende.com>
Message-ID: <20061116104441.17382885.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Phillipe,
>     If by staging_dir, you mean where the cross compiler
> executables go, there is no arm-linux-uclibc-g++
> in the bin directory where the arm-linux-uclibc-gcc
> executable is.

Yes, where the cross exec goes. This is defined by buildroot in fact.
I just tried to generate a cross-compiler with the same settings as yours
and it worked. Maybe you have to restart from scratch, try others gcc,
binutils, uClibc versions.

As said Mike

  No, there should literally be a directory called
  "buildroot/build_arm_nofpu/staging_dir/bin/"
  (the "build_arm_nofpu" bit depends on your build settings)
  which gets created as part of your buildroot make.

You also could have a look at the gumstix project. They use gcc-3.4.5 and
I guess they generate a C++ cross-compiler.


> 1.  I am using gcc-3.4.2, binutils-2.16.1 and a uClibc
>     snapshot from around Aug. 1, 2006.
> 
> 2.  In toolchain/gcc there is a gcc-uclibc-3.x.mk file.
>     Is this the .mk file you were referring to?

Yes

Philippe
