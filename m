Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CAF606A31C
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 10:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FLGR6UtL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=m3RagpeR
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 064C4405F3;
	Mon,  9 Nov 2026 10:55:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gsMJ3j7E4ptw; Mon,  9 Nov 2026 10:55:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0E854405F8
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794221717;
	b=FiXldk/pF7lDfmmhSDUBOMnKknj7GOUdeHAzAxjwBio64NC7Li2UAvbk4J3gnDjK7BZF
	 cWpEKIZn21y+ejBqljWi7iY+MfUFgViS3DpPXzNOv7Ihxf/HrgyZq68M94Oy0eWk9V876
	 1m5dJ8r3D/Uv2WEhpVic7ExPtWWUfWIWtvaaovIRJXo97tUP0dfRTj0PtPExEWs3dN/Ts
	 bVxKuJSaq8S0GrvHCWla65RCHatuU5GlF/prCFAYJ0ZUpPjjJAC4fpo+KOLt0SS5/1osz
	 fvXj1lVQ9u9ym7rE+m69EyItUzXoGdfOztr/1P4KUgfb+mIQNxk1PWeKFMt/S8Pp3yQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794221717;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=RFxSbLx/lvMKkBBPx14a1Ydo4O6brfoaQ4NRp5xv8lY=;
	b=mZxeXNVG/z/dxol6SGoxaiGAhP38NEGJit9Km+X+RxtXORDeuQrmVyDyheUFDRUl47Qi
	 7LMuOyzgtWJttnQjFykgzgbXciqm6kMEp054pdGc32NIRai4FcVnMNwROdPkMkxGbqJT6
	 iklXIM256EEGq+cLxJcOZaOEA0sY+diCAlWuFzfuyKRcos0F3dl4NH6+MEMrwlLqw+EM2
	 bDA/utAa8eDooKiQwPE49H+ri12oldm8lYKZ6rG1lluRRCHList1nl7KSRI2TuwzX5s8E
	 26imJFCqobtyldNGQKXn3doX0nx6Fqy7zKCA/O1VTGbTGMJQDTQtPp2QcnGqcBwysnw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794221717;
	bh=RFxSbLx/lvMKkBBPx14a1Ydo4O6brfoaQ4NRp5xv8lY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FLGR6UtL1Vm0YBL5xfqlMdFWpjPBRmFAOTuvGYYQxbV9W8Nur2hfZuQO17O8rRG+u
	 r7sATOvd6Pg8BOKXr3FhN0HfsIuqwugYtovHDpg7Lriul45y0TYMiPntgk1/LYbvC6
	 kRQLKKViJGTkhcftDqXMwWaumDeT3JVoolsZPHdN21YMFFQvRgAaQjseGBrBc6Vp+Q
	 9VcJdTFbOXiN55Xwz6zrMPD7A+iyrTXMtNeVjPaZ1TEQVOakgnvR+tqn+t8QDU6w+H
	 ojQ524XFrYMXtuPe65MYq/emz//VuaYu7KwvzzfMZ0mDULo6ED7tSUPKCW/8ubrdDe
	 aMwrHXxFwYOZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E854405F8;
	Mon,  9 Nov 2026 10:55:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A8876235
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 10:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EA3A605E3
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 10:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qSV9StfiAWoZ for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 10:55:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 73B0E605D1
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.146
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=m3RagpeR
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73B0E605D1
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 10:55:12 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id QN1qxrcTayeI3QN1qxLPYs; Mon, 09 Nov 2026 11:55:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794221710; bh=uUA/jq8V9+e1aFA/ERSWGr0Wz1srUatOSxrGAfVfTp0=;
 h=From:To:Subject:Date:MIME-Version;
 b=m3RagpeR2AieWcCuRuiqEGkIatIvVTCl/t35BLOTagvCgDfUzp1AWJtVp2ERnbiJL
 48hqSGWdFddSrpIfDCqpiZAmp7wbQUd89unqiWE54sKMFyLj9kBuGN1WmNa7DvYQ+Z
 VpNkyGVsTqhnEuqsUX5VgmRwWadheNGHybSAE+goYlYzQ3/ftGc5bsmWLR04L4C5oE
 D5ln86Xwitcr4z0oolbNKP2w3Uuz/qKZEUqBhg9Z4oXtA9H4BdsJs4hSheuhluLScq
 ALSYpAAGl1aRrEqsWBJ49yHr4PS6LGxJYCo1greebDXHiqrYNkCBYaBKJho1zlFCof
 vnSEwrTvRJc4w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Mon,  9 Nov 2026 11:55:09 +0100
Message-ID: <20261109105509.1176524-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFwVmZtZN9icjF7Sqc1CTyd1QqOAb7wsdJcgX5N1k9r94hmBFEAguC2eYT2/wnLB00q0h+4IPioBxvH8XpsGEJYRkH987/o36LSLGKwCDZVMDGtO4Wcs
 naaaommy5cJbOHFywm3Uu2kMVaDPZJPZDKbZQzuRFRkECkg4W5A/T9EUmBd63Qbjl8NfZ+ZadGSa0o68T/PnCra2SWRUZui2+/HpFv0Oj7/5m49XJERhMzG0
 jljAwJvLhtoe/gUgql7VQSazJyO6EELIDDHKBED6y4OnLT3jvBIrxWkEwjkUGWvr7aSv3IWS4WcsAFyJx4a3GA==
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti for swugenerator
 runtime test
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index febf03773c..848307a0ba 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1372,6 +1372,7 @@ F:	package/vim/
 F:	package/wilc-driver/
 F:	package/wireshark/
 F:	package/zlib-ng/
+F:	support/testing/tests/package/test_swugenerator.py
 F:	toolchain/
 
 N:	Graeme Smecher <gsmecher@threespeedlogic.com>
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
