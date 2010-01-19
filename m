From: Jens <irimi@gmx.de>
Date: Tue, 19 Jan 2010 17:32:47 +0100
Subject: [Buildroot] toolchain problem:wrong path in libSDL.la
Message-ID: <4B55DEAF.40808@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm using recent version 2009.11 and I've added SDL package to my 
configuration.

My br installation is at /mnt/ext3data/buildroot/

but br creates a wrong path of libdir in libSDL.la
(/mnt/ext3data/buildroot/output/build/SDL-1.2.14/build/libSDL.la
resp. /mnt/ext3data/buildroot/output/build/staging_dir/usr/lib/libSDL.la):
--- cut ---
# Libraries that this one depends upon.
dependency_libs=' 
-L/mnt/ext3data/buildroot/output/build/staging_dir/usr/lib 
/mnt/ext3data/buildroot/output/build/staging_dir/usr/lib/libiconv.la 
-L/mnt/ext3data/buildroot/output/build/staging_dir/lib -lm 
/mnt/ext3data/buildroot/output/build/staging_dir/usr/lib/libts.la -ldl 
-lpthread'
# Directory that this library needs to be installed in:
libdir='/mnt/ext3data/buildroot/output/build/staging_dir/usr/mnt/ext3data/buildroot/output/build/staging_dir/usr/lib'
--- cut ---

Of course the correct path at my machine is 
'/mnt/ext3data/buildroot/output/build/staging_dir/usr/lib'
That makes it impossible to link applications that require the SDL lib, 
it leads to an linker error:  i.e. 'could not find SDL lib'

I checked older br versions , but same problem. Also an update (I 
switched to newer versions in br scripts) of SDL lib didn't help it nor 
update of libtool (as far as I understood that creates the *.la files !?).

BR,
Jens
