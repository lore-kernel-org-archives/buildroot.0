From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Aug 2016 22:23:41 +0200
Subject: [Buildroot] [PATCH] quagga: fix static link with zlib
In-Reply-To: <a27f85c8a78ed278549be2823c8e8ce4025f32be.1471761559.git.baruch@tkos.co.il>
References: <a27f85c8a78ed278549be2823c8e8ce4025f32be.1471761559.git.baruch@tkos.co.il>
Message-ID: <20160821222341.7d5264f7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 21 Aug 2016 09:39:19 +0300, Baruch Siach wrote:
> quagga links with zlib indirectly via netsnmp -> openssl -> zlib. quagga and
> zlib both define the identically named but otherwise unrelated 'zcalloc'
> symbol. This breaks static linking. Add a patch that renames the offending
> symbol, thus fixing the build.
> 
> Fixes:
> http://autobuild.buildroot.net/results/013/01317aeaff7d127a05e0488a51e81f2d43750687/
> http://autobuild.buildroot.net/results/e9f/e9f17bb6e048c3dd3c65fc588dc5244fbbbba6fb/
> http://autobuild.buildroot.net/results/72b/72b5e8a3d4c1d27c61cdad5a90691117d0dcfbb9/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  ...memory-fix-indirect-static-link-with-zlib.patch | 108 +++++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 package/quagga/0003-lib-memory-fix-indirect-static-link-with-zlib.patch

Thanks for fixing this issue. I'm not sure zzcalloc is really the best
name, but it's fine for now. Could you submit upstream? They will
probably decide of a better name, if need be.

Thanks again, applied to master!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
