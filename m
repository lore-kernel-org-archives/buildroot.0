From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Sep 2011 11:41:54 +0200
Subject: [Buildroot] Questions related to "Incorrect selection of the C
 library" error
In-Reply-To: <CAOPDcRwGMUaA0SuGc09XiQoweF9aMwbSeYKqoD4wj_NwY+i9Rw@mail.gmail.com>
References: <CAOPDcRz+PpksWoMJBh5mzk8+E7YcdKj=httB1nxajGanmKTNow@mail.gmail.com>
 <20110914115217.5a64e8d0@skate> <201109141820.00295.arnout@mind.be>
 <CAOPDcRwGMUaA0SuGc09XiQoweF9aMwbSeYKqoD4wj_NwY+i9Rw@mail.gmail.com>
Message-ID: <20110915114154.5a738a61@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 15 Sep 2011 11:20:44 +0200,
stl <st.lambert02@gmail.com> a ?crit :

> Effectively, my port of uClibc is not installed in the same directory
> than my toolchain.
> Because, the version of the toolchain I use is compiled with newlib
> as C library, instead of uClibc.
> 
> And my problem with the ld-uclibc.so.* comes from I have not done
> anything yet that deals with
> dynamic linker in my port of uClibc.
> 
> It seems that some work remains to be done...

With a bit tuning, Buildroot can work with a toolchain that does not
support shared libraries (so you can postpone the work on the dynamic
linker later on). But it needs to be a real toolchain, not a bare-metal
compiler on one side and the C library on the other side.

So before diving into the dynamic linking stuff and shared libraries, I
would recommend you to work on getting a proper toolchain built, either
with Buildroot or Crosstool-NG (I would suggest the latter). If you
have a working binutils/gcc/uClibc port, integrating the support for
your arch in Crosstool-NG should not be very complicated.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
