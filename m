Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CD4C4321E
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 17:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D8B1403E5;
	Sun,  4 Dec 2022 17:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D8B1403E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ne6K8KwU8VXj; Sun,  4 Dec 2022 17:35:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F0C44013B;
	Sun,  4 Dec 2022 17:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F0C44013B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 439791BF2F5
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 17:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BC2481348
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 17:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BC2481348
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7VXfTB0GZfaF for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 17:35:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0F7F81343
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C0F7F81343
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 17:35:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d5da:276a:18d1:4753])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 09AAE2003B4;
 Sun,  4 Dec 2022 18:35:24 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Dec 2022 18:35:24 +0100
Date: Sun, 4 Dec 2022 18:35:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Patrick Gerber <pge@ik.me>
Message-ID: <20221204173524.GA2855@scaer>
References: <20221204140643.893075-1-pge@ik.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221204140643.893075-1-pge@ik.me>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670175327;
 bh=JDBVtof5VOJVEb9Sr188CcH2CxoIVzmGVRV9Qf0BHK0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZyDx0lqOv0eVP3M0CsbgKYxSHXqPF2v4RCGZ0r2VeGdX4i+BR557kSi4GY3u4epiH
 F+BTjoskr31aDq4PYu0FEdxeu31raFkUyJQiHPsC6jZeMCMuJ7eXusJkmu5sT1yVZV
 N5BnrNE4h2W8RlWk9bSgnwaBwbTZPADnnX/g5gr+n7OA26C5zKlFNB7pq36Im+2CT6
 IKKQH2phQWoAzfp6mIGdHuZzYZvzvKdJy7J9oSvqh1cbmHqbp1zV7bJtlMuz3WmT0C
 j8O7QL6cVf3fu1rTiXMnD+e3OGW67NfsouLaF7rZk1r8JdsrKNw1G5xlBerpK4Vdh9
 D6GbyQMXAtmtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZyDx0lqO
Subject: Re: [Buildroot] [PATCH 1/2] package/pkg-golang: enable pkg specific
 go env also for download step
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

UGF0cmljaywgQWxsLAoKVGhhbmtzIGZvciB0aGlzIHJlc3Bpbi4gOi0pCgpPbiAyMDIyLTEyLTA0
IDE1OjA2ICswMTAwLCBQYXRyaWNrIEdlcmJlciBzcGFrZSB0aHVzbHk6Cj4gQ3VycmVudGx5IHBh
Y2thZ2Ugc2VjaWZpYyBnbyBlbnYgaXMgdXNlZCBvbmx5IGR1cmluZyBwYWNrYWdlIGJ1aWxkIHN0
ZXAuCj4gCj4gR28gdmVuZGVyaW5nIGlzIGRvbmUgZHVyaW5nIHRoZSBkb3dubG9hZCBzdGVwIGFu
ZCBpdCdzIHNvbWV0aW1lcyByZXF1aXJlZAo+IHRvIHNwZWNpZnkgcGFja2FnZSBzZWNpZmljIGdv
IGVudiBhbHNvIGZvciB0aGlzIHN0ZXAuCj4gCj4gRm9yIGV4YW1wbGUsIHdoZW4gaW1wb3J0aW5n
IGN1c3RvbSBnbyBtb2R1bGVzIHdobyBhcmUgaG9zdGVkIG9uIGEgcHJpdmF0ZQo+IGhvc3QsIGl0
4oCZcyByZXF1aXJlZCB0byBzZXQgR09QUklWQVRFIHRvIGF2b2lkIHB1YmxpYyBzdW0gY2hlY2tp
bmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBHZXJiZXIgPHBnZUBpay5tZT4KPiAtLS0K
PiAgcGFja2FnZS9wa2ctZ29sYW5nLm1rIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy1n
b2xhbmcubWsgYi9wYWNrYWdlL3BrZy1nb2xhbmcubWsKPiBpbmRleCAwYjNkYzNkMzJmLi5jZGM2
N2IzMmMwIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcGtnLWdvbGFuZy5tawo+ICsrKyBiL3BhY2th
Z2UvcGtnLWdvbGFuZy5tawo+IEBAIC04Nyw3ICs4Nyw4IEBAICQoMilfUE9TVF9QQVRDSF9IT09L
UyArPSAkKDIpX0dFTl9HT01PRAo+ICAkKDIpX0RPV05MT0FEX1BPU1RfUFJPQ0VTUyA9IGdvCj4g
ICQoMilfRExfRU5WICs9IFwKPiAgCSQkKEhPU1RfR09fQ09NTU9OX0VOVikgXAo+IC0JR09QUk9Y
WT1kaXJlY3QKPiArCUdPUFJPWFk9ZGlyZWN0IFwKPiArCSQkKCQoMilfR09fRU5WKQoKQXMgeW91
IGNhbiBzZWUsIHRoZSBwa2ctZ29sYW5nIGluZnJhIGV4dGVuZHMgJCgyKV9ETF9FTlYsIHNvIHlv
dSBjYW4KYWxyZWFkeSBhY2hpZXZlIHdoYXQgeW91IHdhbnQgYnkgYWRkaW5nIHRoZSBmb2xsb3dp
bmcgdG8geW91ciBwYWNrYWdlOgogICAgRk9PX0RMX0VOViA9IEdPUFJJVkFURT1ibGFibGFibGEK
Cm9yIGV2ZW46CiAgICBGT09fR09fRU5WID0gR09QUklWQVRFPWJsYWJsYWJsYQogICAgRk9PX0RM
X0VOViA9ICQoRk9PX0dPX0VOVikKCkFsc28sIHdoYXQgd2FzIHByb2JhYmx5IG5vdCB2ZXJ5IGNs
ZWFyIGluIG15IHByZXZpb3VzIHJldmlldywgaXMgdGhlCmNvbmNlcm4gd2hldGhlciB3ZSBjYW4g
aGF2ZSBzb21lIHBhY2thZ2UgdGhhdCBzZXQgRk9PX0dPX0VOViB0bwpzb21ldGhpbmcgdGhhdCB3
b3VsZCBicmVhayB0aGUgZG93bmxvYWQgc3RlcC4KClNvIEkgaGFkIGEgbG9vayBhdCB0aGUgb2Zm
aWNpYWwgZG9jdW1lbnRhdGlvbiBmb3IgZ2VuZXJpYyBlbnZpcm9ubWVudAp2YXJpYWJsZXMgdGhh
dCBhcHBseSB0byB0aGUgZ28gY29tbWFuZCBbMF07IEkgY291bGQgbm90IHNwb3QgYSBnZW5lcmlj
CnZhcmlhYmxlIHRoYXQgd291bGQgb2J2aW91c2x5IGhhdmUgYW4gaW1wYWN0IG9uIGRvd25sb2Fk
cywgdW5sZXNzIGFsc28KbGlzdGVkIGFzIHRob3NlIHRoYXQganVzdCBhcHBseSB0byB0aGUgZ28t
bW9kIGNvbW1hbmQgWzFdLgoKSXQgdGh1cyBsb29rcyBsaWtlIHRoZSBjb3JyZWN0IGJlaGF2aW91
ciB0byB1c2UgdGhlIGJ1aWxkIGVudmlyb25tZW50CnZhcmlhYmxlcyBkdXJpbmcgaHRlIGRvd25s
b2FkLiBTdGlsbCwgSSB3YXMgbm90IHN1cmUgdGhpcyB3YXMgbWF0ZXJpYWwKZm9yIHRoZSBtYXN0
ZXIgYnJhbmNoLCBzbyBJIGFwcGxpZWQgdG8gbmV4dC4gVGhhbmtzIQoKWzBdIGh0dHBzOi8vcGtn
LmdvLmRldi9jbWQvZ28jaGRyLUVudmlyb25tZW50X3ZhcmlhYmxlcwpbMV0gaHR0cHM6Ly9nby5k
ZXYvcmVmL21vZCNlbnZpcm9ubWVudC12YXJpYWJsZXMKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4u
Cgo+ICAjIER1ZSB0byB2ZW5kb3JpbmcsIGl0IGlzIHByZXR0eSBsaWtlbHkgdGhhdCBub3QgYWxs
IGxpY2Vuc2VzIGFyZQo+ICAjIGxpc3RlZCBpbiA8cGtnPl9MSUNFTlNFLgo+IC0tIAo+IDIuMjUu
MQo+IAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVh
bC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8
CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAg
ICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0u
LS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDov
L3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAg
IGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
