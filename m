From: Olivier Perron <olivier.perron12@gmail.com>
Date: Tue, 1 Dec 2009 14:10:00 +0100
Subject: [Buildroot] Trying to build in an usual place: /opt instead of /
Message-ID: <5cd84ac80912010510k26f4af64x6234af2e35adbde1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I'm trying to build a basic buildroot system that would go in /opt on
the target. I'm doing this just because there is already another linux
system running from / and I want to add my own "enhanced" one that has
to be fully independent from the original one. Hence everything has to
go in another folder: /opt for instance.

So far, I've tweaked some config files and some .mk files to reach my
goal. I have managed to get uclibc installed in /opt/lib and some
userland binaries in /opt/usr/bin.
But, yes there is a but... all my dynamically linked binaries try to
find the dynamic linker in /lib (e.g. /lib/ld-uClibc.so.0) where as
the linker is /opt/lib/ld-uClibc.so.
I had a look at the generated libc and ld-uClibc and they all have
/opt/lib/ld-uClibc.so hardcoded in them as I was expecting. So I'm
quite not so sure where to look now to resolve that issue.
It looks like I have configured uclibc correctly but the linked
binaries are still wrong.
Maybe I also have to adapt the configuration for gcc or binutils ? I
had a look at the .mk files but cannot find easily what to change...
So I'd be very grateful if someone could point me to the right direction !

Regards
Olivier
