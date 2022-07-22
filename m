Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8ABC43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 13:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D55FB8487C;
	Fri, 22 Jul 2022 13:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D55FB8487C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cCXh_sRwfgu7; Fri, 22 Jul 2022 13:00:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D86CC84848;
	Fri, 22 Jul 2022 13:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D86CC84848
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A35A31BF2FA
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 13:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C0F04237B
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 13:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C0F04237B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFM2qOvbQrEO for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 13:00:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C51542362
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C51542362
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 13:00:54 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1oEsGv-0002Ih-RR;
 Fri, 22 Jul 2022 14:00:50 +0100
From: John Keeping <john@metanate.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 14:00:43 +0100
Message-Id: <20220722130043.4185303-1-john@metanate.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=XjTHE8wd8GnlxnJJgr6/ECojRkaTuCt24xUgTHXUJN0=; b=bo
 FxrTmHx/Tq0XukkWbDplCcltHy0XKOa1RUeab20fEjGy9chNbTqWUp3kn2UoKweSqvHh3Uu1h1jw/
 oZs/nwZjSqGSSFG8cA0zWJd5o4oJsXtdxRvtXScaiTCjySfPn0xOl9G4+ZXFxWjZ0Uljc5Ig5CTgl
 vIIzwsxazbHnm8Eh9kJSONYOmh+0BiLrLTEC1LgyOOe38F1Zo9WnBMsKEeXykgJ2+4ThEeHwzz3eV
 hpX68q3oMMDX6mi5uLVhjx9S//dWzHfjwWfWEEf++8ev+wShJ67gRFzsr7V+ledPxvW8KOy3dK0dH
 0DwXzJjxZUKX3dHk1BkaZyNLguI485aQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=boFxrTmH
Subject: [Buildroot] [PATCH v2] package/fscryptctl: bump to v1.0.0
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
Cc: John Keeping <john@metanate.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to a tagged release, pulling in about 4 years of development.

Note that v1 encryption policies have been deprecated and removed in
this release.  Since the previous version in Buildroot is old enough not
to have support for v2 policies, this is an incompatible update.

There are unlikely to be many v1 users and the format has some known
vulnerabilities so no compatibility option is included.

Signed-off-by: John Keeping <john@metanate.com>
---
v2:
- Use a bare version for compatibility with release-monitoring.org

 package/fscryptctl/fscryptctl.hash | 2 +-
 package/fscryptctl/fscryptctl.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fscryptctl/fscryptctl.hash b/package/fscryptctl/fscryptctl.hash
index b06b96c10f..d254af56ec 100644
--- a/package/fscryptctl/fscryptctl.hash
+++ b/package/fscryptctl/fscryptctl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 970a8febbcbf315313711d8a7ee3d954dea593d8087744d3cba65f6cb4bebcc1  fscryptctl-f037dcf4354ce8f25d0f371b58dfe7a7ac27576f.tar.gz
+sha256 3828d5ad9b93664b9fec0174fc5d8e96d7b021a7896da74efe18fabe5f01d638  fscryptctl-1.0.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/fscryptctl/fscryptctl.mk b/package/fscryptctl/fscryptctl.mk
index 4275bf2b83..154af4d29f 100644
--- a/package/fscryptctl/fscryptctl.mk
+++ b/package/fscryptctl/fscryptctl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FSCRYPTCTL_VERSION = f037dcf4354ce8f25d0f371b58dfe7a7ac27576f
-FSCRYPTCTL_SITE = $(call github,google,fscryptctl,$(FSCRYPTCTL_VERSION))
+FSCRYPTCTL_VERSION = 1.0.0
+FSCRYPTCTL_SITE = $(call github,google,fscryptctl,v$(FSCRYPTCTL_VERSION))
 FSCRYPTCTL_LICENSE = Apache-2.0
 FSCRYPTCTL_LICENSE_FILES = LICENSE
 
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
