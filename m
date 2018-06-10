From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 16:18:51 +0200
Subject: [Buildroot] [PATCH v3,1/2] host-cargo: select host-rustc
In-Reply-To: <20180610133857.4737-1-fontaine.fabrice@gmail.com>
References: <20180610133857.4737-1-fontaine.fabrice@gmail.com>
Message-ID: <20180610161851.2acb3a98@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jun 2018 15:38:56 +0200, Fabrice Fontaine wrote:
> Buildroot documentation specifies that cargo-based package should only
> depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS and selects
> BR2_PACKAGE_HOST_CARGO but this fails with the following error:
> 
> warning: (BR2_PACKAGE_LIBRSVG) selects BR2_PACKAGE_HOST_CARGO which has
> unmet direct dependencies (BR2_PACKAGE_HAS_HOST_RUSTC)
> 
> Indeed, host-cargo depends on
> BR2_PACKAGE_HAS_HOST_RUSTC which is selected only when host-rustc is
> selected.
> 
> So instead of having to select both cargo and rustc in each cargo-based
> package, replace BR2_PACKAGE_HAS_HOST_RUSTC dependency by
> BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS and select
> BR2_PACKAGE_HOST_RUSTC
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni)
>  - Give more details on what does not work in commit log

Applied to master, thanks. I have also applied a follow-up patch that
removes BR2_PACKAGE_HAS_HOST_RUSTC entirely, since it was no longer
used anywhere.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
