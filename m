From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 23 Oct 2014 09:30:40 +0100
Subject: [Buildroot] [PATCH] botan: fix mips64 build using n32 ABI
In-Reply-To: <301f9a581364fbaaf8f8ec7c2cde1d18241928c7.1414046088.git.baruch@tkos.co.il>
References: <301f9a581364fbaaf8f8ec7c2cde1d18241928c7.1414046088.git.baruch@tkos.co.il>
Message-ID: <5448BCB0.7060405@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On 10/23/2014 07:34 AM, Baruch Siach wrote:
> Remove explicit -mabi parameter, and let the external toolchain wrapper set
> the correct -mabi.
>
> Fixes:
> http://autobuild.buildroot.net/results/8fb/8fb8621bc5175f593de4ad0f005a5c7ffd4d9241/
>
> Cc: Francois Perrad <fperrad@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>   package/botan/0001-remove-mips64-explicit-mabi.patch | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>   create mode 100644 package/botan/0001-remove-mips64-explicit-mabi.patch
>
> diff --git a/package/botan/0001-remove-mips64-explicit-mabi.patch b/package/botan/0001-remove-mips64-explicit-mabi.patch
> new file mode 100644
> index 000000000000..3fddd54e9a06
> --- /dev/null
> +++ b/package/botan/0001-remove-mips64-explicit-mabi.patch
> @@ -0,0 +1,18 @@
> +Remove explicit mips64 -mabi parameter
> +
> +This breaks when building for n32 ABI on mips64.
> +
> +Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> +---
> +
> +diff -Nuar Botan-1.10.8-orig/src/build-data/cc/gcc.txt Botan-1.10.8/src/build-data/cc/gcc.txt
> +--- Botan-1.10.8-orig/src/build-data/cc/gcc.txt	2014-04-10 17:11:44.000000000 +0300
> ++++ Botan-1.10.8/src/build-data/cc/gcc.txt	2014-10-23 09:20:34.506722323 +0300
> +@@ -92,7 +92,6 @@
> + # The 'linking' bit means "use this for both compiling *and* linking"
> + <mach_abi_linking>
> + x86_64  -> "-m64"
> +-mips64  -> "-mabi=64"
> + s390    -> "-m31"
> + s390x   -> "-m64"
> + sparc32 -> "-m32 -mno-app-regs"
>

I sent an email to the Botan mailing list informing about this problem:

http://lists.randombit.net/pipermail/botan-devel/2014-October/001949.html

I haven't received a reply yet, but I hope they fix this problem 
upstream so we can do a version bump or backport the upstream patch into 
Buildroot.

However, your patch does the trick and fixes the problem by now, so here 
you have my...

Acked-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
