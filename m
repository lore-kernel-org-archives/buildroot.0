From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 22:17:12 +0200
Subject: [Buildroot] [PATCH] ARC: gcc - Redefine PTRDIFF_TYPE from "long
 int" to "int"
In-Reply-To: <1411039152-15365-1-git-send-email-abrodkin@synopsys.com>
References: <1411039152-15365-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20140923221712.7b931f94@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Brodkin,

On Thu, 18 Sep 2014 15:19:12 +0400, Alexey Brodkin wrote:
> Change of SIZE_TYPE from "long unsigned int" to "unsigned int"
> http://git.buildroot.net/buildroot/commit/?id=0f236c1fef669192c8f5cc8ef26e93da91438dc2
> introduced regression due to existing PTRDIFF_TYPE.
> 
> Now to fix regression convert PTRDIFF_TYPE to simple "int".
> 
> Fix is taken from current development branch of GCC for ARC and will be a
> part of the next release of ARC tools, so at that point patch should be dropped.
> 
> https://github.com/foss-for-synopsys-dwc-arc-processors/gcc/commit/846e92167aa4f486259c9ff44bb4e6cce6097fa4
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Anton Kolesov <akolesov@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/gcc/arc-2014.08/300-ptrdiff_type_int.patch | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/gcc/arc-2014.08/300-ptrdiff_type_int.patch

I've applied your patch. However, I had to tweak a bit the commit log,
especially the title which wasn't matching the standard titles
we use in Buildroot.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
