From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 16:25:47 +0200
Subject: [Buildroot] [PATCH v3,2/2] librsvg: bump to version 2.42.5
In-Reply-To: <20180610133857.4737-2-fontaine.fabrice@gmail.com>
References: <20180610133857.4737-1-fontaine.fabrice@gmail.com>
 <20180610133857.4737-2-fontaine.fabrice@gmail.com>
Message-ID: <20180610162547.6a5d946c@windsurf>
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

I've applied, after fixing the gst-plugins-bad and gst1-plugins-bad
packages, in which you forgot to propagate the new dependency to the
existing Config.in comments.

Generally speaking, I find it a bit annoying that those packages start
using Rust. Not because I have anything against Rust, but because:

 (1) It limits the support to a much smaller set of architectures. For
     example, it is not longer possible to build librsvg or its reverse
     dependencies on ARMv5 platforms.

 (2) It adds a fair amount of build time.

But well, if that's upstream decision, there's not much we can do
against it.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
