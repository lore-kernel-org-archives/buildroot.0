From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Aug 2017 23:37:24 +0200
Subject: [Buildroot] [PATCH] gdb: force to use ncurses and not termcap
 for host-gdb
In-Reply-To: <20170729200626.2403-1-thomas.petazzoni@free-electrons.com>
References: <20170729200626.2403-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170801233724.6026d204@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Jul 2017 22:06:26 +0200, Thomas Petazzoni wrote:
> Both our target and host gdb depend on ncurses (host-ncurses for
> host-gdb, of course). However, while for the target we passs
> --with-curses, we are not doing this for the host variant. Due to
> this, host-gdb default to using the termcap library: if such a library
> is available on the build system, it will be used instead of the
> host-ncurses we have built. This causes the host gdb binary to depend
> on a library that we do not provide in $(HOST_DIR), breaking the
> principle of a standalone SDK (which should only depend on the C
> library).
> 
> To solve this, we simply pass --with-curses in HOST_GDB_CONF_OPTS,
> which forces host-gdb to use the host-ncurses library.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/gdb/gdb.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
