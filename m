Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508BDCA9ED0
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 18:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16F47809A7;
	Mon, 12 Oct 2026 18:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rka7elkB-h0n; Mon, 12 Oct 2026 18:24:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3C3208098A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791829451;
	b=quBjZmVl5wSg0Ugr2/e6n3DXnU+Cj+o3VO5O0OL520/ssEnm4iTaps5GkHm7brieLpzq
	 S4743piMbBBbw2XCApY8Etee5trTcBDq1qzWWfmPO0ep9Q25W4yB5PupPcHKRAThRZKhR
	 LebUkiz1qyc2Ob5/6Fl4qh1hIwXUXvl2+bjho4YxtjQsvliDnRkONru+8Js5mwsXQPcEk
	 VI8tBbkMTLULYklBH4WQmrh01/BB+cn+ZmYpatCYEQsJCA71mONkDm2vmjA3kpJOxjTSo
	 +mZL642TTR4YPZctNBmLKts62FD+45Sg7Xgvsbfk+7usTtgVme2HDdoKo3V/3jy7rmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791829451;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5zeMVDUcGd97lMrvP2umSVyK0SSwPg6eDXd65MaRSaI=;
	b=ALy6GXuiYoeGvIppJBRfwS3XY0Uz4OZuljl/tv9RREYU0PnmibY9awflS9JpacR9zv4V
	 kxDffq3hJtFHRGut3kb+UKFqGfqjLa3a93oHJjm27TddqJP4Fl0zq92IQeZNMdX6PfbSW
	 dT6PLTukLSf+KhNbIpYA6uz4C2VBWJq5KhTE9diKqg04zPsNmh7OqEI2ZoCNFVgueX3df
	 fnlRJZziKB0I8mKPTQnlQ/I/IuvGHmNp80YcNJdL3gvCF3NCA2NKLldgqLntL+4UPiAlz
	 5lGs72YLVSa8RLAgehxf+feiCNIhev2joOc28DUyL3kA5av0gpcq9k7QwaPOMhpiBqw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791829451;
	bh=5zeMVDUcGd97lMrvP2umSVyK0SSwPg6eDXd65MaRSaI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=RGHz7TEshyTkCPYPlcnJUiGyLfULpHQ9mRzuae+5LsbQhBYUE2lGAuvMrq7Fr00wx
	 VbmBrIgoK+v381/CImNLf6cMHyn2Gf9qIUQEmxS2yg53jLJRSJ40WJTUCxA1wiEDbp
	 uLaVQNBkoK4H251l6WLD6l8J23ay3oUZxob8cGJTE+orCbO6H1TJylpMs7GLFANVHs
	 j31JBj5ovqfof07qTwcLaYly7rS9pOMsb0sxpwVDtrvcBmDsjpHTuCawSYs2sYhD4A
	 wyS4DgLpIgMBmeHLMEYKK20ybeTedvjHcQmYLhZnumw+FNKKtEfZ9qhfRMHqOmilhy
	 xZlIAtVE39TEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C3208098A;
	Mon, 12 Oct 2026 18:24:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 549B4105
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 18:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46962400B3
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 18:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zswcoBnVdGQ9 for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 18:24:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1314E4002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791829448;
 b=ndv0VjmwHxARS5og9HUO4tDJw+4ZF1DPTMklSE+GiKUcwlKd35rhT0pLB2JJazQ6GZWd
 J11WecCYZrmCBoFS6X7FhKI2EGipMkDFRi2VBi1Wn5l2O4y6jq01YHaPfb4sT/R0fAeXZ
 8Fh28nxwzbocHbZZyCpTLsWtgrOD/ZBtaxmIqP02Qxr+S4tpqmFfXQT9Cz6dSaLZhlj75
 uI6qFDSDmytj7cEd86eC0l+gM/euzn0l2jduTNT7bXLzHbisyLGxAQ0Bnjfnl08WYqvFU
 bsm5F+e8rzpx69CfC51BYXzbI+AY9w0yNMuKE1STiPuvA5TDlDX2iFxAkU3kUP1AxtQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791829448;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=DsBrJym+97FZg8Ptp/6zwd68NkvXk4Y8dVSWj7d7zjc=;
 b=IAS7RaIxBOlr1+ipmK5fmwWMvfpt7ReiydvW3WSRrZfUQNCAZqim2RSmmdQmYD2ejTSf
 /m6qAMVvMKKkujjfIcQeKgFarQ+T1+l3jxp5ErJszCpI2nIeL1mqjSrqBLbsSLMyB5qta
 3b7B99fKAuOc7cCY4OZm3wncwQdqgb8YMQjGqbFZvElON3mdlJAx1iLLASJPLiOmT8AG6
 zJEGKaG2pes6oYmBDUX1a8EGcbvFSAJzT7lZB2lXvq4avAt8UcYSz5eqkB82NMOR8OLp7
 rR36uGFBDhmrQDmrCxjrOo7mQa76bBAZuHkneV5Lj7QeJust9PThx4UbaoriTPg5WSA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=dkIsTJ8D; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1314E4002B
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 18:24:07 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MryT9-1wt4dc0O1N-00aoWy; Mon, 12
 Oct 2026 20:24:05 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Mon, 12 Oct 2026 20:23:45 +0200
Message-ID: <20261012182345.2187315-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:F9uHW4QVA5wUCxdzPBWeC+uCQsAEIlBVz1Oz0Q84FPHco5YDf11
 7YewOpHOV3f+NXU3DIbUUAcZA7mmr5alvFflFm+hGXHt3EV4hRDVnrHv0+h+wUsS3MJ0a7J
 VisGil4rXmdd2eZqVMquh0vPc4S8Yfu5Rox0dN80bHgCvpkxx8YsEB9568EdNQh9QD8aPa/
 IjMBp9oFaO3haYh4TO8xw==
UI-OutboundReport: notjunk:1;M01:P0:KPTP0Ctnteo=;JoOScIPmXBaw9V7GEwbTjXiHhZd
 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
 1Q0NZvIuOYBT902dsjCk=
Subject: [Buildroot] [PATCH 1/1] package/iwd: do not enable
 CONFIG_CRYPTO_MD4 for kernel
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This was added in 8c12a6bf51bc4b166948b4392e96344259a64778
"package/iwd: enable required kernel dependencies". The iwd code
referenced there did not check for MD4 then (iwd version 1.20), nor
does it now (3.12), so remove the Kconfig fixup. It did and does check
for MD5, which remains enabled.

Fixes: 8c12a6bf51bc4b166948b4392e96344259a64778

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/iwd/iwd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 8f662ce5e5..bb6bbcd868 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -77,7 +77,6 @@ define IWD_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_DES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_ECB)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_HMAC)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD4)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD5)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA1)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
