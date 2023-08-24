Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9872DC6FA8F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 18:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55AC3415B9;
	Thu, 24 Aug 2023 18:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55AC3415B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hi9ul1HsU_kA; Thu, 24 Aug 2023 18:58:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A966C4159D;
	Thu, 24 Aug 2023 18:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A966C4159D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61F421BF853
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 18:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 491F74159D
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 18:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 491F74159D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SmpdXB3naMFX for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 18:58:35 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CD8040569
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 18:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CD8040569
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A8BEE0003;
 Thu, 24 Aug 2023 18:58:32 +0000 (UTC)
Date: Thu, 24 Aug 2023 20:58:31 +0200
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= via buildroot
 <buildroot@buildroot.org>
Message-ID: <20230824205831.5027a943@windsurf>
In-Reply-To: <20230824150950.56165-1-raphael.melotte@mind.be>
References: <20230824150950.56165-1-raphael.melotte@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1692903512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7f4kIdmm4t+1PfMhOb0kzV1efIv+0IP+aQtYzSWllGA=;
 b=B737FNySFYT0MMJ6Lu+sAp/B+kboftggUdPzmlK+XgHwlpaJYfpZUMnwxmvN4uqqrA9azh
 0eNjw9617WmhI2b7LCNsj3IqHJMV3bIS9w0ypNIILxpsf3KERPMuN234tUBfaak9t/URnh
 5tx2jEiAvJ8oLDtNbAWiqbUNMcboOp8HSCdXy8nMHBw8KIQOuM3FS0pmmOEhRgQt7MLFsv
 TpLh71oL/3quuerNKTZCHvTlFUhG9i/HC9GR727kmQzMMRxwwW3pLqxX2j2QG8Xy6fF5bt
 dit1RHSODvVnzmJQdazL86G5oxDZJS1nVMjNjsVf5lvG0+2C35Vu265/Yi+UBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B737FNyS
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: remove
 leftover comment about headers
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAyNCBBdWcgMjAyMyAxNzowOTo0OCArMDIwMApSYXBoYcOrbCBNw6lsb3R0ZSB2aWEg
YnVpbGRyb290IDxidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cgo+IENvbW1pdCAwYThl
ZjJmM2Y3YmMyMTFkMzhhNWEzNzAwN2JkZWI0ODliZDM3YWFlIGJ1bXBlZCB0aGUgaGVhZGVycwo+
IHZlcnNpb24gcmVxdWlyZW1lbnRzLCBidXQgZGlkIG5vdCB1cGRhdGUgdGhlIGFzc29jaWF0ZWQg
Y29tbWVudC4KPiAKPiBSZW1vdmUgdGhlIGNvbW1lbnQgZW50aXJlbHksIGFzIGl0IGRvZXMgbm90
IGFwcGx5IGFueW1vcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJh
cGhhZWwubWVsb3R0ZUBtaW5kLmJlPgo+IC0tLQo+ICBwYWNrYWdlL25ldHdvcmstbWFuYWdlci9D
b25maWcuaW4gfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCkFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9v
dGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxp
bi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
