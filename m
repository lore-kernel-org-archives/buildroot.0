Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589C8CD3438
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 19:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B187C60E46;
	Wed, 12 Nov 2025 19:26:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUgVSz97PcRJ; Wed, 12 Nov 2025 19:26:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1107560E23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1107560E23;
	Wed, 12 Nov 2025 19:26:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59D98230
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BC1160E23
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gxRu91N0IbKi for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 19:26:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 462D960E1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 462D960E1C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 462D960E1C
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 19:26:05 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2036650700; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 19:26:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJGTg-00HXMf-2t;
 Wed, 12 Nov 2025 20:26:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Martin =?utf-8?Q?Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Cc: buildroot@buildroot.org
References: <20251112065527.57161-1-martink@posteo.de>
Date: Wed, 12 Nov 2025 20:26:00 +0100
In-Reply-To: <20251112065527.57161-1-martink@posteo.de> ("Martin
 =?utf-8?Q?Kepplinger-Novakovi=C4=87=22's?= message of "Wed, 12 Nov 2025
 06:55:43 +0000")
Message-ID: <87346jt5mf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=kMvC2ZqFFLBGNbOeqnKpRQwa2FP/XrmtfTkdqpY01ZiW2POkAWJgWxWgglhc9VrbqYiBF2kO8TvqbxJSQjt5uv8dcPDCRGi0ImfLtTqI+eBSyLLMkiOYkEKlbG+C9OuICFarXM6BPHetHuctHmM/dCfqw36na/3PCmlkm3uzu4x9i4SdISK0wOxFcFjzyoyhcDcK9BnemD3y84sQ4aszCws6gGJqQ0jvL9GnkaUDwrHUDCYLDt09mGWFmoemhIk46VteHYDbun6ECYr9JgZWagNyhLp2OkSS9KvBFD/1QxNg6WXNNHuBPuxSb+UlzJdzUSTJxNVpZ3mZdlMJO6YfPQ==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=uoHB9BWjZ84kKFYRhT/gQsSgAOfgXKoXdiwZH8Nhkg4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=kMvC2ZqF
Subject: Re: [Buildroot] [PATCH] package/tslib: bump version to 1.24
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

Pj4+Pj4gIk1hcnRpbiIgPT0gTWFydGluIEtlcHBsaW5nZXItTm92YWtvdmnEhyA8bWFydGlua0Bw
b3N0ZW8uZGU+IHdyaXRlczoKCiA+IFJlbGVhc2Ugbm90ZXMgZnJvbSBodHRwczovL2dpdGh1Yi5j
b20vbGlidHMvdHNsaWIvcmVsZWFzZXMgOgogPiBUaGlzIHJlbGVhc2UgaW5jbHVkZXMgbGlidHMg
dmVyc2lvbiAwLjEwLjUgYW5kIHRoZSBmb2xsb3dpbmcgY2hhbmdlczoKCiA+ICAgKiBpbXByb3Zl
ZCByZWxlYXNlIHByb2NlZHVyZQogPiAgICogZGVidWcgZml4ZXMgZm9yIDMyYml0IHN5c3RlbXMK
ID4gICAqIENNYWtlIGFuZCBhdXRvY29uZiB1cGRhdGVzIGZvciBuZXdlciB2ZXJzaW9ucwogPiAg
ICogZml4ZXMgZm9yIG1pbm9yIGNwcGNoZWNrIGVycm9ycwogPiAgICogdHNfY29uZiB0ZXN0IHBy
b2dyYW0gZml4ZXMKCiA+IFNpZ25lZC1vZmYtYnk6IE1hcnRpbiBLZXBwbGluZ2VyLU5vdmFrb3Zp
xIcgPG1hcnRpbmtAcG9zdGVvLmRlPgoKQ29tbWl0dGVkLCB0aGFua3MuCgotLSAKQnllLCBQZXRl
ciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
