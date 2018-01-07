From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 23:52:38 +0100
Subject: [Buildroot] [PATCH] ncurses: Install 256 color terminfo files
In-Reply-To: <20171220020624.22252-1-tpiepho@impinj.com>
References: <20171220020624.22252-1-tpiepho@impinj.com>
Message-ID: <20180107235238.14263617@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Dec 2017 18:06:24 -0800, Trent Piepho wrote:
> There are three 256 color terminfo files that buildroot only installs if
> ncurses is configured with wide character support, which also enables
> ext-color.  There is a fourth 256 color terminfo file and does not depend
> on wchar suport and is always installed.
> 
> This changes that to always install all four 256 color terminfo files.
> 
> When ncurses has ext-colors enabled,it allows 256 fg and bg colors at the
> same time.  Without ext-colors, it is still possible to use the 256 color
> terminfo files and one can get a combination of fb and bg colors that
> equals up to 256, e.g. 256 fg colors on one background or 16 fg and 16 bg
> colors.
> 
> In short, the 256 color files work fine without wchar or ext-color support
> and support more colors than the normal xterm, etc.  terminfo files.  It's
> common today for the default terminal to use xterm-256color and it's nice
> if thinks like vim and top work out of the box.
> 
> Signed-off-by: Trent Piepho <tpiepho@impinj.com>
> ---
>  package/ncurses/ncurses.mk | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
