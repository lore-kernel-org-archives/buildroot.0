Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01B0AC6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 09:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 874CC81C26;
	Sun, 12 Mar 2023 09:22:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 874CC81C26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NLTFeaVvfh6P; Sun, 12 Mar 2023 09:22:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7E3481B36;
	Sun, 12 Mar 2023 09:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7E3481B36
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 034C21BF3C3
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE94981B36
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 09:22:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE94981B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hUMrmJmebfHb for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 09:22:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF0DC81B35
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF0DC81B35
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 09:22:27 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.126.28])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id E3DB22003F3;
 Sun, 12 Mar 2023 10:22:22 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 10:22:15 +0100
Message-Id: <20230312092215.11954-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1678612944;
 bh=X6vOZRWkvq2OeQMnYL0g5xC4vECIDFsmnXR9KThzP6k=;
 h=From:To:Cc:Subject:Date:From;
 b=dgDb08edNzZ/V3bboPCADP6AY8oi/4ocdqi4QNsGX9nDYvqky/q9NC1nI8Ne8I4Ld
 Ivztwgkz0Lr+J8CWYKOKtXqMxtDbXPpWZpKWBXPvyKYDa6CwL1UPPZNyw8wUo0yiQM
 9XH5WNIhpfwt+ey+TTjivFzzMye8BU/MyliVlS+zmsywuCaSHB0SIEZCfdZkJtX2eS
 OBbZPW8VOl+Rh32UF1D7Gs4HQ06bAP55ZQ/P//D1povyBGbL4Ul3eJDaWp6JFwCzr3
 NSAfFeoItiV3EHMIFGfhe62iPRROgBfI7dYGM7HL7IAvnhPWFWSI2hJTivxRSU3/Pt
 /PxtIrmOz8dPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dgDb08ed
Subject: [Buildroot] [PATCH next 1/1] package/pcre2: update _SITE url
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The pcre2 url [1] is now redirecting to [2]. This change was
announced in upstream commit [3] which was already included in
pcre2 10.41.

This commit updates the PCRE2_SITE url accordingly. The package
version remains unchanged.

[1] https://github.com/PhilipHazel/pcre2
[2] https://github.com/PCRE2Project/pcre2
[3] https://github.com/PCRE2Project/pcre2/commit/66b3cb34dfe5411cb2bb939a8f4981081815d496

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pcre2/pcre2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index aba378cab6..c35056f8a2 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PCRE2_VERSION = 10.42
-PCRE2_SITE = https://github.com/PhilipHazel/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
+PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
 PCRE2_LICENSE_FILES = LICENCE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
