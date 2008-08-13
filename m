From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 13 Aug 2008 13:24:08 +1000
Subject: [Buildroot] [PATCH v2 1/1] openssl: convert
	to	Makefile.autotools.in and bump version to 0.9.8g
In-Reply-To: <1218542611-21908-1-git-send-email-hans-christian.egtvedt@atmel.com>
References: <1218542611-21908-1-git-send-email-hans-christian.egtvedt@atmel.com>
Message-ID: <20080813032408.GA1773@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 12, 2008 at 02:03:31PM +0200, Hans-Christian Egtvedt wrote:
> This patch converts building of OpenSSL to use Makefile.autotools.in and bumps

OpenSSL doesn't use autotools though, so is this a good idea?

> +$(OPENSSL_TARGET_CONFIGURE):
> +	(cd $(OPENSSL_DIR); \
> +		$(TARGET_CONFIGURE_ARGS) \
> +		$(TARGET_CONFIGURE_OPTS) \
> +		./Configure \
> +			linux-$(OPENSSL_TARGET_ARCH) \
> +			--prefix=/usr \
> +			--openssldir=/usr/lib/ssl \
> +			threads \
> +			shared \
> +			no-idea \
> +			no-mdc2 \
> +			no-rc5 \
> +			zlib-dynamic \
>  	)

Once you've overriden the CONFIGURE stage, is there much benefit left in
using Makefile.autotools.in?


cheers
Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
