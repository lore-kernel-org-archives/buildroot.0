From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 May 2014 21:44:42 +0200
Subject: [Buildroot] [PATCH 1/1] fio: fix missing fallocate64()
In-Reply-To: <1399668168-4521-1-git-send-email-frank@frajasalo.de>
References: <1399668168-4521-1-git-send-email-frank@frajasalo.de>
Message-ID: <20140512214442.014f1eb5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Bergmann,

On Fri,  9 May 2014 22:42:48 +0200, Frank Bergmann wrote:

> +ifeq ($(BR2_nios2),y)
> +BR2_GLOBAL_PATCH_DIR += "board/common-nios2"
> +endif

Unfortunately, we don't want to have architecture-specific patches, and
not applied with this mechanism.

I believe the easiest solution is just to make the fio package not
available on NIOS II.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
