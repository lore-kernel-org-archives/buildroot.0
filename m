Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FEFC433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Dec 2021 11:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1B1440632;
	Thu, 23 Dec 2021 11:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZr1As7U0b-3; Thu, 23 Dec 2021 11:20:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C240C4062F;
	Thu, 23 Dec 2021 11:20:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD9831BF475
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 11:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CF4A81D5A
 for <buildroot@lists.busybox.net>; Thu, 23 Dec 2021 11:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linatsea.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zrhjB44frYvr for <buildroot@lists.busybox.net>;
 Thu, 23 Dec 2021 11:20:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4497281D3D
 for <buildroot@buildroot.org>; Thu, 23 Dec 2021 11:20:48 +0000 (UTC)
Received: (Authenticated sender: thierry.bultel@linatsea.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2F5F6240004;
 Thu, 23 Dec 2021 11:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linatsea.fr; s=gm1;
 t=1640258444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y1wZ20k9V7VO9dSC4C4G3yEPczSzC6H0tNprlSVoX04=;
 b=cUFKbKE0KWYcXjSqb4sBsl7BTPjaY8udCxv2Rmzc9ZHvhf8Nt6IUf6g0VPpsusij7ElT9n
 y9Zm4VgxdDwKRVl6pZSJ+wpQWXmAFV0ZdIYxbo6Cbs3xah5jro/fJhvTKPfo3Cw6OGbTd9
 W1FxvI1plg2Df9nIrYxVJEGDR7Lj83Ge8xbj4Q/ojTIJkGyUO6sQIc+5s19Uu0IjNDeneq
 pjjSfmGzzho40y3/OQGRfDMjDO++pRWTFz57zw7BzVbzeWsmrgyFmFxAuEspQ1x0ctOChj
 26zk8D1chJXMJ7WtQ27rfipjHacbywHdQok1ZCNkFUj2aP7XfXMrJlTHVxIHZA==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211219073119.1087539-1-thierry.bultel@linatsea.fr>
 <20211219073119.1087539-3-thierry.bultel@linatsea.fr>
 <20211219111336.49cd5d7a@windsurf>
From: Thierry Bultel <thierry.bultel@linatsea.fr>
Message-ID: <3c476986-226a-67ef-6f1e-12beb67fb622@linatsea.fr>
Date: Thu, 23 Dec 2021 12:20:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211219111336.49cd5d7a@windsurf>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v2 3/3] fs/cpio: new option to use dracut
 tool
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CkxlIDE5LzEyLzIwMjEgw6AgMTE6MTMsIFRob21hcyBQZXRhenpvbmkgYSDDqWNyaXTCoDoKPiBI
ZWxsbyBUaGllcnJ5LAo+Cj4gT24gU3VuLCAxOSBEZWMgMjAyMSAwODozMToxOSArMDEwMAo+IFRo
aWVycnkgQnVsdGVsIDx0aGllcnJ5LmJ1bHRlbEBsaW5hdHNlYS5mcj4gd3JvdGU6Cj4KPj4gQWRk
cyBhbiBvcHRpb24gdG8gaW52b2tlIHRoZSBkcmFjdXQgaG9zdCB0b29sLCBwcm92aWRpbmcKPj4g
YSBjb25maWd1cmF0aW9uIGZpbGUsIGluc3RlYWQgb2YgaGF2aW5nIGEgZnVsbCBjcGlvIGFyY2hp
dmUKPj4gb2YgdGhlIHdob2xlIHRhcmdldCBkaXJlY3RvcnkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFRoaWVycnkgQnVsdGVsIDx0aGllcnJ5LmJ1bHRlbEBsaW5hdHNlYS5mcj4KPj4gQ2hhbmdlcyB2
MSAtPiB2MiAoc3VnZ2VzdGVkIGJ5IEFybm91bHQgYW5kIFlhbm4pCj4+ICAgIC0gd2FzIGEgbmV3
IGZzIHR5cGUsIG5vdyBhbiBvcHRpb24gb2YgY3Bpbwo+PiAgICAtIGRlYWxzIHdpdGggdGhlIGNh
c2Ugb2YgYSBidWlsZCB3aXRoIG5vIGtlcm5lbAo+PiAgICAtIGdldHMgdGhlIGtlcm5lbCBuYW1l
IGluIGEgc21hcnRlciB3YXkKPj4gICAgLSBjaGVja3MgZm9yIHRoZSBuYW1lIG9mIGRyYWN1dCBj
b25maWd1cmF0aW9uIGZpbGUKPj4KPj4gU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBCdWx0ZWwgPHRo
aWVycnkuYnVsdGVsQGxpbmF0c2VhLmZyPgo+IFRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzISBX
aGF0IHdvdWxkIGJlIG5pY2UgaXMgdG8gYWRkIGEgdGVzdCBjYXNlIGluCj4gc3VwcG9ydC90ZXN0
aW5nLyBmb3IgdGhpcy4gV2UgYWxyZWFkeSBoYXZlIGxvdHMgb2YgdGVzdHMgZm9yIHZhcmlvdXMK
PiBmaWxlc3lzdGVtIHR5cGVzIGluIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9mcy4KClRoYW5rcyBU
aG9tYXMsCmRvbmUgYW5kIGp1c3Qgc3VibWl0dGVkIGluIG15IHYzIHBhdGNoZXMuCgpUaGUgdGVz
dHMgYWxzbyBjb3ZlciB0aGUgZnVsbCBjcGlvIG1vZGUsIGFuZCByZXZlYWxlZCBzb21lCnVuaGFu
ZGxlZCBjYXNlcyBpbiBkcmFjdXQgbW9kZSwgd2hlcmUgdGhlIHVDbGliYyByZXF1aXJlZAp0byBw
YXkgbW9yZSBhdHRlbnRpb24uCgpDaGVlcnMKVGhpZXJyeQoKPgo+IFRoYW5rcyEKPgo+IFRob21h
cwoKLS0gClJlOiB0ZXN0CgotLSAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
