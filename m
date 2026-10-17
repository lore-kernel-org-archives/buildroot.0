Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0568ACCF2C7
	for <buildroot@archiver.kernel.org>; Sat, 17 Oct 2026 14:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4A5B812DB;
	Sat, 17 Oct 2026 14:00:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spmpTuh2P14X; Sat, 17 Oct 2026 14:00:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D439D814BC
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792245648;
	b=A2p+nM29HBZhykHezYk+TIwbUY0ndofkr0HDtQ4sTX9KeoqQES8fSKyEg5TjjV7N632P
	 SlxmXMX8ykGpKJnsWQAriYR91bV6ggWKqulpNo6B3HrOoeRwBo3ERAmidzzU29AupzGrj
	 2v7DtaHAdl/CWZ5xAbDwIR/PaWz3yvEobw8D49xd9c0IqsRtnGb2WcuBTFR+JEfl80IXW
	 VPqAeodUmIOp8XNGf81Lqy/6Zt/aAZqembmiKb2fdg162Ez9Dm44jSG35amwG6mHO8XRM
	 vZEmkVAzRgMrLkDZomlVQvoY3nJSyrbkzGqsYRRYDFWsu7gl9cMXu73OCHEJISkq+LQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792245648;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bxaFXGfD+86rf5Lu27hDDSz8/EW43ccDZP/8b6ybq/8=;
	b=pssLJ/X0T+nlzm57+jsb6sRADnaPGTxjceE0A0yW7rMt3ghx+9XL7Nza5850IwZbKhx/
	 vHSJS+SvUkrliyQ/erVDAEF3Qa7da9f1DvssEn3mxMpLEFS93qKzY+L1a0z9/RA+2ptgH
	 PdjAxrKkkMpqvDMjSstt3JTbU7vbIZzjagSwEonBjZn3PjBp0eexYTHBPpoaa9n6KdPb8
	 LVNYlXqa9W14s1KJlX3+XXVuhHPb7CXp7nlWN6tsBZI8IlAHKuEFpHrKE/PE8DJVojPTb
	 uBYqgpYhh45LuQChMb5fE/C+ao2g27en8aLymbe0qxpmCt07oK1zv5+Vpynys26WnHQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792245647;
	bh=bxaFXGfD+86rf5Lu27hDDSz8/EW43ccDZP/8b6ybq/8=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=NpmXwP1Noy1zJvt+Ow6+nePtsfw0K0r0EftKcI+yATVZvFTfjKEYWeQt2BtXc7n0q
	 RkLy5hHRm3MB3z2ADxjgO1dTwY9sDFr9M1eq5ExCwpxiKO4n7zlVU6amLrYUbR6Bh9
	 Fk2I0YmbN8kvqv/UONaGd/eYS4ckvcHfJ4Yb/loOBKCczHDjFHo7HG5idvn4U8uym+
	 lsb8ie4kRyyg5bEZkklLd3L7VP+xOZ2+HM+GOPguXJvk31zN6zY8bv9OxH8gir26Po
	 OcPV0rTTe0flCrL/SRFSiJe9GauM+e9qPboAQA8ZIRS3tFvIq9c3YYL4mXgAjZXvat
	 NONI2efpUWH8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D439D814BC;
	Sat, 17 Oct 2026 14:00:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0741D1AB
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 14:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1D1840987
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 14:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_yiVrav3pbl for <buildroot@buildroot.org>;
 Sat, 17 Oct 2026 14:00:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 551D040986
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792245644;
 b=ahhMFAw2YSZnO/oeedslpqH+t5R0FLQhM8DaeEszPmJypNaXeuGDnbqw/mEQra2juRAx
 g9Olr6pxUzZbAGbpTGKJ6OBs/Cqd5dp64r/NvOGDLYPB+bNHURLTl5fUBqJiJ9W28pVA8
 mUOhQcs2G0ZJ7RJOkbK6IMxA3CjdSk7maQoYyUo8cfvwD/l1egV0HyO3ZhK8lwz28vSa7
 xO5u7dlEx/8ykfh67AcasvCaIRt+/W5ChccawW2Q4sUUuM6Q+DUSKCBErYwhCqw4qMjp1
 8qas5KWloDCOH+FdJgNBqscuzoRXlMOJfnbq5BKP4yD6pnYWx8862Fy4pFJKMxlQREg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792245644;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=eb69VkQlwF9zppNnAeoEev138ZUULSQVDKZvZidDl2s=;
 b=Qq3/1sR+oT8JAS/uesVZolO2V9HpOFNitZC1s5u6+AGRte8R54XfcYd89idFc2m8vhLz
 wJMZAV92JqF7S74o6rU4LdL5yhg/DDyJA7WHsqtjeHtc0PRVUAja4EaUi68CtneKxB9oB
 XGPpOI4DF9Y/GEVg/O64npmcnysMQns9Zuxe+CKPl5IK3u746sHXAS3z9uPIHrOVifDDA
 D+qEiXxvfkhfW/2e7rQcJHwXWvLXKS6W+NyOgVeTvRVi5GuOpu+SM6aNHSvuuJeeG1gUf
 FLq323SaHu4LhscHyzeUf0v7Umz24zopgkIIBWBMI1wf4vxCnjhafwqSnZzL9Q0XzUQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=jGyd34KC; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 551D040986
 for <buildroot@buildroot.org>; Sat, 17 Oct 2026 14:00:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mkpf3-1wuF4s2DIl-00dLvg; Sat, 17
 Oct 2026 16:00:37 +0200
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 17 Oct 2026 16:00:26 +0200
Message-ID: <20261017140027.697390-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:OWSMaR9i7ob73ArNMmi+8gALCQDi1kR06Mm/IhnUSz4ATX1/fZs
 ucTWOLWqpAcVRTo23IWbUpSf+L0+tUlnP6Y+MviYw9lh6LCr1uWtVjc/RoW8CBcKLO3WKPu
 HGYXJ+cf/yalkANf53uc+Yy6bHdER2F8AYuWJFqD61nWMz/r706AqpqjBLIBFIlpAwrRQ/o
 CAiILpeT8Lv7jA+SdvdKw==
UI-OutboundReport: notjunk:1;M01:P0:2dvZiLQr13U=;5troL6ZE22+OX1udrUOQWhSotpK
 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
 =
Subject: [Buildroot] [PATCH v2 1/2] package/p11-kit: security bump to
 version 0.26.5
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
