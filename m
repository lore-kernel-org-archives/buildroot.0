Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D5DC982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 07:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 057F8811E5;
	Sat, 19 Sep 2026 07:37:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RpVZPGkRIklG; Sat, 19 Sep 2026 07:37:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1DAA6811B3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789803427;
	b=b0Wix4aoVv8s+KC3c330UB1nrzLptXi1dlzbhULk9n1Bqy+RVM5I4XOhJRItOgt3SofX
	 6SfJbA1vAT4mHaTzimOpAQ6EJ8Q2XIWJrTU/Mz0kZVADa3I8Tk2GvsC9Cj5KXDBsuRTyt
	 nvCinpsjTK2TiZw0FE+dUQL6iTldws166LzXSnrF444kY0mvP/+6BXfYIE2J21fbXVYzT
	 vVVRS0Z+vzcgLUu7C3cpC1+Y0GWOU7angLzfTvtA/7bKYHI2ANu3YDHeBViZOlPTvT64H
	 M+V7xpHM18uoVTazUyMLhQ+ugnDccqNNzBbh58Chd2Kt+Sfnca+DTDUn4HinjfjDLVA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789803427;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Mime-Version:Date:Message-Id:Cc:To:X-Mailer:
	 References:In-Reply-To:X-Last-TLS-Session-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gNGUk718ihb+TQ4CMX4bQl1Op3Vl6rXBYi0rFRWsUsg=;
	b=KD+bk4bUJERSyqnPjBujjuKJzULruI5AMIr0BmyU16xIc41B9jx2gpOxA+pFrslwVN6P
	 vNgwGimsIrcTiTt0vdQj/j5kbbvYm1D6vH+4BOEV+ikYeJcW456e7ZXrnWGFIC8r+lcTS
	 XbDEvrAfLQQcEb4SNmehrVvmztfre/yKGhKsBiQsidfxhlqxOTA7Q/rkyMAw6QraaL6PF
	 UQVQn1LZUPWYjZaaQxByP6rCuiV2uA290PwpQVlOWx2ENEoG7+rx4aXdqD39i5SDd2o31
	 NYxlDX/xbK6TlZ6IAbYpbMqBp+TS6bpiROIIsPc0IGC9QCHTUSiooWJtvdtB++7HjJg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789803427;
	bh=gNGUk718ihb+TQ4CMX4bQl1Op3Vl6rXBYi0rFRWsUsg=;
	h=Date:Cc:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Po3+x4cLaetOSVsfEo/F1Wr07pmn7jdQSSpSkAB4Ug7VXrc9r4n/gEo0FxeQb4jj9
	 Kxiya/IU2rH+CxGpLIN6PZNb8jV3tjyeiG7+Qm83pvptFLiKosywa1mgZ+nJgtgDTN
	 5wpFHukF6D//poS/1Q1gNaqjl15JVdEXZ6O4ofqUIzjX/bdpVkPip05eLXqDnlZRei
	 vw+cb6O6x0fIVmuBjIyz92mrWDeECmfSVK1rC0V97D9Fd7AiZamD4ZpMxtz+B02sG2
	 yLM6f/+V2Cw4fXVVSOQsGjxdU8vcvRkOC5MSLIi5kFmPnae67vbsN1ZkPIMHRPVkjM
	 4JfCsmCZkD5vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DAA6811B3;
	Sat, 19 Sep 2026 07:37:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7078C362
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 07:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54A61811B3
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 07:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wG5mb4a5ZaaE for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 07:37:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D0C8881194
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789803425;
 b=EEflvtQx91pBvKg1mx1hF6j2l+AfRdIyWvZ3N0XbADoAPKh4V4nv0VOsEWgMauPgvzhk
 HRqLdFicdIIM+EZg5oRSFuHnYWFdu1wpKc2G5SEE1lB3mPSuK6wOCa/uDg1Wcnl7J+rSB
 MeYVlZODZacoQOwfxR/UXiKxffOWHMDmyK0DZRa7T/QqGrCRihIUVg8R/+zY51urMPJG+
 rnmRnDeD9j8iGrzw2o63lOS475MLsJfXzC9/qJUSHQP9lb/PxeOleh9HkU1tPRIF2olio
 keapIV9iFf8I+bz6naMbk72RATO5QXFesohXtMhx7MCT3T4B6SkWrtoeXkwX0lWWcRw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789803425;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Mime-Version:
 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:
 From:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
 bh=afahxcgRXjp2F34goN/5usO/eIu5cgqJ2hfCOvirIiA=;
 b=II+C6sBOe/LI2uKYnQBVCFU8BTpdQ0UQ3uckVc+uMIq7/dd0yKkMlbOrHY0U4jIhHOxv
 7O0tQF6mrdVm6oq4abw76UP6EYfcWxL4/BXZF03gkoiQ16MCHcyOnVRRL63M/Weq0Tfmg
 iB05z0HqhCDBx2wKwP1Mh4OQwTPJUgdUhPxbjKtMcpT6TyU68vXyo9Y70wYCWB8lSZKYT
 jM/g54dVhWE8wltMEATjj3Zw0iYF4j10g4rNVxYa+JU9KGq1eiNd//sORdeowo2Gkp0DB
 GcZdLWmTtVyMoHvA0h7GkrkMWvIzSATqVXAhpZQlR0XCEErCuPWuZEcMcE3SmzMqKXA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=2IiN5L+H; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D0C8881194
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 07:37:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E43604E408AA
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 07:37:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9FBF6606CA
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 07:37:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DAC3D1032907B; 
 Sat, 19 Sep 2026 09:36:57 +0200 (CEST)
Mime-Version: 1.0
Date: Sat, 19 Sep 2026 09:36:57 +0200
Message-Id: <DLJ4CYWOH1SP.2CCG0B6CZ4BID@bootlin.com>
Cc: <buildroot@buildroot.org>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260907-fix_openscap-v2-0-28f8f6ee3248@bootlin.com>
 <20260907-fix_openscap-v2-2-28f8f6ee3248@bootlin.com>
 <aq2yL_rNdxOAv-Ll@windsurf>
In-Reply-To: <aq2yL_rNdxOAv-Ll@windsurf>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 2/2] support/testing: add tests for
 openscap
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpIFNlcCAxOCwgMjAyNiBhdCAxMTo1MCBQTSBDRVNULCBUaG9tYXMgUGV0YXp6b25pIHdy
b3RlOgo+IE9uIE1vbiwgU2VwIDA3LCAyMDI2IGF0IDAzOjQ3OjM3UE0gKzAyMDAsIEFsZXhpcyBM
b3Rob3LDqSB2aWEgYnVpbGRyb290IHdyb3RlOgo+PiBBZGQgYmFzaWMgdGVzdHMgZm9yIG9wZW5z
Y2FwLCBlbnN1cmluZyB0aGF0IGl0IGJ1aWxkcyBhbmQgcnVucyBhIG1pbmltYWwKPj4gY29tbWFu
ZCB3aXRoIGRpZmZlcmVudCBjcnlwdG9ncmFwaGljIGJhY2tlbmRzOgo+PiAtIGxpYmdjcnlwdAo+
PiAtIGxpYm5zcwo+PiAtIG5vIGNyeXB0byBiYWNrZW5kCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBB
bGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgo+Cj4gQXBwbGllZCwg
YWZ0ZXIgYWRkaW5nIHJlbGV2YW50IGVudHJpZXMgaW4gdGhlIERFVkVMT1BFUlMgZmlsZS4KCkkg
dW5mb3J0dW5hdGVseSBrZWVwIG9uIG1ha2luZyB0aGUgc2FtZSBtaXN0YWtlcywgbXkgYmFkLCBz
byB0aGFua3MgZm9yIHRoZSBmaXggOykKCkFsZXhpcwoKPiBUaG9tYXMKCgoKCi0tIApBbGV4aXMg
TG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpo
dHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
