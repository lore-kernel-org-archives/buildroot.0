From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Mar 2020 23:18:11 +0100
Subject: [Buildroot] [PATCH 1/2] package/llvm: specify
 LLVM_ENABLE_BINDINGS=OFF
In-Reply-To: <20200316200106.3709163-1-joseph.kogut@gmail.com>
References: <20200316200106.3709163-1-joseph.kogut@gmail.com>
Message-ID: <20200318231811.3a6763f5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Mar 2020 13:01:05 -0700
Joseph Kogut <joseph.kogut@gmail.com> wrote:

> LLVM builds bindings for other languages such as Go and OCaml when the
> appropriate dependencies can be found. We currently don't support
> building these bindings in Buildroot, as they're currently unused by any
> package.
> 
> Building these bindings was originally disabled by overriding the
> dependencies with values indicating that they were not found.
> 
> Newer versions of LLVM no longer disable the OCaml bindings when overriding
> OCAMLFIND. Consequently, the build process attempts to install the bindings
> to the default location on the host of /usr/lib/ocaml/llvm, causing a
> permissions error and build failure.
> 
> Additionally, LLVM has since added the variable LLVM_ENABLE_BINDINGS to
> control whether bindings are enabled, so we override that to disable the
> bindings.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  package/llvm/llvm.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Thanks, both patches applied.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
