From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Aug 2020 23:41:14 +0200
Subject: [Buildroot] [PATCH v2] package/capnproto: bump version to 0.8.0
In-Reply-To: <20200516075313.GB31946@coltrane>
References: <20200516075313.GB31946@coltrane>
Message-ID: <20200808234114.2c5b12b4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 16 May 2020 09:53:13 +0200
Koen Martens <gmc@sonologic.nl> wrote:

> The new version requires an extra features in the
> toolchain and won't build with a specific gcc
> bug, therefore two new toolchain options are added
> as dependencies:
> 
> * !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
> * BR2_TOOLCHAIN_HAS_UCONTEXT
> 
> Signed-off-by: Koen Martens <gmc@sonologic.nl>
> 
> ---
> changes v1 -> v2:
>   - use !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 instead of
>     BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
>     (suggested by Thomas Petazzoni)
> ---
>  package/capnproto/Config.in      | 9 +++++++--
>  package/capnproto/capnproto.hash | 2 +-
>  package/capnproto/capnproto.mk   | 2 +-
>  3 files changed, 9 insertions(+), 4 deletions(-)

You had forgotten to propagate the dependency to the c-capnproto
package, so I've done so and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
