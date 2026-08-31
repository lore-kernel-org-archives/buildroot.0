Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D480BC624A4
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 12:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C68F8405A6;
	Mon, 31 Aug 2026 12:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XxaX3wqPRjFm; Mon, 31 Aug 2026 12:51:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788180681;
	bh=PjPSmL937v8Oj3QplRsJtIrvge2nfkzHoJZRm6s5R8M=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=eqnWKakL8YEsPRavHv7z0XYEYFmrOqu/7STeLlyGyE5Z+ZNpW6vrj8LQLSW9g1572
	 k7JEdLttywtMff9Hn4Vyo8q9Rh6ZquIuODQoDs/7hejkJexr5NxjY0tRaKf48NLvRW
	 TcPRLKZs9tp2zKKSgYlYXagaN36s5Z60co709tn9GHN4fwL6/0z7TmYUmGsYim0NbK
	 nfLKpfKHHGsa3CIHFVpKiZCCn0Yg/Hhgo3Z31roQcw3qQX4R+9jeYm0PerHjEKRyv6
	 OBRTi+AI57GtbzowLDgiuqnHwz97okoH4AWDfBs6JQsid3n963f81o3Kq6Co3PQ93U
	 m6EvUwZR8uOJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 268AC40587;
	Mon, 31 Aug 2026 12:51:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA6BB23E
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 12:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91632400E2
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 12:51:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 87_je4wB6mIH for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 12:51:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E09F40071
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 12:51:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McpJq-1wSVwP14d8-00oMeM; Mon, 31
 Aug 2026 14:51:15 +0200
To: buildroot@buildroot.org
Cc: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Mon, 31 Aug 2026 14:51:01 +0200
Message-ID: <20260831125103.841338-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:mZ2lBw89DVqipgRs+Wt+mRxVrQ5NaxreHk/17LWrOs6Li12JQVo
 1ZJOx0AzX5V3DONz0mB9Bcv0wFqtwli7R7er0TLaPor/3t79kJfccxtOStI/O0pG+iYBAWK
 BlXsw9upC+m++IzehmCuYLwXc0xf/vLDIyG5NKNReeS6pdQ1BkZf3Baltj5wCcfDwKU6cKA
 Sq3s2/6kdN7VAo10HDmcw==
UI-OutboundReport: notjunk:1;M01:P0:boDRNGgF/Zo=;hnB2fgnlBTx3RNCqKjVuiZHdW73
 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
 dU=
Subject: [Buildroot] [PATCH next 1/3] fs/common.mk: add optional hook to
 build a verity hash tree
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Using dm-verity may be useful for any read-only filesystem read from a
block device, the new hook will build the required hash tree if
enabled by a per-filesystem config option.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
The change is small, but it's a new feature, so I assume it's for next.
;-)

 fs/common.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 2f3f8bcc7e..794423476d 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -215,6 +215,15 @@ TARGETS_ROOTFS += rootfs-$(1)
 PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_FINAL_RECURSIVE_DEPENDENCIES))
 endif
 
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_VERITY),y)
+ROOTFS_$(2)_DEPENDENCIES += host-cryptsetup
+define ROOTFS_$(2)_VERITY_FORMAT
+	@$$(call MESSAGE,"Generating verity hash tree $$(@F).verity")
+	$(HOST_DIR)/sbin/veritysetup format --root-hash-file $$@.verity.root-hash $$@ $$@.verity
+endef
+ROOTFS_$(2)_POST_GEN_HOOKS += ROOTFS_$(2)_VERITY_FORMAT
+endif
+
 # Check for legacy POST_TARGETS rules
 ifneq ($$(ROOTFS_$(2)_POST_TARGETS),)
 $$(error Filesystem $(1) uses post-target rules, which are no longer supported.\
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
