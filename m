From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 22:05:17 +0100
Subject: [Buildroot] [PATCH 2/5] support/scripts/gen-bootlin-toolchains:
 riscv32 use a pre-2.33 glibc version without RPC support
In-Reply-To: <20201207204821.3588178-2-romain.naour@gmail.com>
References: <20201207204821.3588178-1-romain.naour@gmail.com>
 <20201207204821.3588178-2-romain.naour@gmail.com>
Message-ID: <20201229220517.6638e22c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  7 Dec 2020 21:48:18 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> riscv32 has been merged into glibc 2.33 where RPC support has been removed [1].
> 
> Add a special handling for the riscv32 Bootlin bleeding-edge 2020.08-1 toolchain
> since it used a pre-2.33 glibc version [2].
> 
> Other glibc Bootlin toolchain use glibc 2.31 with RPC support enabled.
> 
> This special handling must be removed when all Bootlin toolchain has been
> rebuild with glibc > 2.32.
> 
> [1] https://sourceware.org/pipermail/libc-announce/2020/000029.html
> [2] https://git.buildroot.net/buildroot/commit/?id=a4889545aa653e7f001f212eda169e7d676aefc0
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/gen-bootlin-toolchains | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

So, as discussed, this approach was not really great. Instead, I've
merged your pull request on toolchains-builder, and manually fixed up
the existing toolchain fragments (for the latest glibc toolchains) so
that they carry the proper RPC information. Then, I applied
https://git.buildroot.org/buildroot/commit/?id=8cba5463deb263e1581895a58fef089e8ec02380
to gen-bootlin-toolchains to leverage this correct information in the
fragments.

So I've marked this particular patch of yours as Rejected.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
