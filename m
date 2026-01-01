Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D66EEEC1C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 22:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A7A5607D1;
	Thu,  1 Jan 2026 22:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nryi7_vF0oBL; Thu,  1 Jan 2026 22:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21F6760799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767304890;
	bh=tRpO8uCQ4Y3CQV9kZGN2SPz835k4v2rmn1cJvybrkRo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Jfsu9Wf6nCrqTD1hOQ/9k21nBUOK8VEl59nhVZo4AtH3xM+8pQFJJXPmqkOmFPt/v
	 SIs8CHH2ZILcWLPx3ydpXbvATSBNNlJqeVWBClbJSMxptROwiCwiDZvr7zDupzcXP0
	 nkMvZaGUv9su7DADO/nr8FDPFf9isbUN84XekZ/wfEwHI2lCCc7TLctjCXFLVI6Pr8
	 ZX0Q/uLMCPxz3rUPWw/Ky0/q+pV1mc/TQRenrYblHfedNRu01mh4jQn+xfIi5GckUH
	 0x/Hee4Qqjo6VozACVztxf2aqR9FFKXCCgudez+dbKLl5814VAo0vCbUvsyYPmaSm0
	 sRbmYpQ0HXLYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21F6760799;
	Thu,  1 Jan 2026 22:01:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 38661206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E591C405A9
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hIc8RG4YNAWH for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 22:01:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6B0C40613
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6B0C40613
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:01:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A00F787F4C; Thu,  1 Jan 2026 22:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 22:59:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ae42d874de8748847e16e2f2cd163ca4bc7ef5e
X-Git-Newrev: 21a8136fb3e55e38015b3b16fb03b4b15e6cbf9c
X-Patchwork-Hint: ignore
Message-Id: <20260101220125.A00F787F4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/quazip: add full destination path
 when installing qztest
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

commit: https://git.buildroot.net/buildroot/commit/?id=21a8136fb3e55e38015b3b16fb03b4b15e6cbf9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: 53044437c8ba83eb4409a4af89fdfe13de7fb737 ("package/quazip: add option to build/install tests")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/quazip/quazip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index a388b161ca..0ab6e2db04 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -20,7 +20,7 @@ ifeq ($(BR2_PACKAGE_QUAZIP_INSTALL_TESTS),y)
 QUAZIP_CONF_OPTS += -DQUAZIP_ENABLE_TESTS=ON
 
 define QUAZIP_INSTALL_TESTS
-	$(INSTALL) -D -m 0755 $(@D)/qztest/qztest $(TARGET_DIR)/usr/bin
+	$(INSTALL) -D -m 0755 $(@D)/qztest/qztest $(TARGET_DIR)/usr/bin/qztest
 endef
 
 QUAZIP_POST_INSTALL_TARGET_HOOKS += QUAZIP_INSTALL_TESTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
