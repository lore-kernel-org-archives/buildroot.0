Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09486C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 18:51:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 310876162E
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 18:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 310876162E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E86C7400C8;
	Mon,  8 Nov 2021 18:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6uBdWTjuflt; Mon,  8 Nov 2021 18:51:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19953400B5;
	Mon,  8 Nov 2021 18:51:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8076B1BF3F3
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 18:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F5FA80E24
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 18:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oxIDkHW5ojhf for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 18:51:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5246D80E1E
 for <buildroot@busybox.net>; Mon,  8 Nov 2021 18:51:31 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 32C7F440EF6;
 Mon,  8 Nov 2021 20:51:14 +0200 (IST)
Authentication-Results: mx.tkos.co.il; dmarc=fail header.from=tkos.co.il
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1636397474;
 bh=kFGWMDwIW3BdwVYDysjo8l5fHCa7mMqB2HFNdb43zMI=;
 h=From:To:Cc:Subject:Date:From;
 b=WdbDvO/ir3n9cEpQqAaBB+VsZuS2gH2iPiLkhFXFoHlBMotvuWa9MyDkE7gnjS1Ny
 4aRHCgT8OpOqsyJdxBBLnfaUu/iwssBpYwFVs4iy0DtpziIE/EK/Vll679YreaS3A+
 8Asl7Ed5sBG9yZNMe0DvmH0nnCmOpvclf+fGBZjW5ztKtc7+SvCIB7C37UFm4TN1gA
 +TZdZ5AUsPnsxUTXBvJS5NN5QJQuV6X3gOoCcYeQRkQr8uW9AwSnPpNlYOmvQKQSxH
 7w5KxP2jS5ksh4w0dtPyt8cCKn2pjZYy1Uh3MJfMyqEW3sShls6X0XYytJmVnkFaYS
 VvWzkNNWudm1Q==
To: buildroot@busybox.net
Date: Mon,  8 Nov 2021 20:51:19 +0200
Message-Id: <4d997358af620f703fe8291f6fc66f03a735b958.1636397479.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] manual: update the list of libffi unsupported
 archs
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libffi supports ARC since commit 34c2afeb750 ("libffi: back-port support
for ARC") in 2014.

Add nds32 and ARMv7-M to the list.

Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 docs/manual/known-issues.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.txt
index ae29a48b3856..616430b91cf3 100644
--- a/docs/manual/known-issues.txt
+++ b/docs/manual/known-issues.txt
@@ -7,7 +7,7 @@
   if such options contain a +$+ sign. For example, the following is known
   to break: +BR2_TARGET_LDFLAGS="-Wl,-rpath=\'$ORIGIN/../lib'"+
 
-* The +libffi+ package is not supported on the SuperH 2 and ARC
+* The +libffi+ package is not supported on the SuperH 2, nds32, and ARMv7-M
   architectures.
 
 * The +prboom+ package triggers a compiler failure with the SuperH 4
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
