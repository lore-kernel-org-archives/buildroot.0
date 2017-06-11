From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 17:52:46 +0200
Subject: [Buildroot] [PATCH 2/2] package lcdproc: override libpng-config
 path
In-Reply-To: <20170611131317.16345-2-romain.naour@gmail.com>
References: <20170611131317.16345-1-romain.naour@gmail.com>
 <20170611131317.16345-2-romain.naour@gmail.com>
Message-ID: <20170611175246.0956b98d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Jun 2017 15:13:17 +0200, Romain Naour wrote:
> Like for freetype-config, override libpng-config path otherwise
> the one from the host system may be used when installed.
> Make sure that the one from HOST_DIR is used.
> 
> configure:7480: checking for libpng-config
> configure:7498: found /usr/bin/libpng-config
> configure:7510: result: /usr/bin/libpng-config
> configure:7529: checking whether libpng is present and sane
> [...]
> nios2-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include/libpng12'
> 
> Fixes
> http://autobuild.buildroot.net/results/b68/b68f54404a7d412d639ebb6d052412eea6ee3bf1/lcdproc-0.5.7/config.log
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/lcdproc/lcdproc.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
