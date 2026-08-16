Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D812C5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 11:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35BCE406BE;
	Sun, 16 Aug 2026 11:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8kU6v35c31W; Sun, 16 Aug 2026 11:37:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F1F1406C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786880233;
	bh=XwN2Vehi7uIWpOhwyI/wFyBpv6C37MJZlHQSBqQcyJc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pKdVnleYGKwFaE3Z90TOpwNpPTjyTVVMTGN6kgDpl4W5nZNG7L/3pKuBOkjran7Zu
	 81ZP9WEMu5AFEz61lRlBh6AyOyssBLR1Wizu8dzzxhhnH8xxuj3ivSG53KVKWq0Izx
	 DpI+/SeirBb8mLB2szdTfpsR4NAMic5ECwMkOufZbRgEDGMjugzTva/R9+zE+zCTnW
	 JdzKYGnFPq6FQzS0b+mYzyAnIuvbYFixksS6Q9ltfmQ0ZvJpKkBzCd92U09H2gjj+J
	 hRR2QjUH11/YMQLAyCd7o5GjRLXWQ1C8GjVSENbzs+F5TAWYd+y1JKQhImBExF148L
	 LiXRjAJzJPr6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F1F1406C0;
	Sun, 16 Aug 2026 11:37:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13899336
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 11:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE80B406BE
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 11:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DxpgJRaLJC2W for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 11:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22588406C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22588406C0
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 11:37:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F8B28DA7A; Sun, 16 Aug 2026 11:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 12:52:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c5039b80ebbe42db35af189afcff7fb7d5cace6
X-Git-Newrev: d3dbfb3de01470b5432cecadda76c569474854d9
X-Patchwork-Hint: ignore
Message-Id: <20260816113619.0F8B28DA7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: automatically enable uchar
 when wchar is enabled
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d3dbfb3de01470b5432cecadda76c569474854d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When wchar in uClibc is enabled, just enable uchar support, too.
Adds 5kb to the C library on aarch64. Makes the default uClibc
config more compatible to musl and glibc.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/uclibc/uclibc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index c19328e87a..beaa32e67f 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -365,6 +365,7 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
 UCLIBC_WCHAR_CONFIG = $(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_WCHAR)
+UCLIBC_UCHAR_CONFIG = $(call KCONFIG_ENABLE_OPT,UCLIBC_HAS_UCHAR)
 else
 UCLIBC_WCHAR_CONFIG = $(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_WCHAR)
 endif
@@ -431,6 +432,7 @@ define UCLIBC_KCONFIG_FIXUP_CMDS
 	$(UCLIBC_THREAD_DEBUG_CONFIG)
 	$(UCLIBC_LOCALE_CONFIG)
 	$(UCLIBC_WCHAR_CONFIG)
+	$(UCLIBC_UCHAR_CONFIG)
 	$(UCLIBC_SHARED_LIBS_CONFIG)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
