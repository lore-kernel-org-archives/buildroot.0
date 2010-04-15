From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 15 Apr 2010 14:03:27 +0200
Subject: [Buildroot] [PATCH] mtd: mkfs.jffs2 requires zlib to build
In-Reply-To: <1271283866-21577-1-git-send-email-will_wagner@carallon.com>
	(Will Wagner's message of "Wed, 14 Apr 2010 23:24:26 +0100")
References: <1271283866-21577-1-git-send-email-will_wagner@carallon.com>
Message-ID: <877ho8exdc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Wagner <will_wagner@carallon.com> writes:

 Will> Signed-off-by: Will Wagner <will_wagner@carallon.com>
 Will> ---
 Will>  package/mtd/mtd.mk |    3 +++
 Will>  1 files changed, 3 insertions(+), 0 deletions(-)

 Will> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
 Will> index 5a449f2..3f6d894 100644
 Will> --- a/package/mtd/mtd.mk
 Will> +++ b/package/mtd/mtd.mk
 Will> @@ -6,6 +6,9 @@
 Will>  MTD_VERSION:=1.3.1
 Will>  MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.bz2
 Will>  MTD_SITE:=ftp://ftp.infradead.org/pub/mtd-utils
 Will> +ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
 Will> +MTD_DEPENDENCIES = zlib
 Will> +endif

Thanks, committed - It needs lzo as well, but I fixed that here.

-- 
Bye, Peter Korsgaard
