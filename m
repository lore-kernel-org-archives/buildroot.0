From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Apr 2014 11:12:42 +0200
Subject: [Buildroot] [PATCH] smack: needs kernel headers v3.0+
In-Reply-To: <08771bc278220844d434dc32849b6a521644203b.1398329779.git.baruch@tkos.co.il>
References: <08771bc278220844d434dc32849b6a521644203b.1398329779.git.baruch@tkos.co.il>
Message-ID: <20140424111242.78331752@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 24 Apr 2014 11:56:19 +0300, Baruch Siach wrote:
> smack uses symbols that are exported to userspace only since Linux kernel
> commit 1dbe39424a43 (xattr.h: expose string defines to userspace).
> 
> Fixes:
> http://autobuild.buildroot.net/results/7fc/7fc69002fbb37962e65e0f83384ae7a4e6eac8a9/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/smack/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied... but I just realized there was a mistake:

> -comment "smack needs a toolchain w/ dynamic library"
> +comment "smack needs a toolchain w/ dynamic library, headers >= 3.0"
>  	depends on BR2_PREFER_STATIC_LIB
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0

This means the comment will only be displayed if both conditions are
met (i.e static lib is enabled *and* we don't have at least 3.0 kernel
headers). But we need the comment to be displayed if static lib is
enabled *OR* we don't have at least 3.0 kernel headers.

Could you send a followup patch to fix this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
