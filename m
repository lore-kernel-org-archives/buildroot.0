Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6944FC32793
	for <buildroot@archiver.kernel.org>; Wed, 18 Jan 2023 21:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E809740B9A;
	Wed, 18 Jan 2023 21:35:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E809740B9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aqIe2LI_L66H; Wed, 18 Jan 2023 21:35:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C81D40B64;
	Wed, 18 Jan 2023 21:35:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C81D40B64
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FF721BF308
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 21:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B46C60FF3
 for <buildroot@lists.busybox.net>; Wed, 18 Jan 2023 21:35:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B46C60FF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9V4dOv7v3mZa for <buildroot@lists.busybox.net>;
 Wed, 18 Jan 2023 21:35:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E89760AC3
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E89760AC3
 for <buildroot@buildroot.org>; Wed, 18 Jan 2023 21:35:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.20]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRCKC-1p66U60JKm-00NDsg; Wed, 18
 Jan 2023 22:35:18 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed, 18 Jan 2023 22:35:17 +0100
Message-Id: <20230118213517.5946-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZabZuAeSgOoXUABnWBitVaiaNl9LbEwtiYucY3vUS0+Ux2a+cnC
 /8ATfBQmMKCnYrBBj4N58wlitR8nrfFFNwcAN6EmACclYlLHUUxpLKdsSvcXaZa3INMnbjQ
 l7YDGF0jM6YmC5IYSOYAwfwRSbEUUCTu4gXh+abJXN1GHqXP/OaIIfywptAEai2Qm5r6ZuI
 sgzhKZnOjEWtF/MmQUixQ==
UI-OutboundReport: notjunk:1;M01:P0:6rgeHWqY+Zg=;ptq3NrIC0CxfIlf3g6WET1fR+ha
 FCg2Pn1SR2/aOe02/vXMC+oW62LB/kYzNzPhYKuecy2BNrxbUyYlHOK7NXqgTVoYyOb1R8/4g
 9BQbUJdRXX6qPxL78MIMcteoBv1jX9XvrBYbKyDxYxA+hfyLNvXlvfyR0pWNrPlElARGyeBc/
 rxPjxhynmp6Ct7ufuGN00NXHoV2vU1+MVFpqWBJELb9dFBh60m6oUugy1WKrDzixPLTcjtzZR
 knrck34B8hrMwB1tlSeqiLBHuil4teKfz0WnBCeFKGGUoqqsiZxzfv+ZwhazvvVHppkn4i0uP
 +UxVly9RHkSQVRGV92pp/gq4UgMWa4+scHWweNx9QkNNz7pfCLsq+NgXzgQiG1MOCkg7L8vSr
 b0J6r0XPfeSJkgaETFJ6TBr3bOTP7AkwAcTzscnfbJ9JTGq4K8aHu1hs7Bpzgp4mbY5KDrOx9
 xFp117EkdSKTBoSACJWCjfWDz5ZOCAFBhxojhbkT82mryGKUYnSqZi5BcjI2w/ID1knUu8CJk
 1ntuoQvDec2N/F7JF4+RhjqNSxz9yLqoWEUTbtQXBidGTdplupN88n7fHEu324A/KBR+P1bS2
 7jBxlBenrk0myQs22pEsNuqcJaeY4/bO4fHS6C8y8mGKM25POE9RF1QogAE/1P+7dfipUvFvB
 i0uUFg57GH54rv8UP7uwK3l9OrERKcfnDNzQSZmaWCwGDCszc3WNhOrctrFJnkP1LEFt13Kzg
 UVcAG3hTFHxEE54Pax0ziaRiu5Nq4C8lvTilcijMoc50wLhJxm87QqylSqIGFOZXUN5RMtb5B
 442s4lkI8ka4SaiSHvIiLvsWcIkICynpRyTww9QdZKOk8mQdGL2tQsdWnzdnd1qj0ROtDAl8m
 9gnOv3gCD/wKdv1XUDPhxkb32+9+OlnQ5zuRbrPffX6ZrbgNGbGmFpLWYWgLxjAHoJC53+1WI
 a3PpC7aApT7Z/txnI5uEHmiwQ7M=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1674077718; bh=T1Bo/ONTAlwDkFbbYv5DFuAtN0DPlevAp6eXMcvUz/w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=SHN81BXtIlgHLUmYCIg8Qb/yiBfcgk5Ua9EyPqb+01lsESzeYqTVwSkXb5btixXaR
 COgffoQkesjRw4BVyFptJ2alGb6ojAOtIcJqdvvMIEL6ZYFwTw1tLWOsqchL0mB3bO
 EooWgtzj0/WuOg5tt79BwU7g5DOg8woK2tvNPPEEhem2BaEpIg21rLjWqMZkVSn9D2
 jnYjYPUeg/Y9bYk+z9+PrzO7C6eyQ1ublhRGo2ycFkEq/AlRD0lAfQ9Bc3Lhhtsdsg
 qRqvhES3NL0NKxohaFByhp3SVoT2wb5tuL3BXWeYxY089JdTSlHaEfephy06b+ZBZP
 YWnZTW8rCVzbg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=SHN81BXt
Subject: [Buildroot] [PATCH v1] package/git: bump version to 2.39.1
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- fixes CVE-2022-41903 and CVE-2022-23521

For details see [1].

[1] https://lore.kernel.org/git/xmqq7cxl9h0i.fsf@gitster.g/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index 57a77b2810..75398896e5 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  ba199b13fb5a99ca3dec917b0bd736bc0eb5a9df87737d435eddfdf10d69265b  git-2.39.0.tar.xz
+sha256  40a38a0847b30c371b35873b3afcf123885dd41ea3ecbbf510efa97f3ce5c161  git-2.39.1.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 9918d4c1ef..1d728e1964 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.39.0
+GIT_VERSION = 2.39.1
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
