Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58013C47073
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 22:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA54561468;
	Thu,  4 Jan 2024 22:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA54561468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BvU-jtvDVDoN; Thu,  4 Jan 2024 22:33:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D91961461;
	Thu,  4 Jan 2024 22:33:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D91961461
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECE531BF3E8
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 22:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4421404ED
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 22:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4421404ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahW1DtEu5ViF for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 22:33:44 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A706400C6
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 22:33:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A706400C6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C284C0004;
 Thu,  4 Jan 2024 22:33:40 +0000 (UTC)
Date: Thu, 4 Jan 2024 23:33:40 +0100
To: =?UTF-8?B?RmzDoXZpbyBUYXBhasOzcw==?= <flavio.tapajos@newtesc.com.br>
Message-ID: <20240104233340.6cc53404@windsurf>
In-Reply-To: <20240103142831.901515-2-flavio.tapajos@newtesc.com.br>
References: <20240103142831.901515-1-flavio.tapajos@newtesc.com.br>
 <20240103142831.901515-2-flavio.tapajos@newtesc.com.br>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704407621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DA2tSTz7BVmVemSvjtG4wdSDIh3XRblYN/WkSwME+jo=;
 b=HcC+7aYqBBw9saPuCAbOI9WanaKGKBtJZeRXpwXsaDJfVwZYsdVhjUkc5ayRnEzwdOIki/
 thDE67Y7w/fymIWqy66LhsqLiYrRcjUmdZ+lkEinDwsg/fNVb5CnzLC4/jeF4vXA3LZBr5
 M27WK65zJ9AH1hyzFiku5vG0V4z+0eGZ1nNTT4U7K2zTeyAogo6Hbf/EbTToUuESgJD8ks
 QlKa9r+9YQ9J8ukEzIH9K7tZEzg9N2tgHp8/0XyDlv+n+qJjj63aIMa0RBnFTewwHwmFu7
 xh0O+rkM+2RBiEs+e6xIXpcCa5+tev5cdatnjdD+IHHCBftwVYZfHo25oHutTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HcC+7aYq
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_2/2=5D_DEVELOPERS=3A_add_Fl=C3=A1?=
 =?utf-8?q?vio_Tapaj=C3=B3s_for_python-sqlalchemy?=
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAgMyBKYW4gMjAyNCAxMToyODozMSAtMDMwMApGbMOhdmlvIFRhcGFqw7NzIDxmbGF2
aW8udGFwYWpvc0BuZXd0ZXNjLmNvbS5icj4gd3JvdGU6Cgo+IFNpZ25lZC1vZmYtYnk6IEZsw6F2
aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPgo+IC0tLQo+ICBERVZF
TE9QRVJTIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKQXBwbGllZCB0
byBtYXN0ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290
bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGlu
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
