From: MikeW <mw_phil@yahoo.co.uk>
Date: Wed, 15 Nov 2006 14:47:23 +0000 (UTC)
Subject: [Buildroot] C++ cross compiler
References: <22099.82.171.61.116.1163581168.squirrel@webmail.aerende.com>
Message-ID: <loom.20061115T152329-249@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 <nina.holly@...> writes:

> 
> Hi,
>     Is it possible to generate a C++ (g++) cross compiler
> for ARM usng buildroot?  I have been able to generate
> a GCC cross compiler for ARM using buildroot.
> 
> Thanks for any pointers.
> 
> Nina
> 
This is in make menuconfig: Toolchain options: Build/install
c++ compiler and libstdc++

Also, if you get the problem raised here:
http://bugs.uclibc.org/view.php?id=904

applying the patch in the first Note solves the problem.
http://gcc.gnu.org/bugzilla/attachment.cgi?id=6132

Method: save the text of the patch from the link, as something like
libstdc++-3.4.0-uclibc.patch and then copy the file to toolchain/gcc/<version>/

You will need to repatch & rebuild the toolchain ... make dirclean first.

Regards,
MikeW
