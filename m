Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2EFC433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 23:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A68CF404CD;
	Wed,  8 Dec 2021 23:21:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8QcEfowXQTLd; Wed,  8 Dec 2021 23:21:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 923C840477;
	Wed,  8 Dec 2021 23:21:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA1341BF3E1
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 23:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91B4E409D9
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 23:21:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ERaoDU1Q2dG0 for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 23:21:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp4.osuosl.org (Postfix) with ESMTP id D87B2409CD
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 23:21:51 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id v6Fwmlj65ydyPv6FxmTais; Thu, 09 Dec 2021 00:21:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639005709; bh=C9Pzlo0maB80v9pWF25O22DnXydJ6VRryG53P5nAJwA=;
 h=From:To:Subject:Date:MIME-Version:Content-Type;
 b=Vj+6aRFvpdfrUWaeXWLJ92DzqUfkOm0Q+aMBZX9yjtocXdSmnEy5mjmspL1zevz2K
 dv50KRfcK+Aq5dgTi9t+6A09gLoAZ5sUxaalX0wcu/ixHDvwmfe+F4kyGEn+AQ5U+w
 OsFVtTTKuVUgTnSUUhnzIy7AAE1hh4z1n9W2ZEaME1gNkNOnBPmGuV8JoAFubH4nuO
 +L9G62xjRVnQclaFVRHt0XMAuw/848uaud8MfysmLD9ZNDca94pIUfMDg/Eret3p/e
 0bp4VUsdQ8tt3kM8wIs2mTXBKDsAs21ni4Wy03hqp33ijTTSQDXRZkT3fO10I5PpT/
 eZbe2sWofN4Xg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Arnout Vandecappelle <arnout@mind.be>
Date: Thu,  9 Dec 2021 00:21:48 +0100
Message-Id: <20211208232148.3694208-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOoqRHbLwteH+HrVSH4+f+vT/9+hjKocl6e0e6lsgqYkTIE5ksuSUMhXejp/2HnlfoqYj6i6bMI5Fd4bLHeHnuZGfzrvE1HtxsIqHQcs2Oi4QdzrhyCh
 bl4XXXisLKQLqxd9fGD9/m1bOd/YiGh8bI5dx/WmxkWVFGi4MkXTw6Y6SAnfhjKrQQtASLGik5oLL1ZYOExCHdOL2U7x8KoYTSFND/TiqZyx800sBAv7VAY8
 75jvdnogi+9PIMClS8tLfj7avFCjAH7xF7vQYklZ9SYrIu64yeYSqVA8u/m3I0OcjgobfITyVi0cliED4dTTxg==
Subject: [Buildroot] [PATCH] package/postgis: re-enable Microblaze
 architecture
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hpbGUgYWRkaW5nIHRoaXMgcGFja2FnZSB3aXRoIGNvbW1pdFsxXSBNaWNyb2JsYXplIGFyY2hp
dGVjdHVyZSBoYXMgYmVlbgpkaXNhYmxlZCBieSBkZWZhdWx0IHBvaW50aW5nIHRoYXQgaXQgc3Vm
ZmVycyBmcm9tIGdjYyBJQ0UsIGJ1dCB0aGlzIGlzIG5vdAp0cnVlLCBpbmRlZWQgdGhlIGJ1aWxk
IGVycm9yIGlzIHJlZmVycmVkIHRvIGxpYmdlb3MgdGhhdCBpcyBwb3N0Z2lzCmRlcGVuZGVuY3k6
CmBgYAogIGR1cmluZyBSVEwgcGFzczogcmVsb2FkCiAgLi4uL2Jvb3RsaW4tbWljcm9ibGF6ZWVs
LXVjbGliYy9idWlsZC9saWJnZW9zLTMuOS4wL3NyYy9nZW9tL3V0aWwvRGVuc2lmaWVyLmNwcDog
SW4gc3RhdGljIG1lbWJlciBmdW5jdGlvbiDigJhzdGF0aWMgc3RkOjp1bmlxdWVfcHRyPHN0ZDo6
dmVjdG9yPGdlb3M6Omdlb206OkNvb3JkaW5hdGU+ID4gZ2Vvczo6Z2VvbTo6dXRpbDo6RGVuc2lm
aWVyOjpkZW5zaWZ5UG9pbnRzKGdlb3M6Omdlb206OkNvb3JkaW5hdGU6OlZlY3QsIGRvdWJsZSwg
Y29uc3QgZ2Vvczo6Z2VvbTo6UHJlY2lzaW9uTW9kZWwqKeKAmToKICAuLi4vYm9vdGxpbi1taWNy
b2JsYXplZWwtdWNsaWJjL2J1aWxkL2xpYmdlb3MtMy45LjAvc3JjL2dlb20vdXRpbC9EZW5zaWZp
ZXIuY3BwOjEyODoxOiBpbnRlcm5hbCBjb21waWxlciBlcnJvcjogaW4gZ2VuX3JlZ19ydHgsIGF0
IGVtaXQtcnRsLmM6MTE1NQogIDEyOCB8IH0KICAgICAgfCBeCmBgYAoKVGhpcyBidWlsZCBlcnJv
ciBoYXMgYmVlbiB3b3JrZWQgYXJvdW5kIHdpdGggdGhpcyBjb21taXRbMl0gYW5kIEkndmUganVz
dAp0ZXN0ZWQgdGhpcyBidWlsZCB3aXRoIE1pY3JvYmxhemUgZ2NjIDkuMy85LjQvMTAuMyBhbmQg
MTEuMiBhbmQgaXQgYnVpbGRzCnN1Y2Nlc2Z1bGx5IHNpbmNlIHRoZSBidWcgYWJvdmUgaXMgZ2Nj
IGJ1ZyA5MDYyMFszXSBhbmQgaXQncyBiZWVuIGhhbmRsZWQKaW4gbGliZ2VvcyBhbHJlYWR5LgoK
U28gbGV0J3MgYWxsb3cgTWljcm9ibGF6ZShlbC9iZSkgdG8gYnVpbGQgdGhpcyBwb3N0Z2lzLgoK
WzFdOiBodHRwczovL2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPTliYjEw
MzQ0NTVkZTI5OTg3NmRmZDAzYzUwNzRkOGJiOTYyMmY4NzM5YmIxMDM0NDU1ZGUyOTk4NzZkZmQw
M2M1MDc0ZDhiYjk2MjJmODczClsyXTogaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJv
b3QvY29tbWl0Lz9pZD04NDdiNDQxYjFjYTIyMzBjNGYyNmE0OWFhZWRlNjllY2E1ZTdlN2FkClsz
XTogaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9OTA2MjAKClNp
Z25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5l
ZXJpbmcuY29tPgotLS0KIHBhY2thZ2UvcG9zdGdpcy9Db25maWcuaW4gfCAyIC0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3Bvc3RnaXMvQ29u
ZmlnLmluIGIvcGFja2FnZS9wb3N0Z2lzL0NvbmZpZy5pbgppbmRleCBkMzgxYTRiYWY5Li40MDVj
NWM3MjNhIDEwMDY0NAotLS0gYS9wYWNrYWdlL3Bvc3RnaXMvQ29uZmlnLmluCisrKyBiL3BhY2th
Z2UvcG9zdGdpcy9Db25maWcuaW4KQEAgLTEsNyArMSw2IEBACiBjb25maWcgQlIyX1BBQ0tBR0Vf
UE9TVEdJUwogCWJvb2wgInBvc3RnaXMiCiAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9QT1NUR1JF
U1FMX0ZVTEwKLQlkZXBlbmRzIG9uICFCUjJfbWljcm9ibGF6ZWVsICYmICFCUjJfbWljcm9ibGF6
ZWJlICMgSUNFCiAJZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJTVERDUFAgIyBsaWJnZW9zLCBw
cm9qCiAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzcgIyBDKysxMSwg
cHJvagogCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyAjIGxpYmdlb3MsIHBy
b2oKQEAgLTIwLDcgKzE5LDYgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1BPU1RHSVMKIAkgIGh0dHBz
Oi8vcG9zdGdpcy5uZXQvCiAKIGNvbW1lbnQgInBvc3RnaXMgbmVlZHMgYSB0b29sY2hhaW4gdy8g
QysrLCB0aHJlYWRzLCB3Y2hhciwgZ2NjID49IDQuNywgbm90IGJpbnV0aWxzIGJ1ZyAyNzU5NyIK
LQlkZXBlbmRzIG9uICFCUjJfbWljcm9ibGF6ZWVsICYmICFCUjJfbWljcm9ibGF6ZWJlICMgSUNF
CiAJZGVwZW5kcyBvbiAhQlIyX0lOU1RBTExfTElCU1REQ1BQIHx8ICFCUjJfVE9PTENIQUlOX0dD
Q19BVF9MRUFTVF80XzcgfHwgXAogCQkhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyB8fCAhQlIy
X1VTRV9XQ0hBUiB8fCBcCiAJCUJSMl9UT09MQ0hBSU5fSEFTX0JJTlVUSUxTX0JVR18yNzU5Nwot
LSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
