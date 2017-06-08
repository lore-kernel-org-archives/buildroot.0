From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 21:35:24 +0200
Subject: [Buildroot] [PATCH v2] sngrep: fix wchar detection.
In-Reply-To: <20170607155316.25646-1-aduskett@codeblue.com>
References: <20170607155316.25646-1-aduskett@codeblue.com>
Message-ID: <20170608213524.21c05b9c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Jun 2017 11:53:16 -0400, Adam Duskett wrote:
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
> Changes v1 -> v2:
>   - Added # Locally computed header to sngrep.hash

Applied to master, after fixing the commit log, which wasn't
appropriate anymore.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
