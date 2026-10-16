Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E03CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FED340A9E;
	Fri, 16 Oct 2026 15:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ckP7eBVGlsK; Fri, 16 Oct 2026 15:28:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D578540A91
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792164510;
	b=Pnr4MWQ1iUwQFA4GxRJZ/euG3tlUKXatlXKpUObjv2wWgxaI+0c548WPeobFAJC4DPek
	 ymlCxIoow4Nr90Bb4tyozIqon5jVhflXfgvg5KQu5pi5Z0PkeO0FN0/9QA24YgCmHApKW
	 V/7/6ZwRXWCPERkbD+uX4edBGerN3kND95HUHibw2WGY62La89f0llwikHhWYfeT6enHo
	 jvZAccsxaAzbqWvhCnRHp1IodMM8VStoI96Mzv5RvQLIOvmFIbaXqyz0cmH5Bbm9LQYeI
	 LtLevbtx3AMphBSJgAtErpcI2+P3tdjnKrhUrzXJctMqcnpLsdsJA9bVnEeJUTJcCoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792164510;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=i1wjF3F0j/Bk34lNvQgSY/V23Pv0QUCH4nNndANTcSc=;
	b=jQ1r/n0mNVRQ+0VAt0c96SveLbupF+b53qz+wRzuNjIU4n1TVf68o2HcFRAqySlES12o
	 aWAojuURQGdi99wIXMc6yiiruJ2/8Bic/+az5XNgCfOnPLOw+GUSLNhNuYBXzg2xt+CDd
	 u9ZJlR0mrsi3f/ZsCdLBLiyGgeWZVHeGfwj7W5whsP6dR+av0v2s0cqIzIQ0ZB6CKgYoN
	 mkrGDSZwjWspPWw7c7F084TlClZs8yFPpaKHYwxfRfqJOkPrIpNUuD2NvsfaWQQsB3BiR
	 oeN4xBDtvlUwRtZmfHGk5dzPEMEk/rW2OOazgSxmbM0gbDwW7rsF2XCyNiIRE58ytwg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792164509;
	bh=i1wjF3F0j/Bk34lNvQgSY/V23Pv0QUCH4nNndANTcSc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kLyximCuC/MmIcpPjaXkxfVQ8oN76iNqiH4CjdcTyvmowAGrWt7+hKgxze2V9OsXR
	 /zUOapVloI/ngblQERCMhOzmqG0w3DD1mdCwtUyxdVFBBFS+oKtYImBDY3B+/b13Te
	 GWoEXCF1Fk86sGWsQRzsYyr3CpHkaH5krhGcgrBF8Rxzs7ZvOa9BA7fFkbMjoTnrgW
	 ssj5qWPkaBFkWIVUPIwcncmKglsGJCqiR3BZFvdjcrg5wPUzq+v9r1EFTXg03kkj4w
	 UUFCUDxPpj8E+YjnNC67B7iebGQdZOXyFDCk8eTqCF1FsI6cL9AjymsRViJz0P6Lxa
	 nr1BKEKOmWzJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D578540A91;
	Fri, 16 Oct 2026 15:28:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DCA8769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F1EC40A91
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AjRPq09yexH2 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:28:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0626240A94
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792164507;
 b=XZ0RQ7Wf6oRqlN1pccphtwfS976DN0JvNGywksuofl6UA9gQN70BKbdEHnTNUrD5Fkkt
 /83Ogh36gSEFX75yDqKxwaBffgYqy0w8SreZDzOvU3VbLQdv89Fvi02GuitrKTh7ENhVy
 1+IBpRZ668ly+0IMrVbMipENZa2tSd4wiVT5VZ6KuPDBannXtDDYXViktUjlhxp98DokC
 yKGSLidlCL8rHaGf1wmE6u7W9x0iAf/NG3dwA+tb6OCUsQmu8jyB5WkH1NfAK+T035Qb0
 5WpcrgIZmdTSrFbo/PDKDc8w9NXGQ5//WdD+RJoPY7ushZjIc5pLNc3Fuliq0xq6VMQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792164507;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=JxqKcXvIodnMutKkpV4wOvjjb4IppxjcspLlydOWfXI=;
 b=gk3+EnZYsutILd6C6UX5i1c6xSOW8wUQEkoADf8nY9F8pnw2+566K7rGuMTZ3Vmgwi/E
 9Ym3PORkG70BI9Ia1CwdSq4nqtK/4qVyViLxwRd+QNx+nLhuS+DERP8+oa/Z5sJ+9JiTR
 WT8YvF8VTcnHFeeSlgqPuRhxj8HxE+sYhkpfGmrzXzsqjTq6T7AnOJKVE60OnrGRxkBGu
 55eBeF3iHAP/oq2OUwY4vLbwN0/7RFbX48WQo2H0f+KM+AnJ33wfF4Bd0RenxC47Lyixx
 CPUFQ1MIzqu1TZneRrm7rKyz7KkKi2HxXp/zR2AqA96I+DHh4yxABQNFOloZxC0BWgA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=pRljbEXz; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0626240A94
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:28:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTiPl-1xCUgb47A5-00RacV; Fri, 16
 Oct 2026 17:28:21 +0200
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Fri, 16 Oct 2026 17:28:08 +0200
Message-ID: <20261016152811.2817446-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:nMbSo/ELZo0n6qG5c1gAlx3JBJZ89DAKLccfGh7ekPasUx9RI5t
 Etm3v4fJD2q65VavxkX3YjAIARR9NP9c9pU0SP9J/Wo+YrJ8mUAMF1sYTWCGYm2ikjXpyOO
 hrX1Mmq+nqD3GpQ48DLKOK7XTbLvtbR4cQ/rPsg7/os4U1VqWVAFdjxNhVcCKRSL3A7/WTn
 f3yex6LJyfXFmYw3saWYw==
UI-OutboundReport: notjunk:1;M01:P0:ZWtLIsZ6Gfk=;R78oRF9nAYqOyOWbtGVZqzvD2W1
 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
 uMvOyFgFmrY=
Subject: [Buildroot] [PATCH 1/4] package/uboot-tools: do not require OpenSSL
 PKCS#11 provider
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

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Patch 0003-Add-support-for-OpenSSL-Provider-API.patch makes
package/uboot-tools build without the OpenSSL engine API, but it fails
at runtime if pkcs11-provider [1] is not available. That provider is
not packaged in Buildroot, and should not be required when not
actually using PKCS#11 keys.

The problem has been discussed on the U-Boot mailing list [2], and
part of the reason this patch has not been merged into U-Boot yet. It
causes tests.package.test_uboot_tools.TestHostUbootTools to fail with:

=== STDOUT/STDERR ===
At main.c:259:
- SSL error:12800067:DSO support routines::could not load the shared library: crypto/dso/dso_dlfcn.c:115
- SSL error:12800067:DSO support routines::could not load the shared library: crypto/dso/dso_lib.c:147
- SSL error:07880025:common libcrypto routines::reason(37): crypto/provider_core.c:1026
mkimage: OSSL_PROVIDER_try_load(pkcs11)

This commit adjust the patch as suggested in [2] to continue if the
PKCS#11 provider fails to load, making the test work. However,
actually using PKCS#11 keys will not work until pkcs11-provider [1] is
packaged.

[1] https://github.com/openssl-projects/pkcs11-provider
[2] https://lists.u-boot-project.org/pipermail/u-boot/2026-August/629348.html

Fixes: f87cf2d6239d676147dec1fef088d81ee873277a ("package/uboot-tools: Fix build with OpenSSL 4.0.0")

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
The alternative is to revert f87cf2d6239d676147dec1fef088d81ee873277a
until a fixed version is available. In any case I think either revert or
a package for pkcs11-provider are needed before the 2026.11 release,
support for PKCS#11 is important outside testing.

 .../0003-Add-support-for-OpenSSL-Provider-API.patch         | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch b/package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch
index 9a5071cae3..2403e3ebab 100644
--- a/package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch
+++ b/package/uboot-tools/0003-Add-support-for-OpenSSL-Provider-API.patch
@@ -29,6 +29,8 @@ Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
 Upstream: https://github.com/u-boot/u-boot/pull/918
 
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Fiona: apply fix from https://lists.u-boot-project.org/pipermail/u-boot/2026-August/629348.html to make pkcs11 provider optional]
+Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
 ---
  lib/aes/aes-encrypt.c |   4 +-
  lib/rsa/rsa-sign.c    | 102 +++++++++++++++++++++++++++++++++++++++---
@@ -149,10 +151,10 @@ index 0e38c9e802f..f456f3c58e6 100644
 +	EVP_PKEY *private_key = NULL;
 +	OSSL_STORE_CTX *store;
 +
-+	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
-+		ERR(1, "OSSL_PROVIDER_try_load(pkcs11)");
 +	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
 +		ERR(1, "OSSL_PROVIDER_try_load(default)");
++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
++		ERR_clear_error();
 +
 +	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
 +	ERR(!store, "OSSL_STORE_open");
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
