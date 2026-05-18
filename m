Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAFCCD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 22:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C87D680DF6;
	Mon, 18 May 2026 22:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbfTKNuV1cy4; Mon, 18 May 2026 22:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBE9D80E00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779141762;
	bh=9HN2c3JnLXyIyCkOwazRLvkSoow9BL6DqBSiEOFeMmk=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=FwutbHWbH6wqWtiFBaH1ppzZUAHOyT5j4KRH3g32eih4wwrHjtKP6bJSr6EWQeB/H
	 NsWmfmMJpVpi/+yjIZaE1nQ/tWBbZbZZUgsdLysdxiaLDrwv4WPeyLemn12nnahuUC
	 cHMs2P+tFQmhVO7xPROuLQSVWq3FQN/SkwAecBDJe/3BQhc/wcIir0pfrR6E+AAeHk
	 fJ10gjrXSBrGB40lqlbbXyuo3EPXHyb60Yf3uZbUFdNJbe8By4XrQ6TezD5Gq+n8Ah
	 e77/N7SOQcnDOvNf+ueNXo1ma5k6dQMNufCjXvmi4xlHWdqUBn/7MHGjCLccUfm5ff
	 uWeSWp6NpLtdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBE9D80E00;
	Mon, 18 May 2026 22:02:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85E7F265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 22:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C0F240A01
 for <buildroot@buildroot.org>; Mon, 18 May 2026 22:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id leBeYCVAli8d for <buildroot@buildroot.org>;
 Mon, 18 May 2026 22:02:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 27A60408AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27A60408AA
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27A60408AA
 for <buildroot@buildroot.org>; Mon, 18 May 2026 22:02:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8ykW-1wU3qs0n9a-00BJAV; Tue, 19
 May 2026 00:02:36 +0200
To: buildroot@buildroot.org
Cc: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Mon, 18 May 2026 22:02:28 +0000
Message-ID: <20260518220229.17936-1-and@gmx.li>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:/SbWWjkyZ2bZ5cMMGDLTZ6Unj/TzhWhRMKVbcZzACgGe4FGsIZD
 kfF7CRTZjvzHs6e8ctkAlYMAmET/uRhhU6MRf5pL0CxjL/0giriUj5Gs9lXS3NfBFzQ+3P5
 qkJQq9CFoPDfD9qxU7jUKRGQnDmDxlt7zU194Fz3MtFr6AJXvMZjEimdiixdrTjzmJMX1Bi
 Ier1Gt1wVlQBmFd7M6Wmg==
UI-OutboundReport: notjunk:1;M01:P0:cAv8R9le80s=;vY5arc6pwnQgG1x6Rv16kcsvom/
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1779141756; x=1779746556; i=and@gmx.li;
 bh=nBcAKs6/wd5ph3igFmqqEcUQqoO4vJd6RhoBpDLyjrQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=kDKdpUO0sJUNX0/b0abizOU/HpIlG0VXM0hCiNouIS5qn3cLhjub+kyrg6p7dFf3
 mikJpkkptKw+X8FWNnTJvc8PPd5/KAwT/VSDPQFo8gZBX9lG2j+3L9JzEAKEwsWBS
 2YomPV6TsOQoh1m/G9gDn/My384Q1PS9aaVLOpt/Q8jkZcNHSIUUFyTHcFt7EKo3S
 aJlXA+G4DfFEGiq9aS38XFZ/kCfsX9Z8zHk7BguHrKMyDvoPKmdl8uZc33LTXMCcV
 nexGa4GOElNYEo1BEHxl0SqNgiB53qMs+d4T6UtbrHwYKAxHC2BZsirTr86MUCl3c
 cMKSFawx1FoeFzFIdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.li header.i=and@gmx.li
 header.a=rsa-sha256 header.s=s31663417 header.b=kDKdpUO0
Subject: [Buildroot] [PATCH v4 1/2] package/libargon2: conditionally
 shared/static build
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add static build support of libargon2.
This will allow dependent packages like cryptsetup to build static as well.

Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/libargon2/Config.in    | 5 -----
 package/libargon2/libargon2.mk | 6 ++++++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libargon2/Config.in b/package/libargon2/Config.in
index 6bba74cf..73c1e0d7 100644
--- a/package/libargon2/Config.in
+++ b/package/libargon2/Config.in
@@ -1,12 +1,7 @@
 config BR2_PACKAGE_LIBARGON2
 	bool "libargon2"
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	help
 	  A modern password hashing algorithm
 
 	  https://password-hashing.net/#argon2
-
-comment "libargon needs a toolchain w/ dynamic library"
-	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
diff --git a/package/libargon2/libargon2.mk b/package/libargon2/libargon2.mk
index b3f6e1b2..8ca0071a 100644
--- a/package/libargon2/libargon2.mk
+++ b/package/libargon2/libargon2.mk
@@ -23,6 +23,12 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 LIBARGON2_OPTS += NO_THREADS=1
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBARGON2_OPTS += LIB_SH= LINKED_LIB_SH=
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBARGON2_OPTS += LIB_ST=
+endif
+
 define LIBARGON2_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		$(LIBARGON2_OPTS)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
