Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB202C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 20:06:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41264611EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 20:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 41264611EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6D2F4067D;
	Tue, 19 Oct 2021 20:06:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ejW6zithtyE; Tue, 19 Oct 2021 20:06:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D8C940680;
	Tue, 19 Oct 2021 20:06:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABB6C1BF476
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 20:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BF2A83139
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 20:06:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKYdtWbBGv_D for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 20:06:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DB3583192
 for <buildroot@busybox.net>; Tue, 19 Oct 2021 20:06:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:dd94:aa5f:dfc1:b524])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9012B19F54D;
 Tue, 19 Oct 2021 22:06:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634674008;
 bh=vnKJxcUhrTJRRNhKuEyLvdDwiEa/BDl64bxaz+okeSM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gqBTcJcoVl4KUj9Nwlh5zOMQHc+70IW55J5XU6PymLCQgo1bc5IjUdk+TJN40ExIC
 N+ZVbXcJB/8w/eWVQlTnqEuKdGxlgh+cAU82sk6YyXlXhnZ8tqI/3R+y+lduqhyYlO
 y7Qgb88nBG98l6uhmjG3znC74aONRvL+anXNggzafEatsUSigisDo4beatSMwa2jWW
 qQnEvRAaDxgrFf9BT522stYHHIb2AF/XcFHskx1j8EWtFS8tPQB5IDSjvo7nUxtetU
 N7PgUwbIDuz5ALxf05iddJHSYRk2LeZf1SoUc5BUcuugm4LdVQ3hQuwsXBoGMPCtf8
 LmFJIHF4R3nkA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 19 Oct 2021 22:06:43 +0200
Date: Tue, 19 Oct 2021 22:06:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20211019200643.GY2400@scaer>
References: <20210901141029.892409-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210901141029.892409-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2] support/scripts/pkg-stats: prefers
 stable version from release-monitoring.org
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIxLTA5LTAxIDE2OjEwICswMjAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IGZvciBleGFtcGxlIHdpdGggbGlicG5nOiAxLjYuMzcgaW5zdGVh
ZCBvZiAxLjcuMGJldGE4OQo+IAo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJh
bmNvaXMucGVycmFkQGdhZHoub3JnPgo+IC0tLQo+ICBzdXBwb3J0L3NjcmlwdHMvcGtnLXN0YXRz
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQg
YS9zdXBwb3J0L3NjcmlwdHMvcGtnLXN0YXRzIGIvc3VwcG9ydC9zY3JpcHRzL3BrZy1zdGF0cwo+
IGluZGV4IGNjOTFkMTMxNi4uMjQ5Y2M2YWZlIDEwMDc1NQo+IC0tLSBhL3N1cHBvcnQvc2NyaXB0
cy9wa2ctc3RhdHMKPiArKysgYi9zdXBwb3J0L3NjcmlwdHMvcGtnLXN0YXRzCj4gQEAgLTQ4NSw2
ICs0ODUsNyBAQCBhc3luYyBkZWYgY2hlY2tfcGFja2FnZV9nZXRfbGF0ZXN0X3ZlcnNpb25fYnlf
ZGlzdHJvKHNlc3Npb24sIHBrZywgcmV0cnk9VHJ1ZSk6Cj4gIAo+ICAgICAgICAgICAgICBkYXRh
ID0gYXdhaXQgcmVzcC5qc29uKCkKPiAgICAgICAgICAgICAgdmVyc2lvbiA9IGRhdGFbJ3ZlcnNp
b24nXSBpZiAndmVyc2lvbicgaW4gZGF0YSBlbHNlIE5vbmUKPiArICAgICAgICAgICAgdmVyc2lv
biA9IGRhdGFbJ3N0YWJsZV92ZXJzaW9ucyddWzBdIGlmICdzdGFibGVfdmVyc2lvbnMnIGluIGRh
dGEgZWxzZSB2ZXJzaW9uCgpJJ3ZlIGNoYW5nZWQgdGhhdCB0byBmaXQgYWxsIGluIGEgc2luZ2xl
IGxpbmU6CgogICAgdmVyc2lvbiA9IGRhdGFbJ3N0YWJsZV92ZXJzaW9ucyddWzBdIGlmICdzdGFi
bGVfdmVyc2lvbnMnIGluIGRhdGEgZWxzZSBkYXRhWyd2ZXJzaW9uJ10gaWYgJ3ZlcnNpb24nIGlu
IGRhdGEgZWxzZSBOb25lCgpBbmQgaXQgYWxsIGZpdHMgaW4gdGhlIGFsbG93ZWQgMTMyLWNoYXIg
bGltaXQhIDotKQoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4g
TU9SSU4uCgo+ICAgICAgICAgICAgICBjaGVja19wYWNrYWdlX2xhdGVzdF92ZXJzaW9uX3NldF9z
dGF0dXMocGtnLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgUk1fQVBJX1NUQVRVU19GT1VORF9CWV9ESVNUUk8sCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2ZXJzaW9uLAo+IC0tIAo+IDIu
MzAuMgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidXN5Ym94Lm5ldAo+IGh0dHA6
Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVk
IHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYg
MDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAg
ICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFH
QUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdl
ZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8
CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
