From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 21:51:31 +0200
Subject: [Buildroot] [PATCH v1] qt5location: fix plugins build dependency
In-Reply-To: <20170724183513.25131-1-ps.report@gmx.net>
References: <20170724183513.25131-1-ps.report@gmx.net>
Message-ID: <20170725215131.7ea4c526@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 24 Jul 2017 20:35:13 +0200, Peter Seiderer wrote:
> Do not build the plugins before the dependency on module positioning for
> the plugin subdir position is available (add Add upstream patch
> 0001-Fix-plugins-build-dependency.patch [1]).
> 
> Fixes [2]:
> 
>   cp -dpfr .../output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/qt/plugins/position .../output/target/usr/lib/qt/plugins/
>   cp: cannot stat '.../output/host/aarch64-buildroot-linux-gnu/sysroot/usr/lib/qt/plugins/position': No such file or directory
> 
> [1] https://code.qt.io/cgit/qt/qtlocation.git/patch/?id=3ac051c4549575634cecc706175b019f4ed4c3bf
> [2] http://autobuild.buildroot.net/results/bc1/bc13abf3bb2fe1c991aec2334ee658c9641d1fd5
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Thanks to Joshua Henderson for the Qt bug report and investigaton.
> ---
>  .../0001-Fix-plugins-build-dependency.patch        | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/qt5/qt5location/0001-Fix-plugins-build-dependency.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
