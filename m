Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A726CEB2C1
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 21:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5D004017A;
	Mon, 30 Sep 2024 21:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZdUNp6ojW2d; Mon, 30 Sep 2024 21:05:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74CA0400E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74CA0400E5;
	Mon, 30 Sep 2024 21:05:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17E391BF348
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 21:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 076A780E8C
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 21:05:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rn9T2WWu40zg for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 21:05:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C97E180E85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C97E180E85
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C97E180E85
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 21:05:00 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id D3387240EC0;
 Mon, 30 Sep 2024 23:04:58 +0200 (CEST)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix03.mail.de (Postfix) with ESMTP id B28EE260286;
 Mon, 30 Sep 2024 23:04:58 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id EE511240A18;
 Mon, 30 Sep 2024 23:04:57 +0200 (CEST)
Message-ID: <cbab2142-67df-40ee-a508-659775259385@mail.de>
Date: Mon, 30 Sep 2024 23:04:55 +0200
MIME-Version: 1.0
To: Andrew McCann <andrew.2.622266@gmail.com>
References: <CAPKzRz-HU2_WJesQKDn_Nj8dZLgzYpJXL9+Gt6tH1Xgk8LzT=A@mail.gmail.com>
 <763b02bb-2b74-4afc-b670-d41183bef12c@grenoble.cnrs.fr>
 <CAPKzRz83KTOgnyyBBuZjzV7uSti+G05KaUnM4=mFV8U2GhcKCw@mail.gmail.com>
 <97e1c0a9-9ebc-4b45-b231-75ac947a7ead@mail.de>
 <CAPKzRz87tMVoYkmSMrCfVB8xw-6CQq45MfVz0jK_yTExgR-yaw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAPKzRz87tMVoYkmSMrCfVB8xw-6CQq45MfVz0jK_yTExgR-yaw@mail.gmail.com>
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 778
X-purgate-ID: 154282::1727730298-DACAF6E7-5DC5FC0A/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1727730298;
 bh=1avr+atW9L9EbQg3urjMCZW4X71B3YYI+Y7qyrpV+No=;
 h=Message-ID:Date:Subject:To:Cc:From:From:To:CC:Subject:Reply-To;
 b=n0g2HcOOnvnU3/S1LU5ZjX5OqI4NocnrxpV5y7cH6zJTTJDgDJ/esibT88HkUkJHX
 4qlZnc487699otWqlrkfWxUzb2Pz1PrtLlRyEnBei+o4b7zbpnyu9Okt7fBCVJjODQ
 MZc6pQJoPvHUgVAFAnCJfGTDvewvaHG6IxDzXHBa2wiOyb8d2FtRU4D+38WBgboHVV
 5hQCmI+KA8sdQc62+vGkokme/6wkW5iAauX+I96fhcxz94Uw5k7Xaiu9dRJiRByw1a
 Tu7Ke7Z0u5adRpBiE7LMLqG8u0Lfv0Xt35OzQ23SnHFekfi5Wr8/X4vEue/dh/gHLc
 ez0e1Sp6a6Vag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=n0g2HcOO
Subject: Re: [Buildroot] Change config.txt Not Working
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQW5keSwKCj4gVGhhbmtzIHZlcnkgbXVjaCBmb3IgeW91ciByZXNwb25zZS7CoCBJIHdhcyBz
dWNjZXNzZnVsIHVwZGF0aW5nIHRoZSAKPiBjb25maWcudHh0IHVzaW5nIHlvdXIgc2VyaWVzIG9m
IGNvbW1hbmRzLsKgIFNvIEkgc3VwcG9zZSBJIGRpZG4ndCBoYXZlIAo+IHNvbWUgcHJvcGVyIGNs
ZWFudXAuwqAgSSBkaWQgbm90IGtub3cgYWJvdXQgdGhlc2UgY29tbWFuZHMsIGFuZCBJIGRvbid0
IAo+IGJlbGlldmUgdGhleSBhcmUgcmVmZXJlbmNlZCBpbiB0aGUgYnVpbGRyb290IGRvY3VtZW50
YXRpb24uwqAgSXMgdGhlcmUgYSAKPiBwbGFjZSB0byByZWFkIGFib3V0IHRoZW0/CgpHbGFkIHRv
IGhlbHAhIEhhdmUgYSBsb29rIGhlcmU6Cmh0dHBzOi8vYnVpbGRyb290Lm9yZy9kb3dubG9hZHMv
bWFudWFsL21hbnVhbC5odG1sI3JlYnVpbGQtcGtnCgpBbHNvIHNlZSBoZXJlLCB0aGUgKHNhbWU/
KSBkb2N1bWVudGF0aW9uIGluc2lkZSB0aGUgYnVpbGRyb290IHJlcG9zaXRvcnk6CgpodHRwczov
L2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iLzIwMjQuMDIuNi9kb2Nz
L21hbnVhbC9yZWJ1aWxkaW5nLXBhY2thZ2VzLmFkb2M/cmVmX3R5cGU9dGFncwoKU28sIGlmIHlv
dSBoYXBwZW4gdG8gZmluZCBzb21lIHR5cG8gb3IgaGF2ZSBzb21lIGlkZWEgZm9yIGltcHJvdmVt
ZW50LCAKcGF0Y2hlcyBhcmUgb2YgY291cnNlIGFwcHJlY2lhdGVkLCBJIGd1ZXNzIDopCgpCZXN0
IHJlZ2FyZHMsCktpbGlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
