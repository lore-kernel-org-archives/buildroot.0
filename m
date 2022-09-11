Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C09C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 18:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D01F340C15;
	Sun, 11 Sep 2022 18:17:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D01F340C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rDxO8KX0Mrox; Sun, 11 Sep 2022 18:17:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 036FE403F8;
	Sun, 11 Sep 2022 18:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 036FE403F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F9271BF3EB
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 18:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B13484582
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 18:17:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B13484582
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TSxAhPP78lzK for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 18:17:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5366884540
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5366884540
 for <buildroot@busybox.net>; Sun, 11 Sep 2022 18:17:00 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:41d6:744a:8631:c709])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8A7CC13F8AF;
 Sun, 11 Sep 2022 20:16:53 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Sep 2022 20:16:53 +0200
Date: Sun, 11 Sep 2022 20:16:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220911181653.GA898622@scaer>
References: <20220911162550.2257072-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220911162550.2257072-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662920216;
 bh=Jm4rSkEt42HNv5mOSC7m+ly2Uod85vMMclsWfEEEciQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oE0JONkpnnwzUUICZ85LBSISLp3QuZJp6yKbKqrebHzbTc626OSVKBLkksJAqVfN5
 t37eEEZtPZ94doc8lU7Zk5QVMd1kjRIy7Fa2gQnanpAv/qwfXVYwockHlWD55hxpW3
 XCIwhBxwc024e196Oz/z91VRUx+mhP1pPK4xEyuR39FVPRoG0iyUXVGFfYlMdWgiIV
 9VA4LVtkfNBYenCdQAOeeuPIOPaaYaigkHIlI5Sc4+3eiKmgbpt1NxljT8EJRgK/VO
 y6lY89HDof/34mvQq53PEXeL+ic9aPvEcFtHfu4qOk7duewmpJZVnDOfMZ2wqOF3iq
 cQjED4ORFwgtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oE0JONkp
Subject: Re: [Buildroot] [PATCH] package/luarocks: use two spaces
 indentation in hash file
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

RmFuw6dvaXMsIEFsbCwKCk9uIDIwMjItMDktMTEgMTg6MjUgKzAyMDAsIEZyYW5jb2lzIFBlcnJh
ZCBzcGFrZSB0aHVzbHk6Cj4gU2lnbmVkLW9mZi1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29p
cy5wZXJyYWRAZ2Fkei5vcmc+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVnYXJkcywK
WWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIHBhY2thZ2UvbHVhcm9ja3MvYnVpbGRyb290Lmx1YSB8
IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2x1YXJvY2tzL2J1aWxkcm9vdC5sdWEgYi9wYWNr
YWdlL2x1YXJvY2tzL2J1aWxkcm9vdC5sdWEKPiBpbmRleCAyZDE2MGYwMmIuLjNjMDQ0ZDg5YiAx
MDA2NDQKPiAtLS0gYS9wYWNrYWdlL2x1YXJvY2tzL2J1aWxkcm9vdC5sdWEKPiArKysgYi9wYWNr
YWdlL2x1YXJvY2tzL2J1aWxkcm9vdC5sdWEKPiBAQCAtMjY1LDEwICsyNjUsMTAgQEAgbG9jYWwg
ZnVuY3Rpb24gZ2VuZXJhdGVfaGFzaCAocm9ja3NwZWMsIGxjbmFtZSwgcm9ja19maWxlLCBsaWNl
bnNlcywgZGlnZXN0KQo+ICAgICBsb2NhbCBmID0gYXNzZXJ0KGlvLm9wZW4oZm5hbWUsICd3Jykp
Cj4gICAgIHV0aWwucHJpbnRvdXQoJ3dyaXRlICcgLi4gZm5hbWUpCj4gICAgIGY6d3JpdGUoJyMg
Y29tcHV0ZWQgYnkgbHVhcm9ja3MvYnVpbGRyb290XG4nKQo+IC0gICBmOndyaXRlKCdzaGEyNTYg
JyAuLiBkaWdlc3Rbcm9ja19maWxlXSAuLiAnICAnIC4uIHJvY2tfZmlsZSAuLiAnXG4nKQo+ICsg
ICBmOndyaXRlKCdzaGEyNTYgICcgLi4gZGlnZXN0W3JvY2tfZmlsZV0gLi4gJyAgJyAuLiByb2Nr
X2ZpbGUgLi4gJ1xuJykKPiAgICAgZm9yIGkgPSAxLCAjbGljZW5zZXMgZG8KPiAgICAgICAgbG9j
YWwgZmlsZSA9IGxpY2Vuc2VzW2ldCj4gLSAgICAgIGY6d3JpdGUoJ3NoYTI1NiAnIC4uIGRpZ2Vz
dFtmaWxlXSAuLiAnICAnIC4uIHN1YmRpciAuLiAnLycgLi4gZmlsZSAuLiAnXG4nKQo+ICsgICAg
ICBmOndyaXRlKCdzaGEyNTYgICcgLi4gZGlnZXN0W2ZpbGVdIC4uICcgICcgLi4gc3ViZGlyIC4u
ICcvJyAuLiBmaWxlIC4uICdcbicpCj4gICAgIGVuZAo+ICAgICBmOmNsb3NlKCkKPiAgZW5kCj4g
LS0gCj4gMi4zNC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwt
VGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAp8
ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAgICAg
fCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0tLi0t
LS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6Ly95
bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBj
b25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1eLS0t
LS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
