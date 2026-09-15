Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCF6C88E7F
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 12:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D713C80AE3;
	Tue, 15 Sep 2026 12:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOGfi_Qy15P2; Tue, 15 Sep 2026 12:39:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AEC4080D18
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789475982;
	b=fu7oTCnzkUVHBWnx1YvSlTHnl9NDPHW07KLKhQS/JDRDKNsSYq54dw9B1Y//I5M+HEAv
	 82QctpjJtXV51DD3VT3CuI0nx+1tRw3sJt3eHYTlfNFZqJuWqiHMB/YoflRV2STTJdy9f
	 cxMr/cCbyqij/1JwmMiJ736ATe8VB/hNC5GcpOS07tieO/L+SplKKJScJ8ApsDLMKgLfW
	 lUCAAhZDi65oJKpL5fe/zV55zQ2hiW3iLvuXF4yHQgAvkYGGD7hUkQ8A+Iad50SJDcbtd
	 Z43T0aaZYxlRtMxFH9dFg+xpbYPgIBxDWtObLYJ+siwmFZn0OaDkMEu5aROmEFkUJ/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789475982;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=y/9A3ze5UrooEvfiEy91/icorn6DAvWAOy1hX1w3fcE=;
	b=LfD35NpXJxTpWaFJr53iMhCzyPx50M29ERn/BS8ypj76RHyCDXTG2BDIcUz02eTbNRc5
	 vFZHvsq+YIgWtfoGCpHMD7B+dig6kR8YPc0j/VI7Vva+J4XV/DlNeI3FkFwLJxw/lSHJN
	 8mdDNS0Qli4gJU4afIDsHl9FBbBXKjdaOJMOB9MZjCfTBlWSRoS+1nfTsZKd++YmZwJE6
	 xKtKU9mVRxV2PkM0eBfiZudi8FbYA5fjB3dw/l6HMigwURyOgS0Mmnb+HlIEerxmKFKE+
	 N71ctoiCIqyAJ0rQST9wE4la/HGuDOMWrnhZf9QfkuD2+DBV7fhhEqM3hjYiT6zOP9g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789475982;
	bh=y/9A3ze5UrooEvfiEy91/icorn6DAvWAOy1hX1w3fcE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IJbc/lBn/4cOeU0LjGrc4ozwqN9myLYVmRmgoK2czmLaY1iUgQusa2gdUKnP9JYxn
	 HSSQLsXY/Miu1rFOoKFhHGMPQqzYgS25EzezwfDR+SdQ3vCRlQoohi84kLo3yjvHsT
	 pHBSILfLFLxt40HMI+4fGA9s2EzPSKFUc56ypDDwAp/fVImE1hKsDUuJ0TglXfRd26
	 Bbi7dYbtWYxtiPj3gwOFpIRjVMyPMM5w+3+3rQo2Dso0hmsLAnIIa2cQrjrN9wOsX9
	 cIh3mVP0tHMmWGMwR33Ub98dMftJBrBFZ8KxBhDqNvTZaedwS/x3ekMFlwyXpXbsp2
	 P1tDATm5F9gRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEC4080D18;
	Tue, 15 Sep 2026 12:39:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CE22493
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E1BC60777
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rhdRt1vFZBtk for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 12:39:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BDFA86074D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789475980;
 b=SjKx84QRYBEz7wqSdSOZoox+Bd4dvJeuilwvWuSloKk/+Dh9QiEbX4tIz2Pnjcx18fD3
 Ti9nMuZCwFDkXLpo9nN9FZ0FYpMZr9Fm2CttN5OX1YtD20A0RyjrT/LDQUpfoKAQd76FH
 pY5H/5/po9ukfQkw9dCMSFI2Med6SAGTRE8zKC4Ycxtzv8UbyQzwBUabIV5d4cWJgyQpj
 nYM6UTvWH6PNSlBYN8tCjGqgLfTz9Vzro+6E/+8rfhgjr6ls3aGljnCbQ7CZSI8b/mn1c
 hnZKEaQN0uI90uoaD/6iTowLyYJEyDAAMtr9SP3dhENmDGke7bkfspQATqNv8XVKfZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789475980;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=VqrxNBZdDUoh01sRHlj8KbSdSgqn4ObOakG0oguT9VA=;
 b=ie8avSgQr88BkPkZMm7E0F69WvGk3m+IQ3hpsHHB9jpECYZSPt3EjGWzifCdDPLzosQs
 0C1w2Y7/Ibyu8q/ED82f/EPFNLeDLR7xtazKZ+n9jeHFv+87zy9HALRjTbyY4FpX06fdo
 ryX2E5CaoRlOlBFH69fK0WIi8F6w26XCMG0HBzrDj1UcOQMSFGRW2Z+mTQympMwTbUK8g
 HIi6wOK5uesArxpMmM7iggVmyIly4O49DtNSAuPp+TuOwqDu7ePqqZQe2+ofQfAdag996
 8aX1tZg9SLg5Vs5AX+iEKZN/OaV2uohuY00gZdmDN4yJwxy1ZZkqrH9XlAnvWNQiNeQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=s+HPVs+S; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BDFA86074D
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:39:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A90CE1A081F
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 12:39:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7E26F60498;
 Tue, 15 Sep 2026 12:39:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A097B11C7AF51; 
 Tue, 15 Sep 2026 14:39:36 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue, 15 Sep 2026 14:39:31 +0200
Message-ID: <20260915123932.1956884-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915123932.1956884-1-thomas.petazzoni@bootlin.com>
References: <20260915123932.1956884-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/2] package/glslsandbox: harmonize
 BR2_PACKAGE_BUSYBOX_SHOW_OTHERS select
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

BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS needs the full blown version of
bash and coreutils, so it selects BR2_PACKAGE_BUSYBOX_SHOW_OTHERS, but
it does so only if BR2_PACKAGE_BUSYBOX=y. Which kind of makes sense,
but is not aligned with the vast majority of other places where
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected, where
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected unconditionally. Harmonize
this with other packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glslsandbox-player/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index d2e146d827..04ca85f381 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -35,7 +35,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
 	depends on BR2_USE_MMU # bash, python3
 	depends on BR2_USE_WCHAR # python3
 	select BR2_PACKAGE_BASH # runtime
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
 	select BR2_PACKAGE_COREUTILS # runtime (timeout)
 	select BR2_PACKAGE_LIBCURL_CURL # runtime
 	select BR2_PACKAGE_IMAGEMAGICK # runtime
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
