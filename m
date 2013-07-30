From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jul 2013 11:19:15 +0200
Subject: [Buildroot] Libraries built with buildroot can only be used by
 buildroot itself.
In-Reply-To: <20130730085749.GA12392@zuhnb712.ap.bm.net>
References: <20130730044000.GA24161@zuhnb712.ap.bm.net>
 <CAAXf6LUnzaaHCE+9DiybobpZqUgCmHFEt12a3c=5B5NTP5zsNg@mail.gmail.com>
 <20130730085749.GA12392@zuhnb712.ap.bm.net>
Message-ID: <20130730111915.2d2f00d9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Tue, 30 Jul 2013 16:57:49 +0800, Woody Wu wrote:

> > So the behavior you are seeing is expected. You should always use the
> > toolchain through output/host/usr/bin/.
> 
> Okay, Thomas.  But I found fully copy of output/host/usr/bin (just in
> another directory) also does not work.  Is this also expected behavior?

Copying output/host/usr/bin alone doesn't make any sense because
you're moving the compiler and other tools but not the sysroot. Copying
the entire output/host directory elsewhere would make more sense, but
unfortunately, Buildroot doesn't support a relocatable sysroot for now.
So you should *not* move this directory.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
