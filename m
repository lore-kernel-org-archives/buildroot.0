Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CCC606A31D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 14:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HHbuke69
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4E978118D;
	Fri, 23 Oct 2026 14:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrTg4hByHiWb; Fri, 23 Oct 2026 14:05:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5CAF481164
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792764311;
	b=m1uGHc1h4abvuQZCJILs3AHmzlkJg6N5uLQAMZuFsM1WKcjZLPEeMHC9/cByUS6b5Tj6
	 Ol2brTkpV7pKGUDTGaQUlk8TBEQjawgcEegntdFd7vAYM7vrytEuxrLrxoYP1S+Cn11Xc
	 TD19XedznoXEIGIWW5jFA81vPM51WwYfMT28aH08tfknmAg/9WgqTalkCOJhDmT6JpXWU
	 CGrI+IGkN69RenrKTkCeaSPO2x9kTH73yQTfNPYtWd7iWYa3ZbMplBjJYSVz8BUjXrymV
	 mWLAlDi/Ig22i/eYv1WdUhxkT4hyaZGZ1E3s7OgeFlQOhYvhtsnlyVrmo19q/C7/8dg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792764311;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:X-Mailer:X-Last-TLS-Session-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qAgh6EWDCCWzBatPIBhw8u0OmM8WhAtORVXkrlyJY9U=;
	b=HetO7hpyqCGFDTj8wm9HqmLkEUbXeplUF+634Y3gJ7wGF5en+8LCT4fiDJXiOTHjUdME
	 yT7Hgm3f1WoEiZcEKa/7fY8no8H8gEd68dBUXfsL3xekoF36t5p33eiRt7ZKRdGeyuml5
	 DnfNouUtNFDGOh89F4KugjRcgbPh9+LuxYKDP55MvfhXZyuVhnpkvr61CC6Q+ThaHrRHU
	 kBJlCwC+h1315gdT5jaLGK8WNvycKeMcOlmUbo0Lh0X/i3mZ1iyL4QWvxu86czZDumF6v
	 IU55daCIkXFigzxCNpWn9Xdq14gyUaUR8caedtMUPcEyLH751kkAAIoXFwyTEgsMe7Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792764311;
	bh=qAgh6EWDCCWzBatPIBhw8u0OmM8WhAtORVXkrlyJY9U=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HHbuke69XXcxqYnWXUnFVpdv9Yn5qSCCtLTc+mzlpfb4LHnRsvKFGAjBLsTgaOtxb
	 mqJT1GpOAsZ462YJPkmxzsG//pZpZvh1GTwfc52026iiA4lnLD0XH/WGGwDkekkssu
	 9ewcSL0Q7YSwQVDj7miJf56uHz6pJfyCptFQa3b0YIisTA9UwxcbN+ja2toebKr9KV
	 BR2ITZUtGpeLe6Si9aqddBt4pCNbaqus1derWNJF65nhN1TWvUwmBq2j0wMgDxJ+Bn
	 sgHIyEQ8axN9pZP39UF/KmADi8wEZWlKHfh0IfV49YJnHVHNStjM0QihgRVwa54wP8
	 M3nvElBRcNjbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CAF481164;
	Fri, 23 Oct 2026 14:05:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A80B312C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DC6781155
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVi3mZwGrB_a for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 14:05:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 354D88110D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792764308;
 b=hknVsoTjblM0girZ+5Ww3D85yWQMbnrOJ3xwD9US5+bdqrsJlrUzjAI9ZSMgXXSs2Lcm
 +as3nkGS1Ov+QdisB/BgHTeXOthmXeb+XFMG7pnjXug8KlvibYpE14Px6NY/Ez9Mhgtja
 WBXNOM9WreDmHpcWUoEe7gCPiwvKyxDJBqYiA9+1dKs2xPCrs8owVKiSiGqmwR9t/83Tf
 ocpEOn82smDUQ5+iSBVN29xGg+bcKeldsLr3S7p7ASq4Ie2HBOAs80RpzjSEh7OB02suh
 w8nep4nvI5iHYUegqaAJ1cklm+dHAcIIxQeG24NuyTuNPyJZQSRZnYm6xuTyH0poAVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792764308;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:Date:
 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
 X-Last-TLS-Session-Version;
 bh=71GRICogn4UVRoYZWnhnjhkSC94BzQ0HyKt0NzAr2s0=;
 b=ChjsL+IGsj+bz72eH+h3SspQ6uTXCWZXsWxbslVCEDJAyu9wSt2+DlwYZm4Sv2402nM7
 IlrxFcBO2jkDvA6kRcOoU2NeSDspuqfkXP4QT4g5Vhem5FAMwJHUu00Gh5eabH92OrS8i
 dd/Ad8fJ44bLn2Y+48Yev3cw2u14NaC0g5BR72g1gm1PpoIF7puA6d9yI2KQLgtEbrgfP
 thcP8iJSQhYaCs6C2axBWCtNnqCS02B4fQIVLFrVM5bZ0IaEKObWXHsK+HTsRRcXdKEr8
 Pcyrr2eqUFBoDqplwPAVYsf1yI3sxK02PBce6sJgMvihgmaIAnAWPJxdu1iZjHDS8LQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=rhkuehuu; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 354D88110D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:05:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 07AB9C51460
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:06:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 36E9A60398;
 Fri, 23 Oct 2026 14:05:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5A6E310329035; 
 Fri, 23 Oct 2026 16:05:00 +0200 (CEST)
Date: Fri, 23 Oct 2026 16:04:46 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261023-netsnmp-enable-blumenthal-aes-v1-1-bb34083800a5@bootlin.com>
References: <20261023-netsnmp-enable-blumenthal-aes-v1-0-bb34083800a5@bootlin.com>
In-Reply-To: <20261023-netsnmp-enable-blumenthal-aes-v1-0-bb34083800a5@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Julien Olivain <ju.o@free.fr>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 1/2] package/netsnmp: enable Blumenthal
 AES-192/AES-256 for SNMPv3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

bmV0c25tcCB1c2VzIEFFUyB3aXRoIGtleXMgdXAgdG8gMTI4IGJpdHMuIG5ldHNubXAgY2FuIHN1
cHBvcnQgQUVTIHdpdGgKa2V5cyB1cCB0byAyNTYgYml0cyB3aGVuIHRoZSBCbHVtZW50aGFsIEFF
UyBzdXBwb3J0IGlzIGVuYWJsZWQgKHRocm91Z2gKLS1lbmFibGUtYmx1bWVudGhhbC1hZXMpLiBU
aGlzIGZlYXR1cmUgZGVwZW5kcyBvbiBPcGVuU1NMIGJlaW5nCmF2YWlsYWJsZSwgc28gYWRkIGl0
IGluIE5FVFNOTVBfQ09ORl9PUFRTIG9ubHkgaWYgT3BlblNTTCB3aXRoIEFFUwpzdXBwb3J0IGlz
IGVuYWJsZWQsIHNvIGdhdGUgaXQgYmVoaW5nIEJSM19DT05GSUdfT1BFTlNTTD15CgpTaWduZWQt
b2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0K
IHBhY2thZ2UvbmV0c25tcC9uZXRzbm1wLm1rIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL25ldHNubXAv
bmV0c25tcC5tayBiL3BhY2thZ2UvbmV0c25tcC9uZXRzbm1wLm1rCmluZGV4IDE4YjVhYzM2ZTEz
ZC4uZTI0MGZmMDkwNTYzIDEwMDY0NAotLS0gYS9wYWNrYWdlL25ldHNubXAvbmV0c25tcC5tawor
KysgYi9wYWNrYWdlL25ldHNubXAvbmV0c25tcC5tawpAQCAtNzMsNyArNzMsOCBAQCBORVRTTk1Q
X0RFUEVOREVOQ0lFUyArPSBob3N0LXBrZ2NvbmYgb3BlbnNzbAogTkVUU05NUF9DT05GX09QVFMg
Kz0gXAogCS0td2l0aC1vcGVuc3NsPSQoU1RBR0lOR19ESVIpL3Vzci9pbmNsdWRlL29wZW5zc2wg
XAogCS0td2l0aC1zZWN1cml0eS1tb2R1bGVzPSJ0c20sdXNtIiBcCi0JLS13aXRoLXRyYW5zcG9y
dHM9IkRUTFNVRFAsVExTVENQIgorCS0td2l0aC10cmFuc3BvcnRzPSJEVExTVURQLFRMU1RDUCIg
XAorCS0tZW5hYmxlLWJsdW1lbnRoYWwtYWVzCiBORVRTTk1QX0NPTkZfRU5WICs9IExJQlM9YCQo
UEtHX0NPTkZJR19IT1NUX0JJTkFSWSkgLS1saWJzIG9wZW5zc2xgCiBlbHNlIGlmZXEgKCQoQlIy
X1BBQ0tBR0VfTkVUU05NUF9PUEVOU1NMX0lOVEVSTkFMKSx5KQogTkVUU05NUF9DT05GX09QVFMg
Kz0gLS13aXRoLW9wZW5zc2w9aW50ZXJuYWwKCi0tIAoyLjU2LjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
