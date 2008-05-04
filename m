From: Ragnar Ouchterlony <ragnar+buildroot@lysator.liu.se>
Date: Sun, 04 May 2008 20:39:20 +0200
Subject: [Buildroot] libstdc++.la and it's libdir
Message-ID: <1209926360.20914.11.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm doing a personal project where I am building a new rootdisk for my
DNS-323 (an ARM machine).

I use buildroot from 20080430 (currently) with gcc-4.2.3. Although I
have a few patches to make things work, I don't have anything that
touches gcc.

Now over to my problem:

The libdir variable in libstdc++.la (residing
in /path/to/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/lib/libstdc++.la
file is wrong. It says:

libdir='/usr/arm-linux-uclibc/lib'

where I would have expected it to say:

libdir='?/path/to/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/lib'

This causes problems when using libtool. I.e, I compile a c++ libary (in
this case libsigc++-2.0) and then that library gets in it's .la file a
dependency for ?/usr/arm-linux-uclibc/lib/libstdc++.la and when I in
turn compile a program that uses libsigc++ libtool fails because it
can't find /usr/arm-linux-uclibc/lib/libstdc++.la.

If I manually edit libstdc++.la for it to point to the correct place,
things work as expected when I recompile my dependent libraries.

Have anyone else had this problem and have any idea where I should look
for a more permanent fix instead of doing things manually. I know I can
probably use sed somewhere to change the offending line, but I would
really like to know why it sets it wrong the first time around.

Any help is appreciated.

/Ragnar Ouchterlony
