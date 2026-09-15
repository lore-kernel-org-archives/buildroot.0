Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47057C88E53
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 12:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFCC380D87;
	Tue, 15 Sep 2026 12:29:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dStKkiOqxOi; Tue, 15 Sep 2026 12:29:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2B19180DB8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789475397;
	b=PZYvnQDqaQUHXIQ7+0aKnz0k3kYMqRNiSQS/RrunAvdG7wFys4hYNqEjezDc2DHFYZwZ
	 SC+GYNIHAr/IhGFYDu11Tha5HAWio8fAQh1c6XCPk71fpl+XgL8KLgUKpUVQg/RjyFDFj
	 CzG1cGghaDUBDLjTwElbojG/JXl3G2hG6pyTI8WofkxkCkBSdQqwO6vsymH3UgZZ6BV76
	 Zt6JaqYjkw89lS9bbuY6Tvb7XpGAGToxSUbIA6xMfOmqLA7EsjshPEt5TDifR+vJdvUzk
	 UvsstWzoUQxLWbnm2MbRaeZEcEfGL6ZXkwm+66nf2GIan0s5O/z7wyMJDUutx38vlkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789475397;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=4pKwCHtG/Yr6DTlzRBw3HfEDKYtpmfvRfcz6qRMA8+E=;
	b=R9l6viZ8MRVw6dlijy5UAMi2ViI4KG7IAMTwg1lE+tg5ZMYNxvgvb1muVtwZOFu4nLXb
	 evnBiqywYcadZwRPkmwjwaKKTYKJyu96HUevMbA7VyCnvsHIu1ZyEB6gwuoLV6SbNzPrY
	 EiMKPytLSEqgemsmFJNBrHlJ03nxM13jVfDqLiGQaTjKTJenvx1/jSxpRnsYNheu6vZzU
	 3Ct5fft989+w7NLGwloHENq6UTJjya2F1BP1taCK91zeNWUTJkJGFf8wLzCB3C8sgbSaN
	 ERACWMTVbo1l5DPMYMeqTWQ1Peg1kH9mmq09yy6KAcEwsI9FGsXmRVekjT+je0tEwsA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789475397;
	bh=4pKwCHtG/Yr6DTlzRBw3HfEDKYtpmfvRfcz6qRMA8+E=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=LvimIkgdYrb5RBDJ0IOpfJ2Zz+w/3VBqCOcHZz/3mYNFxuTo82PXjQlnUWYK/BXQP
	 4N6tTn9BYwt85qQE1dVdxQZbWD20NmoUMttMxr61OqIF6UP0LnxdFSz7J0Dwfqqtel
	 OqXrXhLFoGfCCjBmm3eyaFrInoJxN/j9M5nsf7jidb+Sfrxzy9gHHA/Cf0D/DsAfHU
	 2gXcq++WVxKIBLG1AmjxA8sQT4noiV50n2iTth/IgTzHMUTJ5abaQMJxmZt2ULrYpa
	 /B9l9PBr16BnUT/NyseJKmcBjBZmwwTJ04OnPvZXkzhkvIN8oLfVSVWQojQlhELd7B
	 adiEIlsRU6NuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B19180DB8;
	Tue, 15 Sep 2026 12:29:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA4EF24D
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB61F80DB8
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cW_EHU8kneyr for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 12:29:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2671080D87
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789475394;
 b=ne0YMJqntDjwqToskLo9S1dWUXhRigwUnMa9Z1bLvV0x2e1TkWgd5DgbkSYz10r6Dt2r
 JhE097eAcam2k89MhlXoNzpDfQ3fTBu3s721dACETFVopnX4633Qr6yPjEIVr5cFq+3ZE
 aSMVLthPWNsqgLns206RjTP9tv/NWT4GYknLR4JOMGJYGZQo06B5E4iqIWxzBtUl2ZNZe
 WgmCBfKTF0Ho9gTpVD6hdqz5BGREPWk8Ga6DPY5BKQ0OmPVeBPhM3F8O+MNwsBbtRhnIX
 5egDrd6eRjjCSVGKbKP68sDeSrU+jLol5qThj6Cl/LcJcW43fHkz2x6+HtFAYpTJFAg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789475394;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=0cz0Sj+q3MoA9A1WTWw28+3pX2Kl0nQf3xYP0j2t8bY=;
 b=javjIKJmhARl0Aa6hMWkOiO5BDf7JcTuaQAcNp53h/hmkfG157exV8yWCQXXI/BSTlxo
 i0eLz7lpzTd77RDAanT141N9/SkwdnnzypDOZ2RMXFzTeHPW8RWSVU9ZE/sE6tkAmuguN
 4PD47YsgXAwI+j4fJ5B0puvTFC4QqfJvuzUNkdT84OXhN14G7z43fez3oxzRzorezinGR
 fUSIeAMEnzND9Gj8Cnp655wKkv/wppmhpBvV/iTvfSdcHAh7ndDO3RlPCz76hk4H2i/7m
 3cG6lRZE2I8ON8FMvf1WpagBkSUAVK5ftoY3Gs87fof2q6PGGux3lziU/2hfObUrdeg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=EDxQp1e9; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2671080D87
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:29:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C9C8C1A0811
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:29:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 972AB60498;
 Tue, 15 Sep 2026 12:29:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8CACE11C7AF51; 
 Tue, 15 Sep 2026 14:29:47 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Chen Pei <cp0613@linux.alibaba.com>
Date: Tue, 15 Sep 2026 14:29:43 +0200
Message-ID: <20260915122946.1953137-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/2] package/ndctl: fix Config.in comment
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Config.in comment has the correct dependency on
!BR2_TOOLCHAIN_HAS_THREADS, but that was not reflected in the comment
text itself.

Fixes: 039c1ae13ec12f7cebddf86f37080d0a1fee28e6 ("package/ndctl: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ndctl/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ndctl/Config.in b/package/ndctl/Config.in
index 9d3972bd2f..708871d693 100644
--- a/package/ndctl/Config.in
+++ b/package/ndctl/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_NDCTL
 
 	  https://github.com/pmem/ndctl
 
-comment "ndctl needs udev /dev management, a toolchain headers >= 5.10"
+comment "ndctl needs udev /dev management, a toolchain w/ threads, headers >= 5.10"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_HAS_UDEV \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
