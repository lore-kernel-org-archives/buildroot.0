Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150DEC433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 18:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C88B83EE4;
	Thu,  2 Dec 2021 18:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ReksLVX9N_9N; Thu,  2 Dec 2021 18:59:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C703783EE0;
	Thu,  2 Dec 2021 18:59:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F2FB91BF20B
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 18:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E046D40A68
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 18:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GyyO05kbK0yI for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 18:59:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CF1E40010
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 18:59:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id AFFDF4000F;
 Thu,  2 Dec 2021 18:59:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1msrIj-0000LB-0S; Thu, 02 Dec 2021 19:59:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20211128131842.274555-1-texier.pj2@gmail.com>
Date: Thu, 02 Dec 2021 19:59:24 +0100
In-Reply-To: <20211128131842.274555-1-texier.pj2@gmail.com> (Pierre-Jean
 Texier's message of "Sun, 28 Nov 2021 14:18:42 +0100")
Message-ID: <87k0gmde9f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/genimage: bump to version 15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Pierre-Jean" == Pierre-Jean Texier <texier.pj2@gmail.com> writes:

 > This includes the following changes:
 > aa76b22 release version 15
 > dd49fec util: Fix warn_unused_result build warnings
 > 6ba2b4d image-hd: more error output when bootloaders overlap with the partition table
 > 90b83ba allow specifying 'holes' in the partition section
 > 09fde2e [ci skip] typo "used used fill" -> "used to fill"
 > b0d794c image-flash: don't ignore truncate errors except ENOENT
 > 93d1f26 .github: replace ubuntu-16.04 with ubuntu-18.04
 > 1e9b9be util: systemp(): don't use shell defined in SHELL, but GENIMAGE_SHELL
 > 1c53012 util: systemp(): use shell defined in SHELL rather than /bin/sh
 > 89490b9 image-android-sparse: use off_t instead of int for lseek return values
 > f1cab39 test: add tests for --includepath
 > 9e7f23a README.rst: reflow paragraph
 > 0778817 add --includepath option
 > e210857 config.c: remove redundant helper add_opt()
 > 18b3cfd config.c: allow hiding specific command line options from --help
 > 65548f6 config.c: remove unused member cmdlineopt
 > f606a33 util: remove unused pad_file function
 > 62e1d4f image-flash: use insert_image instead of pad_file
 > 8c0fe58 image-ext2: use insert_image instead of pad_file
 > 7d0003b util: insert_image: allow specifying the fill value
 > b847f3e image-hd: resize the image to the final size at the begining
 > 8e3bf8b test: hdimage: check the disk usage of the second image as well
 > e2bd4c3 test: handle new genext2fs and e2fsprogs versions
 > 06ac16e insert_image: fix read/write loop
 > 17e2c3c test: filter 'rauc info' output for newer distros
 > 1d72d80 image-hd: stricter option handling
 > d912549 image-hd.c: make GPT backup handling a little less special
 > 69f6644 add test for partitions out of order
 > 9190a2b image-hd.c: correct computation of first_usable_lba
 > 8505aed image-hd.c: switch to insert_image() instead of pad_file()
 > 5cc31c6 image-hd.c: truncate output file before looping over partitions
 > 2194e31 image-hd.c: replace use of pad_file() with extend_file()
 > 5638a9e util.c: add insert_image() helper
 > 8eef854 test: add tests for "bootloader with holes allowing some overlap"
 > a72ca69 image-hd.c: take image holes into consideration when checking for overlap
 > 564e359 document "file" image type and "hole" syntax in particular
 > 998a118 image-file.c: allow specifying "don't care" regions
 > 7f8f19d image-hd.c: fix missing check for overlap with GPT table
 > e91c8e2 image-hd.c: check all partitions for overlap
 > 44d5346 image-hd.c: allow partitions to appear out-of-order
 > cd3ceac image-hd.c: ensure an autoresize partition has a size consistent with its alignment
 > 0a61f64 README.rst: add description of how default align/size/offset are computed
 > efaae46 test: fix copy/paste error in the test refactoring
 > 086380a config: don't try to access non-existent section
 > fe74ea1 image-vfat: drop '-b' from mcopy
 > 7ef351d test: factor out some test data generation
 > 94af174 image-hd.c: fix extended partition with offset
 > 649602b image-hd.c: prepare for fake partitions
 > cc13e78 image-hd.c: don't sanity check partition_type_uuid for !part->in_partition_table
 > 5f53df3 image-hd.c: move overlap check below partition size determination
 > b77f38b image-hd.c: allow specifying minimum size for auto-resize partitions
 > 5f07c1c image-hd.c: do not require the autoresize partition to be specified last
 > 8269fa7 image-hd.c: enforce proper alignment of all partitions
 > 5bd7283 image-hd.c: ignore in-partition-table when the image has no partition table
 > 3e2b616 image-hd.c: always sanity check child->size v part->size
 > fa619fb image-hd.c: separate computation of part->offset from the sanity checks
 > 030e7a3 allow each partition to have its own align value
 > cf192fd image-hd.c: fix computation of autoresize size
 > d6c477c image-hd.c: don't lazily initialize now
 > 6cbbf86 README.rst: document default value of in-partition-table option
 > e43e02e test: add some tests for overlap of GPT
 > 11f3528 image-hd.c: refactor updating chs values
 > 8c74183 image-hd.c: add and use "struct mbr_tail"
 > 9ffd5e0 add macro for compile-time assertions
 > 9e59a27 change insert_data() to take const void* instead of const char*
 > bcd7fa6 util: strtoul_suffix: allow s suffix for sector size (512 bytes)
 > 41d77c4 image-hd.c: fix copy-pasto access of random memory
 > 5dc2e22 list.h: drop prefetch()
 > be29822 image-rauc: add intermediate option
 > 344416f util: add save string concat with formated string
 > 351d50e image-rauc: ensure clean-up on rauc_generate() exit
 > 5cba95c image-rauc: free keyringargs after use
 > 23adab0 image-ext: ensure size is always interpreted as kilobytes
 > 8014c7e .github: run apt-get update to update package cache

 > Signed-off-by: Pierre-Jean Texier <texier.pj2@gmail.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
