Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F145BCCF2C4
	for <buildroot@archiver.kernel.org>; Sat, 17 Oct 2026 13:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B355C60642;
	Sat, 17 Oct 2026 13:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3EPiQAUz4NV6; Sat, 17 Oct 2026 13:12:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6090A6062D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792242778;
	b=YC0+S7RrOYEkgv7f2Bt4nTasl90NVzNrOWpHUUnwLEy05Q3gvH051sRU7J9sRbPSeVvP
	 vTIX01oc46AMXVZOcemn2ePB/rJ0132He2RL0H8xKb8ohDewCt+rdzk/y0+COKxsvbcOm
	 WVZJgEg5T9Y4BsbO45oVi/M/7cmMdFvy2c8DXaEmSiUUG/IB6zaq5KR5ZdmJnmLzHNu3y
	 giqzD68OSdJyao7y7hI099nnbcDfEM/BuLI5hW53LW+M0cqCliOIswls5gOCcEl361Otl
	 xaaxpBTybh1tsLv0qG6Ar3BsM9rl0P+NAtuYIc5qEtgP85wDuwQAUiGgoTpRIMJcewQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792242778;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-MIME-Autoconverted:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=lnxkWbqEPbJpPK144Ini/4WklbP+KAmee5SjEM88DlQ=;
	b=jpU8XlpPcO54InuNi4XbPzXSoNRMOie9tX/IQX3n1JOCichoK5h5Og/6qVBuNfLe7HoD
	 btBXgz+/ArC0RVyNYP/uu5CAYJdlEu74II4IBV4QAru8v0+qkCJhGD5CdEyreZ/IJcL3Y
	 f1aQMpsglkyEtQrKP4apcfUGooH5k4biQJ4v58VjLcK58qKwycfgT0B/gUMzPvJ6P3qyk
	 AM7381kJ8yOgfNC1PelIeQLY+YBd+d59tfWYX09OwgIKQnlE7wudCApgy1fUYSRsfjQZN
	 nFrnSEJoruVmmemePQLHuVdYXVWBbVF1sGW7A3r181MgqMYgQMFY9VezkX+R0ljpIDg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792242778;
	bh=lnxkWbqEPbJpPK144Ini/4WklbP+KAmee5SjEM88DlQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bbtOLj/8+7BMJkSB+09X81YVH1I2eqxodTgtZ6mlueU/AaB+30JSZJYXo1Suhbh+8
	 8uc/zTw15K8m9nSJF8bgO0supiAP2IS4UBjBjPxNbVdc689W0fV9OadThe29ruguSE
	 ylJ6PUyJR/vEO1L/52RBlZ1pVGdD9nZbWdmE/9VAw0m/KqplNdikkdcKJ7B1L2e/RP
	 izdY9DZRKWhIGdkR/Q9tIZfAjUHHPrk9Oyyvq9O5wOUEdaNxBUF9a0UMO+gMp6mKPL
	 hYuGetOMEoDhPTH6IxwlaL828jNdFeSyQXe4YzYiVi4n1khalcdEW7RnNroAbWFaFA
	 iVIM7clDnRFbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6090A6062D;
	Sat, 17 Oct 2026 13:12:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE8731DE
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 13:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0E1E4096C
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 13:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_oKw1A_DeBK for <buildroot@buildroot.org>;
 Sat, 17 Oct 2026 13:12:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 75D664092B
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792242774;
 b=bDHGPSjCcjA7QDX7dP85oaRYjHtMZ6N9t/IyXEmUblGwXrrPCfxxUtcXhiWRxCTdgNnl
 wI47oqPLjM/+mEyy4tRqrLtfjGjdPQ2qZNHllfMjAFlBEv0BUuPLorKoMcHsuDtM4k9DL
 9JMNu6JfTWOhSEh/aJUhH3x7Nfbv7g8YsZZwHRsmdiQ9Yt6KAuRqQUYyAYThkHk5aBOp5
 5cvy4FFTHaDB3Eb6XtK+31MOMB9lGEZGEfQDcXhPcP1IkrpneDcUksLFIWv7nfp/zhDlR
 t9GvtbN7aRXnX6OOMtdm8SXHj5GN8SKckC/GVQNp9rwQSkLlmYn1k5h91UPlK8NVe5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792242774;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:
 X-MIME-Autoconverted:Content-Type;
 bh=eqVf3x8KDNiN4S8klt5p7jMFRgF+h4WQJlFAFWwLwVo=;
 b=TWlas8V2Sp+rnV84mvgPrnTby9p2RpNsXCtNPm9wnIGJzhVb7hvDZtdQp+0O2EXko0nZ
 IiGJfw3R/yuY85UjuH5s8zcChxqQ0xqoCFTlQa9soIQWXFEkAK2EldclM0+iDtT5AYBM5
 iRfxyAmn3z423JTSwR4vgTuh2qdfqthEGD5cVFx2BRGGT/BlX67XvVS1DSBnQEI4DfFXH
 XpYpv/txe1kCwatccB6PORP32/lkhwxeoBo9XKKeJ51pfjXFyFpWX9EQzgUL7DwAabB1C
 s/6PcGpf/RAGofDeACpcj5t/8GYLYA8xwrpakXL1PnIXmMlL3jmFnxND+b5HkYe35bA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail3 header.b=cRdEzlRR; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=cRdEzlRR
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75D664092B
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 13:12:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=cRdEzlRRjUdVBxzJElx33iuP4dYwQVDyWr8wn7c2oboMn9bLXlqWVfbDnw9Hu+jvtFui0SbglpAp9tSAaMMwLq7zLwJcaFzalnVmtlzk9tUD7uK00s04BZJTwk8LodqIUrykwK0YtqnfknrsMIO4B4ueKocpuiBs3p3qPQftSozoRTbiiJD1nROYs4e+Jl2UgqEfxyVgldhI8efm1i7DmY+fsDumYv738CzsBxneIHIcauKWiRsmRntC90mMq+WMUIaUIcJqczMAyjqgj0o96mcy/vqLITrSIR76iCXAi+5gbex7vOnz/kkRApln8XRm8bswQG7xjuAAxcb71YgzAQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=eYaZO4Frhdlh8WJPrnfR14Xm4Qh6wbwTuWdsju+35Fs=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 48372972;
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 17 Oct 2026 13:12:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xI4DR-00000006b0Z-1dJs;
 Sat, 17 Oct 2026 15:12:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Oct 2026 15:12:40 +0200
Message-ID: <20261017131247.1572149-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261017131247.1572149-1-peter@korsgaard.com>
References: <20261017131247.1572149-1-peter@korsgaard.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH 2/4] board/librecomputer/lafrite/readme.txt:
 document UART pinout
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The lafrite board exposes the console UART on the GPIO header.  Document the
pinout for ease of use.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/librecomputer/lafrite/readme.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/board/librecomputer/lafrite/readme.txt b/board/librecomputer/lafrite/readme.txt
index c439c5e91d..86afa855e6 100644
--- a/board/librecomputer/lafrite/readme.txt
+++ b/board/librecomputer/lafrite/readme.txt
@@ -32,3 +32,10 @@ How to boot
 
 Insert flash drive to the USB connector furthest away from the IR
 receiver and power up board. The system will boot automatically.
+
+A serial console is available on the GPIO header with the following
+pinout:
+
+- TX: pin 3
+- RX: pin 5
+- Ground: pin 6
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
