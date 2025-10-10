Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD8ECCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 06:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A59BA84194;
	Fri, 10 Oct 2025 06:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMzXGAZVzFbn; Fri, 10 Oct 2025 06:16:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A14EC84189
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A14EC84189;
	Fri, 10 Oct 2025 06:16:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A7F33226
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D3196140F
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OL7ZSk0Ly4FL for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 06:16:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 85FE260D5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85FE260D5E
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85FE260D5E
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:16:24 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 257764129; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 10 Oct 2025 06:16:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1v76QL-008mn1-0K;
 Fri, 10 Oct 2025 08:16:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: yann.morin@orange.com
Cc: Bernd Kuhls <bernd@kuhls.net>,  <buildroot@buildroot.org>
References: <20251009165624.3914222-1-bernd@kuhls.net>
 <aOiXXHg2kwmHaIea@yd-6wlzhs3>
Date: Fri, 10 Oct 2025 08:16:17 +0200
In-Reply-To: <aOiXXHg2kwmHaIea@yd-6wlzhs3> (yann morin's message of "Fri, 10
 Oct 2025 07:19:24 +0200")
Message-ID: <87ikgnwaby.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=DVWUr49EPl89pT7lJadI6fRYrqgTN6awo1m/+4Wz1wENnLtu/aA+TCDXmL/cPUxWUDyLzhEZzJf0mz0WssnXIIAWd+Xs9nRB/4xnjrKPf4Xihoqvp70SoxtpZwk+3AybbtZ18uYyLMvA11GPB0JSo2bJck90gLjOaieV0u/JvIjFC+cqYem7vRbjtgaQTwIh157+HdOiJg2IDwi1pjgJ7i17+1Sp6y4Q8GqIBF9GT9Cw1KVvdqIXRITUC/mE5N//sWHN6PHsodQYTfxgTs/Vd/cW6hRWE4E0OpPk6HwOMhIN6v9Svr3PPAUTOAP++wlOaCBdg9N3of5ug9rsGgiMbA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=m/gXTaPyINu46+GNENqXF2/WOI/ZYiRIdAuJyPXH8WU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=DVWUr49E
Subject: Re: [Buildroot] [PATCH 1/1] package/gpsd: remove -std=gnu++98 from
 CFLAGS
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

Pj4+Pj4gInlhbm4iID09IHlhbm4gbW9yaW4gPHlhbm4ubW9yaW5Ab3JhbmdlLmNvbT4gd3JpdGVz
OgoKID4gQmVybmQsIEFsbCwKID4gT24gMjAyNS0xMC0wOSAxODo1NiArMDIwMCwgQmVybmQgS3Vo
bHMgc3Bha2UgdGh1c2x5OgogPj4gSW4gMjAxNiBidWlsZHJvb3QgY29tbWl0IGI0YzA1MGU5YWZl
ZDdhOGRjMzAyZTZlMTAxNGNjNGZmYjUwODU5MGQgYWRkZWQKID4+IC1zdGQ9Z251Kys5OCBhbHNv
IHRvIENGTEFHUyBrbm93aW5nIHRoYXQgaXQgd2lsbCBjYXVzZSB3YXJuaW5nczoKID4+IGh0dHBz
Oi8vbGlzdHMubm9uZ251Lm9yZy9hcmNoaXZlL2h0bWwvZ3BzZC1kZXYvMjAxNi0wOS9tc2cwMDA4
Mi5odG1sCiA+PiAnQWx0aG91Z2ggdGhpcyBsZWFkcyB0byBsb3RzIG9mIHdhcm5pbmdzIG9uIGV2
ZXJ5IGNvbXBpbGF0aW9uIHdpdGggZ2NjOgogPj4gImNjMTogd2FybmluZzogY29tbWFuZCBsaW5l
IG9wdGlvbiAnLXN0ZD1nbnUrKzk4JyBpcyB2YWxpZCBmb3IgQysrL09iakMrKyBidXQgbm90IGZv
ciBDIicKID4+IFRoZXNlIHdhcm5pbmdzIGFyZSBzdGlsbCBwcmVzZW50IGJ1dCBjYXVzZSBhIG1p
c2RldGVjdGlvbiBpbiBjb25maWd1cmUKID4+IENoZWNraW5nIGlmIHN0cmVycm9yX3IoKSByZXR1
cm5zIGludC4uLiBubwogPj4gYmVjYXVzZSBoZXJlIHdhcm5pbmdzIGFyZSB0cmVhdGVkIGFzIGVy
cm9ycywgcXVvdGluZyBjb25maWcubG9nOgogPj4gY2MxOiBlcnJvcjogY29tbWFuZC1saW5lIG9w
dGlvbiDDouKCrMucLXN0ZD1nbnUrKzk4w6LigqzihKIgaXMgdmFsaWQgZm9yIEMrKy9PYmpDKysg
YnV0IG5vdCBmb3IgQyBbLVdlcnJvcl0KID4+IGNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0
ZWQgYXMgZXJyb3JzCgogPiBJJ20gbm90IHN1cmUgd2h5IHdlIG9ubHkgbm90aWNlIHRvZGF5LCB0
aG91Z2g6IHRoZSB0b29sY2hhaW4gaXMgZ2NjLTE0LAogPiB3aGljaCBpcyBub3QgcmVhbGx5IG5l
dywgYW5kIHRoZXJlIGlzIG9ubHkgdGhpcyBvbmUgc2luZ2xlIGZhaWx1cmUgaW4KID4gdGhlIGF1
dG9idWlsZGVycy4uLgoKID4+IEluIDIwMTcgdXBzdHJlYW0gY29tbWl0dGVkCiA+PiBodHRwczov
L2dpdGxhYi5jb20vZ3BzZC9ncHNkLy0vY29tbWl0L2QyODdjNzZmNGYyZTFmZmQyNzVkYTQxYjg0
ZjllMDhlYTdmNzQzNDQKID4+IHdoaWNoIGFkZGVkICJzdGQ6OiIgbmFtZXNwYWNlIHByZWZpeGVz
IGFuZCBmaXhlZCB0aGUgb3JpZ2luYWwgcHJvYmxlbS4KID4+IC1zdGQ9Z251Kys5OCBiZWluZyBy
ZW1vdmVkIGZyb20gQ0ZMQUdTIGxldHMgY29uZmlndXJlIGNvcnJlY3RseSBkZXRlY3QKID4+IHN0
cmVycm9yX3IoKToKID4+IENoZWNraW5nIGlmIHN0cmVycm9yX3IoKSByZXR1cm5zIGludC4uLiB5
ZXMKCiA+IEF3ZXNvbWUgcmVzZWFyY2gsIHRoYW5rcyEgSSd2ZSBiZWVuIHNjcmF0Y2hpbmcgbXkg
aGVhZCBvbiB0aGlzLCBidXQgSQogPiBtaXNzZWQgdGhlIHVwc3RyZWFtIGNvbW1pdCBkMjg3Yzc2
ZjRmMmUgeW91IHNwb3R0ZWQuIPCfkY0KCiA+IFstLVNOSVAtLV0KID4+IEZpeGVzOgogPj4gaHR0
cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzUyZDc0N2QzM2Q3MTRlYTEwYjll
N2VlMTBhZGVhZGQ5ZTQ1MTJjMmQvCiA+PiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVy
bmRAa3VobHMubmV0PgoKID4gVGVzdGVkLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluQG9y
YW5nZS5jb20+CiA+IFJldmlld2VkLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluQG9yYW5n
ZS5jb20+CgpDb21taXR0ZWQsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
