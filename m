Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C66C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 19:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0B48607AB;
	Tue, 22 Apr 2025 19:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3vzYBaPIJYMl; Tue, 22 Apr 2025 19:16:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 077DC607E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 077DC607E4;
	Tue, 22 Apr 2025 19:16:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 357FB1A0
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AD2C80C4C
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATDKOqnbl4DO for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 19:16:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 74DC180BA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74DC180BA3
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74DC180BA3
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:16:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 81FFC1C0E3A; Tue, 22 Apr 2025 21:16:39 +0200 (CEST)
Message-ID: <5bc6aa94-6be2-423b-9bd6-9e8eb85e12cc@rnout.be>
Date: Tue, 22 Apr 2025 21:16:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Raphael Pavlidis <raphael.pavlidis@gmail.com>
References: <20250328064920.536373-1-peter@korsgaard.com>
 <20250328064920.536373-2-peter@korsgaard.com>
 <8299831a-af9a-464a-b367-6d8e0f7c94e7@rnout.be>
 <87h62nz71t.fsf@dell.be.48ers.dk>
Content-Language: en-GB
In-Reply-To: <87h62nz71t.fsf@dell.be.48ers.dk>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1745349399; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=JfmsVojF7pkVSmqxTfPhd9fnJkGSREsASp0kKJfWkOU=;
 b=Zw4jSm5gEpT538ZumsYxqoWB/ABbszcO93PR82vXybdwg0K2F+RCIG8K+nYCC2xMqs9RG7
 k6w7JwDrJ3nzIxytjT7jCuDp8uiq+PwbYWOwqJCp8XdrW7CIW2YzryO7nHkH7ZqT82/vWW
 yI4a2yR+87IQpsuWjb94ddvm8ffr3J5PzwvaDIRLAumJH/rI4cjXlckg/REHczX8LlGRQt
 RE4dHwvI7BwjoJRgyfEk+f+9TU2Fq0vptSt91/XhePcKeuto6GL7zcBwzEZq8Fr2S5IuDs
 YLdDdfsz+udbQgPlXmO2F55pnx4xHYiKBA9GvheA4D59bs1JUorZmSh6LrpF9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 2/2] package/xwayland: security bump to
 version 24.1.6
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDE3LzA0LzIwMjUgMDc6MzMsIFBldGVyIEtvcnNnYWFyZCB3cm90ZToKPj4+Pj4+ICJBcm5v
dXQiID09IEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAcm5vdXQuYmU+IHdyaXRlczoKPiAg
ID4+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4K
Pgo+ICAgPiDCoEFwcGxpZWQgdG/CoDIwMjUuMDIueCwgdGhhbmtzLgo+Cj4gU2hvdWxkbid0IHRo
aXMgZ28gdG8gMjAyNC4wMi54IC8gMjAyNC4xMS54IGFzIHdlbGwgbGlrZSB0aGUgeHNlcnZlciBi
dW1wPwoKIMKgQXBwbGllZCB0byB0aG9zZSBicmFuY2hlcyBhcyB3ZWxsIQoKCiDCoFJlZ2FyZHMs
CiDCoEFybm91dAoKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
