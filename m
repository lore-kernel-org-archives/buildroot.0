From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 15:22:08 +0200
Subject: [Buildroot] [PATCH] package: qemu: Make dependency to nettle
 explicit
In-Reply-To: <20190911084039.16983-1-post@lespocky.de>
References: <20190911084039.16983-1-post@lespocky.de>
Message-ID: <20190915152208.5a83c6e2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

On Wed, 11 Sep 2019 10:40:39 +0200
Alexander Dahl <post@lespocky.de> wrote:

> For the fli4l router distribution we had problems building 'qemu', some
> builds failed complaining when checking dynamic linking of the package:
> 
> >>> qemu 2.12.1 Error: Library libnettle.so.6 referenced by usr/libexec/qemu-bridge-helper belongs to package nettle which is not a dependency of qemu  
> 
> https://web.nettworks.org/ci/job/fli4l/job/buildroot/job/4.0/job/trunk-x86_64/495/console
> 
> Making the dependency explicit, by calling ./configure with
> --enable-nettle or --disable-nettle depending on the activation status
> of package nettle, solves the issue.
> 
> For fli4l the fix is still based on buildroot 2018.02.x, but the problem
> is the same in recent version of buildroot, and the fix works for master
> as well.
> 
> Cc: Florian Wolters <florian@florian-wolters.de>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
>  package/qemu/qemu.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

I have reworked the commit log, because it didn't make much sense in
the context of upstream Buildroot. Indeed, in upstream Buildroot,
missing such optional dependencies does not cause any build error.

BTW, thanks for pointing me to the additional tooling that the fli4l
project has added. In the context of upstream Buildroot, I think our
goal is rather to move towards per-package target/host folders, which
make sure only the explicitly listed dependencies are visible by each
package.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
