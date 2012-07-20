From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 20:06:17 +0200
Subject: [Buildroot] [PATCH] lua: ensure that host-lua does not depend
 on host-readline and host-ncurses
In-Reply-To: <1342788156-17040-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1342788156-17040-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20120720200617.2b92d9cf@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 20 Jul 2012 14:42:36 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> Commit ad6af5819f88bac9ca7f50e565c4fc68d3e408cc removed the
> HOST_LUA_DEPENDENCIES assignement to the empty variable, so from that
> commit, the dependencies of host-lua are automatically computed from
> the dependencies of lua. Since lua can depend on readline and ncurses,
> it means that host-lua can depend on host-readline and host-ncurses,
> and the host-readline package does not exist in Buildroot. Since there
> is no reason to build host-lua with readline/ncurses support, just
> re-add the HOST_LUA_DEPENDENCIES variable.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Francois Perrad <fperrad@gmail.com>

Applied, as well as two other fixes to make lua build with gcc 4.6, and
to make host-lua install properly when it is the first host package to
be built.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
