From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Fri, 2 Nov 2012 17:06:41 +0000
Subject: [Buildroot] BR2_PREFER_STATIC_LIB and LDFLAGS+= -static
Message-ID: <F9C551623D2CBB4C9488801D14F864C6287244@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Near line 302 in package/Makefile.in was added TARGET_LDFLAGS += -static
to satisfy a request I made a while back.  This really needs to be
--static so that it filters down through autoconf the correct way.  If
-static is passed in LDFLAGS, autoconf regularly mishandles this by
setting a variable then never reconfiguring the package's make system
to build static.  However, the --static to ld is the same as -static,
but autoconf does not compare for --static, thus, packages get built as
desired.

Can someone change this in package/Makefile.in or should I submit a
dinky patch for this?

Thanks,
Andy
