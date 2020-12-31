From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 17:31:56 +0100
Subject: [Buildroot] [PATCH v1] package/iwd: fix static linking
 (readline needs ncurses)
In-Reply-To: <20201227170832.23903-1-ps.report@gmx.net>
References: <20201227170832.23903-1-ps.report@gmx.net>
Message-ID: <20201231173156.6f01202a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Dec 2020 18:08:32 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Fixes:
> 
>   - http://autobuild.buildroot.net/results/26c7536b95cc475bc10d4283e93ea9ccd6ced665
> 
>   .../arm-buildroot-linux-musleabihf/bin/ld: .../arm-buildroot-linux-musleabihf/sysroot/usr/lib/libreadline.a(display.o): in function `_rl_move_cursor_relative':
>   display.c:(.text+0x1164): undefined reference to `tputs'
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...tatic-linking-readline-needs-ncurses.patch | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 package/iwd/0001-iwctl-fix-static-linking-readline-needs-ncurses.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
