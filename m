Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095B9C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 22:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEC8960B8D;
	Fri, 18 Mar 2022 22:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mz1f7IwL3GeP; Fri, 18 Mar 2022 22:46:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9EEB60B1D;
	Fri, 18 Mar 2022 22:46:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA0421BF853
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8AD260B8D
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:46:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKG2D098l4TJ for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 22:46:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D763B60B1D
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 22:46:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:20af:3c78:ddff:75e1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4334313F854;
 Fri, 18 Mar 2022 23:46:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647643587;
 bh=6vl2v0SfEVmmPpRC9X7vq2qiIX08l4JjIqRFXsJXg30=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lc78pAl3yzFZpRvAxw7tHlUQst/OXGtfePyRbeTdWFlksdbFBsiXMUVAvoQP0zKSl
 fnLOYyMHpU1wllyhXRCgpYWwcjXsoLqtFgWyq4ZXDEMSiWr8k2AudxyiaW6xj/w0lZ
 x81fl76owl5YIMChNviCCWZRcDgnwClhk40bKEz/jQ69D7n2D+0rmJdyOS4uIJlIaq
 sHoLY3Vb8RYEx8e7mpRFa8I8MO/RWiD1ldDbnqRdDGN+z26/EXWRLDM81hgT+JY/8L
 xvZNaK0ZStx40b+ic/s3utyuxq66CMZYp26h1wv5KFK6cUI3gK6BAXcZ34YAkJ+Iht
 CAqttg7da+SVA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Mar 2022 23:46:23 +0100
Date: Fri, 18 Mar 2022 23:46:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Message-ID: <20220318224622.GW283544@scaer>
References: <20220318132427.48737-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318132427.48737-1-clement.leger@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v5 0/8] boot/optee-os: support new optee-os
 3.16.0 build dependencies
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2zDqW1lbnQsIEFsbCwKCk9uIDIwMjItMDMtMTggMTQ6MjQgKzAxMDAsIENsw6ltZW50IEzDqWdl
ciBzcGFrZSB0aHVzbHk6Cj4gTmV3ZXIgdmVyc2lvbnMgb2Ygb3B0ZWUtb3MgKD49IDMuMTYuMCkg
dXNlcyBweXRob24tY3J5cHRvZ3JhcGh5IGluc3RlYWQKPiBvZiBweXRob24tcHljcnlwdG9kb21l
eCB0byBidWlsZC4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IHRvIGJ1aWxkCj4gaG9zdC1weXRo
b24tY3J5cHRvZ3JhcGh5IGFuZCB1c2VzIGl0IGluIG9wdGVlLW9zIHBhY2thZ2UgdG8gYnVpbGQg
dGhlCj4gMy4xNi4wIHZlcnNpb24uIEFsc28gYnVtcCBvcHRlZS1jbGllbnQsIG9wdGVlLWJlbmNo
bWFyaywgb3B0ZWUtZXhhbXBsZXMKPiBhbmQgb3B0ZWUtdGVzdCB3aGljaCBuZWVkcyB0byBiZSBh
bGlnbmVkIHdpdGggb3B0ZWUtb3MgdmVyc2lvbi4KWy0tU05JUC0tXQo+IENsw6ltZW50IEzDqWdl
ciAoNyk6Cj4gICBwYWNrYWdlL3B5dGhvbi1jcnlwdG9ncmFwaHk6IGVuYWJsZSBob3N0IHBhY2th
Z2UKPiAgIGJvb3Qvb3B0ZWUtb3M6IGFkZCBzdXBwb3J0IHRvIGJ1aWxkIHdpdGggcHl0aG9uLWNy
eXB0b2dyYXBoeQo+ICAgYm9vdC9vcHRlZS1vczogYnVtcCB0byB2ZXJzaW9uIDMuMTYuMAo+ICAg
cGFja2FnZS9vcHRlZS10ZXN0OiBidW1wIHRvIHZlcnNpb24gMy4xNi4wCj4gICBwYWNrYWdlL29w
dGVlLWV4YW1wbGVzOiBidW1wIHRvIHZlcnNpb24gMy4xNi4wCj4gICBwYWNrYWdlL29wdGVlLWNs
aWVudDogYnVtcCB0byB2ZXJzaW9uIDMuMTYuMAo+ICAgcGFja2FnZS9vcHRlZS1iZW5jaG1hcms6
IGJ1bXAgdG8gdmVyc2lvbiAzLjE2LjAKCldob2xlIHNlcmllcyBhcHBsaWVkIHRvIG1hc3Rlciwg
dGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gWWFubiBFLiBNT1JJTiAoMSk6Cj4g
ICBwYWNrYWdlL3BrZy1nZW5lcmljOiBob3N0IHZhcmlhbnQgaW5oZXJpdHMgdGFyZ2V0IGRvd25s
b2FkIHNldHRpbmdzCj4gCj4gIGJvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluICAgICAgICAgICAgICAg
ICAgICAgICB8IDE0ICsrKysrKysrKy0tCj4gIGJvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MuaGFzaCAg
ICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KPiAgYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tayAg
ICAgICAgICAgICAgICAgICAgIHwgIDggKysrKysrLQo+ICBwYWNrYWdlL29wdGVlLWJlbmNobWFy
ay9vcHRlZS1iZW5jaG1hcmsuaGFzaCAgfCAgNCArKy0tCj4gIHBhY2thZ2Uvb3B0ZWUtYmVuY2ht
YXJrL29wdGVlLWJlbmNobWFyay5tayAgICB8ICAyICstCj4gIHBhY2thZ2Uvb3B0ZWUtY2xpZW50
L29wdGVlLWNsaWVudC5oYXNoICAgICAgICB8ICA0ICsrLS0KPiAgcGFja2FnZS9vcHRlZS1jbGll
bnQvb3B0ZWUtY2xpZW50Lm1rICAgICAgICAgIHwgIDIgKy0KPiAgcGFja2FnZS9vcHRlZS1leGFt
cGxlcy9vcHRlZS1leGFtcGxlcy5oYXNoICAgIHwgIDQgKystLQo+ICBwYWNrYWdlL29wdGVlLWV4
YW1wbGVzL29wdGVlLWV4YW1wbGVzLm1rICAgICAgfCAgMiArLQo+ICBwYWNrYWdlL29wdGVlLXRl
c3Qvb3B0ZWUtdGVzdC5oYXNoICAgICAgICAgICAgfCAgNCArKy0tCj4gIHBhY2thZ2Uvb3B0ZWUt
dGVzdC9vcHRlZS10ZXN0Lm1rICAgICAgICAgICAgICB8ICAyICstCj4gIHBhY2thZ2UvcGtnLWdl
bmVyaWMubWsgICAgICAgICAgICAgICAgICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKysK
PiAgLi4uL3B5dGhvbi1jcnlwdG9ncmFwaHkubWsgICAgICAgICAgICAgICAgICAgIHwgMTIgKysr
KysrKysrKwo+ICAxMyBmaWxlcyBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlv
bnMoLSkKPiAKPiAtLSAKPiAyLjM0LjEKPiAKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8
ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04g
fCBFcmljcycgY29uc3BpcmFjeTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNp
Z25lciB8IFwgLyBDQU1QQUlHTiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEg
MDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBU
aGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8g
XCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0t
LS0tJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
