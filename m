Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA84C5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 22:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EF4A80DA2;
	Sun, 16 Aug 2026 22:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1N7p_EmeQjDd; Sun, 16 Aug 2026 22:20:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB35280D93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786918833;
	bh=zuE0EzmgaG3k7nvhyZRXdDbuNjpwPr0zAW/Ozh2dbA8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qryWprRixj3oBHnAzbTF7V9/1sIrrWJSG0fPD0Q9HvN/1163hUYST/+aasiNxi3Q9
	 KDHIG4vUi9Rn4XtEtql/cALuI+uebIGBUcMXIXyo4EJfcfQZU+w3vJUCS0EOTVi59N
	 MAvUBm4LFUVHRfzFyPd3uVCJW7+mULiDM9tPVR7DwI9ouXYE1Dzz5/zBBWSW0TJxnW
	 yF3Eyvsfot1Zsb5xY2aeq9prUgtIoKNYrDinEAlNI8TPfRiSclCEi6tTIm2us0ko3v
	 LoHv1cVDX8DeQUfKU1VErT6fsKAQx9SJhjXDwaOmyeOn9HYHu9nUhUcplRYD3wT9IY
	 c8oeSCtfJlZ6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB35280D93;
	Sun, 16 Aug 2026 22:20:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FEB14CD
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 558994066E
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wb2OfpAaw5UY for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 22:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1BE5405B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1BE5405B7
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:20:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6452F8DAC6; Sun, 16 Aug 2026 22:19:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 23:49:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ac19958f25a58df65b991ec1d7fa80b34f19eb0
X-Git-Newrev: d7acf1235564c48881eda9ac53a4abbfa9508f8c
X-Patchwork-Hint: ignore
Message-Id: <20260816221939.6452F8DAC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/containerd: security bump version
 to 2.0.11
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d7acf1235564c48881eda9ac53a4abbfa9508f8c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/containerd/containerd/releases/tag/v2.0.11

https://github.com/containerd/containerd/releases/tag/v2.0.10
Fixes CVE-2026-47262 & CVE-2026-53488.

https://github.com/containerd/containerd/releases/tag/v2.0.9
Fixes CVE-2026-46680.

https://github.com/containerd/containerd/releases/tag/v2.0.8
Fixes CVE-2026-35469.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 0916c603bb..410e5d61e1 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  2bbf9fedcf4ab31736fcb3ce224ef22610a87da9d53bbd8f6d205710fd849831  containerd-2.0.7-go2.tar.gz
+sha256  eadaa5301c0f633f6fed6a3b22f5cf4343ac522401ad2e84bb3299f811a35976  containerd-2.0.11-go2.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index a334f0fdac..4a3a371ee4 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 2.0.7
+CONTAINERD_VERSION = 2.0.11
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
