Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D21C77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 15:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C6A28224A;
	Sat,  6 May 2023 15:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C6A28224A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EWNAjlf0vuFY; Sat,  6 May 2023 15:16:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 680E383CE3;
	Sat,  6 May 2023 15:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 680E383CE3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 20BD51BF36C
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE3DC401B7
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE3DC401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LYurGUI7RtGJ for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 15:16:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17B4E400E5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17B4E400E5
 for <buildroot@buildroot.org>; Sat,  6 May 2023 15:16:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2F405B0055A;
 Sat,  6 May 2023 17:16:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 17:16:01 +0200
Date: Sat, 6 May 2023 17:16:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20230506151601.GA252090@scaer>
References: <87o7mz4amx.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o7mz4amx.fsf@tarshish>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683386164;
 bh=A1BMWwsbsrcP/rmobY0dA4/mqxCyvDpxLmFdODB9EOo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BnnwivqbyxO6gLTflivByyWGJyYfhKAItl4ik1v8BtJPAfYMszhm32zH7Yqrw87v9
 5NqkdTkAkGOi/bFk7kIFBFapbBbmvjq8XQx//5pN6AkFxmzjipjzutVKiduv3g+rSP
 CGBqFPUiL+3NFPgU24qwrJ0QL2Om926GrbmzFMonXhQd+VIcJhq0R/MWw/hirSD//9
 fzDxNzWWWBZnAL1xclIMCrlnjFE1dk0A52b+AzDjzrNx+uYT+0XAOUBv8xZycy0Bj3
 XyQwcR6J89K5OZRKylkFqKGgV9oAT5YyGYQNsiVYkHx8xIR3U8oE4TE8qjBxTqxDz/
 hfHsD3V73N7Ag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Bnnwivqb
Subject: Re: [Buildroot] List of trivial old patches
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

QmFydWNoLCBBbGwsCgpPbiAyMDIzLTA1LTA1IDA4OjE3ICswMzAwLCBCYXJ1Y2ggU2lhY2ggdmlh
IGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gSGVyZSBpcyBhIGxpc3Qgb2Ygb3ZlciBtb250aCBv
bGQgcGF0Y2h3b3JrIGVudHJpZXMgdGhhdCBsb29rIGxpa2UKPiB0cml2aWFsIHZlcnNpb24gYnVt
cHMsIG9yIHVwc3RyZWFtIGJhY2twb3J0cy4KPiBUaGVyZSBhcmUgYSBsb3QgbW9yZS4gU28gaWYg
eW91IGZpbmQgdGhpcyBsaXN0IHVzZWZ1bCwgSSdsbCBkaWcgdXAgbW9yZQo+IHBhdGNoZXMuCgpJ
IGJsaW5kbHkgYXBwbGllZCB0aGUgcGF0Y2hlcywgb24gdGhlIGFzc3VtcHRpb24geW91IGRpZCBh
Y3R1YWxseSByZXZpZXcKdGhlbSBiZWZvcmUgYWRkaW5nIHRoZW0gdG8gdGhlIGxpc3QsIHdoaWNo
IHdhcyBuZWl0aGVyIHRvbyBzaG9ydCBub3IgdG9vCmxvbmcsIHNvIGl0IHdhcyBwcmV0dHkgbXVj
aCBtYW5hZ2VhYmxlLCBzbyB5ZXMsIHRoYXQgd2FzIHVzZWZ1bC4gVGhhbmtzIQoKV2hhdCB3b3Vs
ZCBiZSBldmVuIG1vcmUgdXNlZnVsIChhbmQgdGhpcyBpcyB2YWxpZCBmb3IgZXZlcnlvbmUpIGlz
IHRvCnJldmlldyBjb21wbGV4IHBhdGNoZXMgdG9vLCBiZWNhdXNlIHRob3NlIGFyZSB0aGUgb25l
cyB0aGF0IHRha2UgbW9yZQp0aW1lICh2ZXJzaW9uIGJ1bXBzIGFyZSBpbmRlZWQgdHJpdmlhbCBh
bmQgc2VsZG9tIGdldCBhIHNlY29uZCB0aG91Z2h0CmZyb20gbXkgcGFydCkuCgpBbnl3YXksIHRo
YW5rcyBmb3IgdGhlIGVmZm9ydCwgYW5kIGlmIHlvdSBzZW5kIGFub3RoZXIgbGlzdCwgdGhpcyBs
ZW5ndGgKYW5kIGNvbnRlbnQgaXMgbmljZS4g8J+RjQoKVGhhbmtzIQoKUmVnYXJkcywKWWFubiBF
LiBNT1JJTi4KCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8
IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFj
eTogfAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlH
TiAgICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0t
LS0tLi0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0
dHA6Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAg
IHYgICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
