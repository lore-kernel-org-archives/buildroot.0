From: Jason Valenzuela <jvalenzuela@dspfl.com>
Date: Mon, 19 May 2008 14:19:37 -0400
Subject: [Buildroot] User shared libraries
Message-ID: <4831C4B9.9080107@dspfl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've got a question regarding adding shared libraries to the buildroot 
system. This is my first time with the buildroot/uclibc/busybox system, 
so I forgive me if I miss something obvious.

I have the base root file system and toolchain compiled ok. I now wish 
to add a few of my own programs to run on the target system. Currently 
these programs of mine consist of a shared library and a binary that 
utilizes that shared library. By following the docs and looking at some 
of the other .mk files, I think I have the shared library installed ok. 
The .so files are in the correct target 
directory($(TARGET_DIR)/usr/lib). By using the --includedir option to 
the configure script, I *THINK* I got the headers to land in the right 
place also, build_ARCH/staging_dir/usr/include or more specifically 
$(STAGING_DIR)/usr/include.

Now comes that part I'm stuck on, the binary. Its configure script wants 
to see that the library is in fact installed, however it is not 
installed in the toolchain directory, only the headers are. It seems 
like I should install the shared library in both the target file system 
and in the toolchain. Is this correct? Any pointers to some 
docs/examples on how to do this?


Thanks,
Jason Valenzuela
