Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FB8C5475B
	for <buildroot@archiver.kernel.org>; Mon, 11 Mar 2024 18:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88E454034E;
	Mon, 11 Mar 2024 18:30:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LFjAxnVmtKBj; Mon, 11 Mar 2024 18:30:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D13340356
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D13340356;
	Mon, 11 Mar 2024 18:30:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C8731BF38E
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 18:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6942A60035
 for <buildroot@lists.busybox.net>; Mon, 11 Mar 2024 18:30:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M5VmEt_JL8LJ for <buildroot@lists.busybox.net>;
 Mon, 11 Mar 2024 18:30:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3AA9E6086F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AA9E6086F
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AA9E6086F
 for <buildroot@buildroot.org>; Mon, 11 Mar 2024 18:29:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E84960007;
 Mon, 11 Mar 2024 18:29:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rjkPM-0094Mw-2i;
 Mon, 11 Mar 2024 19:29:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
References: <20240211222706.2959549-1-thomas.petazzoni@bootlin.com>
 <82397d49-8d5a-4349-aef5-50e83e5a9b40@bubu1.eu>
Date: Mon, 11 Mar 2024 19:29:56 +0100
In-Reply-To: <82397d49-8d5a-4349-aef5-50e83e5a9b40@bubu1.eu> (Marcus Hoffmann
 via buildroot's message of "Mon, 19 Feb 2024 15:52:19 +0100")
Message-ID: <87wmq8sjtn.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/util-linux: bump to version 2.39.3
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
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Marcus" == Marcus Hoffmann via buildroot <buildroot@buildroot.org> writes:

 > Hi Thomas,
 > On 11.02.24 23:27, Thomas Petazzoni via buildroot wrote:
 >> Changes between 2.39.2 and 2.39.3:
 >> 2da5c904e18fdcffd2b252d641e6f76374c7b406 build-sys: release++
 >> (v2.39.3)
 >> 03c939edda81c5a4d6e5f5c1cb896e79c1e82e16 docs: update v2.39.3-ReleaseNotes
 >> dafb120ef79c878cfd1b65c1d1c46497f17a7f7e docs: update AUTHORS file
 >> bfc9691ce5d964b87f6c02cc236361b4772456d0 po-man: merge changes
 >> d2232b60963a6e4e43fd359d1a4b552c4291b327 po: merge changes
 >> 4ab356c1c02c34cd3935e1bb0aa47ed6e27cfe3c po: add ro.po (from translationproject.org)
 >> 7e147d16c06f14b3f760b620d4f359cef12fe4ad po: update es.po (from translationproject.org)
 >> e8cb61f07430d5f1d624245a219c2e21694c5f52 lsfd: fix memory leak in append_filter_expr()
 >> 192d8aaa07e088e44fcb78736a53baae1ead7ccd lsfd: avoid undefined behavior
 >> 756588f8c8b2ed93c124ca15cfb3f0efc4a0f9f6 lsfd: (man) fix the form for the optional argument of --inet option
 >> 8d78c1306d1a9d5ebf9ec058344685da0360b87b Add Phytium FTC310 & FTC664 support
 >> b75322cdb13c6c0b3789ff8fc19dcd017c069784 Add Phytium FTC862 cpu model. fix:#2486
 >> ec1b0eb36bd6c5a5079293ab03241163f61a8bf4 libmount: accept '\' as escape for options separator
 >> 2e5f5c8d85338811595d321a77647a40e12321c9 tests: add ts_skip_docker
 >> 0b3254cac3a275bbe32af57c6037cd29c21324d7 Merge branch
 >> 'stable-2.39/bcachefs-fixes' of https://github.com/t-8ch/util-linux
 >> into PR/stable-v2.39.3
 >> 6498439340a16e6acee54987df016c6b7928b17a tests: skip broken tests on docker
 >> fa9b5365861934faab9ba73bd405095f56f02e45 libblkid: (bcachefs) add support for sub-device labels
 >> 3c5d991b0323b33816e661e52da5d6f5402f47b5 libblkid: (bcachefs) adapt to major.minor version
 >> ece194082fb318d0fa3fec31193ce6f61b97c67a libuuid: avoid truncate clocks.txt to improve performance
 >> 84a62c1a5a614bde2530544bf2558c73f0179d42 libuuid/src/gen_uuid.c: fix cs_min declaration
 >> 93239aa7869ddd236db8e5a28b4e6873ce6e0f22 libmount: fix possible NULL dereference [coverity scan]
 >> a6def815e21d50db7a99ec74080c3fd7eb64e934 meson: install wall executable with group 'tty'
 >> c6c1c69c3e83606eced938d841af03c1acef03a0 meson: install write executable with group 'tty'
 >> bf2cd1d5a6eb273fbb11931b86ae165e7da5a397 libmount: improve mnt_table_next_child_fs()
 >> c14f5bf37adf681c378fc004f0996e0bcfd30ce0 docs: add SPDX to boilerplate.c
 >> fdd9f11f5e38b044617d3bc5f6c00789096b233f disk-utils: add SPDX and Copyright notices
 >> e7dbe9c788da98b86f8cf87bc20ec74e32206451 include/audit-arch: add missing SPDX
 >> 5ec7b14a72d9893d2a8d8c7f40cd45b44c9575c9 setterm: avoid restoring flags from uninitialized memory
 >> 64d2300e6443c311219f187433046751a86ed18e Fix man page for col to correct documentation error
 >> 7cc2c962567fe40daa9b12481224e5a0e6f96c47 Update col.c to fix option mistake
 >> 122d7e7afb44d8a823e362673b0d2d1e31f7d478 umount: handle bindmounts during --recursive
 >> da18b31ff1cb504e3d288f77d1f1d1179c39e4d8 lscpu: fix caches separator for --parse=<list>
 >> 3a5c9c1dd6935fb16f15f210b80ce9c5228e6a19 Use empty libuser config file.
 >> 7058d793def09c3d4645e9efd1d8a5d212e839b0 libblkid: exfat: fix fail to find volume label
 >> d065ff00a36b7244842f743372099837bc61328b blkpr: store return value of getopt_long in int
 >> 9ca6f1712a5803e32e26e065e32e99837ba8b5d2 lib/path: Set errno in case of fgets failure
 >> e2f0aa5c25c0295ef6187d3c53c2801fe17385e5 autotools: fix AC_DEFINE_UNQUOTED() use
 >> cefd05c479e5456af8db2a86fabad165d247176b autotools: fix librtas check
 >> f27fbafb24bdcefaa2463d47abc18491c3497451 lib/path: fix typos
 >> f8ab70477e2ca7ac050fd4e2337b76a1972c8aa3 lib/path: set errno in case of error
 >> 5ec30a362a5dd91c018c04a64fd1a481029dc4c6 lib/path: fix possible out of boundary access
 >> edc723cd3341ff3d3e660051525dca40a2af6b3b libblkid: reset errno before calling probefuncs
 >> 8de89778b945d552796f09576925310810ce798b setpriv: fix group argument completion
 >> 41599054c7248f12c8a54d02f7161d0aff4275a9 libfdisk: reset errno before calling read()
 >> cce4e44059405f3170b166fbf1774bf4b89c11c4 blkid: fix call to err_exclusive_options
 >> b718f985cb6cc3bc65618649e9f231ecafcf81fb docs: use HTTPS for GitHub clone URLs
 >> 2bddfa6928af328675b2ffbfc9b6546e9ee81722 libblkid: (probe) handle probe without chain gracefully
 >> 3d31216787d6725fed361d27f0f01aff6ef46981 lib/idcache: always gracefully handle null cache
 >> 368521e45e1c9cb44145fc72c04d1cc903a883e8 script-playutils: close filestream in case ignore_line() fails
 >> 087b0d2383b8ab1ee4564d692d5f797ac781896f libblkid: (vxfs) report endianness
 >> 7e5056f33bdfd867ce6f1a642f560fdf0b402c1e libblkid: (ntfs) validate that sector_size is a power of two
 >> f368ccc759f9684338da723a93449764d0a8e312 libsmartcols: handle nameless tables in export format
 >> f5cace8da07291c94b76b5cf80da1f921be67419 ldattach: don't call exit() from signal handler
 >> 03c12a34c58d2550c6c718275950866d387d33f5 lslogins: fix realloc() loop allocation size
 >> 83ba179b12d3c6c5f400bf78f2f742b1cc7ce256 lib/env: avoid underflow of read_all_alloc() return value
 >> 813851fba28cb3ecde6a7f0c90a7e343920cd8c7 libblkid: avoid memory leak of cachefile path
 >> 4459623cde42a5d021a6d71e38fcdfd4fff3e171 libmount: gracefully handle NULL path in mnt_resolve_target()
 >> dbde7a537f27b23d64a8d3f583af472357de7192 more: avoid out-of-bound access
 >> c26badd5d4295d52e987c75e69113edfb407fb27 libfdisk: handle allocation failure in fdisk_new_partition
 >> 5c250aa6425fc3e35c07bce019eb4b7fa34bf722 login: Use pid_t for child_pid
 >> be3f1712ee2e1e43d9b82b7cf4987c8a609a81ef login: move comment
 >> 98be90b5bafa66d98655f8639efb3ffa984fc530 build-sys: fix libmount/src/hooks.c use
 >> a711af02d32c0a0a31f1bbb943ffff2e94203e86 lscpu: Use 4K buffer size instead of BUFSIZ
 >> 45c6136cba5f7607cca08c5aaab8e9b22ef87c25 autotools: fix typos
 >> aa98c4ecc938a3459ffb759a444a8a585a9d0a3a libmount: make.stx_mnt_id use more robust
 >> c697c2bb69f55aa24b6c0e2e752548f823c53796 libmount: report statx in features list
 >> 13711f3ab79dfa92e8815eb9b752ec2bf4832d80 libmount: fix statx() includes
 >> e9ed5a2b80bf8a76924caf8cd93b4cfff4d210a7 libblkid: (vfat) avoid modifying shared buffer
 >> d2cadf0992cce589bfffeb603325c3c2fe54a991 libblkid: (jmicron_raid) use checksum APIs
 >> c54c99efd0c3fc7f1e8db8b7191a6e1e3b295f1f libblkid: (jmicron_raid) avoid modifying shared buffer
 >> 64418c52bc594abf01fc4ae8148e7aa93e4b3f22 libblkid: (zonefs) avoid modifying shared buffer
 >> b66da7ce4a04d6c960817a56fe82498c4e7dea44 losetup: fix JSON MAJ:MIN
 >> 44d7bf2c8d1c6d34a40416807d16db6c07ac4916 lslogins: (man) fix -y option formatting
 >> 7d6c71e51ed3c5f8505c67962b6d03490738a879 include: add DragonFlyBSD GPT partition types
 >> 6b9fda87c4e5d0c6f945d7565197f157b9fa3d5f libblkid: (bcachefs) fix size validation
 >> acbf17ae8f8ee0f941fe98ed12f115f2b349bba8 libblkid: (bcachefs) fix compiler warning [-Werror=sign-compare]
 >> 1ec71634aa4ef5ddca23d65c8a296f3614231e8a libblkid: (bcachefs) fix not detecting large superblocks
 >> 68564ebb50f8afab5a9527c534417e247cca0b27 libmount: Fix regression when mounting with atime
 >> We can drop 0001-libuuid-src-gen_uuid.c-fix-cs_min-declaration.patch
 >> as it was backported by upstream to the 2.39.x branch, and included in
 >> 2.39.3.
 >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 >> ---
 >> ...rc-gen_uuid.c-fix-cs_min-declaration.patch | 80 -------------------
 >> package/util-linux/util-linux.hash            |  2 +-
 >> package/util-linux/util-linux.mk              |  2 +-
 >> 3 files changed, 2 insertions(+), 82 deletions(-)
 >> delete mode 100644 package/util-linux/0001-libuuid-src-gen_uuid.c-fix-cs_min-declaration.patch
 >> diff --git
 >> a/package/util-linux/0001-libuuid-src-gen_uuid.c-fix-cs_min-declaration.patch
 >> b/package/util-linux/0001-libuuid-src-gen_uuid.c-fix-cs_min-declaration.patch
 >> deleted file mode 100644
 >> index bba4d54619..0000000000
 >> --- a/package/util-linux/0001-libuuid-src-gen_uuid.c-fix-cs_min-declaration.patch
 >> +++ /dev/null
 >> @@ -1,80 +0,0 @@
 >> -From bcd11dece7d278bb0b76b138d08dedea80fa8262 Mon Sep 17 00:00:00 2001
 >> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> -Date: Tue, 7 Nov 2023 18:43:57 +0100
 >> -Subject: [PATCH] libuuid/src/gen_uuid.c: fix cs_min declaration
 >> -
 >> -Define cs_min through a define and not a const int to avoid the
 >> -following build failure with -O0 raised since version 2.39 and
 >> -https://github.com/util-linux/util-linux/commit/2fa4168c8bc9d5438bc1dfadda293c7c21b6fa59:
 >> -
 >> -libuuid/src/gen_uuid.c: In function 'uuid_generate_time_generic':
 >> -libuuid/src/gen_uuid.c:536:33: error: initializer element is not constant
 >> -  THREAD_LOCAL int  cache_size = cs_min;
 >> -                                 ^~~~~~
 >> -
 >> -For consistency, also use define for cs_max and cs_factor
 >> -
 >> -Fixes:
 >> - - http://autobuild.buildroot.org/results/2f80a5cdb523cc3c8c0f3693607a1be036b2ae98
 >> -
 >> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> -Upstream: https://github.com/util-linux/util-linux/commit/07e5c29d501c19e7af84fecb5915e0f9f94cb49f
 >> ----
 >> - libuuid/src/gen_uuid.c | 19 ++++++++++---------
 >> - 1 file changed, 10 insertions(+), 9 deletions(-)
 >> -
 >> -diff --git a/libuuid/src/gen_uuid.c b/libuuid/src/gen_uuid.c
 >> -index 619ef0131..db793c374 100644
 >> ---- a/libuuid/src/gen_uuid.c
 >> -+++ b/libuuid/src/gen_uuid.c
 >> -@@ -518,6 +518,10 @@ int __uuid_generate_time_cont(uuid_t out, int *num, uint32_t cont_offset)
 >> - 	return __uuid_generate_time_internal(out, num, cont_offset);
 >> - }
 >> -
 >> -+#define CS_MIN		(1<<6)
 >> -+#define CS_MAX		(1<<18)
 >> -+#define CS_FACTOR	2
 >> -+
 >> - /*
 >> -  * Generate time-based UUID and store it to @out
 >> -  *
 >> -@@ -529,11 +533,8 @@ int __uuid_generate_time_cont(uuid_t out, int *num, uint32_t cont_offset)
 >> - static int uuid_generate_time_generic(uuid_t out) {
 >> - #ifdef HAVE_TLS
 >> - 	/* thread local cache for uuidd based requests */
 >> --	const int			cs_min = (1<<6);
 >> --	const int			cs_max = (1<<18);
 >> --	const int			cs_factor = 2;
 >> - 	THREAD_LOCAL int		num = 0;
 >> --	THREAD_LOCAL int		cache_size = cs_min;
 >> -+	THREAD_LOCAL int		cache_size = CS_MIN;
 >> - 	THREAD_LOCAL int		last_used = 0;
 >> - 	THREAD_LOCAL struct uuid	uu;
 >> - 	THREAD_LOCAL time_t		last_time = 0;
 >> -@@ -552,10 +553,10 @@ static int uuid_generate_time_generic(uuid_t out) {
 >> - 		 * Start with a small cache size to cover short running applications
 >> - 		 * and adjust the cache size over the runntime.
 >> - 		 */
 >> --		if ((last_used == cache_size) && (cache_size < cs_max))
 >> --			cache_size *= cs_factor;
 >> --		else if ((last_used < (cache_size / cs_factor)) && (cache_size > cs_min))
 >> --			cache_size /= cs_factor;
 >> -+		if ((last_used == cache_size) && (cache_size < CS_MAX))
 >> -+			cache_size *= CS_FACTOR;
 >> -+		else if ((last_used < (cache_size / CS_FACTOR)) && (cache_size > CS_MIN))
 >> -+			cache_size /= CS_FACTOR;
 >> -
 >> - 		num = cache_size;
 >> -
 >> -@@ -568,7 +569,7 @@ static int uuid_generate_time_generic(uuid_t out) {
 >> - 		}
 >> - 		/* request to daemon failed, reset cache */
 >> - 		num = 0;
 >> --		cache_size = cs_min;
 >> -+		cache_size = CS_MIN;
 >> - 	}
 >> - 	if (num > 0) { /* serve uuid from cache */
 >> - 		uu.time_low++;
 >> ---
 >> -2.43.0
 >> -
 >> diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
 >> index 1638cd9967..480f82d751 100644
 >> --- a/package/util-linux/util-linux.hash
 >> +++ b/package/util-linux/util-linux.hash
 >> @@ -1,5 +1,5 @@
 >> # From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.39/sha256sums.asc
 >> -sha256  87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f  util-linux-2.39.2.tar.xz
 >> +sha256  7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f  util-linux-2.39.3.tar.xz
 >> # License files, locally calculated
 >> sha256  64dfeae1519bf0e27563d905a71264310fb6a8fa74e5cf99bb36e4d30d7ef455  README.licensing

 > This fails make legal-info now:

 >>>> util-linux 2.39.3 Collecting legal info
 > ERROR: README.licensing has wrong sha256 hash:
 > ERROR: expected:
 > 64dfeae1519bf0e27563d905a71264310fb6a8fa74e5cf99bb36e4d30d7ef455
 > ERROR: got     :
 > 13f0ea46d12d798c095a6ad39d7ddc988e2e4d274c6494115f6b463f7bc4f702
 > ERROR: Incomplete download, or man-in-the-middle (MITM) attack


 > Likely due to
 > https://github.com/util-linux/util-linux/commit/fdd9f11f5e38b044617d3bc5f6c00789096b233f

 > Which as far as I read it doesn't change any licensing but clarifies
 > in the top level license readme that part of the code base (fdisk.c)
 > is GPL-1.0-or-later licensed which wasn't mentioned before. The file
 > in question already had correct license information before.

Agreed. Committed with that fixed and added an autobuilder fix line, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
