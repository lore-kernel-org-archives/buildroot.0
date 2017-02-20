From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Feb 2017 22:04:06 +0100
Subject: [Buildroot] [PATCH v3 2/3] qt5base: use system/buildroot
 provided freetype
In-Reply-To: <20170218113202.14213-2-ps.report@gmx.net>
References: <20170218113202.14213-1-ps.report@gmx.net>
 <20170218113202.14213-2-ps.report@gmx.net>
Message-ID: <20170220220406.57446709@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 18 Feb 2017 12:32:01 +0100, Peter Seiderer wrote:
> Select (and use) builroot provided freetype in case qt5base gui is
> selected (gui without freetype/font support makes not much sense
> and gives compile errors).
> 
> Qt 5.6 needs some support to find the include headers, 5.8 is
> clever enough inherently.
> 
> Fixes [1] (by avoiding the build-in freetype library which depends
> on activated libpng support):
> 
>   Project ERROR: Library 'libpng' is not defined.
>   make[3]: *** [sub-3rdparty-freetype-make_first] Error 3
> 
> [1] http://autobuild.buildroot.net/results/219162ba616289f799a5053c4dcc6b8574284283
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changes v2 -> v3:
>   - fix typo in patch description s/avtivated/activated (Arnout Vandecappelle)
>   - group freetype related options into ifeq and only set freetype include path
>     in case GUI is selected (Arnout Vandecappelle)
>   - add Reviewed-by: Arnout Vandecappelle

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
