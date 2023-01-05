Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C988FC3DA7A
	for <buildroot@archiver.kernel.org>; Thu,  5 Jan 2023 13:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E15381FAF;
	Thu,  5 Jan 2023 13:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E15381FAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EARWCI6ksaQ1; Thu,  5 Jan 2023 13:37:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B74981CAF;
	Thu,  5 Jan 2023 13:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B74981CAF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 725571BF409
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 13:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D9C94012D
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 13:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D9C94012D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6E5D8u3nbBPc for <buildroot@lists.busybox.net>;
 Thu,  5 Jan 2023 13:37:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1686740125
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1686740125
 for <buildroot@buildroot.org>; Thu,  5 Jan 2023 13:37:43 +0000 (UTC)
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <martin@geanix.com>)
 id 1pDQRC-0001V7-0f; Thu, 05 Jan 2023 14:37:42 +0100
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <martin@geanix.com>)
 id 1pDQRB-000Vlr-RG; Thu, 05 Jan 2023 14:37:41 +0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: buildroot@buildroot.org
Date: Thu,  5 Jan 2023 14:37:38 +0100
Message-Id: <20230105133738.751495-1-martin@geanix.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.7/26772/Thu Jan  5 10:42:43 2023)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=fnaJ+xbNL1+KbBHIleRf7WuA2fJqpoQOz6IW/iw3c2E=; b=ZAW+zcztAlhKrLzYfW29PFm4RE
 NGDQa0C97/4av4WGsyqesibdI5dlGiUHLNQiZSPWwk46muIklPXR0SSkpnn6f6Vnn3s9IS5vrcTPu
 UkbR8/zkQHuJ2aXQTUz9OJIlsymAy0/Y7Nnd34Bl5tfHQpQ1eYRoq3po+r7tl8hHtBUQLHKItQTS1
 lzCDAVrd4qW9JtyGXgZWnCo81MnjBDasEPFZTOVBeu3ZbMt9cg18AGSdExRuJOPgqQobTfE06I9ra
 HIVGhAA3EUAkszsVj9DlPpfkKmFkh80XEawRtONxhW/e4/nyZEHQXWi4CNSzrvnUWY7KJ58o9Js39
 Qxi7Af4w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com
 header.a=rsa-sha256 header.s=default2211 header.b=ZAW+zczt
Subject: [Buildroot] [PATCH] package/nginx-njs: new package
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QSBtb2R1bGUgZm9yIGV4dGVuZGluZyB0aGUgbmdpbnggc2VydmVyIGNvbmZpZ3VyYXRpb24gd2l0
aCBqYXZhc2NyaXB0Cm1vZHVsZXMuCgpTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gSHVuZGViw7hsbCA8
bWFydGluQGdlYW5peC5jb20+Ci0tLQogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAg
fCAgMSArCiBwYWNrYWdlL25naW54LW5qcy9Db25maWcuaW4gICAgICB8IDExICsrKysrKysrKysr
CiBwYWNrYWdlL25naW54LW5qcy9uZ2lueC1uanMuaGFzaCB8ICAzICsrKwogcGFja2FnZS9uZ2lu
eC1uanMvbmdpbngtbmpzLm1rICAgfCAxMyArKysrKysrKysrKysrCiBwYWNrYWdlL25naW54L25n
aW54Lm1rICAgICAgICAgICB8ICA1ICsrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlv
bnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL25naW54LW5qcy9Db25maWcuaW4KIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL25naW54LW5qcy9uZ2lueC1uanMuaGFzaAogY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvbmdpbngtbmpzL25naW54LW5qcy5tawoKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5kZXggOTk1ZGFlMmM1Ny4u
NTc3MTRhMjIxMCAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9D
b25maWcuaW4KQEAgLTIzNzAsNiArMjM3MCw3IEBAIG1lbnUgIkV4dGVybmFsIG5naW54IG1vZHVs
ZXMiCiAJc291cmNlICJwYWNrYWdlL25naW54LWRhdi1leHQvQ29uZmlnLmluIgogCXNvdXJjZSAi
cGFja2FnZS9uZ2lueC1tb2RzZWN1cml0eS9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL25n
aW54LW5heHNpL0NvbmZpZy5pbiIKKwlzb3VyY2UgInBhY2thZ2UvbmdpbngtbmpzL0NvbmZpZy5p
biIKIAlzb3VyY2UgInBhY2thZ2UvbmdpbngtdXBsb2FkL0NvbmZpZy5pbiIKIGVuZG1lbnUKIGVu
ZGlmCmRpZmYgLS1naXQgYS9wYWNrYWdlL25naW54LW5qcy9Db25maWcuaW4gYi9wYWNrYWdlL25n
aW54LW5qcy9Db25maWcuaW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4u
ZjE5ZjIwOTQ4MQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbmdpbngtbmpzL0NvbmZpZy5p
bgpAQCAtMCwwICsxLDExIEBACitjb25maWcgQlIyX1BBQ0tBR0VfTkdJTlhfTkpTCisJYm9vbCAi
bmdpbngtbmpzIgorCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTkdJTlhfSFRUUAorCXNlbGVjdCBC
UjJfUEFDS0FHRV9PUEVOU1NMCisJaGVscAorCSAgbmpzIGlzIGEgc3Vic2V0IG9mIHRoZSBKYXZh
U2NyaXB0IGxhbmd1YWdlIHRoYXQgYWxsb3dzCisJICBleHRlbmRpbmcgbmdpbnggZnVuY3Rpb25h
bGl0eS4gbmpzIGlzIGNyZWF0ZWQgaW4gY29tcGxpYW5jZQorCSAgd2l0aCBFQ01BU2NyaXB0IDUu
MSAoc3RyaWN0IG1vZGUpIHdpdGggc29tZSBFQ01BU2NyaXB0IDYKKwkgIGFuZCBsYXRlciBleHRl
bnNpb25zLgorCisJICBodHRwczovL2dpdGh1Yi5jb20vbmdpbngvbmpzCmRpZmYgLS1naXQgYS9w
YWNrYWdlL25naW54LW5qcy9uZ2lueC1uanMuaGFzaCBiL3BhY2thZ2UvbmdpbngtbmpzL25naW54
LW5qcy5oYXNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmQ0MDE1MzUw
YTEKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL25naW54LW5qcy9uZ2lueC1uanMuaGFzaApA
QCAtMCwwICsxLDMgQEAKKyMgTG9jYWxseSBDb21wdXRlZDoKK3NoYTI1NiAgOTJjYzQyNWQwYjA5
NTJiYjdlMmU3YTM5NmNiYTU4ZmViNGE5MGZiM2NiNjM0NDFjMjAxYWI0ZDNlMGNkNjQwMyAgbmdp
bngtbmpzLTAuNy45LnRhci5negorc2hhMjU2ICBmZjVjMzQzYmY2ZWY0NDQ3ZTRjOTkwMDY0MGM3
ZTRhMGEyODYyNDMzNzVlY2ExMWM2MTEzMTZmZjNmMjYzNTU5ICBMSUNFTlNFCmRpZmYgLS1naXQg
YS9wYWNrYWdlL25naW54LW5qcy9uZ2lueC1uanMubWsgYi9wYWNrYWdlL25naW54LW5qcy9uZ2lu
eC1uanMubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNjJmMWMxM2Fl
ZAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbmdpbngtbmpzL25naW54LW5qcy5tawpAQCAt
MCwwICsxLDEzIEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyBuZ2lueC1uanMKKyMK
KyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK05HSU5YX05KU19WRVJTSU9OID0gMC43LjkKK05H
SU5YX05KU19TSVRFID0gJChjYWxsIGdpdGh1YixuZ2lueCxuanMsJChOR0lOWF9OSlNfVkVSU0lP
TikpCitOR0lOWF9OSlNfTElDRU5TRSA9IEJTRC0yLUNsYXVzZQorTkdJTlhfTkpTX0xJQ0VOU0Vf
RklMRVMgPSBMSUNFTlNFCitOR0lOWF9OSlNfREVQRU5ERU5DSUVTID0gb3BlbnNzbAorCiskKGV2
YWwgJChnZW5lcmljLXBhY2thZ2UpKQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZ2lueC9uZ2lueC5t
ayBiL3BhY2thZ2UvbmdpbngvbmdpbngubWsKaW5kZXggNjJlYTM3OWZmYy4uY2IwYzA3OTcxMiAx
MDA2NDQKLS0tIGEvcGFja2FnZS9uZ2lueC9uZ2lueC5taworKysgYi9wYWNrYWdlL25naW54L25n
aW54Lm1rCkBAIC0yOTAsNiArMjkwLDExIEBAIE5HSU5YX0RFUEVOREVOQ0lFUyArPSBuZ2lueC1t
b2RzZWN1cml0eQogTkdJTlhfQ09ORl9PUFRTICs9IC0tYWRkLW1vZHVsZT0kKE5HSU5YX01PRFNF
Q1VSSVRZX0RJUikKIGVuZGlmCiAKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfTkdJTlhfTkpTKSx5KQor
TkdJTlhfQ09ORl9PUFRTICs9ICQoYWRkcHJlZml4IC0tYWRkLW1vZHVsZT0sJChOR0lOWF9OSlNf
RElSKS9uZ2lueCkKK05HSU5YX0RFUEVOREVOQ0lFUyArPSBuZ2lueC1uanMKK2VuZGlmCisKICMg
RGVidWcgbG9nZ2luZwogTkdJTlhfQ09ORl9PUFRTICs9ICQoaWYgJChCUjJfUEFDS0FHRV9OR0lO
WF9ERUJVRyksLS13aXRoLWRlYnVnKQogCi0tIAoyLjM5LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
