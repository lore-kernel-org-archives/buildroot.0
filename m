From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Jan 2017 14:32:26 +0100
Subject: [Buildroot] dhcpcd build fails
In-Reply-To: <CAA2DH4t=asj1xnvHChcXQXNU4Q0jkCHuwQ+pYDA-8mtpgKBnnw@mail.gmail.com>
 (Prasant J.'s message of "Wed, 4 Jan 2017 12:25:58 +0530")
References: <CAA2DH4t=asj1xnvHChcXQXNU4Q0jkCHuwQ+pYDA-8mtpgKBnnw@mail.gmail.com>
Message-ID: <87r34j2bo5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Prasant" == Prasant J <pj0585@gmail.com> writes:

 > Hi,
 > I'm trying to build my rootfs from buildroot for my Analog Devices board.
 > "dhcpcd" package fails to build. Below are the details:



 >>>> dhcpcd 6.6.7 Building
 > PATH="/WORK/build-repo/sc58x-dev/buildroot/output/host/bin:/WORK/build-repo/sc58x-dev/buildroot/output/host/sbin:/WORK/build-repo/sc58x-dev/buildroot/output/host/usr/bin:/WORK/build-repo/sc58x-dev/buildroot/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/analog/cces-linux-add-in/1.1.0/ARM/arm-linux-gnueabi/bin:/opt/analog/cces/2.3.0/ARM/arm-none-eabi/bin"
 > /usr/bin/make -j1 -C
 > /WORK/build-repo/sc58x-dev/buildroot/output/build/dhcpcd-6.6.7 all
 > make[1]: Entering directory
 > `/WORK/build-repo/sc58x-dev/buildroot/output/build/dhcpcd-6.6.7'
 > /WORK/build-repo/sc58x-dev/buildroot/output/host/usr/bin/arm-linux-gnueabi-gcc
 >  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os
 > -std=c99  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -D_BSD_SOURCE -D_XOPEN_SOURCE=700
 > -D_DEFAULT_SOURCE -DINET -DINET6 -I./crypt -c dhcpcd.c -o dhcpcd.o
 > In file included from
 > /WORK/build-repo/sc58x-dev/buildroot/output/host/usr/arm-buildroot-linux-gnueabihf/sysroot/usr/include/sys/socket.h:38:0,
 >                  from dhcpcd.c:33:
 > ipv6.h:154:41: error: invalid application of ?sizeof? to incomplete
 > type ?struct in6_pktinfo?

It sounds like your toolchain doesn't have IPv6 support. Please provide
more details. What Buildroot version are you using and what is your
.config?

-- 
Bye, Peter Korsgaard
