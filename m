From: MikeW <mw_phil@yahoo.co.uk>
Date: Thu, 16 Nov 2006 16:08:42 +0000 (UTC)
Subject: [Buildroot] C++ cross compiler]
References: <29305.82.171.61.116.1163624395.squirrel@webmail.aerende.com>
	<loom.20061116T100028-172@post.gmane.org>
	<13882.82.171.61.116.1163689078.squirrel@webmail.aerende.com>
Message-ID: <loom.20061116T165730-420@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 <nina.holly@...> writes:

> 
> 
> > No, there should literally be a directory called
> > "buildroot/build_arm_nofpu/staging_dir/bin/"
> > (the "build_arm_nofpu" bit depends on your build settings)
> > which gets created as part of your buildroot make.
> > What is the directory path in your system to what you call
> > "where the cross compiler executables go" ?
> 
> That is /usr/local/arm/release-3.4.2.  In this directory there are
> the directories:
> 
> arm-linux-uclibc
> bin
> bin-ccache
> include
> info
> lib
> libexec
> man
> usr
> 
> arm-linux-uclibc has the directories:
> 
> bin
> target_utils
> 
> which just have executables such as ar, as, gcc, ld, gdbserver, etc.
> 
> /usr/local/arm/release-3.4.2/bin has:
> 
> arm-linux-gcc-3.4.2-?arm-linux-uclibc-gcc-3.4.2
> 
> etc.
> 
> but no arm-linux-g++
> 
> Nina
> 
You should *not* set your staging_dir to be /usr/local ... !

The reason you do not see a C++ compiler there is because you
can only install programs there as root.
The other compiler files you see there must be left from some
earlier installation, or must have permissions that allow overwriting.

But before you change the permissions, read further !

For one thing, the staging_dir is used during the build process
of buildroot to store not only the toolchain files, but acts
as the holding area for the files immediately prior to constructing
the root filesystem. As such it will contain other files which are
used in the build process but will not be present on the root filesystem,
such as source headers and static libraries.

SO the staging_dir setting in the menuconfig should NOT be set
to /usr/local...anything, it should preferably be left as
the default value, which causes it to be in the place I said before.

If you want to use the toolchain you have built with buildroot,
follow the instructions in the buildroot documents and use the
compilers within staging_dir/bin.

You can always make some symbolic links to the tools for convenience.

Hope that gets you going again.

Regards,

MikeW
