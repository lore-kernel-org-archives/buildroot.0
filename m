Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C34C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 21:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74F5A4068E;
	Sat, 12 Sep 2026 21:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2r6kDTy2tOi; Sat, 12 Sep 2026 21:09:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8C35540698
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789247366;
	b=IgfkqOr53CsqyG47UbmyJCuvBYKEEe+1jUvMtbWiFCi5JjM+1ciyTz0wZx7smrEvPHwQ
	 bwb9sdTnnU69RotfIWr+mGqGZ3TnrSuqvVpgpnoMYjKJFWUlh9IaZsilumsqS4sHikcZd
	 xRNAilGVIB1wxbbf02cTDBCpy4upU4Qjy06AUU/jtqYH+bIbdGdY1LjSgDcXwWx7IRnqb
	 NQzqi+tAEo6LGQlUpzvwOl9l5MCZiF0cAOmng4YZTDAjZnvVttt9y/TZjrBTyZIppPX7+
	 Y9jeHOUFhf7UQ9gEqfmDzXfdIEr7g6yatzBbyCJMbgUMusQ7C5gM2qjRWCjD7f9SN/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789247366;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/T0ZKDQX3rCpkOMq81ffH99G9pStPsQaJsa2MEv9KBo=;
	b=AFyzN7N/Jtz8hh4VsQ5RKGKxtEMofdGTJqdZbAGsi71W9yHzwnlML6k7gKlvowVr8Vw/
	 OeQqCRU1hPV+QK3f5DjrUtHBk5Joo0R90GyLHugg3tfJuDixgsuiWHMhDgVCWbjUVekUz
	 oDNTWMwxSkJtABS+7Je7BBb9YN2v2fo+4MGjixhnKXUJYRoovPfUKQGU92s96J1hMjmS5
	 YvCqeO/laxSZhEyrxu2FNv4dlxjjNCVcPKjj9Lvi+KthqIkO0sY0GSdHiFoRgr04jKqP8
	 WqjLIFfPjgW324HSldyeZTnNSWy3ARzf5oWDv9rG0WriVjyeNwCNoE2nT7lRv1Q8nVQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789247366;
	bh=/T0ZKDQX3rCpkOMq81ffH99G9pStPsQaJsa2MEv9KBo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=dVX6ekhX+Zvqutwb6zLD0eLQHscWaoJs40vq6Jv5ABZ7uQZkMFVooSGGz4u9rPwUr
	 eBweQzUrlEzvLZ9aOfdx6VClMy1I66LY6u7Xzs24sYp33rp5HsZNGfsCc6Szxr+rSS
	 jPuRnKNS2gcTVqkqmu0viGfGvScQtAzfvppI+taBRL7TuCqbqDJggXZ3RoC56A1e9n
	 idH0ivMNNrmh2/8kwoiUEs51Y5E43gjC6L0MTrdZbfl7Xx9RKsaGbCC2jVE4P0yxaT
	 0D02oexcTWZBdKnNC9FxQhF8BdqzK8whM2z/309HavL/KrV/HG1Dh9vr7lX5PRzUmw
	 fWWPAQ75/DW3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C35540698;
	Sat, 12 Sep 2026 21:09:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6C56701
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCA1340698
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CcBNK1Kloti for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 21:09:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 55F484068E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789247363;
 b=GedaCeLZD6A/ncXR9xmtQPxZY16Fdl/zLYtgecs7qtV3q04mqFJ26nb2T6EjVtLWXVwN
 P/mExnrKjF+Y+G6yKP/4DeO+hPsuWI85fBfoRCuUF/9pCSeQjmAHhR2bg2/WX1G/DMC63
 iwB2dKPMh5p7pQejOA4MFLPIi188P9sk4j+7ySmB61202C+m5bK51KYmbmSN05pTAv/zC
 qxL6NR0+MVSGh3rRTpXwuZBlbdJeKmg1QkwsT9yLXq0gT4Q6zvwIy7BrPazdKbdezFFac
 WxcIlN7zneicd7YlcAZ9he/LZKLOydVZgxnHqK3nKHkcbMSqUUx1v8Z6nk94sNLrpzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789247363;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=4acUj614TasY+4BwJgfCYZECkWmbqvupQOY/T3mXRDk=;
 b=nbLYG6hMe4/wydzQgiqBrPsZSCWI8oI5t2Nl0//XzxD4uZmmFdgXkQ+KoZzC8oNCxcY+
 Qh3VJBcBERWwdKhr/cLvoa2YxJnOugimGD9BZGuL+A5Feu8tK7e8Sj0oZfOGHCajawdKp
 yjLxe6Pv66g9S2o8xS6FVIz4xgRM+oMsIOGzDJdXSszTyN4/yoqBamvULh1ZYamm8RMYB
 7FZIUX5iQauKouVZoKJQ/Tu8ihgqIp3PbI3ZBYEV79SRrQrerQjbIvGFJV1AWQM/sHTSQ
 M/1f3f7+Eyk9RxW3P1cQSB8D7gshVUq0cdm+fqKNyH4f/ftKNEwuaOn6ePB+KL+onIw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="h/TW2Tep"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55F484068E
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:09:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C38551A030B
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:09:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E8A1660580;
 Sat, 12 Sep 2026 21:09:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5B2E211C7AFA9; 
 Sat, 12 Sep 2026 23:09:12 +0200 (CEST)
To: buildroot@buildroot.org
Date: Sat, 12 Sep 2026 23:09:08 +0200
Message-ID: <20260912210910.1553765-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/2] package/python-googleapis-common-protos:
 add missing BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS selects
BR2_PACKAGE_PYTHON_PROTOBUF but did not propagate
BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS.

Fixes: d37766a886a8dc3d49d45e14955411700a5efd26 ("package/python-googleapis-common-protos: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-googleapis-common-protos/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-googleapis-common-protos/Config.in b/package/python-googleapis-common-protos/Config.in
index 8f487f5ee6..541cb5bee2 100644
--- a/package/python-googleapis-common-protos/Config.in
+++ b/package/python-googleapis-common-protos/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS
 	bool "python-googleapis-common-protos"
+	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # python-protobuf
 	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
 	help
 	  Common protobufs used in Google APIs.
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
