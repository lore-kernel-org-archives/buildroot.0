From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Jul 2011 11:24:06 +0200
Subject: [Buildroot] lame linking issue
In-Reply-To: <4E12D425.1010201@visionsystems.de> (Yegor Yefremov's message of
 "Tue, 05 Jul 2011 11:06:45 +0200")
References: <4E0DD227.6050807@visionsystems.de>
 <87hb71xgt5.fsf@macbook.be.48ers.dk>
 <4E12D425.1010201@visionsystems.de>
Message-ID: <87iprhw05l.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:

Hi,

 Yegor> Could it be due to 64-bit build system?

No - I build on 64bit (Debian) as well.

 Yegor> /bin/sh ../libtool --tag=CC   --mode=link /home/YegorYefremov/projects/versioned/buildroot/output/host/usr/bin/arm-unknown-linux-uclibcgnueabi-gcc  -Wall -pipe -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I/usr/include -I/usr/include/gtk-1.2 -I/usr/include/glib-1.2 -I/usr/lib64/glib/include     -o lame main.o console.o get_audio.o lametime.o parse.o portableio.o timestatus.o brhist.o ../libmp3lame/libmp3lame.la -lm

It's probably the /usr/include  and /usr/lib64 references here that's
causing problems. I wonder where they are coming from though, as I don't
see any glib/gtk references in lame's configure script.

-- 
Bye, Peter Korsgaard
