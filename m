From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 20 Feb 2008 07:28:55 +0100
Subject: [Buildroot] patch to allow selection of e2fsprogs tools to
	install
References: <20080220061811.GA8033@cloud.net.au>
Message-ID: <007d01c8738a$903f7ca0$f4031a0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


----- Original Message ----- 
From: "Hamish Moffatt" <hamish@cloud.net.au>
To: <buildroot@uclibc.org>
Sent: Wednesday, February 20, 2008 7:18 AM
Subject: [Buildroot] patch to allow selection of e2fsprogs tools to install


> Any objection to the following patch, which allows choice of which
> e2fsprogs tools to install (a la package/mtd and others)?
> 
> I wish there were a better way to write the makefile other than a ton of
> ifneq/endif lines. I suspect some sort of macro and $(call ..) could do
> it.
> 
> I only omit tools at install time, not build time. This allows you to
> build multiple projects with different tool selections if you wanted.
> Plus, e2fsprogs does not support disabling most tools at build time.
> 
> Hamish
>

Something similar to:

EF2FS_RM-$(strip $(BR2_PACKAGE_E2FSPROGS_BADBLOCKS)) += ${TARGET_DIR}/sbin/badblocks

for all configs should create a list of files to remove and another list of files to keep.

The "rm -rf" all files in the list 

Best Regards
Ulf Samuelsson
