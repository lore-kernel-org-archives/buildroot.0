Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CEDCA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68BCB606D9;
	Sat,  3 Oct 2026 16:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HoNXSecY-4yB; Sat,  3 Oct 2026 16:29:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 855F86069C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791044961;
	b=I7j3nO1ZZ2iMk81DWrhq+yucqpw+nV2MqFIiqGTEA3wQ+CAsCM59Wbi6hCUH+kg/IPk+
	 8WuVazdfIFdlyqvIrQRb//JrRgxN+XM3CI96anQGiEixt+xIObR/G7MyA87SngxGjDedY
	 x1sDPH1Eri8hVho9WInxcUofSB5Qa3o4r1HRShmePIBnNPA+wswGQQHT0/ZgcnPsMmvjz
	 TQk3GBpf+hfxqepAMpoINRpcpJurYx9OkWkMuRkJY51wVdatP+ue8VMDqObij87JavtyQ
	 ZVWf15wOg01d69ud+XsFUoezsXEAikE6S2ratJpMLRc0yQOZGgDSnLcuisUOADCgzeQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791044961;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=o3k3Bcoh8N0x5KaQZ2Vzrv+T1e26dJUabuoHtq5uJdc=;
	b=NVAzyMlgfQujfUtVa/pzoEGYeQpizW/ecAz9PgCx2jSezSPESC19b+2UZOjEyDvGPatw
	 YQ57qIeGwkPwf/qZ5Wq1CR5NufTZ0JX0QLMbC2UIvb9MhipgpcBvzXJTZEKRiacPniPkW
	 g7MJkuXh3r1zbEGOWVovzGej5CJB+F8rEj83tmcaTISlTVgmMtD+rIrTqchZUM7o6n0dg
	 sl6wfY7yZj1qCszqLeGzHaWeYsAEmQx5aI3CaUYlJVHCytMmNs9kXBaPMz6Ih6iif1JiF
	 KnlrvW/LmdDkaQEFvXGk5DIH3v5yzQTy1sjXcl03elmKlr5rnc4qfLK1d0DaW7mSLCw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791044961;
	bh=o3k3Bcoh8N0x5KaQZ2Vzrv+T1e26dJUabuoHtq5uJdc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=nasKJcOI0Y6eEsAr/TlvyZSP7URhssWf3FZj43HFYEsYxyddkFPwxiaoQhnaRQaBc
	 71gYjcP/jT3OZiY4b8RGGPJCly4piHY+wTiyAA8HAZ5Fw3bf2BIbxS/gLqV7E8d4Qk
	 XSemEjXLud/J2UtoqSH/uUedE4rcs7q6391lKpNWQHhYmPIUdSK2oYIlwxoJg4ycPG
	 KswxTX96zEv28u+Em8i6AwrkNvTVdsk82JjzPcW/cKrml2bDAmfAnwZg2tudx/Rakj
	 19dm/PyX1SZMx9Ren2ZgaWPE1OFf47xITN/P4aTXHLxcE3iCSxEcOg90dUJ0aZ+C1m
	 1ktb5rxRDqm+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 855F86069C;
	Sat,  3 Oct 2026 16:29:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 542862E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 461EB6069C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uCqs49Uhw7z8 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:29:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 99C486067F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791044959;
 b=oJIWxibzo16+mJWGYf82gsc6Rcadx/QEzzWCX6OC0LtCIy49e+eP+Ro788BPXfN6Mm7t
 3Cp6y0YChxheVoDLmpOuWlBk5ldICdDkLDMCYoHYySuyu6gtW6bZLUSLdcIGUb0fp2orw
 fRubCgOoqKM8ubA28UUfDb62z3zr90C//k4mqsUg4worE8Fp7cXf8AWqMAgJsichsTsqb
 Ecd7+1L7rvFQqZ+DheTfjTtSvaxxG+P6UgUGWhGohORI+Xej4tYoUhtEqJGRtcrQm0A5a
 bL0pNL5Q84IdRFKu38UULbacJOoo3ce0Ihv7xxIM6HokHUON1ZT+Dcy8+lECUsV3uKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791044959;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=IhaabLq4sa/CWYAGv9CUn+6YtuQ6JE88EJEOo5+7HwQ=;
 b=qdWBPoPeBh4ytQakyIrNDsH7IpWGULsZ6t8qRmzqnhCY2mMDiTQb2OU5MGYXHkRzCPyu
 QFK78LcgqezmJGdL8vaFPXWp/ETCINg0RGepDaE3dJ3xd1r+zu8mw5Zo6tNOSuqMlh2l6
 y2Riv+i5kfhpkWjPC1ZRJ2rHfsf3bNXJFD7hhxnj6NlFWGeGAp10slyBrTpGVkrgJX8Cl
 nfDj93RbBrkG368u85Omp7U3Z6NJuOf07OTW27N+QMO6QoLBsrzZYIwEtVuwcJpNvzc6Y
 laygQjR7H9UoBuqhr4p5pNBLGFDvyFRT1MHo7gy5osW3UHTYR/dKkjXHZlsxwlWcjpw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Gdvnh05Q; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99C486067F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:29:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B1E5A4E41134;
 Sat,  3 Oct 2026 16:29:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 811D6604FF;
 Sat,  3 Oct 2026 16:29:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F1F6910328170; 
 Sat,  3 Oct 2026 18:29:14 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Sat,  3 Oct 2026 18:29:12 +0200
Message-ID: <20261003162913.1025194-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/libarchive: drop dependency on
 host-pkgconf
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 95db5707dff571c7f3485b3aa63bf5977c7bf08d bumped libarchive to
version 3.8.1, and as part of this, dropped AUTORECONF = YES. This
allowed to drop the host-pkgconf dependency, which was only needed due
to AUTORECONF = YES. However, the host-pkgconf dependency removal was
only done for the target variant of libarchive, and not for the host
variant.

This commit aligns the host variant with the target variant from that
perspective.

This is not tagged as a fix, as nothing was broken.

Cc: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libarchive/libarchive.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 5b6aea3407..88dbf2a48e 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -146,8 +146,6 @@ endif
 
 # The only user of host-libarchive needs zlib support
 HOST_LIBARCHIVE_DEPENDENCIES = host-zlib
-# needed for autoreconf
-HOST_LIBARCHIVE_DEPENDENCIES += host-pkgconf
 HOST_LIBARCHIVE_CONF_OPTS = \
 	--disable-bsdtar \
 	--disable-bsdcpio \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
