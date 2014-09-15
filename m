From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 15:50:52 +0200
Subject: [Buildroot] [PATCH] ARC: gcc - Fix SIZE_TYPE to be "unsigned
 int" instead of long unsigned int"
In-Reply-To: <1410787585-20387-1-git-send-email-abrodkin@synopsys.com>
References: <1410787585-20387-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140915155052.1b3283ae@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Mon, 15 Sep 2014 17:26:25 +0400, Alexey Brodkin wrote:
> This makes size_t to be "unsigned" ssize_t which makes happy compiler on data
> type checks.
> 
> Fix is taken from current development branch of GCC for ARC and will be a
> part of the next release of ARC tools, so at that point patch should be dropped.
> 
> https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/249f040299402647525c3f15b79d319fa7acddd3
> 
> Fixes http://autobuild.buildroot.net/results/405/405da9a945511329929b18740b983c51b8dcc43e
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> 
> Cc: Anton Kolesov <akolesov@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/gcc/arc-2014.08/200-size_type_unsigned_int.patch | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 package/gcc/arc-2014.08/200-size_type_unsigned_int.patch

Thanks, looks good, but...

> 
> diff --git a/package/gcc/arc-2014.08/200-size_type_unsigned_int.patch b/package/gcc/arc-2014.08/200-size_type_unsigned_int.patch
> new file mode 100644
> index 0000000..78d4b10
> --- /dev/null
> +++ b/package/gcc/arc-2014.08/200-size_type_unsigned_int.patch

Patch lacks a description + SoB.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
