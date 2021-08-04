Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13412C432BE
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 22:02:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A35D061073
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 22:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A35D061073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 723B882C91;
	Wed,  4 Aug 2021 22:02:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jQdT-w94f-xd; Wed,  4 Aug 2021 22:02:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA9668267F;
	Wed,  4 Aug 2021 22:02:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98F681BF5DB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 22:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87E4A8267F
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 22:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RRkVNVdaNkvW for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 22:02:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D61581C44
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 22:02:01 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 3969DE0002;
 Wed,  4 Aug 2021 22:01:58 +0000 (UTC)
Date: Thu, 5 Aug 2021 00:01:56 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@essensium.com>
Message-ID: <20210805000156.157c0aa2@windsurf>
In-Reply-To: <20200207141629.31586-1-raphael.melotte@essensium.com>
References: <20200207141629.31586-1-raphael.melotte@essensium.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rsa: new package.
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gUmFwaGHDq2wsCgpBYm91dCAxLjUgeWVhcnMgYWZ0ZXIgeW91ciBwYXRjaCB3YXMgc2Vu
dCwgSSBmaW5hbGx5IGFwcGxpZWQgaXQgdG8gb3VyCm5leHQgYnJhbmNoLiBJIGRpZCBhIG51bWJl
ciBvZiBjaGFuZ2VzLCBzZWUgYmVsb3cuCgpPbiBGcmksICA3IEZlYiAyMDIwIDE1OjE2OjI4ICsw
MTAwClJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAZXNzZW5zaXVtLmNvbT4gd3Jv
dGU6Cgo+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IGQ4ZWEy
M2UwYjMuLmI0NzBlMzRjYzUgMTAwNjQ0Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVM
T1BFUlMKPiBAQCAtMjA3Niw2ICsyMDc2LDkgQEAgTjoJUmFodWwgSmFpbiA8cmFodWwuamFpbkBp
bWd0ZWMuY29tPgo+ICBGOglwYWNrYWdlL3VodHRwZC8KPiAgRjoJcGFja2FnZS91c3RyZWFtLXNz
bC8KPiAgCj4gK046ICBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQGVzc2Vuc2l1
bS5jb20+Cj4gK0Y6ICBwYWNrYWdlL3B5dGhvbi1yc2EvCgpUaGUgaW5kZW50YXRpb24gd2FzIG5v
dCBjb3JyZWN0IGhlcmUsIGFuZCBhbnl3YXkgeW91J3ZlIGhhZCBzZXZlcmFsCnBhY2thZ2VzIGFk
ZGVkIHNpbmNlIHRoZW4sIHNvIGl0IGRpZCBub3QgYXBwbHkgYXMtaXMsIGJ1dCB0aGF0J3Mgbm90
IGEKYmlnIGRlYWwuCgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1yc2EvQ29uZmlnLmlu
IGIvcGFja2FnZS9weXRob24tcnNhL0NvbmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
aW5kZXggMDAwMDAwMDAwMC4uYzAyNjAxMTA1Ygo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNr
YWdlL3B5dGhvbi1yc2EvQ29uZmlnLmluCj4gQEAgLTAsMCArMSwxMCBAQAo+ICtjb25maWcgQlIy
X1BBQ0tBR0VfUFlUSE9OX1JTQQo+ICsJYm9vbCAicHl0aG9uLXJzYSIKCkFzIEkndmUgdXBkYXRl
ZCB0byBhIG5ld2VyIHJlbGVhc2Ugb2YgcHl0aG9uLXJzYSwgd2hpY2ggaXMgUHl0aG9uIDMueApv
bmx5LCBJJ3ZlIGFkZGVkIGEgZGVwZW5kZW5jeSBvbiBCUjJfUEFDS0FHRV9QWVRIT04zLgoKPiAr
CXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fUFlBU04xCgpUaGlzIHNob3VsZCBoYXZlIGhhZCB0
aGUgYW5ub3RhdGlvbiAiIyBydW50aW1lIi4KCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9u
LXJzYS9weXRob24tcnNhLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi1yc2EvcHl0aG9uLXJzYS5oYXNo
Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5jOTNjMjI0M2ZiCj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXJzYS9weXRob24tcnNhLmhhc2gK
PiBAQCAtMCwwICsxLDYgQEAKPiArIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcv
cnNhL2pzb246Cj4gK21kNSAgOWY5YWY0MzNhMTY4NjhiNjE2ZmM2MDkyMTVlOTFkZGIgIHJzYS00
LjAudGFyLmd6Cj4gK3NoYTI1NiAgMWE4MzY0MDY0MDU3MzAxMjFhZTk4MjNlMTljNmU4MDZjNjJi
YmFkNzNmODkwNTc0ZmZmNTBlZmE0MTIyYzQ4NyAgcnNhLTQuMC50YXIuZ3oKCkhhdmluZyB0aGUg
bWQ1IGhhc2ggaXMgbm90IG5lZWRlZCB3aGVuIHdlIGhhdmUgdGhlIHNoYTI1Niwgc28gSSBrZXB0
Cm9ubHkgdGhlIHNoYTI2NS4KCj4gK1BZVEhPTl9SU0FfVkVSU0lPTiA9IDQuMAoKSSB1cGRhdGVk
IHRvIDQuNy4yCgo+ICtQWVRIT05fUlNBX1NPVVJDRSA9IHJzYS0kKFBZVEhPTl9SU0FfVkVSU0lP
TikudGFyLmd6Cj4gK1BZVEhPTl9SU0FfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVk
Lm9yZy9wYWNrYWdlcy9jYi9kMC84Zjk5YjkxNDMyYTYwY2E0YjFjZDQ3OGZkMGJkZjI4YzE5MDFj
NThlM2E5ZjE0ZjRiYTNkYmE4NmI1N2YKPiArUFlUSE9OX1JTQV9TRVRVUF9UWVBFID0gc2V0dXB0
b29scwo+ICtQWVRIT05fUlNBX0xJQ0VOU0UgPSBBUEFDSEUKClRoaXMgaXMgbm90IGEgdmFsaWQg
U1BEWCBjb2RlLiBUaGUgdmFsaWQgY29kZSBpcyBBcGFjaGUtMi4wLgoKPiArUFlUSE9OX1JTQV9M
SUNFTlNFX0ZJTEVTID0gTElDRU5TRQo+ICtQWVRIT05fUlNBX0RFUEVOREVOQ0lFUyA9IHB5dGhv
bi1weWFzbjEKClRoaXMgaXMgbm90IGEgYnVpbGQtdGltZSBkZXBlbmRlbmN5LCBvbmx5IGEgcnVu
dGltZSBvbmUsIHNvIEkgZHJvcHBlZAp0aGlzIGxpbmUuIEhhdmluZyB0aGUgInNlbGVjdCIgaW4g
dGhlIENvbmZpZy5pbiBmaWxlIGlzIGVub3VnaCBmb3IKcnVudGltZSBkZXBlbmRlbmNpZXMuCgpB
bHNvLCBJJ3ZlIGFkZGVkIGEgdGVzdCBjYXNlIGluIHN1cHBvcnQvdGVzdGluZy8gc28gdGhhdCBw
eXRob24tcnNhCmdldHMgcnVudGltZSB0ZXN0ZWQgaW4gb3VyIGluZnJhc3RydWN0dXJlLiBGZWVs
IGZyZWUgdG8gaGF2ZSBhIGxvb2sgYXQKdGhlIGZpbmFsIGNvbW1pdCBhdApodHRwczovL2dpdC5i
dWlsZHJvb3Qub3JnL2J1aWxkcm9vdC9jb21taXQvP2g9bmV4dCZpZD01OGM5OWM5NTdiMDAyYTlk
NmZhN2RlOGRmMjRjODdkZjM3OWM5ZmFmCnRvIHNlZSBob3cgdGhlIHRlc3QgY2FzZSBpcyBpbXBs
ZW1lbnRlZCwgaXQgY291bGQgYmUgdXNlZnVsIGZvciB5b3VyCmZ1dHVyZSBjb250cmlidXRpb25z
LgoKVGhhbmtzIGEgbG90LAoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBh
bmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0
cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRw
Oi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
