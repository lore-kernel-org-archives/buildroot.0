From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Sep 2017 23:13:14 +0200
Subject: [Buildroot] [PATCH] dbus: add upstream patch to fix startup
	hang with with expat >= 2.2.1
In-Reply-To: <20170804165832.6869-1-m.hoffmann@cartelsol.com> (Marcus
 Hoffmann's message of "Fri, 4 Aug 2017 18:58:32 +0200")
References: <20170804165832.6869-1-m.hoffmann@cartelsol.com>
Message-ID: <87r2vkluhh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcus" == Marcus Hoffmann <m.hoffmann@cartelsol.com> writes:

 > After c0ad6ded018ffbc33f7f5 expat: security bump to version 2.2.1
 > the system can hang on startup under certain circumstances.

 > This happens when:
 >   * we use systemd as init system
 >   * the random nonblocking pool takes a while to initialize
 >     * this apparently doesn't happen on qemu, so this would not have
 >       been caught by the runtime testing infrastructure
 >     * it also doesn't seem to happen when network booting

 > For a more detailed description of the bug see here:
 > https://bugs.freedesktop.org/show_bug.cgi?id=101858

 > The patch should be in next dbus version 1.10.24

 > Set DBUS_AUTORECONF = YES because configure.ac is changed.

 > Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
 > ---
 > I think this should also go into the stable 2017.02.x and 2017.05.x branches as
 > they received the expat bump but won't be receiving the fix in the next dbus 
 > version.

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
