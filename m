From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 23:45:25 +0200
Subject: [Buildroot] [PATCH v2] rust: Modify Rust to be usable as
 host-tool only
In-Reply-To: <20180822223350.8735-1-sam.voss@gmail.com>
References: <20180822223350.8735-1-sam.voss@gmail.com>
Message-ID: <20180912234525.26ca301e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Aug 2018 17:33:50 -0500, sam.voss at gmail.com wrote:
> From: Sam Voss <sam.voss@gmail.com>
> 
> Modify host-rust virtual package to default to host-rust-bin when no
> other selection has been made, as long as the host supports rust. This
> allows host only tools to still use rust when the target architecture
> does not support it.
> 
> Add target-specific variable which is used to differentiate host and
> target arch requirements (BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS).
> 
> A target package shall depend on this variable where a host package will
> use the previously defined BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS. The new
> "target" version is selectable for the same set of architectures as
> before, but now depends on the host variant.
> 
> Signed-off-by: Sam Voss <sam.voss@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/rust-bin/rust-bin.mk |  9 ++++++---
>  package/rustc/Config.in.host | 16 ++++++++++++----
>  package/rustc/rustc.mk       |  2 ++
>  3 files changed, 20 insertions(+), 7 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
