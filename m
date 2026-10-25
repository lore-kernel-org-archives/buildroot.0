Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A5B606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 07:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VdCd7Dnk;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=Xc3Q7K+m
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3BA180C86;
	Sun, 25 Oct 2026 07:34:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jM7dhlMamNaJ; Sun, 25 Oct 2026 07:34:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1366080C8A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792913644;
	b=KRqehRlBCcau+B6f9SfXXF6MWbRjMmEfP8RITq7JaRbxWpQClOIgveDBwaMxHj8Vfycb
	 UeUYVMuxBv0+X4LGJg5nlCMhg5soK92Y0rYa6Q7u7No/0CXCftX8+EPKVw+6EydrCTICV
	 HtIfRBeH7SGx7Ubf1U8urSN5VKmi+TBHVtUeadkLRn1ms9viRd7ILpqLa920Oodi4FxVz
	 0/vSawQs2iX6AfBSutlsAZG2Ml1YYVis/SzAc3o7DyjfevJA41ag4AVY+ZUv3hpMIe+Fc
	 nU9X6HH3A9SEOsjrWcsi7Q/DBgr+LrYCrmO3cOcmacx8SVZrbqZiIQRCRI5YINYvKDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792913644;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=8a2mkcLE/REQ4503r3qv+MViKcLBKsSxeYKQuJLVZ84=;
	b=GjGhgGAzbKQwc9XlkmBU41LmCTfKn0UJJ72577KXAZ1gK6hMLpTC7rneKuz4obx/71mL
	 /EclXuDpt7ZJLBOJq20lda1cTkaaQP7UCpN8BJdND3uZzSZomVtt1mTyrcOZCUY69NOq7
	 Nv1/RelW/M3aFxnO2T9j4VCJUklPfFEeaHrD0ExscWYaWVm21+LQqJqqxHjXQfQFQqQuC
	 RiczUPdMnI8xndpzRQBKULHcnM2rN321E1Kwp5jka3vf6VzIEzflvZMubCakvqHZjEiLt
	 nFKD1Nkitf1aCdXAUIBKD2ZoMhb/0pRg/9VPT9R+XzadVOS5ejJL1e2eAsYJ/V8oRDQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792913644;
	bh=8a2mkcLE/REQ4503r3qv+MViKcLBKsSxeYKQuJLVZ84=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VdCd7DnkUaJXX48n6ET0/4jhJ0KkvmkcAw6ilCMp0mQPW8KfZdIdMq+F/qN3A+7XN
	 71N87SM1fAckYgAlzx0+QIGx+QRPjuLaA2FnfnbfcT//zttKbbosOwhplJn/jfzaF9
	 0edqp5qtQD6tc0YpIY5t9vrGDylnKqHq5vM/BTTX8AkDY/VopWn6ZFnucEvfgRLdqc
	 a8MP6LspatMaDpzk+OH5RjBYPzT1OaAUQn7cDur9awH2dJhrm6vYWm8LbV+3/kutAA
	 1XPEZWwpzBw/Hvh55Ah3zkYCEwMYH5KmDW1Ejj7wzCrVGaihVezJ7pkxLSW5D+1Q0t
	 310c8M7bWooGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1366080C8A;
	Sun, 25 Oct 2026 07:34:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EABA23D9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 07:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC42360600
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 07:34:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNJPdR44Euta for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 07:34:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D92F8605CC
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792913641;
 b=sebf8sangHKa/vvp2dJDsMCJQRuDhW352r1Jw9E9ZWj318dFyF8YSvM3u2UwGNetpHJI
 uSRPgxegu4FNATwNL505hyOy0PVOIamcxP0/8fercPnz9uGViVPFUYAt3FunhLwkRBtCL
 SEJOh3FhF0Hl4BeVAt5ezyheM8W/7q5AWFVXxzDD/Qib7G0G/O3rKi6P3I9lQ1s4QYSf2
 O+i77baJW2p6OrHavOE4duaRu/JUGZF2RHZiNX+7hqDms2pFpLf7zKxsy2pyRjxvkzZjf
 ez/mgmVt++E2JQrjg2IAbrtFzTJ1NS+VYC+xSHEX8lFK3eJT50qMEXjR6xwzAmAlXEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792913641;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type:Content-Disposition:X-Operating-System;
 bh=b1AaZEoqCBoZAPxbVbnkwwSL+CXtDbOE4Ikch3Mt/Sw=;
 b=TBP5yNvgVjcI2DYZabye9nGCRkQYmpa2qCxLALovGcPvJF/rUbtRAagkHGzeRmgkiEh+
 dhLBAlJRbMPibKoyhWVAmEE7WCPaFd9QdSYtjLMU9CTT0Ef9YVzLI8tSdT09i2TcqYtdy
 ggJ26pbbHVgaTJeQIANsBRV/Ij6kD4IrQH6eHsFBhrwvo5oFYF3IO2EUOIyuZfOh5l7/8
 YdHdup182w6BETMt4IHYYXJ3vKNPOkNOVXQ+QohnyiYCNT5mSlQLjt8WgOswvgL/Y3NfP
 869o1KEbUdiCGxGRKp0S0jdbbkA2BcCdkUU9/Q3gCsynshFgDk25nLXVYVxEbLi03cg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=none header.from=openadk.org;
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D92F8605CC
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 07:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1792913637; bh=iYtQcVtrKdhI4OHFRfEc3U7AVUIBgJCOOpOYKJ5uZoc=;
 h=Date:From:To:Subject:From;
 b=Xc3Q7K+mNzkrATMvL46Wx6OdsJ9iG+zy8gvrfZqk8h8i1sKVXGmxLoRWcZFzxqBJP
 mtaJ01TvgVZf8WLTEaYtlH6H6GCBQXNBhMivMPGBL41jaxpbeCsiYgw3omyBlrqRU9
 98/694j2M7vSXeajcI7m0h5X2HBCwnAlqHHqHwBE7M7dJsHlLPkAf90/pZpJVLmg/f
 arObObzdq7db6OoDBM7lYVD3x8zNHkxHb8YpFpJ9I1eFydoWO/dDG8YNVEHrIwIzXc
 OkOsVGjzhx315W3auSyN6N2v6chMpa4wLljb31x+riVAhizVxgDjsJtK7C+fi6RgAd
 i9FXMSvtu71yA==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0D74F31E0B00; Sun, 25 Oct 2026 08:33:56 +0100 (CET)
Date: Sun, 25 Oct 2026 08:33:56 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <at2w5EdFCWiG0ZjA@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH v2] package/chawan: or1k is not supported
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes:
 - https://autobuild.buildroot.org/results/2aa8986b4161c9ce25d4bddf8c29d1b204893e0b

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
  - add the suggested Buildroot way to disable unsupported
    architectures (Thomas Petazzoni)
---
 package/chawan/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/chawan/Config.in b/package/chawan/Config.in
index 220c81a16d..3cd31019c2 100644
--- a/package/chawan/Config.in
+++ b/package/chawan/Config.in
@@ -1,5 +1,11 @@
+config BR2_PACKAGE_CHAWAN_ARCH_SUPPORTS
+	bool
+	default y
+	depends on !BR2_or1k
+
 config BR2_PACKAGE_CHAWAN
 	bool "chawan"
+	depends on BR2_PACKAGE_CHAWAN_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_PACKAGE_BROTLI
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
