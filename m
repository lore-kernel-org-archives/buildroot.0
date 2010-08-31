From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 31 Aug 2010 20:54:04 +0000 (UTC)
Subject: [Buildroot] Debug symbols in staging, but stripped on target?
Message-ID: <i5jq5c$s5d$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I need to do some debugging of a package's application, so I need
debugging symbols enabled for that package.

The only option I can find that appears related is

  BR2_ENABLE_DEBUG

There are a couple issues with that:

 1) It enables debug symbols for all packages, and I only want them
    for one.

 2) It apprently disables stripping of target executables.  I don't
    have room (nor any use) for debugging symbols on the target -- I
    only need them on the development host (e.g. in the staging
    directory).

It also appears to force BR2_PACKAGE_GDB_SERVER.  What if I'm using an
external toolchain that provides my gdb server?

Is there any way to enable debugging symbols for just one package?

Can the target binaries still be stripped?

-- 
Grant Edwards               grant.b.edwards        Yow! I didn't order any
                                  at               WOO-WOO ... Maybe a YUBBA
                              gmail.com            ... But no WOO-WOO!
