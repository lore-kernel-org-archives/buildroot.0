From: MikeW <mw_phil@yahoo.co.uk>
Date: Thu, 16 Nov 2006 09:24:55 +0000 (UTC)
Subject: [Buildroot] C++ cross compiler]
References: <29305.82.171.61.116.1163624395.squirrel@webmail.aerende.com>
Message-ID: <loom.20061116T100028-172@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 <nina.holly@...> writes:

> 
> Phillipe,
>     If by staging_dir, you mean where the cross compiler
> executables go, there is no arm-linux-uclibc-g++
> in the bin directory where the arm-linux-uclibc-gcc
> executable is.
> 
> 1.  I am using gcc-3.4.2, binutils-2.16.1 and a uClibc
>     snapshot from around Aug. 1, 2006.
> 
> 2.  In toolchain/gcc there is a gcc-uclibc-3.x.mk file.
>     Is this the .mk file you were referring to?
> 
> Nina

No, there should literally be a directory called
"buildroot/build_arm_nofpu/staging_dir/bin/"
(the "build_arm_nofpu" bit depends on your build settings)
which gets created as part of your buildroot make.

So under "buildroot" (the buildroot installation dir)
you should get "build_arm_nofpu" or something like it.

Under "build_arm_nofpu" you will get a subdirectory for each
package, plus one called "root" and one called "staging_dir".

The "root" one is where your root filesystem is built, and
the "staging_dir" one is where 
a) the built toolchain is placed
b) files built from packages are created prior to installation in "root"

Among the directories in my "staging_dir" containing toolchain files
are "arm-elf-linux", "arm-linux" and "bin" which contain links to
compilers (including c++) or the executables themselves.

What is the directory path in your system to what you call
"where the cross compiler executables go" ?

Regards,
Mike
