Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28036C001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 19:13:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 368636059C;
	Thu, 10 Aug 2023 19:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 368636059C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SHVF_JyI3Nfk; Thu, 10 Aug 2023 19:13:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6478A61037;
	Thu, 10 Aug 2023 19:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6478A61037
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E43EE1BF5A6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBCCC417D3
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 19:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBCCC417D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKwlEAroxOPb for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 19:13:16 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40D59417BF
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 19:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40D59417BF
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9c21:609:a9c4:c6b1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 38D73780372;
 Thu, 10 Aug 2023 21:13:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 10 Aug 2023 21:13:10 +0200
Date: Thu, 10 Aug 2023 21:13:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nicolas Boichat <drinkcat@google.com>
Message-ID: <20230810191310.GI421096@scaer>
References: <cover.1691616286.git.yann.morin.1998@free.fr>
 <c9a96063bdc257e07f5288c68d017c9a7d9ac14c.1691616286.git.yann.morin.1998@free.fr>
 <CAHRZCZVN4W6d_GEeMxjv36oyQ=Edp5dzoGhyojAxT0gGt9R8UA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHRZCZVN4W6d_GEeMxjv36oyQ=Edp5dzoGhyojAxT0gGt9R8UA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691694793;
 bh=RDht5xgAJyb83ewrMgdbe3gxzunxrX8mfJLVudlZ8V0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OGjbdE9nuiTeKjXo5B6wsIo7xmvWex9MsukCgaiQ4CtVIL16u6D6KzZ7rA0culVSK
 7DTwjzPt1EY/jMTJ52hsFGIE4X9s6epJZ8RlTeRe/Dji93SJjs+BBNFwiwZut6jZUR
 0NWm6/RryWD73ym7rfOKAFl7FJHi2KSWr6xG7MgqHLv48pRnwlnc6UjZNBvhmTyDbr
 0NsHgamhNDgjjrZykzP3JW/F0+TBrezG9ujqAyH+U1UaTnELBOPAX2bswFirdqMcF4
 fP/x/TUwPXqCcQ5p4agZ/buJbXR8elwHukAIbTWHIt/cF4/At1Vrani8HdHOnDaHt5
 3atvI1AXrCafQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OGjbdE9n
Subject: Re: [Buildroot] [PATCH 3/5] utils/docker-run: bind mount
 .git/objects if needed
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tmljb2xhcywgQWxsLAoKT24gMjAyMy0wOC0xMCAwODoyMyArMDgwMCwgTmljb2xhcyBCb2ljaGF0
IHZpYSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IE9uIFRodSwgQXVnIDEwLCAyMDIzIGF0IDU6
MjTigK9BTSBZYW5uIEUuIE1PUklOIDwgWzFdeWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3Rl
Ogo+ICAgRnJvbTogTmljb2xhcyBCb2ljaGF0IDwgWzJdZHJpbmtjYXRAZ29vZ2xlLmNvbT4KPiAK
PiAgIElmIGJ1aWxkcm9vdCBpcyBjaGVja2VkIG91dCBhcyBwYXJ0IG9mIGEgJ3JlcG8nIG1hbmlm
ZXN0LCBkb2NrZXItcnVuCj4gICBkb2Vzbid0IGZ1bGx5IGJpbmQgbW91bnQgdGhlIC5naXQgZGly
ZWN0b3J5LCBsZWFkaW5nIHRvIGNvbW1hbmRzIHN1Y2gKPiAgIGFzIGB1dGlscy9kb2NrZXItcnVu
IG1ha2UgY2hlY2stcGFja2FnZWAgdG8gZmFpbC4KPiAKPiAgIFNpZ25lZC1vZmYtYnk6IE5pY29s
YXMgQm9pY2hhdCA8IFszXWRyaW5rY2F0QGdvb2dsZS5jb20+Cj4gICBbIFs0XXlhbm4ubW9yaW4u
MTk5OEBmcmVlLmZyOiB1c2UgbmV3bHkgaW50cm9kdWNlZCBtb3VudHBvaW50cyBsaXN0XQo+ICAg
U2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8IFs1XXlhbm4ubW9yaW4uMTk5OEBmcmVlLmZy
Pgo+ICAgLS0tCj4gICDCoHV0aWxzL2RvY2tlci1ydW4gfCA2ICsrKysrKwo+ICAgwqAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gCj4gICBkaWZmIC0tZ2l0IGEvdXRpbHMvZG9ja2Vy
LXJ1biBiL3V0aWxzL2RvY2tlci1ydW4KPiAgIGluZGV4IDdiMjdhOWIwNWMuLmZmOTAzYjk2ZTkg
MTAwNzU1Cj4gICAtLS0gYS91dGlscy9kb2NrZXItcnVuCj4gICArKysgYi91dGlscy9kb2NrZXIt
cnVuCj4gICBAQCAtMzMsNiArMzMsMTIgQEAgaWYgWyAiJHtHSVRfRElSfSIgXTsgdGhlbgo+ICAg
wqAgwqAgwqAjIHBhdGggYWxyZWFkeSAoaW4gYSB3b3JkaXIpLCB0aGVuIHRoYXQncyBhIG5vb3Au
Cj4gICDCoCDCoCDCoEdJVF9ESVI9IiQoY2QgIiR7TUFJTl9ESVJ9IjsgcmVhZGxpbmsgLWUgIiR7
R0lUX0RJUn0iKSIKPiAgIMKgIMKgIMKgbW91bnRwb2ludHMrPSggIiR7R0lUX0RJUn0iICkKPiAg
ICsKPiAgICvCoCDCoCAjICdyZXBvJyBzdG9yZXMgLmdpdC9vYmplY3RzIHNlcGFyYXRlbHkuCj4g
ICArwqAgwqAgaWYgWyAtTCAiJHtHSVRfRElSfS9vYmplY3RzIiBdOyB0aGVuCj4gICArwqAgwqAg
wqAgwqAgT0JKRUNUU19ESVI9IiQoY2QgIiR7TUFJTl9ESVJ9IjsgcmVhZGxpbmsgLWUgIiR7R0lU
X0RJUn0vb2JqZWN0cyIpIgo+IAo+IEkgaW50ZW50aW9uYWxseSByZW1vdmVkIGBjZCAiJHtNQUlO
X0RJUn0iYCBpbiBteSBwYXRjaCwgYXMgJHtHSVRfRElSfQo+IGhhcyBhbHJlYWR5IGJlZW4gbWFk
ZSBhbiBhYnNvbHV0ZSBwYXRoLCBqdXN0IGFib3ZlLCBzbyB0aGUgY2QKPiBvcGVyYXRpb24gaXMg
dW5uZWNlc3NhcnkuCgpUaGF0J3MgcmlnaHQuIEJ1dCBmb3Igc3ltZXRyeSwgSSBwcmVmZXJyZWQg
dG8gdXNlIHRoZSBzYW1lIGNvbnN0cnVjdC4KVHJ1ZSwgdGhhdCdzIHN1cGVyZmx1b3VzLCBidXQg
YXQgbGVhc3Qgd2UgZG9uO3QgaGF2ZSB0byB0aGluayB0b28gaGFyZAphYm91dCBpdCB3aGVuIHdl
IGxvb2sgYXQgdGhlIGNvZGUuCgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjazsgSSBzaG91bGQgcHJv
YmFibHkgaGF2ZSBtZW50aW9uZWQgdGhhdCBpbiB0aGUKY29tbWl0IGxvZy4KClJlZ2FyZHMsCllh
bm4gRS4gTU9SSU4uCgo+ICAgK8KgIMKgIMKgIMKgIG1vdW50cG9pbnRzKz0oICIke09CSkVDVFNf
RElSfSIgKQo+IAo+IE90aGVyd2lzZSwgdGhhdCdzIGEgbmljZSBjbGVhbnVwICwtKQo+IFRoYW5r
cyEKPiDCoAo+IAo+ICAgK8KgIMKgIGZpCj4gICDCoGZpCj4gCj4gICDCoGlmIFsgIiR7QlIyX0RM
X0RJUn0iIF07IHRoZW4KPiAgIC0tCj4gICAyLjI1LjEKPiAKPiBMaW5rczoKPiAxLiBtYWlsdG86
eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnIKPiAyLiBtYWlsdG86ZHJpbmtjYXRAZ29vZ2xlLmNvbQo+
IDMuIG1haWx0bzpkcmlua2NhdEBnb29nbGUuY29tCj4gNC4gbWFpbHRvOnlhbm4ubW9yaW4uMTk5
OEBmcmVlLmZyCj4gNS4gbWFpbHRvOnlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyCgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxp
bmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJ
IFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdh
cmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cnwg
KzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8
ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8v
KlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
