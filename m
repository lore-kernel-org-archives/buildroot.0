From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 17 Jul 2009 23:57:22 +0200
Subject: [Buildroot] 64bit build error Mesa
In-Reply-To: <56852.172.16.221.250.1247695631.squirrel@cvs.xtale.biz>
	(nfrench@xtale.biz's message of "Wed\,
	15 Jul 2009 22\:07\:11 -0000 \(Europe\/London\)")
References: <56852.172.16.221.250.1247695631.squirrel@cvs.xtale.biz>
Message-ID: <87fxcvht19.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "nfrench" == nfrench  <nfrench@xtale.biz> writes:

 nfrench> Have a 64 bit build system and have now added XORG but get
 nfrench> the following /bin/sh: makedepend: command not found
 nfrench> make[4]: *** No rule to make target `depend', needed by
 nfrench> `default'.  Stop.  make[4]: Leaving directory
 nfrench> `/mnt/wd/buildroot-2009.05/build_x86_64/Mesa-7.2/src
 nfrench> /glx/x11'

Mesa needs makedepend installed on the host. Please install it on your
build machine (on Debian it's in xutils-dev the package) and it should
work.

We should probably compile makedepend for the host ourselves or
atleast complain loudly if it isn't installed instead of this error.

-- 
Bye, Peter Korsgaard
