From: Danny Gale <Daniel.Gale@coloradoengineeringinc.com>
Date: Fri, 31 Jan 2014 10:05:59 -0700
Subject: [Buildroot] Error building with external toolchain
Message-ID: <52EBD7F7.8010504@coloradoengineeringinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm having some trouble getting buildroot to import my external 
toolchain properly. The output is:

 >>> toolchain undefined Extracting
 >>> toolchain undefined Patching
 >>> toolchain-external undefined Extracting
 >>> toolchain-external undefined Patching
 >>> toolchain-external undefined Configuring
 >>> toolchain-external undefined Building
 >>> toolchain-external undefined Installing to staging directory
 >>> toolchain-external undefined Copying external toolchain libraries 
to target...
make[1]: *** 
[/home/dgale/Documents/system_build/bld/start.buildroot-2013.11/output/build/toolchain-external-undefined/.stamp_staging_installed] 
Error 255
make[1]: Leaving directory 
`/home/dgale/Documents/system_build/bld/start.buildroot-2013.11'
make: *** [.buildroot] Error 2

I have been unable to get make to output any useful error messages here, 
even using the -d flag.

This error shows release 2013.11, but there are similar problems with 
the latest git snapshot.

What is the problem here? Has anybody run into this before? I should 
mention that the toolchain being imported is 64-bit. This is NOT an 
issue using an equivalent toolchain at 32-bits. The 64-bit toolchain, 
however, doesn't support multilib.

What will be required to get buildroot working with the 64-bit toolchain?

Thanks,
Danny
