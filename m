From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 11:54:54 +0100
Subject: [Buildroot] [PATCH 2/5 v5] package/meson: fix CPU familly
In-Reply-To: <ab061e6fba04bad42265bf795b717de583f370db.1545814334.git.yann.morin.1998@free.fr>
References: <cover.1545814334.git.yann.morin.1998@free.fr>
 <ab061e6fba04bad42265bf795b717de583f370db.1545814334.git.yann.morin.1998@free.fr>
Message-ID: <20181228115454.30fa00e1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Dec 2018 09:52:27 +0100, Yann E. MORIN wrote:
> From: James Hilliard <james.hilliard1@gmail.com>
> 
> As explained in [0], meson recognises a certain set of CPU famillies,
> whose names slightly differ from those we know them as.
> 
> If we don't pass the proper cpu_familly, meson whines:
>     WARNING: Unknown CPU family 'i686', please report this at [...]
> 
> Subsequently, packages that use that to decide on what they should build
> and how they should build it, fail to build. That is the case for the
> upcoming systemd-boot, for example.
> 
> Fix that by using the list propvided by the meson documentation [0].
> 
> [0] https://mesonbuild.com/Reference-tables.html#cpu-families
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> [yann.morin.1998 at free.fr:
>   - split in its own patch
>   - imnprove commit log
> ]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/meson/meson.mk | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
