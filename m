From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 15:36:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/minidlna: unavailable for
 static builds
In-Reply-To: <1458380622-28765-1-git-send-email-bernd.kuhls@t-online.de>
References: <1458380622-28765-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160320153638.6be4f246@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 19 Mar 2016 10:43:42 +0100, Bernd Kuhls wrote:
> minidlna has long standing issues with static-only builds:
> http://patchwork.ozlabs.org/patch/501844/
> http://patchwork.ozlabs.org/patch/506310/
> 
> This patch fixes
> http://autobuild.buildroot.net/results/d73/d7370d0f8d1c7c028996feab0ea4f36edbf8a698/
> http://autobuild.buildroot.net/results/575/5752be7c1820579425ba24178482ab0d6eea7b62/
> "pack_utils.c:(.text+0x9a8): multiple definition of `free_metadata'"
> 
> The multiple definition can be fixed of course but instead of digging
> deeper and deeper into this mess let's disable static builds.

Fully agreed. If anyone wants to build minidlna statically, they can
work with upstream to fix this.

> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/minidlna/Config.in   | 6 ++++--
>  package/minidlna/minidlna.mk | 9 ---------
>  2 files changed, 4 insertions(+), 11 deletions(-)

Applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
