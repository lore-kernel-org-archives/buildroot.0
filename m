From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Sep 2017 23:27:42 +0200
Subject: [Buildroot] [PATCH] gdb: force to use ncurses and not termcap
	for host-gdb
In-Reply-To: <20170729200626.2403-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 29 Jul 2017 22:06:26 +0200")
References: <20170729200626.2403-1-thomas.petazzoni@free-electrons.com>
Message-ID: <87h8wim9wx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Both our target and host gdb depend on ncurses (host-ncurses for
 > host-gdb, of course). However, while for the target we passs
 > --with-curses, we are not doing this for the host variant. Due to
 > this, host-gdb default to using the termcap library: if such a library
 > is available on the build system, it will be used instead of the
 > host-ncurses we have built. This causes the host gdb binary to depend
 > on a library that we do not provide in $(HOST_DIR), breaking the
 > principle of a standalone SDK (which should only depend on the C
 > library).

 > To solve this, we simply pass --with-curses in HOST_GDB_CONF_OPTS,
 > which forces host-gdb to use the host-ncurses library.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
