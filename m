Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E1BC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9247460759;
	Sun, 20 Sep 2026 14:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsZevLGWlbyr; Sun, 20 Sep 2026 14:57:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B845860767
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789916258;
	b=jZ8DUc8GXpe/iv1ZIgXhLtm321knpwBiGP9o6CFpbDTU1vUqtJQ8bmSZOfwR7rxWWDlA
	 vizxIJD3Qlt33CbLnb3469AB01btlpqx+4XPMt/Svd/IJSBdt9hCjvLUdRZJqMlOSlMDi
	 vYubAxmy7xEy1has1bwUnZxNBL+0Y40WcRGs9KT3RyEnO7lAspHqSeeq5VsK+tUU+mnMu
	 ZYmqqO43P4ae8uwMz+T5+ebI0Jg9Mcaoz6pcMCVeXvrhNzErz3dHhF3n3NDlPo2BUL3L3
	 XnYW7thFx/ImWMJ3U9Z4lR/JltGGU06ka4fnlXiufz172c9cqnsA57WjOdk5LzbwVxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789916258;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wmEmg7YX6kok3q1pbpCLq82nmdS1hBdrqA61c2dvlUo=;
	b=LMLwIrCPOUUDLatEMsYhklMJZ3EfJWrRzMdo/HUQOOX/sST8MB7UZmXb/OOzCAHkT5PY
	 wZOm2mX6qTGBwUmjp4B0KYCN5CH94TSr1wVlxpeMaAzREuTxWBrfcf2AbDkdcRkGrQfhu
	 U+Dqv2XJsWy+GI5HQcOWkeFyUqMfVDJKMRv+MAyp2dww7dG92aNi+jB7rpH7g6yOvwPgu
	 krXgC5X3H/EK6Ny+7uUM2m3K2F5rtZRlqEgy9pH8aciqyBHELYRR3HyNKTpnARsgjthKp
	 Slixy7eh3jcuXx7q6VwOZheo/whJOxXrc6+yVtYZvxmPEDIRtN3rC75IAvp3rP4tjPw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789916258;
	bh=wmEmg7YX6kok3q1pbpCLq82nmdS1hBdrqA61c2dvlUo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RDD8akFBJDuOjRZU/TVOjZSv7Km17b5PPQj2ew7MXNSf9msq4X2WJRn+KlmcegcQO
	 drl70wcUKGnpcO7334he1tNFmAWbLNeCprGOgESiRrOOwq2fPGU+M0Ozb/qdXonBGb
	 OSSNd0yHu4zMTXINzcRX5ov87dHetMN/tigZiIdFgcozpqIM62SjPaYj+hV3FWCQAW
	 v5eZ3X8L1JUob/Zap9AoF9gCnHtCsVumB7wPubuVEWd2Hjv80P/VxZR+vVAD9kiWHK
	 9sEDlpbLTB6IVAmsf5k7lEplqI8EFuvvMI7qOncsBCnl168xrJymvluB5bJ1TxsVhg
	 3mqjxThL5NZRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B845860767;
	Sun, 20 Sep 2026 14:57:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E3573FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AF5880E27
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:57:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4TYPWwxFGTiy for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:57:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B7D2480A5C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789916257;
 b=Mu50H3MgnqWNjqARDGTpbS6xEMh2M37haKlH5l7V48PDZRQUCk3TkNySQOAoCrTlS167
 cD+JupBPdTaxObV26Rz91SkKNIREaLGtrW3QwpApWxuCLLASDC+5vX0COl/2Y+tPnSDoR
 WCeg8FoU7DEzeUsfZBn6SkuO+vleFMr1L/6HiJPKVGrRKm9E+GfaFO/2DPe6udST/6RFG
 l8zqB0eL6ZrTRhW82T3BVCB7DyF+gXwlxWqlyZ2LMTGxGiqCeVhSk4FWnQRBSs+mUAaku
 m//6htVmx39eA1AGVbneEiyJwJUh7wLCwMc7El8wxE4tvvILiROjQ55DTROPeKfPbUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789916257;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5bSOvAFgQEIp5Vhs2TnSNbtTNJQ9XVCtj1wzIlQ3nd8=;
 b=r+DJPNP6Eru6H49LIv/qyt2lRNGqJhZLexGuu+I5bhlcEf2AOGri/ZwS9WACxK+8ekvY
 rEPbD9OyUjVLqTP1LRyXU1lqs8XCXF/ET67XgVf4bmrWhi7SzQqyKI06LS6KqKOtQBjdW
 0GUicoR27YYHWPn97BgNe0MrLFSux8iqN0xXVuhUihHxzzu7maDwRqcXO8qktkVFB8vtv
 8RTRc/bmulDxM/5ZtsppCM/CSESym9jz3ZLXLW0127ZFr7bT0SvXl3KuQGw6GqFZFopdR
 2IEmw9rWK6UvcuKuGIBldIJiS2Yc7TDbpPN2Y56cvF8+gjSjVAMKo2grCbXRG+hmc5A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Qmi2jeFO; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Qmi2jeFO
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7D2480A5C
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915506;
 bh=5bSOvAFgQEIp5Vhs2TnSNbtTNJQ9XVCtj1wzIlQ3nd8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Qmi2jeFOwVlqE/y/TEQTBQl3JLa+JxD9r7Nieva/vMenH/YAPlc21C/2XLhRfGhNy
 vgqALcD6yL3WI8D940VQFxtTmtx1CnEeD1d0ir4EwqfJYO5w5GkaCH+J0r+8w+jcMu
 V3r0wTAYjSt5Nco/E7rOXnkZZiMqfDGaCR0DYIFfu7NVOTykAtnjUTQMhYm6bC04ql
 sMMv8erzgjrhaHyrRLorUHiu8ZieQZYcVaNARza/ssFftxozYHbxNoctC7iGQu6XC1
 9qAjX2gIAHtIEiDLne4Y3Xh+CPqyqsHxBbheJAAK2IiwJo9JzSUZ3s8QM49oSoGpfu
 e17p0kvdAWWfg==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:NTPxUG2EwxQRNuNi/FEpOv/IHGokMX5NaWnSa2fwoyfMIPs2vZuC/3ROosyfbS0NHmTVChisTrhbCJDASZxpbLBz1GJY14e3v4a6JNQBh8fsloTk5zMAegx5W+knx0C9dsn1jsb/UfuN2I6JY8bR1wQnsIPeoISVymb6VAcNfGajJAVXDGgVhM3k8Rj4D3QzEC1TCYMlozRzt64eOLiiXLw+ov6mfR2y3JwP0fD8B5gj6wrDzulZB5znAtHJjUK+N1DqpUYPH0xV2JqhQ2rAM1bR/khSwfmBGhvsjLVuU0czeCddy4SSpzb6rpvzz6W3Pr1SLk93dc4YmMwg4MFVSVtrSHV+yjBkT712m83Hor198oUIJUuA6w/lBnc5C6Nu9w3oUPCHGEPE4gVKibv424UaZ5NaTMFLvi3oDSOBYOvOAYBQ95EiTv22eQi+/42dQjEy8pWho9TzrDh3aijqBFmH+IJQkooDibb6I7K0D3sB2XqeUysVShKOREY6JIsiZs2alibY/8SXrX9xi0L0twWnkV0pau/+MxITO/xu7SEEizvqKRMZfyA1dfa7wHj0UR+lBLIIrVcrXwxqJzO+BaaiikethGI=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F20FA4C48B5
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imo-000000000hB-0PU6
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:26 +0200
Message-ID: <20260920144428.3009612-66-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v4 65/66] package/znc: Fix build with OpenSSL
 4.0.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-Fix-build-error-with-OpenSSL-4-2024.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch

diff --git a/package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch b/package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch
new file mode 100644
index 0000000000..1dc7eb28fb
--- /dev/null
+++ b/package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch
@@ -0,0 +1,57 @@
+From 94bcf919e1163564e637df8d437585bc7b55e7aa Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <rks1986@gmail.com>
+Date: Mon, 29 Jun 2026 20:03:27 +0200
+Subject: [PATCH] Fix build error with OpenSSL 4 (#2024)
+
+More details here https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1138356
+
+Upstream: https://github.com/znc/znc/commit/94bcf919e1163564e637df8d437585bc7b55e7aa
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/SSLVerifyHost.cpp | 4 ++--
+ src/Utils.cpp         | 5 ++++-
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/SSLVerifyHost.cpp b/src/SSLVerifyHost.cpp
+index ccc20898..99b215bc 100644
+--- a/src/SSLVerifyHost.cpp
++++ b/src/SSLVerifyHost.cpp
+@@ -306,8 +306,8 @@ typedef enum {
+ static HostnameValidationResult matches_common_name(const char* hostname,
+                                                     const X509* server_cert) {
+     int common_name_loc = -1;
+-    X509_NAME_ENTRY* common_name_entry = nullptr;
+-    ASN1_STRING* common_name_asn1 = nullptr;
++    const X509_NAME_ENTRY* common_name_entry = nullptr;
++    const ASN1_STRING* common_name_asn1 = nullptr;
+     CONST_ASN1_STRING_DATA char* common_name_str = nullptr;
+ 
+     // Find the position of the CN field in the Subject field of the certificate
+diff --git a/src/Utils.cpp b/src/Utils.cpp
+index ed2c9c83..744f61d1 100644
+--- a/src/Utils.cpp
++++ b/src/Utils.cpp
+@@ -129,7 +129,8 @@ void CUtils::GenerateCert(FILE* pOut) {
+     sEmailAddr += "@";
+     sEmailAddr += sHostName;
+ 
+-    X509_NAME* pName = X509_get_subject_name(pCert.get());
++    X509_NAME* pName = X509_NAME_new();
++    if (!pName) return;
+     X509_NAME_add_entry_by_txt(pName, "OU", MBSTRING_ASC,
+                                (unsigned char*)pLogName, -1, -1, 0);
+     X509_NAME_add_entry_by_txt(pName, "CN", MBSTRING_ASC,
+@@ -137,7 +138,9 @@ void CUtils::GenerateCert(FILE* pOut) {
+     X509_NAME_add_entry_by_txt(pName, "emailAddress", MBSTRING_ASC,
+                                (unsigned char*)sEmailAddr.c_str(), -1, -1, 0);
+ 
++    X509_set_subject_name(pCert.get(), pName);
+     X509_set_issuer_name(pCert.get(), pName);
++    X509_NAME_free(pName);
+ 
+     if (!X509_sign(pCert.get(), pKey.get(), EVP_sha256())) return;
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
