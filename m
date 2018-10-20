From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 21 Oct 2018 00:02:31 +0200
Subject: [Buildroot] [PATCH 3/3] cargo-bin: bump version to 0.30.0
In-Reply-To: <20181018205835.8719-4-eric.le.bihan.dev@free.fr>
References: <20181018205835.8719-1-eric.le.bihan.dev@free.fr>
 <20181018205835.8719-4-eric.le.bihan.dev@free.fr>
Message-ID: <20181021000231.0addc2ca@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Eric,

On Thu, 18 Oct 2018 22:58:35 +0200, Eric Le Bihan wrote:
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

I had to revert this patch, it was causing build failures due to the
hashes. See below.

> diff --git a/package/cargo-bin/cargo-bin.hash b/package/cargo-bin/cargo-bin.hash
> index ad2da2bc00..96e90c6603 100644
> --- a/package/cargo-bin/cargo-bin.hash
> +++ b/package/cargo-bin/cargo-bin.hash
> @@ -1,9 +1,9 @@
> -# From https://static.rust-lang.org/dist/cargo-0.27.0-i686-unknown-linux-gnu.tar.xz.sha256
> -sha256 64c2262c0577ef1824d3d885753362d68c04f36ea85a195894894c37e2445ef5  cargo-0.27.0-i686-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/cargo-0.27.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> -sha256 3688bea3d971615d9c4b33612c20783bd9a385539aa7f754e6543c196e1bcec2  cargo-0.27.0-powerpc64le-unknown-linux-gnu.tar.xz
> -# From https://static.rust-lang.org/dist/cargo-0.27.0-x86_64-unknown-linux-gnu.tar.xz.sha256
> -sha256 d09c061daaafd735742e0b18a4da6eb656f61d4c57504d100a6ca9f766b38c71  cargo-0.27.0-x86_64-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/cargo-0.30.0-i686-unknown-linux-gnu.tar.xz.sha256
> +sha256 4b828c263283241ad1c99f30e0b5d8554b6dac2737d09cfd466b4c15b0d7296a  cargo-0.30.0-i686-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/cargo-0.30.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
> +sha256 3718a63fa744d9cd856d72a4fe3ac3b84ff34575a77da72667474c4726d56155  cargo-0.30.0-powerpc64le-unknown-linux-gnu.tar.xz
> +# From https://static.rust-lang.org/dist/cargo-0.30.0-x86_64-unknown-linux-gnu.tar.xz.sha256
> +sha256 9524db722356307669c9068bb7df8dbd57e153717e62071b62560eb22ce2f3cd  cargo-0.30.0-x86_64-unknown-linux-gnu.tar.xz

So you updated all those hashes, but they are all wrong. They not match
the tarballs, they do not match the .sha256 files provided on the
upstream site. The upstream site tarballs do match the .sha256 file
that they provide, but they are different hashes than yours.

This looks weird and suspicious. Has upstreaming modified their tarball
after releasing them ? Has their server been hacked, and the tarballs
replaced with some bad thing inside ?

Could you check if you still have a copy of those tarballs locally on
your machine ? Do they have the hash that you wrote in the .hash file ?
If so, could you carefully keep such tarballs, and compare their
contents with the tarballs currently provided by the upstream site ?

Note: we really don't want to blindly update those hashes so that they
patch upstream. We need to understand why the hashes that they provide
now don't match the ones that you provided in this patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
