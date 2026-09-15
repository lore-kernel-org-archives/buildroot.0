Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050F2C88E77
	for <buildroot@archiver.kernel.org>; Tue, 15 Sep 2026 21:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6D574068C;
	Tue, 15 Sep 2026 21:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A7vt0VlQQRTe; Tue, 15 Sep 2026 21:51:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7BFDE40565
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789509075;
	b=Jz37NcoappdhC9QIgWCdCWYtykz6fRjywhVIzea7F1yF4tOCcc0ONCLmTQywnT/NIea/
	 z29+glqEbDKPqdDyAlOj+/HCxffTqlIs4Jqe2/OU2vA59/4AHQccnq87rfW13HtsaX/mS
	 R6c7VEqc9UwW06SyCvqiAEvDK3wXvAmg7+YqJYqiSKD58kUm8ntPCJzw8JXAF6Hn7B6/y
	 ay2ITEv2bRBPCzmmHHX4ZqgLah0+xXxZB7/gGGJKZyn0CkaQKO9HNYq18R9kLE/0Qy6ZD
	 uppt5ogUTs4jCe0ConZF/Zz8dYBJBoU11b6956Cvezv4uI56MijrcNKu5FHclkLjpJg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789509075;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=yqBEyTwZ8+lEw7Fpb81qSaTqWb/cq22CXN2t2y8WsCU=;
	b=YjiriTaCpq/UuS9WASzZvb+kWFGf0uT95SG0h9MprnV1v/44Qr+dOTVtIJv3jdbB3TL8
	 7fVl9AHXouqhjVLr9UOcDvv+qPwWtKmFWQPgw4AMLUlrdpG9ziXzhRdqSapt6IIxZ29WQ
	 7cWVZHV0zSeyVBKPnrnbBKKZNz26UQPdOABXuuelcF1mUnfEpYQ+Cm6gyFpmTiNJNwF2g
	 ajUwjRCdsQQvJ+L9IEStx+QxvKP+CMtfd9gX0y3nEpRHQ9VF6yhUxJc3VX1l28pAL0c6V
	 8NQIv0OvQjA6HTH5s8wqUqe/UB0RChWIt7FZtx+XApkeZ/bQoVozs9y+Wxz18qF4aNA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789509075;
	bh=yqBEyTwZ8+lEw7Fpb81qSaTqWb/cq22CXN2t2y8WsCU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Fr8zWEJZCfQYlY2jHKXx9xXz8adM/vI7VLyP/mrAruv5HSVAkwOiKaNl+VmbRPpqY
	 gkOEAXIxAUO93HTolPioMrPA7d5uLIfX/eYmRW43rWFrsFMA4KuGb0e8hK3+arN2IS
	 CWsXcbGENi/P1gsdUBlJcocqT8M6KQtCLpR/znBPyuzLe7eTsyxOI0tzfU7wtjQrTN
	 IfELQMoe24fZVSL9OLnB4x7vCDUGFxfWbAsfFzXAgXeDvrWfkx0FZM98O4TxBBNgkQ
	 QVLyk79q4HYHWK5soaHFJhVCbZ1u3yVjGTJt7aQ4WfIRoxoW6sOyWDeH+WfMirW3FY
	 pU43IQCGsIcwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BFDE40565;
	Tue, 15 Sep 2026 21:51:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A55D2D0
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 21:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5093780C53
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 21:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5UodRhnkxpTl for <buildroot@buildroot.org>;
 Tue, 15 Sep 2026 21:51:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 005CE8087C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789509073;
 b=a1hc+rR5mCt0eesMNE33B1s+v89QUkxTinAXgdZjCHllnGyjD4YLCulMWOjg3Nl1cIiz
 /rdlJHXfHm0wb9706nf6exO49NduwH3hWLVWyUfGT0u6HCpdRg+6xrUeMonjpJogBEUet
 kPrIwWyz2xK5wLNdBY82Pw6zntwb3Q2U4UdYZN3Na18rh8m8w9EUB/ZTGPS2S0BQu6pMG
 2LqFm+KQ1UnbDQlajDOF6R9H408LvaD/hTugqP1CndrzXcSBxZKEf9wwfSNkT/4vbSBMO
 WPlseiTsr+D7qYqUyxtmmREE2dWJrznWTPXJCweOd4CEsJtwp8DjEdBbVPgP/45N59Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789509073;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=KOEbF5kyAf5AmbP5PwBBWTbM4Z45hz7JiNaXrY+XfVs=;
 b=rjvabUvWYc+nDA7iV7WzUX5I/8aFRqn0eTSN+SYz6OjZdbKCysS7bpFzwXd1EipzfHfi
 gfo5yF3rrug7nuwKvBdpGwmhVesYA2PU2n/CEQR9tqC/PrkuVtVYdgHkUkgHkv7wXurje
 mPMui7t/vF9tj+ZaUC/yTaPaifjWE6msw3nV704t60+JF6su6r/GI+qVTch46sBOA13NM
 mCLt+/+wku8l3YRm9nS/5ePF+yD6LMCWd3gyQinktpgkQmlq4iMrYGGCYA8LQWH2xRBH2
 f7tzUA0r11zOfbSJjc+xBflbDGf2HbHc7kyh27Jxrxeq1BnxRr1yJUhsOv6JfzG5CUg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=XtL9LziB; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 005CE8087C
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 21:51:10 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A58124E4064B
 for <buildroot@buildroot.org>; Tue, 15 Sep 2026 21:51:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6346C602B0;
 Tue, 15 Sep 2026 21:51:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2B22811C7B00C; 
 Tue, 15 Sep 2026 23:51:02 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Stefan Hager <stefan.hager@ginzinger.com>
Date: Tue, 15 Sep 2026 23:50:57 +0200
Message-ID: <20260915215100.2031555-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/2] package/tensorflow-lite: propagate
 libabseil-cpp dependency
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

BR2_PACKAGE_TENSORFLOW_LITE selects BR2_PACKAGE_LIBABSEIL_CPP without
propagating its depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS,
which this commit fixes.

Note that this doesn't create any functional change: tensorflow-lite
is anyway limited to ARM, ARM64, x86 32-bit and x86 64-bit, all of
which are supported by libabseil-cpp.

Fixes: fd29fee3a3ac0ce45404ed256d2059836c352728 ("package/tensorflow-lite: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tensorflow-lite/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tensorflow-lite/Config.in b/package/tensorflow-lite/Config.in
index 751b963b22..604a1ea9ec 100644
--- a/package/tensorflow-lite/Config.in
+++ b/package/tensorflow-lite/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_TENSORFLOW_LITE_ARCH_SUPPORTS
 	default y if BR2_i386
 	default y if BR2_x86_64
 	depends on BR2_PACKAGE_CPUINFO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 
 config BR2_PACKAGE_TENSORFLOW_LITE
 	bool "tensorflow-lite"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
