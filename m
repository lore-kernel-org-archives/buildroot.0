From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Jun 2019 15:07:34 +0200
Subject: [Buildroot] [PATCH] toolchain: fix ARC GCC internal compiller
 error
In-Reply-To: <20190625141003.8208-1-Evgeniy.Didin@synopsys.com>
References: <20190625141003.8208-1-Evgeniy.Didin@synopsys.com>
Message-ID: <204e18bb-db59-aa3d-a6e3-46b4460029b8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Evgeniy,

On 25/06/2019 16:10, Evgeniy Didin wrote:
> With recent arc-toolchain update some packages started to fail with gcc error.
> This commit temporarily add fix for current version of arc-gcc.
> Should be removed with update to next version of ARC tools.
> 
> Fix in upstream gcc:
> https://gcc.gnu.org/viewcvs/gcc?view=revision&sortby=date&revision=272645
> 
> Fixes:
> http://autobuild.buildroot.net/results/66e/66e8f28ed171b5c8994e6ba8c4e6257d6bbe0191//
> http://autobuild.buildroot.net/results/789/789016ff66bb4bcd2667a8c5241a680b98db5b2f//
> http://autobuild.buildroot.net/results/dd9/dd9de722b886dee3e6373b026062e1aecc11efd3//
> 
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: arc-buildroot at synopsys.com
> ---
>  .../gcc/arc-2019.03-release/0001-ARC-PR89838.patch | 367 +++++++++++++++++++++
>  1 file changed, 367 insertions(+)
>  create mode 100644 package/gcc/arc-2019.03-release/0001-ARC-PR89838.patch
> 
> diff --git a/package/gcc/arc-2019.03-release/0001-ARC-PR89838.patch b/package/gcc/arc-2019.03-release/0001-ARC-PR89838.patch
> new file mode 100644
> index 0000000000..e21ae50a23
> --- /dev/null
> +++ b/package/gcc/arc-2019.03-release/0001-ARC-PR89838.patch
> @@ -0,0 +1,367 @@
> +From 228efbbb2f1d59ca7fc0ec09d4be75ce58fa583b Mon Sep 17 00:00:00 2001
> +From: Claudiu Zissulescu <claziss@gmail.com>
> +Date: Mon, 1 Apr 2019 13:03:55 +0300
> +Subject: [PATCH] [ARC] PR89838
> +
> +gcc/
> +xxxx-xx-xx  Claudiu Zissulescu  <claziss@synopsys.com>
> +
> +	* config/arc/arc.c (arc_symbol_binds_local_p): New function.
> +	(arc_legitimize_pic_address): Simplify and cleanup the function.
> +	(SYMBOLIC_CONST): Remove.
> +	(prepare_pic_move): Likewise.
> +	(prepare_move_operands): Handle complex mov cases here.
> +	(arc_legitimize_address_0): Remove call to
> +	arc_legitimize_pic_address.
> +	(arc_legitimize_address): Remove call to
> +	arc_legitimize_tls_address.
> +	* config/arc/arc.md (movqi_insn): Allow Cm3 match.
> +	(movhi_insn): Likewise.
> +
> +/gcc/testsuite
> +xxxx-xx-xx  Claudiu Zissulescu  <claziss@synopsys.com>
> +
> +	* gcc.target/arc/pr89838.c: New file.
> +
> +Fix in upstream:
> +   https://gcc.gnu.org/viewcvs/gcc?view=revision&sortby=date&revision=272645

 The patch also requires your Sob.

 Also, if the upstream commit message is no good, like in this case, it's nice
to add one so we understand why this patch is needed. The upstream commit
message says nothing about what it fixes.

 Regards,
 Arnout

[snip]
