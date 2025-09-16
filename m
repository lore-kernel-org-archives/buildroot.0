Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBAFCAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29F8C82F9B;
	Tue, 16 Sep 2025 20:04:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xc-ugInLJH2Y; Tue, 16 Sep 2025 20:04:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 458F982F4A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 458F982F4A;
	Tue, 16 Sep 2025 20:04:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C84E199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0E5A61105
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFlo_WUIvE8s for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:04:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B15A76110C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B15A76110C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B15A76110C
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:04:13 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -203005822; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 16 Sep 2025 20:04:12 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uybuN-0035I3-16;
 Tue, 16 Sep 2025 22:04:11 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Masahiro Yamada
 <yamada.masahiro@socionext.com>,  Vincent =?utf-8?Q?Stehl=C3=A9?=
 <vincent.stehle@laposte.net>
References: <20250915193756.509482-1-ju.o@free.fr>
Date: Tue, 16 Sep 2025 22:04:11 +0200
In-Reply-To: <20250915193756.509482-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Mon, 15 Sep 2025 21:37:56 +0200")
Message-ID: <87ecs69nb8.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=tJVEUluo7iUThymV9uVjOBIKXuHz7P4AMGxNwsM8vgpejqo9mxkL1y4TSQ28YVJIgZDV3Je486/I/TVY3wyUEV2ERxEy63B6vkuyR2u8C+wiaSphDRm5QunGY4xU0hBzoUgMt/vjmeg4i+DStRuh/CFehwZRJDniDk7RCj70FR6eevm5wGbFPVrLRJRnz9zxIMfzEocsW/4Mr4mOoEmw7iurez+sHmbzXpprO8LUp8my853Ar4ahJ9hGuBz7bmklmc9chSRzf9hNPcCDAfglA45+qLgoeliPC500jexO6aJSLBO2LaAHoi1z/XhYQOTr+60iYHo80XR0nlNrKkhMvQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=YNTTEgMk7rjNCLcP5CLMEsP8sOrHnwi4x+uorIRgb7g=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=tJVEUluo
Subject: Re: [Buildroot] [PATCH 1/1] configs/arm_foundationv8: add eth0 to
 be configured by dhcp at boot
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

Pj4+Pj4gIkp1bGllbiIgPT0gSnVsaWVuIE9saXZhaW4gdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290
QGJ1aWxkcm9vdC5vcmc+IHdyaXRlczoKCiA+IFRoZSAiYm9hcmQvYXJtL2ZvdW5kYXRpb24tdjgv
cmVhZG1lLnR4dCIgYm9hcmQgZG9jdW1lbnRhdGlvbiBmaWxlIFsxXQogPiByZWNvbW1lbmRzIHRv
IHN0YXJ0IHRoZSBGb3VuZGF0aW9uX1BsYXRmb3JtIGVtdWxhdG9yIHdpdGggYSBuYXQKID4gbmV0
d29yaywgYnV0IHRoZSBjb3JyZXNwb25kaW5nIGRlZmNvbmZpZyBkb2VzIGluY2x1ZGUgdGhlIGRo
Y3AKID4gbmV0d29yayBjb25maWd1cmF0aW9uIGZvciB0aGUgbmV0d29yayBpbnRlcmZhY2UuCgog
PiBUaGlzIGNvbW1pdCBhZGRzIHRoZSAiZXRoMCIgaW50ZXJmYWNlIHRvIGJlIGNvbmZpZ3VyZWQg
YnkgREhDUAogPiBhdCBib290LCBpbiBvcmRlciB0byBoYXZlIGEgd29ya2luZyBuZXR3b3JrIGNv
bm5lY3Rpdml0eS4KCiA+IFsxXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9ibG9iLzIwMjUuMDgvYm9hcmQvYXJtL2ZvdW5kYXRpb24tdjgvcmVhZG1lLnR4dCNM
MzkKCiA+IENjOiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0Pgog
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgoKQ29tbWl0dGVk
LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
