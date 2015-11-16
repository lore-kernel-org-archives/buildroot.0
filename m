From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Nov 2015 22:15:59 +0100
Subject: [Buildroot] [PATCH v2] package/gauche: exclude build on archs
 not boehm gc ported
In-Reply-To: <201511131026.tADAQef8020593@ms-omx01.plus.so-net.ne.jp>
References: <201511131026.tADAQef8020593@ms-omx01.plus.so-net.ne.jp>
Message-ID: <20151116221559.3989291c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hiroshi Kawashima,

On Fri, 13 Nov 2015 19:26:40 +0900, Hiroshi Kawashima wrote:
> This patch limits gauch build only on architectures boehm gc is ported.
> 
> Will fix:
> http://autobuild.buildroot.org/results/368/3681948013fcd39cc80b690b880924421e429c80//
> http://autobuild.buildroot.org/results/ba7/ba7eb5a878ec25033596dc7c9b0f4678d4a83de5//
> http://autobuild.buildroot.org/results/1cb/1cbf1ee5bde3d50b935ae8ba931c8d0cc1052acc//
> http://autobuild.buildroot.org/results/8af/8afb36606eabdc6ae6e65a28a11877af39f9a7e0//
> 
> Signed-off-by: Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>

Thanks, applied to master after doing a few minor additional changes:

    [Thomas:
     - add comment explaining where the architecture dependency is coming
       from, as suggested by Arnout.
     - move the definition of BR2_PACKAGE_GAUCHE_ARCH_SUPPORTS to the
       beginning of the Config.in file, to be consistent with what we do
       in other packages.]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
