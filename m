Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDA5C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:22:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FCC860F45
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FCC860F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECB1D401FD;
	Tue,  3 Aug 2021 21:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EGyr3KJc2fg6; Tue,  3 Aug 2021 21:22:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C908C40476;
	Tue,  3 Aug 2021 21:22:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 699601BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D7C040235
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FupmYeButHmG for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62CC64035F
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AD8BA8399D; Tue,  3 Aug 2021 21:09:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 18 May 2021 18:44:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b4c92bdda32e377b8f61ec3a5cf7f6bf78e3f48e
X-Git-Newrev: b84acf3f1d91aaa6f280bbb62cce04cb661ef0b2
X-Patchwork-Hint: ignore
Message-Id: <20210803210940.AD8BA8399D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rocksdb: bump to
 version 6.20.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=b84acf3f1d91aaa6f280bbb62cce04cb661ef0b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Refresh first patch
- Add BR2_PACKAGE_ROCKSDB_ARCH_SUPPORTS due to toku_time.h which has
  been added in version 6.16.3 by
  https://github.com/facebook/rocksdb/commit/98236fb10ecdbe6e7e8ef5cfb11e1f11dcb72f84
  and contains the following blob:

 #if defined(__x86_64__) || defined(__i386__)
  uint32_t lo, hi;
  __asm__ __volatile__("rdtsc" : "=a"(lo), "=d"(hi));
  return (uint64_t)hi << 32 | lo;
 #elif defined(__aarch64__)
  uint64_t result;
  __asm __volatile__("mrs %[rt], cntvct_el0" : [ rt ] "=r"(result));
  return result;
 #elif defined(__powerpc__)
  return __ppc_get_timebase();
 #else
 #error No timer implementation for this platform
 #endif

- Also drop second patch and disable build on powerpc as it seems that
  upstream is not really testing powerpc (patch not merged after more
  than one year + build failure with uclibc/musl only fixed on ppc64:
  https://github.com/facebook/rocksdb/commit/24b7ebee80ab282e073fd541d5b807d4a0bbbfab)

- Update hash of README.md (change not related to license:
  https://github.com/facebook/rocksdb/commit/f4ade82ad29790b1e0d99188e0b26e5b805c7243)

As a side effect, this will remove the autobuilder failures on arm,
powerpc and m68k

https://github.com/facebook/rocksdb/blob/v6.20.3/HISTORY.md

Fixes:
 - http://autobuild.buildroot.org/results/059ebe270e6e7c23e40060c4cf0112c4cd72b0e7
 - http://autobuild.buildroot.org/results/f007412f29ab2e03a6904e2f548e77654abde6de
 - http://autobuild.buildroot.org/results/83505f78fcb4d925779177411d830bea127b6800

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...d_tools-build_detect_platform-fix-C-tests.patch |   96 +-
 ...8-compatiblity-fix-CRC32-C-implementation.patch | 3787 --------------------
 package/rocksdb/Config.in                          |   10 +
 package/rocksdb/rocksdb.hash                       |    4 +-
 package/rocksdb/rocksdb.mk                         |    2 +-
 5 files changed, 61 insertions(+), 3838 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
