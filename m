Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E89C3DA7D
	for <buildroot@archiver.kernel.org>; Thu,  5 Jan 2023 13:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CB8240125;
	Thu,  5 Jan 2023 13:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CB8240125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OhKJKlTN0W6g; Thu,  5 Jan 2023 13:00:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63E0440C30;
	Thu,  5 Jan 2023 13:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63E0440C30
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 00BF61BF318
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 13:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D00FB60B44
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 13:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D00FB60B44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eOP7CJ5vxlie for <buildroot@lists.busybox.net>;
 Thu,  5 Jan 2023 13:00:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A34F260AEA
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A34F260AEA
 for <buildroot@buildroot.org>; Thu,  5 Jan 2023 13:00:23 +0000 (UTC)
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <martin@geanix.com>)
 id 1pDPr2-000LhO-L2; Thu, 05 Jan 2023 14:00:20 +0100
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <martin@geanix.com>)
 id 1pDPr2-00057W-Fk; Thu, 05 Jan 2023 14:00:20 +0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: buildroot@buildroot.org
Date: Thu,  5 Jan 2023 13:59:57 +0100
Message-Id: <20230105130000.682525-3-martin@geanix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105130000.682525-1-martin@geanix.com>
References: <20230105130000.682525-1-martin@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.7/26772/Thu Jan  5 10:42:43 2023)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=oodVSr+QzsOuSUueBXC4oRLw2d94nhl+enbaeuJEebA=; b=veXuFk9aQBtZG1rp8Kt6lknbdo
 J6HZG8rRWamPFRIB5sTr4v8rj+L4DEM0J18v3MSpwwAcTK0TiRRbPRbp4eDA8fhRLEit6Lv3mLL4i
 qgEiQIq1Yk5fwJZ5FmYUfOVyCkGC9JHyFWYLpomyaJfMP7mHFkI+71ve/G/F9XNDHQdWWB5MYiboa
 CdJalOy97KX7Q5nRKZweTWQGngAhn+ZeHeYGU6xiTh8c/ShKcjVsN8aqg/KkWa6z0mIEWnQcQrsyS
 GMb9C6yTkhsa6gFBu5ptyRYwTgHBA0sp5Le12fwkd2vLYoBmzEZLZQtp1kxl607/UQp40E2HUuIMO
 EixVvgNA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com
 header.a=rsa-sha256 header.s=default2211 header.b=veXuFk9a
Subject: [Buildroot] [PATCH 2/5] package/python-webargs: new package
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

d2ViYXJncyBpcyBhIGRlcGVuZGVuY3kgb2YgdG8tYmUtYWRkZWQgcHl0aG9uLWZsYXNrLXNtb3Jl
c3QuCgpTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gSHVuZGViw7hsbCA8bWFydGluQGdlYW5peC5jb20+
Ci0tLQogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwog
cGFja2FnZS9weXRob24td2ViYXJncy9Db25maWcuaW4gICAgICAgICAgIHwgMTEgKysrKysrKysr
KysKIHBhY2thZ2UvcHl0aG9uLXdlYmFyZ3MvcHl0aG9uLXdlYmFyZ3MuaGFzaCB8ICA1ICsrKysr
CiBwYWNrYWdlL3B5dGhvbi13ZWJhcmdzL3B5dGhvbi13ZWJhcmdzLm1rICAgfCAxNCArKysrKysr
KysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9weXRob24td2ViYXJncy9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3B5dGhvbi13ZWJhcmdzL3B5dGhvbi13ZWJhcmdzLmhhc2gKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL3B5dGhvbi13ZWJhcmdzL3B5dGhvbi13ZWJhcmdzLm1rCgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9Db25maWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgppbmRleCBjYjVhZjlh
N2UyLi5lMDVmNDI3MWUzIDEwMDY0NAotLS0gYS9wYWNrYWdlL0NvbmZpZy5pbgorKysgYi9wYWNr
YWdlL0NvbmZpZy5pbgpAQCAtMTMyNiw2ICsxMzI2LDcgQEAgbWVudSAiRXh0ZXJuYWwgcHl0aG9u
IG1vZHVsZXMiCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi13Y3dpZHRoL0NvbmZpZy5pbiIKIAlz
b3VyY2UgInBhY2thZ2UvcHl0aG9uLXdlYXN5cHJpbnQvQ29uZmlnLmluIgogCXNvdXJjZSAicGFj
a2FnZS9weXRob24td2ViMnB5L0NvbmZpZy5pbiIKKwlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXdl
YmFyZ3MvQ29uZmlnLmluIgogCXNvdXJjZSAicGFja2FnZS9weXRob24td2ViZW5jb2RpbmdzL0Nv
bmZpZy5pbiIKIAlzb3VyY2UgInBhY2thZ2UvcHl0aG9uLXdlYm9iL0NvbmZpZy5pbiIKIAlzb3Vy
Y2UgInBhY2thZ2UvcHl0aG9uLXdlYnB5L0NvbmZpZy5pbiIKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cHl0aG9uLXdlYmFyZ3MvQ29uZmlnLmluIGIvcGFja2FnZS9weXRob24td2ViYXJncy9Db25maWcu
aW4KbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZjIzMzJkM2I3MAotLS0g
L2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLXdlYmFyZ3MvQ29uZmlnLmluCkBAIC0wLDAg
KzEsMTEgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fV0VCQVJHUworCWJvb2wgInB5dGhv
bi13ZWJhcmdzIgorCXNlbGVjdCBCUjJfUEFDS0FHRV9QWVRIT05fTUFSU0hNQUxMT1cgIyBydW50
aW1lCisJc2VsZWN0IEJSMl9QQUNLQUdFX1BZVEhPTl9QQUNLQUdJTkcgIyBydW50aW1lCisJaGVs
cAorCSAgRGVjbGFyYXRpdmUgcGFyc2luZyBhbmQgdmFsaWRhdGlvbiBvZiBIVFRQIHJlcXVlc3Qg
b2JqZWN0cywKKwkgIHdpdGggYnVpbHQtaW4gc3VwcG9ydCBmb3IgcG9wdWxhciB3ZWIgZnJhbWV3
b3JrcywgaW5jbHVkaW5nCisJICBGbGFzaywgRGphbmdvLCBCb3R0bGUsIFRvcm5hZG8sIFB5cmFt
aWQsIEZhbGNvbiwgYW5kCisJICBhaW9odHRwLgorCisJICBodHRwczovL2dpdGh1Yi5jb20vbWFy
c2htYWxsb3ctY29kZS93ZWJhcmdzCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi13ZWJhcmdz
L3B5dGhvbi13ZWJhcmdzLmhhc2ggYi9wYWNrYWdlL3B5dGhvbi13ZWJhcmdzL3B5dGhvbi13ZWJh
cmdzLmhhc2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNjE5YjU4NDgw
NwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLXdlYmFyZ3MvcHl0aG9uLXdlYmFy
Z3MuaGFzaApAQCAtMCwwICsxLDUgQEAKKyMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGku
b3JnL3B5cGkvd2ViYXJncy9qc29uCittZDUgICA5ZmZmMjkyOTRhNWRiNzQ4ZWNhNzkxZGEyYjkz
ZTM3MCAgd2ViYXJncy04LjIuMC50YXIuZ3oKK3NoYTI1NiAgOTlkNjg5NDBjNDUyZTA3NzI2NDg1
YTE1ZmVmNDNmMTJmOGFlNmMwYzViMzkxYmNiYTc2MDY1ZDQ1MjdmYjg1ZCAgd2ViYXJncy04LjIu
MC50YXIuZ3oKKyMgTG9jYWxseSBjb21wdXRlZCBzaGEyNTYgY2hlY2tzdW1zCitzaGEyNTYgIDU5
NzNlNWRjYzIwYjY1ZTRlYjRiNGFjZGYyNzNiYjc4YTE4NTIyOTE0YWI2MjZmNDk2ZjFiMDcwZjdl
NjI5NGQgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXdlYmFyZ3MvcHl0aG9u
LXdlYmFyZ3MubWsgYi9wYWNrYWdlL3B5dGhvbi13ZWJhcmdzL3B5dGhvbi13ZWJhcmdzLm1rCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmUwNDhkOGE0YWMKLS0tIC9kZXYv
bnVsbAorKysgYi9wYWNrYWdlL3B5dGhvbi13ZWJhcmdzL3B5dGhvbi13ZWJhcmdzLm1rCkBAIC0w
LDAgKzEsMTQgQEAKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisjCisjIHB5dGhvbi13ZWJhcmdz
CisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitQWVRIT05fV0VCQVJHU19WRVJTSU9OID0g
OC4yLjAKK1BZVEhPTl9XRUJBUkdTX1NPVVJDRSA9IHdlYmFyZ3MtJChQWVRIT05fV0VCQVJHU19W
RVJTSU9OKS50YXIuZ3oKK1BZVEhPTl9XRUJBUkdTX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhv
bmhvc3RlZC5vcmcvcGFja2FnZXMvNGIvN2QvZmVjZThlNjU0N2IzZWRkZTg5NTNiMWM4NGE2M2Rh
MDJlMWE4OGVmY2I5ZDdkNDg1ZTRkMWIyNWQ5YzQ3CitQWVRIT05fV0VCQVJHU19TRVRVUF9UWVBF
ID0gc2V0dXB0b29scworUFlUSE9OX1dFQkFSR1NfTElDRU5TRSA9IE1JVAorUFlUSE9OX1dFQkFS
R1NfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKKworJChldmFsICQocHl0aG9uLXBhY2thZ2UpKQot
LSAKMi4zOS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
