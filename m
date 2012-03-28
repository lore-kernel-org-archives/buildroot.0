From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Mar 2012 09:55:32 +0200
Subject: [Buildroot] [PATCH 2/2] microperl: install host-microperl in
 $(HOST_DIR)/opt/perl
In-Reply-To: <87fwctb4gn.fsf@macbook.be.48ers.dk>
References: <cover.1332831974.git.thomas.petazzoni@free-electrons.com>
 <cover.1332831974.git.thomas.petazzoni@free-electrons.com>
 <cb1e211a5de6c88c39cd9890dbf823c0ff1766c3.1332831974.git.thomas.petazzoni@free-electrons.com>
 <87fwctb4gn.fsf@macbook.be.48ers.dk>
Message-ID: <20120328095532.71abc612@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Le Wed, 28 Mar 2012 08:54:32 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Thanks, but I have fixed it a bit differently instead:
> 
> commit d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
> Author: Peter Korsgaard <jacmet@sunsite.dk>
> Date:   Tue Mar 27 17:11:36 2012 +0200

Thanks, yes. As discussed on IRC, I haven't tested your change, but I
agree on the principle.

However, I am worried by the case reported by Will Newton in:

From: Will Newton <will.newton@gmail.com>
To: buildroot at busybox.net
Subject: [Buildroot] Host libxml-parser-perl build issue
Date: Mon, 26 Mar 2012 17:35:29 +0100

In his case, the microperl for the target was not selected, so the
host-microperl was not built, and still he was having issues.
Apparently, the problem is that host-libxml-parser-perl didn't pick up
the libexpat from the $(HOST_DIR). Normally, we build all binaries with
a rpath set to $(HOST_DIR)/usr/lib, but in the specific case of Perl
modules that use a native library such as libexpat, I am not sure how
we are supposed to tell Perl to build such modules with an rpath set.
The current workaround of Will is to pass the LD_LIBRARY_PATH
environment variable in TARGET_CONFIGURE_OPTS and TARGET_MAKE_ENV, but
I don't think this would work for all packages (I remember libtool
being confused by a LD_LIBRARY_PATH being set).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
