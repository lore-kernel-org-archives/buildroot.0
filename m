Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080FFCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 14:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6A3542EC9;
	Sat, 30 May 2026 14:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fbNYoWu1graj; Sat, 30 May 2026 14:55:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C21C42C79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780152959;
	bh=qSHMyPIcOeB42zAV8qtculuES0EhrVdMluYbCgcrQrY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=brAsqLpHzvV0xm9SYToLP+rpaHU+MxYgzfpGHdHneuI/a84sI/v6eORH9pc1VNmK2
	 VXrchJ28Bx3W/96KzyM+/LKWv9qUi81C2igUAqxKbPaQ7AmXhf/RIVXRIfUKXOcccH
	 NVp0GWFHTDAEmCnbqOJNOtYNCeUzn0xQmG9QMxn1Df1jWZe2ol/Qn8yddBcc06YofY
	 HVPKnWfrr7nMEAiVe2fHXRogUt+Rm3ojmMtsp6TZvi6LWGw1uf7KRp7JTarCAX7cqo
	 5bB9yEAK8HeengkPjCH82VWbade0QSGUUcPAKE/IgpQtJ84pEP1ImB2UguFQqLvDbB
	 LS+KJ/oqL6X/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C21C42C79;
	Sat, 30 May 2026 14:55:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F25C9D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:55:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E421285305
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 26b2yafT8Ze6 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 14:55:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 168F0852E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 168F0852E0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 14:55:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 104208750A; Sat, 30 May 2026 14:55:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 16:55:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a3c6c0cbad95f03dc031b1effdff414bb2525493
X-Git-Newrev: 9874899101ee9b7436296841d03cb8e0940c5d7c
X-Patchwork-Hint: ignore
Message-Id: <20260530145544.104208750A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/xmrig: bump version to
 6.26.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9874899101ee9b7436296841d03cb8e0940c5d7c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/xmrig/xmrig/blob/v6.26.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xmrig/xmrig.hash | 2 +-
 package/xmrig/xmrig.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xmrig/xmrig.hash b/package/xmrig/xmrig.hash
index 5aa1630b14..b06e5e7ba6 100644
--- a/package/xmrig/xmrig.hash
+++ b/package/xmrig/xmrig.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  55e415792f2a4ef2430cb26829b0b7d96fc52f51c6274831e9fe76b8aef28593  xmrig-6.25.0.tar.gz
+sha256  5005144e78571f26586410c2b2ede2b0c72afe22f97f1708ea24cfb253c3939b  xmrig-6.26.0.tar.gz
 sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  LICENSE
diff --git a/package/xmrig/xmrig.mk b/package/xmrig/xmrig.mk
index bfd2a98e12..ec493c335a 100644
--- a/package/xmrig/xmrig.mk
+++ b/package/xmrig/xmrig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XMRIG_VERSION = 6.25.0
+XMRIG_VERSION = 6.26.0
 XMRIG_SITE = $(call github,xmrig,xmrig,v$(XMRIG_VERSION))
 XMRIG_LICENSE = GPL-3.0+
 XMRIG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
