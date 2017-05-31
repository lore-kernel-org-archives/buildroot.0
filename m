From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 22:07:12 +0200
Subject: [Buildroot] [PATCH 01/01] sngrep: fix wchar detection.
In-Reply-To: <20170525144749.19333-1-aduskett@codeblue.com>
References: <20170525144749.19333-1-aduskett@codeblue.com>
Message-ID: <20170531220712.72c0e405@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 May 2017 10:47:49 -0400, Adam Duskett wrote:
> Ncurses detection is currently broken in buildroot.
> 
> This patch does the following:
>  - Add SNGREP_CHECK_SCRIPT to configure.ac which checks for a
>    libname, a function in that library, sets a define if found, and
>    if not found, moves on to the next part. This is taken from the
>    htop configure.ac.
> 
>  - Adds SNGREP_CHECK_LIB to configure.ac which checks for a
>    library, a function within that library, sets a define if that function
>    is found, and if not found, moves on to the next part.
>    This is taken from the htop configure.ac
> 
>  - Modifies scrollbar.h and ui_panel.h to include <wctypes.h> instead of
>    <ncursesw/ncurses.h> if unicode is supported.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> ---
>  .../sngrep/0001-fix-ncurses-wchar-detection.patch  | 119 +++++++++++++++++++++

Could you try first to upstream this in the sngrep project? It's a
non-trivial change, so it would be nice to get upstream approval on
this.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
