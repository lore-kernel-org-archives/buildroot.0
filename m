From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Sep 2018 10:43:38 +0200
Subject: [Buildroot] [PATCH v2 1/3] leveldb: install memenv static
 library and header
In-Reply-To: <20180903072528.15744-2-gael.portay@savoirfairelinux.com>
References: <20180903072528.15744-1-gael.portay@savoirfairelinux.com>
 <20180903072528.15744-2-gael.portay@savoirfairelinux.com>
Message-ID: <20180903104338.54d7b1d5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Sep 2018 03:25:26 -0400, Ga?l PORTAY wrote:

> +ifdef BR2_PACKAGE_LEVELDB_MEMENV

Too much vacations here! :-) You have forgotten how Buildroot does this
normally:

ifeq ($(BR2_PACKAGE_LEVELDB_MEMENV),y)

> +define LEVELDB_INSTALL_MEMENV
> +	$(INSTALL) -m 0644 $(@D)/out-static/libmemenv.a $(STAGING_DIR)/usr/lib

-D option and full destination path please.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
