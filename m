From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 21:20:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/linknx: bump version to 0.0.1.33
In-Reply-To: <20170730160508.28122-1-bernd.kuhls@t-online.de>
References: <20170730160508.28122-1-bernd.kuhls@t-online.de>
Message-ID: <20170731212037.5b3ff554@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Jul 2017 18:05:08 +0200, Bernd Kuhls wrote:
> Switch _SITE to github:
> https://github.com/linknx/linknx/commit/80264a26318820e5864196aefe3af093071b90b8
> 
> Mysql support was fixed with
> https://github.com/linknx/linknx/commit/83d1d88dc4cec422e13e0c2baa34a828a3f67270
> there 0001-fix-static-build-with-mysql.patch can be removed.
> 
> Build-tested using this defconfig
> http://autobuild.buildroot.net/results/2df/2dfcbd30079d13997de37e2d1c4643653e200be6
> mentioned in
> https://git.buildroot.net/buildroot/commit/package/linknx?id=f35f54585f9e63400bdbd9c9ba2b9fd67be538ea
> 
> After removing the mysql patch autoreconf is not needed anymore,
> therefore we can remove the libcurl dependency which was only added to
> fix autoreconf:
> https://git.buildroot.net/buildroot/commit/package/linknx?id=e1c9a2349006e657e76dff35706a774376921fb7
> 
> LINKNX_CREATE_MISSING_FILES is also not needed anymore after commit
> https://github.com/linknx/linknx/commit/ef04c6d12846800fa1554d2fe31813dd09c5f29b
> 
> Renumbered remaining patch.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../linknx/0001-fix-static-build-with-mysql.patch  | 47 ----------------------
>  ...1-src-suncalc.cpp-fix-build-with-gcc-6.x.patch} |  0
>  package/linknx/Config.in                           |  1 -
>  package/linknx/linknx.hash                         |  2 +-
>  package/linknx/linknx.mk                           | 19 +++------
>  5 files changed, 6 insertions(+), 63 deletions(-)
>  delete mode 100644 package/linknx/0001-fix-static-build-with-mysql.patch
>  rename package/linknx/{0002-src-suncalc.cpp-fix-build-with-gcc-6.x.patch => 0001-src-suncalc.cpp-fix-build-with-gcc-6.x.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
