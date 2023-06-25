Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B6AEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 14:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 076AA41521;
	Sun, 25 Jun 2023 14:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 076AA41521
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i6uUpHtpHTaY; Sun, 25 Jun 2023 14:44:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D2EE4152D;
	Sun, 25 Jun 2023 14:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D2EE4152D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 881741BF3BD
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F3EB40412
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F3EB40412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_3CXdxc4HG4 for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 14:44:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97F1D4013F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97F1D4013F
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 14:44:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D0470A4C00B8;
 Sun, 25 Jun 2023 16:44:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35240)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qDQyP-0004Zs-14;
 Sun, 25 Jun 2023 16:44:17 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 16:44:17 +0200
Message-Id: <20230625144417.293506-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625144417.293506-1-bernd@kuhls.net>
References: <20230625144417.293506-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687704257;
 bh=jPqG98Rs5osKwEuuDeQDD3hbDLY99D7n5KUzTrIPotg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UzzFD3P17e/RwWgdqlzx2rHsazkRZ25+hNVcLgPob52BFp3syDGbRHbsZ3eI4AbZY
 9JEx2hT0TROwaRbHZAO+GqF6UfqVH+hSMc3mIM+4PfA7h/d9l21qfrYXRKd4rZtmzG
 Kh8xmAVCK3UfaifW5kyF2Kc45tEz9/thYA4f9e4aaSeaA+mMXqFpNOq7Ea1WbXf1YO
 fvORYSk89RYJXtEjWhOFX5yWsTKi/Csb7RpmhWwK7iK5aaegkbn5HVStgs6b983VO8
 xxzVTgght9fXq+kKdGA7Y3LtP4UPEpGNJhtdDsk2xMoyhPd+AU9IeXQYKcm5vYHgp9
 +cPYOQfbt3zrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=UzzFD3P1
Subject: [Buildroot] [PATCH 2/2] package/audit: bump version to 3.1.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/linux-audit/audit-userspace/blob/v3.1.1/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 87c00ec241..310b0a0f6a 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,4 +1,4 @@
 #Locally computed
-sha256  b5cf3cdabb2786c08b1de3599a3b1a547e55f7a9f9c1eb2078f5b44cf44e8378  audit-3.1.tar.gz
+sha256  46e46b37623cce09e6ee134e78d668afc34f4e1c870c853ef12e4193078cfe87  audit-3.1.1.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 252f5865b5..e77e06bd6b 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 3.1
+AUDIT_VERSION = 3.1.1
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
