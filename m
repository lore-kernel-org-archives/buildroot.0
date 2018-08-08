From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Aug 2018 15:17:09 +0200
Subject: [Buildroot] [PATCH] mmc-utils: Rely on our own _FORTIFY_SOURCE
In-Reply-To: <48287dd12fcef0440cc49ff86343867d6cb8429e.1533656185.git.jan.kundrat@cesnet.cz>
References: <48287dd12fcef0440cc49ff86343867d6cb8429e.1533656185.git.jan.kundrat@cesnet.cz>
Message-ID: <20180808151709.2f35030c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Aug 2018 17:32:51 +0200, Jan Kundr?t wrote:
> Upstream always forced _FORTIFY_SOURCE=2. At first, I tried changing
> their flags to undefine that macro first, but that did not work well.
> This patch ensures that the package always respects our toolchain
> settings, even in cases where we are not fortifying the build.
> 
> This fixes a build failure where the mmc-utils package failed to build
> with, e.g., BR2_FORTIFY_SOURCE_1:
> 
>   <command-line>:0:0: error: "_FORTIFY_SOURCE" redefined [-Werror]
>   <command-line>:0:0: note: this is the location of the previous definition
> 
> Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>

Is this fixing a build issue reported by the autobuilders ? Or only
with hardening options ? Your commit log is not very verbose in details
about the configuration/condition under which the build failure happens.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
