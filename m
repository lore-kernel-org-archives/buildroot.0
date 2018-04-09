From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 11:25:30 +0200
Subject: [Buildroot] [PATCH] libbsd: add upstream patch to fix musl
 build issue
In-Reply-To: <20180406081835.4239-1-joerg.krause@embedded.rocks>
References: <20180406081835.4239-1-joerg.krause@embedded.rocks>
Message-ID: <20180409112530.10683cf4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  6 Apr 2018 10:18:35 +0200, J?rg Krause wrote:
> Commit d879be3049598f35d7b959784e1a6c2811ba2036 enabled the build for non-glibc
> toolchains and added a  patch from upstream to fix one remaining build issue
> with musl.
> 
> The upstream patch defines the glibc specific macro `__GLIBC_PREREQ` in
> `include/bsd/sys/cdefs.h`, but the patch does not include this header
> file in `include/bsd/stdlib.h` which uses the macro.
> 
> Upstream did committed an earlier patch which adds this header inclusion
> to `include/bsd/stdlib.h`. So, add this upstream patch as well to fix a
> build error when building the hcitop tool from the not yet added package
> bluez-alsa.
> 
> Note, that the upstream patch address the issue that `<sys/cdefs.h>` is
> a non-portable header. However, this is not the issue which needs to be
> fixed by this patch, but solely the needed inclusion of the
> `include/bsd/stdlib.h` header file, to see the definition of
> `__GLIBC_PREREQ`.
> 
> Backported from: 11ec8f1e5dfa1c10e0c9fb94879b6f5b96ba52dd
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  ...3-Handle-systems-missing-sys-cdefs.h.patch | 230 ++++++++++++++++++
>  1 file changed, 230 insertions(+)
>  create mode 100644 package/libbsd/0003-Handle-systems-missing-sys-cdefs.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
