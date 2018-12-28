From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 11:54:51 +0100
Subject: [Buildroot] [PATCH 1/5 v5] package/meson: never try to run
 generated target binaries
In-Reply-To: <898a91d14004c0149c8a6c4fcf85670d736ffe11.1545814334.git.yann.morin.1998@free.fr>
References: <cover.1545814334.git.yann.morin.1998@free.fr>
 <898a91d14004c0149c8a6c4fcf85670d736ffe11.1545814334.git.yann.morin.1998@free.fr>
Message-ID: <20181228115451.148b39ef@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Dec 2018 09:52:26 +0100, Yann E. MORIN wrote:
> From: James Hilliard <james.hilliard1@gmail.com>
> 
> As explained in [0], meson will try on its own to decide whether it can
> run what it builds. If it happens that the host and target CPUs are
> "compatible", that test may fail and meson may believe it can run what
> it builds.
> 
> Override that test by using needs_exe_wrapper=true, and not defining an
> actual exe_wrapper.
> 
> [0] https://mesonbuild.com/Cross-compilation.html
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> [yann.morin.1998 at free.fr:
>   - split in its own patch
>   - improve commit log
> ]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  package/meson/cross-compilation.conf.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
