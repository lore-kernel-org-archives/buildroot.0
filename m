Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC66C5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B25781174;
	Fri, 31 Jul 2026 11:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BfBqBWKxI999; Fri, 31 Jul 2026 11:57:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74EF381182
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499029;
	bh=93jcnAjv8NvL48IRljN2yNhNPgdIPnS7OKwPXqxU/TA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pz0/Bns5tgEweImhsDCPO/xEgY0cN0UV66cKah07+QosAal5CZ/g6JAGtw+iD3xpp
	 f+M+IMo2LRFVCZ9DioRhpIpqMZEEd2WHK8xBiNWB58nYtEGFRDTlq4C6ZAjOfECu+7
	 dXav65cpjo/3I8HLyqtRkX3VkA/nKFhMsknSM91PVsSEhwPbCykU7LLakaVUe+P8Gd
	 oFgSjJgFMeic4f98Za5wPR6dQDfLhDgsBqT2k8HqEWJvPgsXKJs7OjiHtlhrKORwoW
	 icfAbZA9I0DIuDMcoAAvrMqf+boScG3+S5gzYrozWHLBG3TKGZze8rLgT6EK07zCR7
	 KynTt7zzKiIPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74EF381182;
	Fri, 31 Jul 2026 11:57:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1505969
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDC27810A8
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwXxyJbh47Xq for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:56:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF146810AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF146810AA
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C10EF8B743; Fri, 31 Jul 2026 11:56:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 12:19:08 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: f2384338cd9ea3a559c5f9a81cc3a0de3f349aa7
X-Git-Newrev: c1b826e803a78c06ca4c15a18bab9276dd4454aa
X-Patchwork-Hint: ignore
Message-Id: <20260731115605.C10EF8B743@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/ifupdown-scripts:
 add license info
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c1b826e803a78c06ca4c15a18bab9276dd4454aa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

The package is part of Buildroot and thus under GPL-2.0-or-later
unless stated otherwise, as described in COPYING.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9b8a2d86336d8755730da741c59de72708c52653)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ifupdown-scripts/ifupdown-scripts.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
index 5ef032142c..d7d5244ffc 100644
--- a/package/ifupdown-scripts/ifupdown-scripts.mk
+++ b/package/ifupdown-scripts/ifupdown-scripts.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+IFUPDOWN_SCRIPTS_LICENSE = GPL-2.0-or-later
+
 define IFUPDOWN_SCRIPTS_PREAMBLE
 	echo "# interface file auto-generated by buildroot" \
 		> $(TARGET_DIR)/etc/network/interfaces
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
