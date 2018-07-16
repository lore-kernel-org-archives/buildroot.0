From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 13:19:50 +0200
Subject: [Buildroot] [PATCH v3,2/2] librsvg: bump to version 2.42.5
In-Reply-To: <20180610133857.4737-2-fontaine.fabrice@gmail.com>
References: <20180610133857.4737-1-fontaine.fabrice@gmail.com>
 <20180610133857.4737-2-fontaine.fabrice@gmail.com>
Message-ID: <20180716131950.418525f0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jun 2018 15:38:57 +0200, Fabrice Fontaine wrote:
> - Add a dependency to host-cargo
> - Add a patch to set RUST_TARGET
> - Add a dependency to BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> - Forward this dependency to efl svg, enlightment, gst-plugins-bad and
>   gst1-plugins-bad
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni)
>  - Put back select BR2_PACKAGE_HOST_CARGO in Config.in (even if it is
>    not needed) as well as first patch

This commit was causing many build failures in the autobuilders, due to
the Rust issue Peter and I have discussed in this thread. It's bit more
than a month, and nobody stepped up to fix the Rust issues, so for now,
the safe thing to do is to revert the librsvg bump.

I'll be happy to merge it again once the Rust issues are resolved.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
