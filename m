From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Feb 2020 03:03:18 +0100
Subject: [Buildroot] [PATCH 1/1]
 toolchain/toolchain-external/toolchain-external-codesourcery-arm: disable
 SSP
In-Reply-To: <20191028130838.23254-1-fontaine.fabrice@gmail.com>
References: <20191028130838.23254-1-fontaine.fabrice@gmail.com>
Message-ID: <20200220030318.2997d2af@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Mon, 28 Oct 2019 14:08:38 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This toolchain does not support -fstack-protector-strong:
> SSP option -fstack-protector-strong not available in this toolchain, please select another SSP level
> 
> As there is no way to add a !BR2_SSP_STRONG dependency without creating a
> Kconfig recursive dependency, just remove BR2_TOOLCHAIN_HAS_SSP
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/78dc6428ffaa529fdad8e9c8aaec49ded5f0209a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I have submitted a different patch series, implementing a different
solution for this issue:

  http://patchwork.ozlabs.org/project/buildroot/list/?series=159621

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
