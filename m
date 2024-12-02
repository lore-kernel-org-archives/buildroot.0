Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C109E69E81
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 19:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1536181166;
	Mon,  2 Dec 2024 19:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cA4ki3M2hdBr; Mon,  2 Dec 2024 19:09:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B937811F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B937811F9;
	Mon,  2 Dec 2024 19:09:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E664D1DAA
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 19:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C351440395
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 19:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAkuh2gYcHvI for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 19:09:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A807040134
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A807040134
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A807040134
 for <buildroot@uclibc.org>; Mon,  2 Dec 2024 19:09:11 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1tIBnB-0008Nm-2X
 for buildroot@uclibc.org; Mon, 02 Dec 2024 20:09:09 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 02 Dec 2024 20:08:34 +0100
Message-ID: <pan$ac397$67f189cf$d464437e$3fe47bec@ID-313208.user.individual.net>
References: <20241202182101.410320-1-alex.bennee__28617.3669317336$1733163691$gmane$org@linaro.org>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 0/2] Enable venus and add vkmark
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

QW0gTW9uLCAgMiBEZWMgMjAyNCAxODoyMDo1OSArMDAwMCBzY2hyaWViIEFsZXggQmVubsOpZToK
Cj4gSGksCj4gCj4gVGhpcyBpcyBhIHJlc3BpbiBvZiBhIHNlcmllcyBJIHNlbnQgb3V0IGluIEF1
Z3VzdC4gVGhpcyB0aW1lIGl0IGFwcGxpZXMKPiBvbiB0b3Agb2YgdGhlIHNlcmllcyBCZXJuZCBo
YXMganVzdCBzZW50IG91dDoKCkhpIEFsZXgsCgphZGRlZCB5b3VyIHR3byBwYXRjaGVzIHRvIHRo
ZSBjb21wbGV0ZSBzZXJpZXM6Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9i
dWlsZHJvb3QvbGlzdC8/c2VyaWVzPTQzNDk0NAoKUGxlYXNlIHRlc3Qgd2l0aCBtZXNhIDI0LjMu
MCwgdGhhbmtzLgoKUmVnYXJkcywgQmVybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
