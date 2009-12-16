From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 16 Dec 2009 16:39:39 +0100
Subject: [Buildroot] [PATCH 31/39] mtd-utils: fix dependency on host
	package
In-Reply-To: <e99f7cacef6becaabed74c07bfe5a05f52830ddb.1260905467.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Tue, 15 Dec 2009 20:31:02 +0100")
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
	<cover.1260905467.git.thomas.petazzoni@free-electrons.com>
	<e99f7cacef6becaabed74c07bfe5a05f52830ddb.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87hbrr6i84.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

  Thomas> -$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked $(STAMP_DIR)/host_lzo_installed
 Thomas> +$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked host-lzo
 Thomas>  	CC="$(HOSTCC)" CROSS= LDFLAGS=-L$(HOST_DIR)/usr/lib \
 Thomas>  		$(MAKE) CFLAGS='-I$(HOST_DIR)/usr/include -I./include' \

Same issue as libusb. Having real targets (E.G. where work is done)
depend on phony targets is in general a no-no.

-- 
Bye, Peter Korsgaard
