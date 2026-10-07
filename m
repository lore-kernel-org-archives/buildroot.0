Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC6FCA5FF1
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 13:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D26460706;
	Wed,  7 Oct 2026 13:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M2gL_zDnT5RM; Wed,  7 Oct 2026 13:15:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CEFD5606C6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791378958;
	b=HEf8Fqeouwg+ANb7+pyHgxbinoROe4nrEfvMmJvoBznN1695/WLkzoLmNNIpNT80RPhn
	 eiMdWFmqUl7jMx8MjPkKr1FJopVY8xTohdnTb9QwfF+sB1BltYpr0PEozGXM9GO2O1dHk
	 98ltSiurL6OjrFYSVs5UbE5nP7lj7K4zyZ31FQ5CcAOvB6QnWMIyVFBPzkJE6cuoib09A
	 C2XL5GxAYx2a6SavLgkR01292rG9zHufH+guL1up9DdFGspNtD1wCougnaJV9xxLPfwZz
	 M8EEC4tkCHAN8ti3ERL9AmU+3s/nRTVdYah67l64scH8/AkfeXQ2+a85FpxHRt9B0xg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791378958;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=dMra5NPo+Yg4AE6uVzeeN/e40cSGVH2hNs846vUjqYw=;
	b=ayzPDI92FhxHFbyyalPOjpfx3afwY2ix2PilkPXQi0rrIgEN8D48gMjQrVsQqWzKDzeP
	 hcN0Fr7D4kGcYqSXzeKilVVpWCd1GK1YxSDVtgVXYG1556Qe81RiZqyBfLr5XIIq/2c2a
	 3+d8gEteewSBcLMSTWRSHEzvk0lBCKqhG8wi6NXu2VXsmAJfYPOegUhKbc5wAWcdXavYW
	 jJr/HstZHim2izhSPugrPrksPoQXtLootqtKKJ6vc1StnNgK2KYTlpXB/PkZwRo8qAvIF
	 JVdg0dnaW4LfayqoEP1c8eTST2Mrj4a+Q0RixZ8u3ErymSpFyHohmFN/vuBUWoCQeBg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791378958;
	bh=dMra5NPo+Yg4AE6uVzeeN/e40cSGVH2hNs846vUjqYw=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EPhQRAH0w7mspim4dxJgi+nJnxodpESYAMvdmhc8vLI97G8nVFrFGGSvQ3lUYHRG1
	 Qnxfh314KubRI2juMaU8clwDGFoBh4U5VRCbjnJIQHWWhMervexcAW7sCaUWnDLJE+
	 kgiWXIvPdP5rhL5y5KJmdDpz5Xsr3t1yJPX5Jk5FOsjtbrISP27ZpdDyMOy+tIQuGo
	 9jXQmY4rWWMrcmJaAOC021IZ2ziwVeRFPeQrxPXOkCq6IS+TjIsVsglQ/jjy4zuFQc
	 tK3YUFlXecFjhzccq4oeoDniXpNMZyDREIOE/62K4wkd7hkXRn9/zU2i1kny2Kl5wQ
	 KE0qQZNtYZo0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEFD5606C6;
	Wed,  7 Oct 2026 13:15:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A6ED338
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 12:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C0454066A
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 12:47:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXi3yfcNIlgC for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 12:47:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2A63140665
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791377259;
 b=JNw65Vi5HcMOpT3PO67JGwH0kWU4wdALTWpbh4BT2ONBi+IuojwlnoKaWZo4YRfR+GQE
 vlC6Z3x3VwC+aQm2XuRuQ70Oxzy8PYW7vCeyIQBBUSI4OfQYu7uf2sQJSkOndQZeSfuB9
 LUOz5VMQtbJ1NWKu7eogPfr5Gbd4QFbIBMaNN9Gxf/Qh70aHbTI6Nzp1JSMP8mh+69kn6
 N0ptUgY5K7MqlvecFswew2BZjnv6lNfZ2Ykrxv3s3kGwY+6m6cLrzUTOJFxRGijSFKA7Z
 UaTXls6rWzwVbUI9UE4ecJDq9hK7V42zvRCTJfe6SxgzI4IjSwtSZviy+rSd/AAlQXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791377259;
 h=Received-SPF:Received:Received:Received:Date:From:To:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Disposition:
 Content-Transfer-Encoding;
 bh=/l4iF4L/FvYIgVtyfW8WI2oQ2/QATrHV4PT+ECbvH5Y=;
 b=HqUMQ8hWrVcak1t9qWCTYCHwiV1fiTksWXpoZuHff2ezLhLSkkTSnTy1pzzXSZaxTtqn
 6duZG8dQ7ymXROQcF4bo2+GOtNhQOB9YHuYVHBSBDiINKsaAotONVzVyo2ktTg1OsEHJm
 CMJqrEi2DwJA1/2EGTz5AE/ArpgT4DyZMp/Pda1jYOwZDI5vEQiS2yePl9l06SG6R4SuL
 7sOIvyUAUoEkSvELjVQDX3IQEdIlL6CUSm2TkA6uBVtLjnb3cFz8uR8rdhXa83WdK/WRo
 GsOkYgMyqeRfWEBBEXaVp3LxyvX7wvDNX1MPDBifrperwmEyQakNA0Iv1Ur03hWtEkQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=green-communications.fr; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Softfail (mailfrom) identity=mailfrom;
 client-ip=2a01:e0c:1:1599::10; helo=smtp1-g21.free.fr;
 envelope-from=ignacy.gawedzki@green-communications.fr; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A63140665
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 12:47:38 +0000 (UTC)
Received: from mail.qult.net (unknown [IPv6:2a01:e34:ec12:1270::2])
 by smtp1-g21.free.fr (Postfix) with ESMTPS id 97B5AB0056A
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 14:47:35 +0200 (CEST)
Received: from zenon.in.qult.net ([192.168.64.1] helo=zenon.qult.net)
 by mail.qult.net with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.97)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1xER3X-00000006b36-1ZRT for buildroot@buildroot.org;
 Wed, 07 Oct 2026 14:47:35 +0200
Received: from ig by zenon.qult.net with local (Exim 4.99.1)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1xER3W-00000001TNY-45SE for buildroot@buildroot.org;
 Wed, 07 Oct 2026 14:47:34 +0200
Date: Wed, 7 Oct 2026 14:47:34 +0200
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: buildroot@buildroot.org
Message-ID: <asY_S8f-M6os1idu@zenon.in.qult.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH] binutils: install libsframe to target
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From binutils 2.40, libbfd depends on libsframe.  Without the latter,
executables linked against libbfd, such as bpftool, cannot run.

Signed-off-by: Ignacy Gaw=EAdzki <ignacy.gawedzki@green-communications.fr>
---
 package/binutils/binutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 93a2e82834..06a917f55e 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -129,6 +129,7 @@ ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
 define BINUTILS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=3D$(TARGET_DIR) install
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=3D$(TARGET_DIR) insta=
ll
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libsframe DESTDIR=3D$(TARGET_DIR) ins=
tall
 endef
 endif
 =

-- =

2.53.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
