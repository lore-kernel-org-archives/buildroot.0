From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Jun 2018 07:58:42 +0200
Subject: [Buildroot] [PATCH 2/2] librsvg: bump to version 2.42.5
In-Reply-To: <20180606202501.14535-2-fontaine.fabrice@gmail.com>
References: <20180606202501.14535-1-fontaine.fabrice@gmail.com>
 <20180606202501.14535-2-fontaine.fabrice@gmail.com>
Message-ID: <20180607075842.1c92eba9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Jun 2018 22:25:01 +0200, Fabrice Fontaine wrote:
> - Add a dependency to host-cargo
> - Add a patch to set RUST_TARGET
> - Add a dependency to BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
> - Forward this dependency to efl svg and enlightment
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

As I was surprised by the new rust dependency, I looked at
https://github.com/GNOME/librsvg/blob/master/COMPILING.md. Indeed, Rust
appears to be necessary.

But the other thing that came up from this reading is:

Mandatory dependencies
[...]
GObject-Introspection 0.10.8

But we don't have gobject-introspection in Buildroot, the package for
that is pending review, and it's a complicated one. How is it possible
that you built librsvg without it ? Is the documentation incorrect and
in fact it's an optional dependency ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
