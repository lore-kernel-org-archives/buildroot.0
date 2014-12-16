From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Dec 2014 08:13:22 +0100
Subject: [Buildroot] [PATCH 1/1]  package/gdb: fix shared-only build
In-Reply-To: <1418597244-31844-1-git-send-email-romain.naour@openwide.fr>
References: <1418597244-31844-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141216081322.229c0a52@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sun, 14 Dec 2014 23:47:24 +0100, Romain Naour wrote:
>  When --disable-static is given to the gdb's main configure script,
>  it also disable the static build of bundled libraries like bfd, readline
>  and opcodes, which must be build statically.
> 
>  Fixes:
>  http://autobuild.buildroot.net/results/219/21979e730dca1fce5bdda9a4c7fad4485e788866/
>  http://autobuild.buildroot.net/results/c10/c1096d0bd22de5c6feba848f743601ad0416a944/
>  http://autobuild.buildroot.net/results/d8a/d8a5bcc7fa374fb0c916a9d0f33ef283109cb404/
>  http://autobuild.buildroot.net/results/22a/22a86d0f1df0fc4698c0f734f3d659e6317404a4/
>  http://autobuild.buildroot.net/results/404/404e61e5c30040ee5756f4b5839149dca38660d4/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/gdb/0001-bfd-force-static-build.patch      | 79 +++++++++++++++++++++
>  package/gdb/0002-readline-force-static-build.patch | 34 +++++++++
>  .../gdb/0003-libopcodes-force-static-build.patch   | 80 ++++++++++++++++++++++
>  3 files changed, 193 insertions(+)
>  create mode 100644 package/gdb/0001-bfd-force-static-build.patch
>  create mode 100644 package/gdb/0002-readline-force-static-build.patch
>  create mode 100644 package/gdb/0003-libopcodes-force-static-build.patch

Are you sure patching gdb is the right direction here? I believe those
patches have no chance to be merged upstream, so patching is not the
right solution.

A better solution is probably to re-add --enable-static to
GDB_CONF_OPTS, even if we're doing a shared only build. This doesn't
require patching gdb, and is more compliant with what upstream wants:
doing a pure shared build of gdb isn't supported.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
