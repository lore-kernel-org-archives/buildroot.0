Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47256C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 09:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09F5860BF1;
	Sat,  5 Sep 2026 09:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7RSI-YMIEaCn; Sat,  5 Sep 2026 09:40:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9551660616
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788601211;
	b=IP+NzxO9RXIrahOQ6/Flfrpo0FoDmQ1VTFqKklu5XzYwVAPb+Tyc1sbkEI84KYVGd+5d
	 xg0ODGwYx34Fyy2vMRGwLfc6mI0Ui7H9YgPx+FhEi9Bw3lqR25ULMVx6V3vsIzWRWEIh/
	 HFtoXn6DgUYwAO2fKmjpzmYQyQ/qjfzM485NoEhwpUAVonnO17bQKA/2SURbzSZ+QLRMn
	 vlbDlcnMTcF5vdng4oj19FaRtMnBaPRUChY0EzcldQ4HsHoi5UwkpVcOoTV4sJCww05MS
	 H43PC9uSQN1VIlG7Dqy8ms/pAWtva3hCt7NSbEWG05rWcvv9tvPNfs/6/39V6Drx0KA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788601211;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=NPWHMt8ML7USySCoiND3tZR/bJfc3cyDPqFf5yohAKA=;
	b=mpUAw6+LXIM8OO16wr6/BUtIeAtF00WtggS4kC7aA6p3bzvMUw9LlCAY6ocXo8IWjQHm
	 LdFzWezCMApyCXV2dR+jytqWPQ8oAYPJsGuGL+fvv1HV9ItLjSx/hCp6gYVz3CMFriwLw
	 8nwD5C1uFuwET0uhB7PS6AWMjTo8Ex2PaoH/YLbDASmB5Gmtukc0e5fOzQS5U71fe6yx9
	 qNKPgupyvYrRtUB6cxSYzQ91wBBvUAif/x4ZEShZoKu9P8pmy6cCO/yQ0GulS8Wmt9Vct
	 Vt6QwV1RTcJcLNvv0r9NN8b8vTewohOCabhhUXXrSZ2IzdgXKitZySmLALwGznb1SSA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788601211;
	bh=NPWHMt8ML7USySCoiND3tZR/bJfc3cyDPqFf5yohAKA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=q3X2jvNFuaZCbiiN/AK8PL8dLCjRfZva6VK7fv8JhW2sOl9JETsGnwGOphbo1eMaM
	 uThchqmUATphT89YUvuUcLiWxHBqS/mLvMXOCpinx9UeieRxXQLlpVBNSsR3mduWP4
	 VzHh115XrEwA455iTAd5qIhDIV1xz3EQlLefCRzUYvHlX5LBfEBfPQRa0FjB0mRfNF
	 bQeLBgzflb5HTYpWLk38M2TKVDDTQd0KqM5hc5Qi1b/7OP0WTi61bWv+W2iU5AXIWp
	 LEIe1ii7BWBvK6jHvozvjq9RUaajzesNWOUD2JjYaxkLFEAoLffSuNUyWF5Au8BI1z
	 lYYF6gKvIFtdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9551660616;
	Sat,  5 Sep 2026 09:40:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AE69105
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 09:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 238F340B09
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 09:40:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IC5n_xLG6Ads for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 09:40:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8C2E040AAE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788601208;
 b=i1luCSY/njTe8P2d1geW0CUIk0rvnPFmXjFmGZ6AdoHdeEp6mXXngUwg+ZzjSpOcmy42
 hQJ090RPMFqWW2wx81CWiHbyY00co1XP/0y8ZU6wk5n9EO9jJKLIhkQdr64z9PksoYEHv
 d0XmxR5IYWvo6BUq7EuNKdANCf13L6vScLwgRyGfREq7O7Qdk/BXaC27aHE7GpW3jH632
 zz2vT4E0QvP3kkw4jcNZWgFe7N3EgR4BMsVkzZa8fz77yBg0tAF/7zDo6+rMF6xs3t/e1
 i9y6PXY+QQP9oi7YrDf8GDGVMvQRxG+NbgyajeQHbZ32mR5KJ3u1+7IbGCzq907I+2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788601208;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=3Sfc5c2c+Mwcdd58GpAtVzg0hDlpu/Lg67H5MbheVY4=;
 b=qQTX9GlDaNrqAEYl3aR+83BORajmzrCx4uELJEn8AyIFWKYS0zuLKFqcofTUjxi9Kx+i
 6/I39JKt7WngDPEJEH/S2NcZOjEsT3oUJNachPLSGLEl7k8NrJuhj6bk1ZTMVnQfqYkYu
 +nqkVbNo6pNZbJ8/NfagieHquT55Zag16WxvM4pD+bvBec9wZkcm1IAoaX15Scr8wSupX
 FW5Gb0FNVjs46nfRED4nBzZ37l0RLEc6+u2/kuYLHGQUCqOZHPEbPH0ln4XIiR1n4f1VZ
 qc/D1Fibl7s3taZFpEd/QoOuHrmSQDjc3DVq40FNzFwfhajRzv2qt1beclBuEGll2gA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=qhLLLumK; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=maxime.chevallier@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C2E040AAE
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 09:40:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 4E2F84E4152F
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 09:40:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 22DF460233
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 09:40:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4A28011C78705; 
 Sat,  5 Sep 2026 11:39:59 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 thomas.petazzoni@bootlin.com
Date: Sat,  5 Sep 2026 11:39:51 +0200
Message-ID: <20260905093953.62996-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/linux-tools: selftests: Use
 KHDR_INCLUDES to locate the headers
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
From: Maxime Chevallier via buildroot <buildroot@buildroot.org>
Reply-To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since v6.7 [1], the KHDR_DIR variable isn't used anymore  by the kernel
selftest Makefiles to locate the kernel headers. Instead, KHDR_INCLUDES
is used to specify their location.

Let's pass it with the "-isystem" flag, as is done in the default values
used in the selftest makefiles.

[1]: 43e8832fed08 ("Revert "selftests: error out if kernel header files are not yet built"")

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 package/linux-tools/linux-tool-selftests.mk.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
index db7e4fa1a3..f2f329c05f 100644
--- a/package/linux-tools/linux-tool-selftests.mk.in
+++ b/package/linux-tools/linux-tool-selftests.mk.in
@@ -24,7 +24,7 @@ SELFTESTS_DEPENDENCIES = \
 SELFTESTS_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
 	ARCH=$(SELFTESTS_ARCH) \
-	KHDR_DIR=$(LINUX_DIR)/usr/include
+	KHDR_INCLUDES="-isystem $(LINUX_DIR)/usr/include"
 
 LINUX_TOOLS_BIN_ARCH_EXCLUDE += \
 	/usr/lib/kselftests/tc-testing/
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
