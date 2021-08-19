Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35586C4320A
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:49:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFEE061029
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 21:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFEE061029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0B0E401D8;
	Thu, 19 Aug 2021 21:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1rkCjlexNYbb; Thu, 19 Aug 2021 21:49:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D84F401BB;
	Thu, 19 Aug 2021 21:49:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C946B1BF4D5
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2ADE401BB
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 21:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LQlXJJi0suAI for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 21:49:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA01940176
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 21:49:30 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 97DA3E0003;
 Thu, 19 Aug 2021 21:49:27 +0000 (UTC)
Date: Thu, 19 Aug 2021 23:49:26 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <20210819234926.5298ac99@windsurf>
In-Reply-To: <20210809144144.30105-1-zajec5@gmail.com>
References: <20210809144144.30105-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH V2] package/firmware-utils: add package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gUmFmYcWCLAoKT24gTW9uLCAgOSBBdWcgMjAyMSAxNjo0MTo0NCArMDIwMApSYWZhxYIg
TWnFgmVja2kgPHphamVjNUBnbWFpbC5jb20+IHdyb3RlOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVj
a2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gVGhpcyBwYWNrYWdlIHByb3ZpZGVzIGEgc2V0IG9m
IHRvb2xzIG9yaWdpbmFsbHkgZGV2ZWxvcGVkIGZvciB0aGUKPiBPcGVuV3J0IHByb2plY3QuIFRo
ZXkgYWxsb3cgd29ya2luZyB3aXRoIHZhcmlvdXMgZmlybXdhcmUgZm9ybWF0cyB0aGF0Cj4gYXJl
IHJlcXVpcmVkIGZvciBmbGFzaGluZyBuZXcgaW1hZ2VzIG9uIGVtYmVkZGVkIGRldmljZXMuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgoKSXQg
bW9zdGx5IGxvb2tzIGdvb2QsIGFuZCBJIGFsbW9zdCBhcHBsaWVkLCBidXQgSSBkbyBoYXZlIGEg
ZmV3CnF1ZXN0aW9ucy9jb21tZW50cy4KCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmlu
IGIvcGFja2FnZS9Db25maWcuaW4KPiBpbmRleCAwNDZjMDRlOTk0Li42NjU3ODExYThjIDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBA
QCAtMjEyLDYgKzIxMiw3IEBAIG1lbnUgIkZpbGVzeXN0ZW0gYW5kIGZsYXNoIHV0aWxpdGllcyIK
PiAgCXNvdXJjZSAicGFja2FnZS9leGZhdC11dGlscy9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBh
Y2thZ2UvZXhmYXRwcm9ncy9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvZjJmcy10b29s
cy9Db25maWcuaW4iCj4gKwlzb3VyY2UgInBhY2thZ2UvZmlybXdhcmUtdXRpbHMvQ29uZmlnLmlu
IgoKQ291bGQgeW91IGV4cGxhaW4gd2h5IGEgdGFyZ2V0IHZhcmlhbnQgb2YgdGhpcyBwYWNrYWdl
IGlzIG5lZWRlZD8gV2hhdAphcmUgdGhlIHVzZSBjYXNlcyBmb3IgaGF2aW5nIHRob3NlIHRvb2xz
IGluc3RhbGxlZCBvbiB0aGUgdGFyZ2V0PwoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9maXJtd2Fy
ZS11dGlscy9Db25maWcuaW4gYi9wYWNrYWdlL2Zpcm13YXJlLXV0aWxzL0NvbmZpZy5pbgo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uZGE3NjVlYzFiNAo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2Zpcm13YXJlLXV0aWxzL0NvbmZpZy5pbgo+IEBAIC0w
LDAgKzEsOSBAQAo+ICtjb25maWcgQlIyX1BBQ0tBR0VfRklSTVdBUkVfVVRJTFMKPiArCWJvb2wg
ImZpcm13YXJlLXV0aWxzIgoKWW91IG5lZWQ6CgoJc2VsZWN0IEJSMl9QQUNLQUdFX09QRU5TU0wK
CXNlbGVjdCBCUjJfUEFDS0FHRV9aTElCCgphbHNvLCBjb3VsZCB5b3U6CgogKDEpIFZlcmlmeSB0
aGF0IGl0IGJ1aWxkcyB3aXRoIHRoZSBiYXNpYyBPcGVuU1NMIG9wdGlvbnMsIGkuZSBhZnRlcgog
ICAgIGRpc2FibGluZyBhbGwgb3BlbnNzbCBzdWItb3B0aW9ucyA/CgogKDIpIFZlcmlmeSB0aGF0
IGl0IGJ1aWxkcyB3aXRoIGxpYnJlc3NsID8KCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZmlybXdh
cmUtdXRpbHMvQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL2Zpcm13YXJlLXV0aWxzL0NvbmZpZy5p
bi5ob3N0Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5jZGM3YjZl
Nzc1Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvZmlybXdhcmUtdXRpbHMvQ29uZmln
LmluLmhvc3QKPiBAQCAtMCwwICsxLDkgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfRklS
TVdBUkVfVVRJTFMKPiArCWJvb2wgImhvc3QgZmlybXdhcmUtdXRpbHMiCgpOb3RlOiBkbyAqbm90
KiBhZGQgYW55ICJzZWxlY3QiIGhlcmUuCgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2Zpcm13YXJl
LXV0aWxzL2Zpcm13YXJlLXV0aWxzLm1rIGIvcGFja2FnZS9maXJtd2FyZS11dGlscy9maXJtd2Fy
ZS11dGlscy5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNWEz
NWQxYjg5OAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2Zpcm13YXJlLXV0aWxzL2Zp
cm13YXJlLXV0aWxzLm1rCj4gQEAgLTAsMCArMSwzNSBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+ICsjCj4gKyMgZmlybXdhcmUtdXRpbHMKPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+ICsKPiArRklSTVdBUkVfVVRJTFNfVkVSU0lPTiA9IGUzODUzMTQ5ZmIxOGRmYTU1ZjEw
YzEwYzlhYWY5OWMzMjk3NDczNjUKPiArRklSTVdBUkVfVVRJTFNfU0lURSA9IGdpdDovL2dpdC5v
cGVud3J0Lm9yZy9wcm9qZWN0L2Zpcm13YXJlLXV0aWxzLmdpdAo+ICtGSVJNV0FSRV9VVElMU19M
SUNFTlNFID0gXAo+ICsJQlNELTItQ2xhdXNlICh0cGxpbmstc2FmZWxvYWRlciksIFwKPiArCUJT
RC0zLUNsYXVzZSAoc2VhbWEpLCBcCj4gKwlHUEwtMi4wIChhZGRfaGVhZGVyLCBiY21hbGdvLCBi
dWZmYWxvLWVuYywgYnVmZmFsby1saWIsIGJ1ZmZhbG8tdGFnLCBcCj4gKwkJIGJ1ZmZhbG8tdGZ0
cCwgZGdmaXJtd2FyZSwgZG5zMzEzLWhlYWRlciwgZWRpbWF4X2Z3X2hlYWRlciwgXAo+ICsJCSBm
aXgtdS1tZWRpYS1oZWFkZXIsIGhjc21ha2VpbWFnZSwgbWticm5jbWRsaW5lLCBta2JybmltZywg
XAo+ICsJCSBta2J1ZmZhbG9pbWcsIG1rY2FtZW9mdywgbWtjYXNmdywgbWtkYXBpbWcsIG1rZGFw
aW1nMiwgXAo+ICsJCSBta2RocGltZywgbWtkbmlpbWcsIG1raGlsaW5rZncsIG1rbWVyYWtpZnct
b2xkLCBta21lcmFraWZ3LCBcCj4gKwkJIG1rcGxhbmV4ZncsIG1rcG9yYXlmdywgbWtyYXNpbWFn
ZSwgbWtydG41NnVpbWcsIG1rc2VuYW9mdywgXAo+ICsJCSBta3NlcmNvbW1mdywgbWt0aXRhbmlt
ZywgbWt0cGxpbmtmdy1saWIsIG1rdHBsaW5rZncsIFwKPiArCQkgbWt0cGxpbmtmdzIsIG1rd3Jn
Z2ltZywgbWt3cmdpbWcsIG1remNmdywgbWt6eW5mdywgXAo+ICsJCSBvc2JyaWRnZS1jcmMsIHBj
MWNyeXB0LCBzcmVjMmJpbiwgdHJ4MmVkaXBzLCB1aW1hZ2VfcGFkaGRyLCBcCj4gKwkJIHdydDQw
MG4sIHp5aW1hZ2UsIHp5dHJ4KSwgXAo+ICsJR1BMLTIuMCsgKGFkZHBhdHRlcm4sIGFzdXN0cngs
IGJjbTQ5MDhhc3VzLCBiY200OTA4a2VybmVsLCBkZ24zNTAwc3VtLCBcCj4gKwkJICBlbmNvZGVf
Y3JjLCBqY2dpbWFnZSwgbHptYTJldmEsIG1ha2VhbWl0YmluLCBta2Noa2ltZywgXAo+ICsJCSAg
bWtjc3lzaW1nLCBta2RsaW5rZnctbGliLCBta2RsaW5rZncsIG1rZWRpbWF4aW1nLCBta2Z3aW1h
Z2UsIFwKPiArCQkgIG1rZndpbWFnZTIsIG1raGVhZGVyX2dlbXRlaywgbWtteWxvZncsIG1vdG9y
b2xhLWJpbiwgXAo+ICsJCSAgbmVjLWVuYywgb3NlYW1hLCBvdHJ4LCBwdGdlbiwgc2lnbl9kbGlu
a19ydSwgc3B3MzAzdiwgdHJ4LCBcCj4gKwkJICB4b3JpbWFnZSwgenl4YmNtKSwgXAo+ICsJR1BM
LTIuMCBPUiBHUEwtMy4wIChuYW5kX2VjYyksIFwKPiArCUdQTC0yLjArIE9SIE1JVCAobHhsZncp
LCBcCj4gKwlVTktOT1dOIChpbWFnZXRhZywgdHJ4MnVzcikKCj4gK0ZJUk1XQVJFX1VUSUxTX0RF
UEVOREVOQ0lFUyA9IGxpYm9wZW5zc2wgemxpYgoKVXNlICJvcGVuc3NsIiBpbnN0ZWFkIG9mICJs
aWJvcGVuc3NsIi4KCj4gK0hPU1RfRklSTVdBUkVfVVRJTFNfREVQRU5ERU5DSUVTID0gaG9zdC1s
aWJvcGVuc3NsIGhvc3QtemxpYgoKVXNlICJob3N0LW9wZW5zc2wiIGluc3RlYWQgb2YgImhvc3Qt
bGlib3BlbnNzbCIuCgpUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmks
IGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3li
b3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
