From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Mar 2019 22:23:19 +0100
Subject: [Buildroot] [PATCH 2/3] toolchain: Add necessary options to
 support 5.0 kernel headers
In-Reply-To: <20190319000638.6259-3-joel@jms.id.au>
References: <20190319000638.6259-1-joel@jms.id.au>
 <20190319000638.6259-3-joel@jms.id.au>
Message-ID: <20190319222319.60fd2f2d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joel,

On Tue, 19 Mar 2019 10:36:37 +1030
Joel Stanley <joel@jms.id.au> wrote:

> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  toolchain/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index bcbc3cf98432..f0bde8fbc870 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -397,10 +397,15 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
>  	bool
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
>  
> +config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
> +	bool
> +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0

This patch should come first in your series, because your PATCH 1/3
does this:

+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0

i.e PATCH 1/3 depends on PATCH 2/3.

Another thing that is missing in your series is another patch to add
the 5.0 kernel header selection to
toolchain/toolchain-external/toolchain-external-custom/Config.in.options.

Could you fix these two issues and resend ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
