From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 15:36:16 +0200
Subject: [Buildroot] [PATCH v2] gnupg: Package only needs ncurses with
 readline
In-Reply-To: <20181003002517.27064-1-tpiepho@impinj.com>
References: <20181003002517.27064-1-tpiepho@impinj.com>
Message-ID: <20181004153616.7ed8d046@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 3 Oct 2018 00:25:48 +0000, Trent Piepho wrote:
> This package only needs ncurses when readline support is enabled, as it's the
> autoconf macro file for readline (used by autoconf to create the gnupg configure
> script) that checks for and pulls in ncurses.
> 
> Since readline already depends on ncurses, gnupg need only depend on
> readline (when enabled).
> 
> The host package always forces readline support off, so the host-ncurses
> dependency can be removed entirely.
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
>  package/gnupg/Config.in | 1 -
>  package/gnupg/gnupg.mk  | 4 ++--
>  2 files changed, 2 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
