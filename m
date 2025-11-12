Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA01ACD37BF
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 20:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55A1C8316F;
	Wed, 12 Nov 2025 20:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFTv-NRb0ieR; Wed, 12 Nov 2025 20:03:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9797B83148
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9797B83148;
	Wed, 12 Nov 2025 20:03:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4032E158
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DE67605FA
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:03:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qHY9uwVRbAA for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 20:02:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 094C860E4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 094C860E4B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 094C860E4B
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 20:02:58 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -461612428; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 20:02:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJH3C-00Ha7b-1r;
 Wed, 12 Nov 2025 21:02:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Ayoub Zaki <ayoub.zaki@embetrix.com>
Cc: Lance Fredrickson <lancethepants@gmail.com>,  buildroot@buildroot.org
References: <1c677011-9c6e-483c-ab4f-93480d7fdd69@embetrix.com>
 <CABwKrPDNVLCLJHg7Nvxne+03RtZXXpO_H-iKquAe7hchiMf3pg@mail.gmail.com>
 <076df85a-3775-4854-875a-f76662318e35@embetrix.com>
Date: Wed, 12 Nov 2025 21:02:42 +0100
In-Reply-To: <076df85a-3775-4854-875a-f76662318e35@embetrix.com> (Ayoub Zaki's
 message of "Sun, 9 Nov 2025 22:04:03 +0100")
Message-ID: <87bjl7rpct.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=VTVGq2hvY+J3vAfmb+P+WqAXKymujT2M4l889STE6iEWgwGa28tlawnzaDscBr35s4xk6q11McJYVvz75i+HbaF/k3O3SPmYGP60Gs2flt6YfWno8I43yhgLMw0GGn3Yl8Plu24w5rTUxkmf0BYem0bf+K8XjeIPyEJ++ga9Kg5wKKHPcL/SiwGvAf/aoGhOLRrqoewUykggo5v6yGH7O0jwTNUy0jpOT77ogMr1MlOKUXmKHGXsXaDaJ5KZKi6mpop4udx98B4aIhceCEX7rrWYbcqZcQm43Nb9UtLdOxJW47umcVLfSyqSfrZ0vkHgZeRfNpHAUJKL4g0bYURznA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=5Z+HBo3gd2LI9JBTeDuWjsWCrDOPYC3kUcIca2+4ALM=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=VTVGq2hv
Subject: Re: [Buildroot] override a core package from BR2_EXTERNAL
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

Pj4+Pj4gIkF5b3ViIiA9PSBBeW91YiBaYWtpIDxheW91Yi56YWtpQGVtYmV0cml4LmNvbT4gd3Jp
dGVzOgoKID4gdGhhbmtzLCBidXQgdGhpcyBpcyBOT1Qgd2hhdCBJJ20gbG9va2luZyBmb3IsIEkg
aGF2ZSByZXF1aXJlbWVudCB0bwogPiBoYXZlIGEgY29tcGxldGUgb2xkZXIgdmVyc2lvbiBvZiBh
IGNvcmUgcGFja2FnZS4KCiA+IEkgZGlkIGHCoCByZXZlcnNlIHBhdGNoIGZvciB0aGUgcGFja2Fn
ZSBidXQgdGhpcyBpcyB1Z2x5IGFuZCBsb29rIGZvciBhCiA+IGNsZWFuZXIgd2F5IHRvIGRvIGl0
LgoKVGhlcmUgaXNuJ3QgcmVhbGx5IGFueSBzdXBwb3J0ZWQgd2F5IHRvIGRvIHNvLiAoU2lnbmlm
aWNhbnRseSkgY2hhbmdpbmcKdGhlIHZlcnNpb24gb2YgYSBwYWNrYWdlIGNvdWxkIGFsc28gbWVh
biBhIGNoYW5nZSBpbiAodG9vbGNoYWluKQpkZXBlbmRlbmNpZXMsIHNvIHRoZSBlYXNpZXN0IGlz
IHByb2JhYmx5IHRvIGZvcmsgYnVpbGRyb290IGFuZCBkbyB5b3VyCnR3ZWFrcyBpbiBhIGN1c3Rv
bSB0cmVlLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
