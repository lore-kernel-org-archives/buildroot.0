Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0A6C4167B
	for <buildroot@archiver.kernel.org>; Tue, 28 Nov 2023 14:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 727BB40160;
	Tue, 28 Nov 2023 14:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 727BB40160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6197tMydD3_f; Tue, 28 Nov 2023 14:08:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD8EC40105;
	Tue, 28 Nov 2023 14:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD8EC40105
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF7A31BF2C6
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 14:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95B4F8133F
 for <buildroot@lists.busybox.net>; Tue, 28 Nov 2023 14:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95B4F8133F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PppvkLovBsYT for <buildroot@lists.busybox.net>;
 Tue, 28 Nov 2023 14:07:56 +0000 (UTC)
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D6DE812DC
 for <buildroot@buildroot.org>; Tue, 28 Nov 2023 14:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D6DE812DC
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 8BD854403F6;
 Tue, 28 Nov 2023 16:06:31 +0200 (IST)
References: <20231128134301.6018-1-flavio.tapajos@newtesc.com.br>
User-agent: mu4e 1.10.8; emacs 29.1
To: =?utf-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
Date: Tue, 28 Nov 2023 16:07:20 +0200
In-reply-to: <20231128134301.6018-1-flavio.tapajos@newtesc.com.br>
Message-ID: <87il5mx96x.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1701180391;
 bh=2XzIzmdlgyVCa+jWC2OOuE+AB2g1/igTLvR9n0/haMk=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=dzZaF8pn3fqP9bBbOzWSWj/RQ7HYsjWh0IC9nDdKFti3hwwWv3jruX5pmHUXjIEY5
 WkGthTyPOiVUBaapiIIXl1hbkjI1nystxigT3xmNo3nPO7nXRD+2LnvOK1q0izJzt3
 J3sglXW/VRHLc8Xa2QefUZBF8qe0WCVWtS0j5y7KFK0jcB/cuPpbwis4a7MH8qNd87
 2QupLPUoijczEa0SJxUI3J2epebNi5ZEwSmpoTLaUpG74KB23Ive2st2wlbHhp0xwX
 itjE+P/XdzteF9n0zEaqXFVrbN9v3T5bsWg9nR41fjdFlbiB+piyVSbud1XLXKr4mS
 9c5hdqaw9J4ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=dzZaF8pn
Subject: Re: [Buildroot] [PATCH 1/2] package/rsyslog: bump version to
 8.2310.0
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRmzDoXZpbywKCk9uIFR1ZSwgTm92IDI4IDIwMjMsIEZsw6F2aW8gVGFwYWrDs3Mgd3JvdGU6
Cgo+IFNpZ25lZC1vZmYtYnk6IEZsw6F2aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rl
c2MuY29tLmJyPgo+IC0tLQo+ICBwYWNrYWdlL3JzeXNsb2cvcnN5c2xvZy5tayB8IDIgKy0KCi5o
YXNoIGZpbGUgdXBkYXRlIGlzIG1pc3NpbmcuCgpiYXJ1Y2gKCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnN5
c2xvZy9yc3lzbG9nLm1rIGIvcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cubWsKPiBpbmRleCA4NGZk
MmQyZTVlLi5jZjlmMmMwZTc5IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcnN5c2xvZy9yc3lzbG9n
Lm1rCj4gKysrIGIvcGFja2FnZS9yc3lzbG9nL3JzeXNsb2cubWsKPiBAQCAtNCw3ICs0LDcgQEAK
PiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtUlNZU0xPR19WRVJTSU9OID0g
OC4yMjA0LjEKPiArUlNZU0xPR19WRVJTSU9OID0gOC4yMzEwLjAKPiAgUlNZU0xPR19TSVRFID0g
aHR0cDovL3JzeXNsb2cuY29tL2ZpbGVzL2Rvd25sb2FkL3JzeXNsb2cKPiAgUlNZU0xPR19MSUNF
TlNFID0gR1BMLTMuMCwgTEdQTC0zLjAsIEFwYWNoZS0yLjAKPiAgUlNZU0xPR19MSUNFTlNFX0ZJ
TEVTID0gQ09QWUlORyBDT1BZSU5HLkxFU1NFUiBDT1BZSU5HLkFTTDIwCgoKLS0gCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfi4gLn4gICBUayBP
cGVuIFN5c3RlbXMKPX0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1vb08tLVUtLU9vby0tLS0tLS0tLS0tLXs9CiAgIC0gYmFydWNoQHRrb3MuY28uaWwgLSB0
ZWw6ICs5NzIuNTIuMzY4LjQ2NTYsIGh0dHA6Ly93d3cudGtvcy5jby5pbCAtCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
