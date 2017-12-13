From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 08:20:32 +0100
Subject: [Buildroot] [PATCH] mpd: add upstream patch to fix build with
 libupnp 1.6.24
In-Reply-To: <20171212195109.29683-1-joerg.krause@embedded.rocks>
References: <20171212195109.29683-1-joerg.krause@embedded.rocks>
Message-ID: <20171213082032.42aa4d45@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Dec 2017 20:51:09 +0100, J?rg Krause wrote:
> Add an upstream patch to fix build with libupnp 1.6.24.
> 
> libupnp 1.6.24 added some compat helpers for programs making use of
> libupnp to support 1.6.x and 1.8.x easier [1].
> 
> MPD added its own wrappers in version 0.20.12 [2] which are clashing with the
> newly added compat helpers in libupnp 1.6.24.
> 
> The patch disables the MPD wrappers for libupnp version 1.6.24+.
> 
> Fixes:
> http://autobuild.buildroot.net/results/949bf9d42c82de34f3328a31bb122c81243e5418/
> http://autobuild.buildroot.net/results/b12ca93cb3ad52e601cc99f54a867e21a28fd1c9/
> http://autobuild.buildroot.net/results/7af8e96fdf823bbc427caa562d6d0a130a4875f0/
> .. and many more.
> 
> Backported from: 78728138a04c2493c6bfadee98060043eca204bf
> 
> [1] https://sourceforge.net/p/pupnp/code/ci/8177a4195a4d4a5d6cb095eaf4ca5b65ac446381/
> [2] https://github.com/MusicPlayerDaemon/MPD/commit/714011c81ed6053f7a35812071499356f337dd70
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/mpd/0002-libupnp-1-6-24-compat.patch | 48 ++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/mpd/0002-libupnp-1-6-24-compat.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
