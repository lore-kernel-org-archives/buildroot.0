Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B433CCA46C
	for <buildroot@archiver.kernel.org>; Sat, 17 Oct 2026 00:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48C2B40AF1;
	Sat, 17 Oct 2026 00:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dzQZTZNldfsg; Sat, 17 Oct 2026 00:21:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 343C240AD7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792196496;
	b=D+XqegocOSlr5931sqzXYGk78MGh6KQop5rpSLrYr3VGrlEgFMrxKus+b5ffRkNB+J24
	 nRnQz+pXprU5zn2mnv/zpeRr97E+od0gmaNZLsncI0dPi4OOYIUtrqPJD24PllxyHKtfR
	 LyCjRNor8SWa3fKXWR7wN5HJUcxvdMtSABARvyxPeGqxb6VQNB7wAUmMxgqUA0D3oNePj
	 ety4jbY43QH7K8VkjoT1h3rMGTSIxvGBNtBIe+XxBWG7ZxRYJXCniXYh4g8D7xXIPnvoD
	 Sub8rp9xwW+xUB7PPTuvs+hQ31LoqXH92ysz3ttlyyzMMliRjhswwDX2V4rTZIckvYw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792196496;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bxaFXGfD+86rf5Lu27hDDSz8/EW43ccDZP/8b6ybq/8=;
	b=fKB96Fs+VZ/xZh6Kxso44zjJagqMgZchY41eEqI1uIMY8QGFDK/Z6nsGR3MvjOuf8pgu
	 8hMYnT+g5oas4zsUPagOy6nKa304IYUNmuF687xxdmvggW6pMnC8NvfARFNOYcTIBZ6+A
	 Vip1cBEL6tywhqCyow0Qa8gKBeQWvvQqv/r5hfFVZ29zGlcNNo5n17rh7tJ4Exab4nJlq
	 EyIb2eD51USACB5yyDl0ABP3gNJwLk++qXEVj0G4ummXV4/Sbw5bjafDddws8kdHcgTbj
	 +ofB2Nq1H3qGPe1YHdKDzrtsZtvyaebWN1MtojSQmE+erW+ORTb/qZkuUHoEP3xK9RA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792196496;
	bh=bxaFXGfD+86rf5Lu27hDDSz8/EW43ccDZP/8b6ybq/8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Fjj+yEy+zZ19687QjeIgsMCU6ciimeLe6DWswjB2LYcoVPZI2n64laicAod3i95NX
	 R2PotuV6oSJKYfkHzuUgM5ZFjIytWlsYXibhpPbI0j40TB9jGc2/J9WZI+n8ks0JF9
	 6yCu4bO8Jdc8Oq3gjHI1hBQKGxFopy3MvKDPlk8ZxyjVG1G9V1cB8rFaAX+ypzrzQW
	 YOkiEXO6WsKcigXQCNV1WG4sfjr0Ficl+oJyT06I8IrNetnr9aYq4/wsTwIhqRRxU1
	 tyetjS3Q4AEn+CUn0jN1hiCanwLwtPzF3FWfeNsTh/OZACFWE8ydBcNnLxrLs4llJo
	 BFhnGSu/jVHUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 343C240AD7;
	Sat, 17 Oct 2026 00:21:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DF19105
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 00:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B6A160AEC
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 00:21:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vplh5L1Y7psy for <buildroot@buildroot.org>;
 Sat, 17 Oct 2026 00:21:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C674F60AB0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792196493;
 b=WnY2wruKyFeiI3PWA5SzsWJ122s17I/9qTpSz3P5LiroXfxWY7hLKTns/4XbZLq1dQ9I
 aC95I79saAqN9CglWxaGnLdYzAE90DtwZPW6/yWB65s3FxrWo+AZJwzxfsqrLmDkA02aW
 1/SLH3rn9Ctbw8reTbLuzUsoQ4vdKSSfGx+zoHS24GWEO+IkdaSws0yBn8PKn2wscKnsj
 nlWsCSBMhdrRMv+SySi+E8KKntMfwUnH3troQ1TvE+a8hYN9jLamprxyNgqCK06UA5hHo
 brk3xqmoLRiepPxGK6XkAgnRfaBITWXVrxkw7988lPB0Wo67yuaJtSBnsAz2x9P02VQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792196493;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=eb69VkQlwF9zppNnAeoEev138ZUULSQVDKZvZidDl2s=;
 b=AcdSGX8NvSKRaEGiAXc/c+Y75F4o3+jb5vfPZthYHFv2Udu5BrmpCWX0x7VliP8yV8jq
 D9INzZAuBpR2fCs6xri8kwSAmO19TJgMwguI3fGn7vLjTFZPz5hjIzcJ4EMFdkGcsyEuG
 y5I2pq+ET51jyT/rB5tuB5E/mRaNuYGOiRRLIADOR8E0YIOkJ+Nx72cDY4otOcOTL8kK/
 n2d+ZQ/hEmGdJ84SXXNQNYs9UtpWt7yYslcfJjap8I4VLv+RV5Er3ffrspe4qKR4/X1+B
 cpt9fNG/L4qhvFONdLiw63U/Az2ActRoL7vQZ1h1t7zttREqY3ttlCm9QsAzIRDS6Cg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=aWNPDV9i; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C674F60AB0
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 00:21:32 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MGhuK-1xLfXm3eVe-0055Wi; Sat, 17
 Oct 2026 02:21:28 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 17 Oct 2026 02:21:09 +0200
Message-ID: <20261017002109.3924131-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Qnqo9lVa4D/suLmeQxNlbramxJv5Op6pv+feqhdk4u6pmOS0hfy
 s67QCl0+cxWDF1ECvFexI36jsmcZ7RrKqrf6QFTf2FQ8Qx8zRRwfWFwzQzZu5/JMf2gpgmu
 c4VUPiCbEpsVZrjaPpRI/h2eNxs2EghB1cGBBCwJSWGazOGpmzq4OWGfe3OV2Tg6V7Mu5Kj
 LHl/UfuErtizReLLR+ApA==
UI-OutboundReport: notjunk:1;M01:P0:K/6smbmrXhw=;wy2XqjTGQ0ulnnsr57JED1vybGU
 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
 vRYiZdNb0rVlSZsPYitSFE8rYNUlo=
Subject: [Buildroot] [PATCH 1/1] package/p11-kit: security bump to version
 0.26.5
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

Security fixes by versions:

0.26.5
* CVE-2026-18938: rpc: guard against overflow when decoding nested
  attributes
  https://github.com/advisories/GHSA-6x8p-h5fj-5ppr

0.26.3
* CVE-2026-13757: server: fixed stack exhaustion via unbounded
  recursion in RPC attribute parsing by enforcing a recursion depth
  limit
  https://github.com/advisories/GHSA-p2wm-69qx-x25w
* various memory management fixes (including memory leaks) without
  CVE or details on possible security impact

Full upstream changelog:
https://github.com/p11-glue/p11-kit/blob/0.26.5/NEWS

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/p11-kit/p11-kit.hash | 2 +-
 package/p11-kit/p11-kit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/p11-kit/p11-kit.hash b/package/p11-kit/p11-kit.hash
index 943ad9c22f..ca76eddae6 100644
--- a/package/p11-kit/p11-kit.hash
+++ b/package/p11-kit/p11-kit.hash
@@ -1,4 +1,4 @@
 # From https://github.com/p11-glue/p11-kit/releases/tag/0.26.2
-sha256  09fd9f44da4813a3141e73d5e7cf7008e5660d0405f13d56c15e1da9dcecf828  p11-kit-0.26.2.tar.xz
+sha256  f2cc09111e44bf3fea58f023180b33acea90aa82d042d6fbb623fbc5ba033bb7  p11-kit-0.26.5.tar.xz
 # Locally computed
 sha256  2e1ba993904df807a10c3eda1e5c272338edc35674b679773a8b3ad460731054  COPYING
diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 60133223ce..b3bb3e1263 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P11_KIT_VERSION = 0.26.2
+P11_KIT_VERSION = 0.26.5
 P11_KIT_SOURCE = p11-kit-$(P11_KIT_VERSION).tar.xz
 P11_KIT_SITE = https://github.com/p11-glue/p11-kit/releases/download/$(P11_KIT_VERSION)
 P11_KIT_INSTALL_STAGING = YES
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
