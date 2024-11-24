Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A628CE66887
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 13:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4839060A94;
	Sun, 24 Nov 2024 13:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qoyzSyr3A0Xh; Sun, 24 Nov 2024 13:44:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5419160A53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5419160A53;
	Sun, 24 Nov 2024 13:44:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C407731
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 13:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE055423CF
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 13:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E449PxHKZf_l for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 13:44:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5EEB141E7E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EEB141E7E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EEB141E7E
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 13:44:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 525FCC0004;
 Sun, 24 Nov 2024 13:44:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tFCuu-00G8kg-2Y;
 Sun, 24 Nov 2024 14:44:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: Julien Olivain <ju.o@free.fr>,  <buildroot@buildroot.org>
References: <20241123225155.3362363-1-peter@korsgaard.com>
 <3a4e6ae025bfd288bb98c7b492ec499f@free.fr>
 <1935d676f00.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
Date: Sun, 24 Nov 2024 14:44:48 +0100
In-Reply-To: <1935d676f00.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
 (Vincent Jardin's message of "Sun, 24 Nov 2024 10:01:20 +0100")
Message-ID: <87zflopwz3.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/quagga: fetch from
 sources.buildroot.net
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

Pj4+Pj4gIlZpbmNlbnQiID09IFZpbmNlbnQgSmFyZGluIDx2amFyZGluQGZyZWUuZnI+IHdyaXRl
czoKCiA+IEhpIFBldGVyIGFuZCBKdWxpZW4sCiA+IExlIDI0IG5vdmVtYnJlIDIwMjQgMDE6NDE6
MTcgSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4gYSDDqWNyaXQgOgoKID4+IEhpIFBldGVy
LAogPj4gCiA+PiBPbiAyMy8xMS8yMDI0IDIzOjUxLCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6CiA+
Pj4gRml4ZXMKID4+PiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNTRh
LzU0YTE2NTgyN2Y1MzZiZTQ3Y2Q0NWM5OGRhMzkzN2ExZTk0YTdjNjUvCiA+Pj4gCiA+Pj4gVXBz
dHJlYW0gaXMgbm8gbG9uZ2VyIGFjY2Vzc2libGUsIHNvIHVzZSBzLmIubiBpbnN0ZWFkLgogPj4+
IAogPj4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNv
bT4KID4+PiAtLS0KID4+PiBwYWNrYWdlL3F1YWdnYS9xdWFnZ2EubWsgfCAzICsrLQogPj4+IDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKID4+PiAKID4+PiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9xdWFnZ2EvcXVhZ2dhLm1rIGIvcGFja2FnZS9xdWFnZ2EvcXVh
Z2dhLm1rCiA+Pj4gaW5kZXggNWQ4ZDUyMjYzYS4uZGQ5MjE1NTJmMSAxMDA2NDQKID4+PiAtLS0g
YS9wYWNrYWdlL3F1YWdnYS9xdWFnZ2EubWsKID4+PiArKysgYi9wYWNrYWdlL3F1YWdnYS9xdWFn
Z2EubWsKID4+PiBAQCAtNSw3ICs1LDggQEAKID4+PiAKID4+PiAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwogPj4+IAogPj4+IFFVQUdHQV9WRVJTSU9OID0gMS4yLjQKID4+PiAtUVVBR0dBX1NJVEUg
PSBodHRwOi8vZG93bmxvYWQuc2F2YW5uYWguZ251Lm9yZy9yZWxlYXNlcy9xdWFnZ2EKID4+PiAr
IyB1cHN0cmVhbSAoaHR0cDovL2Rvd25sb2FkLnNhdmFubmFoLmdudS5vcmcvcmVsZWFzZXMvcXVh
Z2dhKSBkZWFkCiA+Pj4gK1FVQUdHQV9TSVRFID0gaHR0cDovL3NvdXJjZXMuYnVpbGRyb290Lm5l
dC9xdWFnZ2EKID4+IAogPj4gU2hvdWxkIHdlIHVzZSBodHRwcyBpbnN0ZWFkPyBUaGUgZGVmYXVs
dCBCUjJfQkFDS1VQX1NJVEUgdmFsdWUKID4+IGlzIHVzaW5nIGl0OgogPj4gaHR0cHM6Ly9naXRs
YWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vYmxvYi8yMDI0LjExLXJjMi9Db25maWcu
aW4jTDI2NQoKID4gU2hvdWxkbid0IHdlIGdpdmUgdXAgdGhpcyBwYWNrYWdlIHNpbmNlIEZSUiBp
cyBhIG1hdHVyZSBhbHRlcm5hdGl2ZSA/CgpZZXMsIEkndmUgc2VudCBhIHBhdGNoIGZvciBuZXh0
IHRvIGRvIHRoYXQuIFRoaXMgcGF0Y2ggaXMgbWVhbnQgYXMgYQpxdWljayBmaXggZm9yIHRoZSBz
dGFibGUgYnJhbmNoZXMgKGFuZCBtYXN0ZXIgLyAyMDI0LjExKSBpbnN0ZWFkLgoKLS0gCkJ5ZSwg
UGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
