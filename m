From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Feb 2018 14:38:29 +0100
Subject: [Buildroot] [PATCH] autofs: allow to use libtirpc
In-Reply-To: <20180201200904.GA18467@waldemar-brodkorb.de>
References: <20180201200904.GA18467@waldemar-brodkorb.de>
Message-ID: <20180206143829.6f639dc6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 1 Feb 2018 21:09:04 +0100, Waldemar Brodkorb wrote:
> uClibc-ng removed internal RPC implementation as it
> is ipv4 only and can not be used for most important RPC software
> rpcbind and nfs-utils.
> musl does not implement RPC and GNU C library deprecated the
> internal implementation a while ago.
> It is still possible to use the C library implementation.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to next, with a change. See below.

> +ifeq ($(BR2_TOOLCHAIN_HAS_NATIVE_RPC),)

I've changed this to BR2_PACKAGE_LIBTIRPC=y, so that it gets used
whenever available, not only when the C library lacks RPC. We do this
in other packages, so I changed it for consistency.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
