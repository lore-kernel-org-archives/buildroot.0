Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B0BD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D196E40738;
	Sun,  7 Dec 2025 17:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njwdSlWQqJXZ; Sun,  7 Dec 2025 17:33:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54A26406CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765128802;
	bh=DxZ3sPSr2cphIhhyvyku/vmPO3sitqiMv9Gos/nD2H8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b/KH04x0qSB+EVNLDXkKbDwc+SKXvLsjGyAxPODkzUYcBNgXBjPPtuhEgArHAag7B
	 E0ozd5IdA1AHJ8CclKK7bpzxajnYtC6LwNHCHsgH1NDz1DFUq/r51M63rG5wwXtR0e
	 sugvD2TK9HEb1SMKi+5kY+ervwivw/80V1NGKKvSD9cEeHzp/ofdClzla1W1mEUY1v
	 S9++Y1ew+jeEkKu2O2xseL2SGsHDla68pyyFpbhtFD+5cqRLwyGcDzXNcprX+Dmf/v
	 zX/QSaafxOCuFhbgINq72VY8PqtpP2Jc6AfyXflflNcjSeRLGJqBXjPhMC83Ct3eFM
	 Fx0NGrvgJEnvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54A26406CD;
	Sun,  7 Dec 2025 17:33:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A0902CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAFA5818C4
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fm4oIUh4yWUD for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:33:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7FE2E818AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FE2E818AC
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FE2E818AC
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:33:19 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1432903205; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 07 Dec 2025 17:33:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vSId4-00000004bTg-3HL0;
 Sun, 07 Dec 2025 18:33:02 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Alexis =?utf-8?Q?Lothor=C3=A9?= via buildroot <buildroot@buildroot.org>
Cc: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 =?utf-8?Q?Herv=C3=A9?= Codina <herve.codina@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251206-libdbi_typo-v1-1-07d8e40b2242@bootlin.com> ("Alexis
 =?utf-8?Q?Lothor=C3=A9?= via buildroot"'s message of "Sat, 06 Dec 2025
 18:59:22 +0100")
References: <20251206-libdbi_typo-v1-1-07d8e40b2242@bootlin.com>
Date: Sun, 07 Dec 2025 18:33:02 +0100
Message-ID: <877buy9oz5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=iZV/77jAgC3kVgaeDsB3b8zB48LbhuUPmju7i/d4O6m4RD+a5Fx3oiIx6TCGLwAHfq0IT2OERObYSgsYxBouysnR8wo/03RsKF34U4qyKkt89CDd6S/t12W+2K9w7LkZTUtcbcpKOWOBCGZ+VrvLM3BfcCHEEyn+mKIr3ZOaNne1ebsU5dQXQu9n6kuxRK1r39SPhYH+RYURmMdm4dVX7ou8Dn0s9XK7/+xpmvDEi+bNxLd/cF48GMjK2BKto+v540yDWZnsTxSD3kzpMYPNYlU0NOaxkxataCdnUK+VWKvQcsjHUj5ydNGd3+kfO88hvbtsDPrrm8PwkqqxdCzl2g==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=yGStkHQO1cGNIPD8eT/dNVkBBpiRK6b2andTmeDRkaQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=iZV/77jA
Subject: Re: [Buildroot] [PATCH] package/libdbi: fix small typo in Config.in
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFsZXhpcyIgPT0gQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6CgogPiBXaGVuIGJyb3dzaW5nIHRoZSBhdmFpbGFibGUg
RGF0YWJhc2UgcGFja2FnZXMsIGxpYmRiaSBhcHBlYXJzIGluIHRoZQogPiBtZW51Y29uZmlnIGFz
ICJsaWRiaSIuCgogPiBGaXggdGhlIG1lbnVjb25maWcgZW50cnkgYnkgdXBkYXRpbmcgdGhlIHJl
bGV2YW50IGJvb2xlYW4gbmFtZS4KCiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8
YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+CiA+IC0tLQogPiAgcGFja2FnZS9saWJkYmkvQ29u
ZmlnLmluIHwgMiArLQogPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgogPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJkYmkvQ29uZmlnLmluIGIvcGFja2Fn
ZS9saWJkYmkvQ29uZmlnLmluCiA+IGluZGV4IDEzYWMzNDRmODI4NC4uZDlhMTMxNjMxMWMxIDEw
MDY0NAogPiAtLS0gYS9wYWNrYWdlL2xpYmRiaS9Db25maWcuaW4KID4gKysrIGIvcGFja2FnZS9s
aWJkYmkvQ29uZmlnLmluCiA+IEBAIC0xLDUgKzEsNSBAQAogPiAgY29uZmlnIEJSMl9QQUNLQUdF
X0xJQkRCSQogPiAtCWJvb2wgImxpZGJpIgogPiArCWJvb2wgImxpYmRiaSIKID4gIAlkZXBlbmRz
IG9uICFCUjJfU1RBVElDX0xJQlMKID4gIAloZWxwCiA+ICAJICBsaWJkYmkgaW1wbGVtZW50cyBh
IGRhdGFiYXNlLWluZGVwZW5kZW50IGFic3RyYWN0aW9uIGxheWVyCgpDb21taXR0ZWQsIHRoYW5r
cy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
