From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 4 Jul 2019 00:25:21 +0200
Subject: [Buildroot] [PATCH 3/3] package/x11r7/xlib_libX11: Fix reliance
 on a host static libc.
In-Reply-To: <20190701194800.67133-3-aduskett@gmail.com>
References: <20190701194800.67133-1-aduskett@gmail.com>
 <20190701194800.67133-3-aduskett@gmail.com>
Message-ID: <52346adb-bdea-a134-eec5-35390ee8c0cc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Series applied to master, thanks.

 For this one, I edited the subject line:

package/x11r7/xlib_libX11: don't require static libc on host

No capitalisation after : and no period at the end.


On 01/07/2019 21:48, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> As per: https://gitlab.freedesktop.org/xorg/lib/libx11/commit/4645e219133458781e3fb48eaea6a74cccb1b9aa
> 
> "For Windows targets, libtool uses a wrapper executable, not a wrapper
> script (see [1]), which it compiles with the host compiler.  This
> doesn't work when cross-compiling."
> 
> Because of this change, builds fail on Linux hosts without a static libc, this
> patch reverts this change as we are guaranteed to build in a Linux environment.

 Also, commit message should be wrapped at 72 columns. So I fixed that as well.


 I've also tried to find a better solution but couldn't find any.

 Could you report this problem upstream? You can add to it that a standard
native build (not even cross-compiled) fails on Fedora 30 because of this. Well,
TBH I haven't tried but I expect it fails :-)


 Regards,
 Arnout

> Fixes:
> http://autobuild.buildroot.net/results/ac7c777e5fe31b6eda8b8b662881b07299e57ae9
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
[snip]
