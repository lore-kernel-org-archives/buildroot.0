Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA1A606A327
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 19:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 651F6605ED;
	Mon,  2 Nov 2026 19:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_zjYCNSfCBg; Mon,  2 Nov 2026 19:55:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C747B60600
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793649323;
	b=HMnTwjbWcw7FHIOEbGjzX2Zv1hBKqgdRwff7+9E+5YDgQC4fk3H6p1ShzKK8Aunf7UFT
	 TMNL5L27ZGLNucLq/23VomSeIhQM0GmmnnafS0qtqceERiGbkc0nKPiUumGZ7SVNLzuCS
	 bV72PWWyLWWMn49YS4a7iHl6DPHI7RgJwT0EtvA1FOZrX1P72/vxzecS+Bjc5VXPlPadC
	 U9SjdtAxqqcWg3vkQ5FTrNx0U4IMQ82UlytZgBAGzKtGhKzWy5cz27VETCXoKOT+ZXo7p
	 nAnDd+zOprxwJR+bozNlSNQolmM1Tm+0x4RTvVsCMxYfUVYWdfPBJfW9tx/3MlITkww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793649323;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JBN0eDeFWNzn0/VZyENfF8SfJ1j+TYw4K7/AGRRUYHo=;
	b=CRLpTP+M70E9hx9Ad8+AVmp1O00R4tlWkaR/aBI5JcxavUWurTGLPmngenkxnyzktr2/
	 HZCO/k8y4xbQmMynvEV/GD5ciYhtj6vWxrj1Yuac9RFv7GgHK5otDOtqgggHqKnGzmkND
	 Pjs8bHA1OfUn1xUfeSUL23cbjlLnAa0IvbKvgDRsMUeAdb09sUzEjZ8ercHCBb38kwU5z
	 2BhjLuDKmMarPiSS6KBzedpAh2BUuWUpMEqlWQVbxJxQzRW7DMCwejy1K1ZIuPPZhg7E4
	 0ctJq5iZGwX2jFzCy9LQxg34RPRzF4uOaTRc5qjYeQ16FcB/eH7HhWY+CaTkVuZlMMw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793649323;
	bh=JBN0eDeFWNzn0/VZyENfF8SfJ1j+TYw4K7/AGRRUYHo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=foA83NCtPUl1hqbOBu+3hLCTKgFIxRS+gZUM/yvCXkyKhbzvLrPup7PZ1X3EgkbjZ
	 hmlKxXzC42NMaRrbFBjK0AO0qju182lIu2RN9gx+NzN7iAXmeIRY69At7hnhyXouOt
	 ZwJRZiPTycJaOCL4lHsRMV3crSy5lZYFkvacoFyusDZ0YY6iMzqhcw5r9zjC/5U3bU
	 G3KzSCdIs56w1SPyHZv9rGHlBbd1q20egZwzRdVFba11hEbajwvOBMLfyzdBkZnbkg
	 zbNL1ivacAxEsW/nJq0pCRmJDbHvAPnbnzITwMqraM52irmbCtfdhFy/KBRf2H5VqV
	 599SLkmSQm9Yw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C747B60600;
	Mon,  2 Nov 2026 19:55:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DBEE72AC
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 19:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D92A540545
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 19:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6RTgE5gHefI for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 19:55:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C10254054A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793649320;
 b=KiGqj2L0csATD6h+tWfxFmoniSxuT4YM9mS0Jqh+tZ4lljWByyoIxxL9pihM5JEdothM
 hHNoU3bnWIYeIH5677PElYSRTo5uyiJCs2UCWaKJtsnTzUNgR9lbYuKQ6n9JJQsEbUH2V
 2UF8qb0JByLE3gw62SN20ernHQpOmMa8ny36QjeGbFA/QWgSDzcETAutvGPlveQuOuV+0
 bZfkT2SFdc8qVSKvzD+Ty0Y+z08GPwNcQrYEiC2siNkjZi7lndowd3PniETDnzzaTblOm
 JS/xpN0UKuebRafGjhzeYbaB+FCHXebLu4eUwPneZPoS7cY/REiYmu5TtLVhfwIk5cA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793649320;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Q97lhQE8pjC2gom9gCIYg5kXW0G5SZ525Bqm08tIgIc=;
 b=GUEcwfuYn2n7vhzYFONLcR0nemTQr7b9SLJ8TXubJdfEVTShaNP5BS0V5K+1ALKlgmYs
 aloyZE4/L5GlE7PuEaKJxBabvw2jPQVeHOZIaLyZHwU7JKSIzowrU96HGWinqFqmI3OHP
 64dLkGcgocunkNP8c3WGTNBW7OX+zX7lZ54vGlNqFDARYkQImSNa35jL3f/h8W8v8wAzv
 PExeltrPekxhpu12Nd9gjyKtCeKBx22Mqgk4fTN3iTejthtOxPpShnsLDypwdwR2c79ne
 K3r+3j3eqXeOUFJLnD2RV94yQq+j831/kcf+NNMa/kLrqE1lAp5ypmaFOG5nulS6lEQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fxsql8aP; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fxsql8aP
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C10254054A
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 19:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793649315;
 bh=Q97lhQE8pjC2gom9gCIYg5kXW0G5SZ525Bqm08tIgIc=;
 h=From:To:Cc:Subject:Date:From;
 b=fxsql8aPe59FwKuyMUhL9XCZpzH+HyBsQkbi9MAM12ep3p/l6aAyHtVk03E1156Xy
 18S9u2IIZWiuOs9kWXWkLJmgUkDgNp9BbAlSoY2pzFhNSyof8ZeOF5YblD/4xVpXwS
 3oAbk+dsaA5IG6aq1CYEsY0bpYUO+yrRVV1ge7Fe/l0f08sJKraH4saXu/1Mmpsq5P
 3DOfbvOu/NhOjs97iKLZltf52NVoo4DYGFaOVjMjwyl4CGla0xgmRej8zwKa50aeUJ
 lOSXexdagvuWUx6aC1LY4/JRnOK00j1aEuGM1kN/wsuS2HMf0ImzezPGuSUYvxrIpe
 3uGy4q8eEp50A==
X-KAS-Sym: v3:f51bdf72230551df:VCYbhGWT5B34OJsjSblqquK3dAdvEYXxnhJQzcbTB4WkY
 Udu0ydOmQ588vFQH8J4AP8o2mWwK7G+mhv8jby/SsDgfLWWSOwquNqds6spIGlo1ALAqUd5r6Xf
 3NZ8dmgj5yM6oubfIjVKPk3apWx8whAeDNUn8AvTjagC7be6d/NsoGqdfphQ0uEzO/UmzLzeP29
 sarHWdqUCNDdykPp8bEXMDhZzz4C85xtHVHTz9/xPN1c7np4tkeqttKAkgMlGmT0t1+0FS5PUo8
 /ajkR4gIzpx620nbx05y6Deux24Mb0yX+N1w4jeEEbPhJFj1wGyZ0JhDlzSkbqtevx8GLw8w==:
 dk8MYCcdb9dNipeJlQ6lHR8mv8M1StOTgjOkbiA8Jrsgm5EdniKLh6thCUF70ePg1JXAV0Ms25j
 4fx6VA2pdf53FNj101NMuxUw9q5ZD1hFQQ+6cqCwvTm8NWEde1C8U/lRVnij7YMxD4YPh62m2ng
 lE8IRrsGZvF7CfYWPzQZLOfSBU/oMneYs+RYvk6hh36HUA9L09OMaTpE3QfgqqPomfJL1YqcB1/
 7LwrsaKdVLTMTMdTdlEcQnP//fF/E6Hij2XO5mqckwAVdEXHRaXdQUYyfautySQX4PR26AIcSsp
 VJHLAnC2RJiwZ5fKCq2VuBcP6GBUxMrXks/ImgvO9fPdUWIhWTpEKiMhqSKQOU0KRW4HcL6qPEm
 PyYflNuAvRky95KO47o1alFezPnuBXPZkgwglZHQj9Pn1dyY+m+Va9vTKPZVeAmH0WuKPIQLZaE
 7Btw2u2MFmiqaCupuQQzWHfyF4WyfR0UKPBTE1SBuZP2HTWsPTdwukroGk0NGhf/89eFeo8gPrE
 PKG7TLLwJ5z4LtO6sXqB8OLgVpUvlQ/Sh1mGeWZYqKTJf+BBwkOxbz/WnIRgJEX5tB5XAeCSPdn
 h5J2U8r9xGHZE2J9HbLZvnzB615RAamr3dxsrht3M4iSk603sPfERkPI7xmFVaJ4nw==
Received: from fli4l.lan.fli4l (p5b3a07a5.dip0.t-ipconnect.de [91.58.7.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 91FC6A4C2D8E;
 Mon,  2 Nov 2026 20:55:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53520)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xNy7e-0000000044P-28Sp;
 Mon, 02 Nov 2026 19:55:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  2 Nov 2026 20:55:14 +0100
Message-ID: <20261102195514.3967-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.10.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

aHR0cHM6Ly9naXRodWIuY29tL2xpYmV4cGF0L2xpYmV4cGF0L2Jsb2IvUl8yXzEwXzAvZXhwYXQv
Q2hhbmdlcwpodHRwczovL2Jsb2cuaGFydHdvcmsub3JnL3Bvc3RzL2V4cGF0LTItMTAtMC1yZWxl
YXNlZC8KClRoZSBmb3VyIGZpeGVkIHNlY3VyaXR5IGlzc3VlcyBhcmU6CgpDVkUtMjAyNi0xMTMz
NTEg4oCUIERlbmlhbCBvZiBzZXJ2aWNlIHdpdGggWE1MX1BhcnNlclJlc2V0CkNWRS0yMDI2LTEx
NTUwNiDigJQgRGVuaWFsIG9mIHNlcnZpY2UgZnJvbSB2YXJpYXRpb25zIG9mIGJpbGxpb24gbGF1
Z2hzCiAgICAgICAgICAgICAgICAgIGF0dGFja3MgYW5kIHBhcmFtZXRlciBsYXVnaHMgYXR0YWNr
cwpDVkUtMjAyNi0xMTc2MTAg4oCUIERlbmlhbCBvZiBzZXJ2aWNlIG9yIG1vcmUgZnJvbSBpc3N1
ZXMgd2l0aCBpbml0aWFsCiAgICAgICAgICAgICAgICAgIG5vbi1maW5hbCBlbXB0eSBzdWJwYXJz
ZXIgcGFyc2UgY2FsbHMKQ1ZFLTIwMjYtMTE4MzcwIOKAlCBTaWduZWQgaW50ZWdlciBvdmVyZmxv
dyBpbiBmdW5jdGlvbiBzdG9yZUF0dHMKClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJu
ZEBrdWhscy5uZXQ+Ci0tLQpHaXRsYWIgcGlwZWxpbmVzIHBhc3NlZDoKaHR0cHM6Ly9naXRsYWIu
Y29tL2JrdWhscy9idWlsZHJvb3QvLS9jb21taXRzLzM0OTFhZTM5NmRmZDcyMjE5NzNmMjUxNWJk
MjdjNDkxYTE5NTAwY2EKCiBwYWNrYWdlL2V4cGF0L2V4cGF0Lmhhc2ggfCA0ICsrLS0KIHBhY2th
Z2UvZXhwYXQvZXhwYXQubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZXhwYXQvZXhwYXQuaGFz
aCBiL3BhY2thZ2UvZXhwYXQvZXhwYXQuaGFzaAppbmRleCA0MTc3OGZjNTM2Li5lODkzOWZkMzhh
IDEwMDY0NAotLS0gYS9wYWNrYWdlL2V4cGF0L2V4cGF0Lmhhc2gKKysrIGIvcGFja2FnZS9leHBh
dC9leHBhdC5oYXNoCkBAIC0xLDQgKzEsNCBAQAotIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9s
aWJleHBhdC9saWJleHBhdC9yZWxlYXNlcy90YWcvUl8yXzlfMAotc2hhMjU2ICAxZTYzNzE4NjJj
YzMxOTk5YjM2OGMzYjg5YjQ5OTk0ZjA2NzdlMWJhYjVmMWIyYjg1YWUzNzQxZjVkODAzMDUxICBl
eHBhdC0yLjkuMC50YXIueHoKKyMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vbGliZXhwYXQvbGli
ZXhwYXQvcmVsZWFzZXMvdGFnL1JfMl8xMF8wCitzaGEyNTYgIGM2MjRiYTI5OThmYzY1ZGYxMTYz
YTQ5NjQxZmYzZjlhYjczMTM4YjExNjQxZDkyYzg2YmVlMGZiMDFiMWJjN2YgIGV4cGF0LTIuMTAu
MC50YXIueHoKICMgTG9jYWxseSBjYWxjdWxhdGVkCiBzaGEyNTYgIDMxYjE1ZGU4MmFhMTlhODQ1
MTU2MTY5YTE3YTU0ODhiZjU5N2U1NjFiMmMzMThkMTU5ZWQ1ODMxMzliMjVlODcgIENPUFlJTkcK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvZXhwYXQvZXhwYXQubWsgYi9wYWNrYWdlL2V4cGF0L2V4cGF0
Lm1rCmluZGV4IGJlNWQ4YWUwYjguLjIzYTYzNWU1ZDQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZXhw
YXQvZXhwYXQubWsKKysrIGIvcGFja2FnZS9leHBhdC9leHBhdC5tawpAQCAtNCw3ICs0LDcgQEAK
ICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUVYUEFUX1ZFUlNJT04gPSAyLjkuMAorRVhQ
QVRfVkVSU0lPTiA9IDIuMTAuMAogRVhQQVRfU0lURSA9IGh0dHBzOi8vZ2l0aHViLmNvbS9saWJl
eHBhdC9saWJleHBhdC9yZWxlYXNlcy9kb3dubG9hZC9SXyQoc3Vic3QgLixfLCQoRVhQQVRfVkVS
U0lPTikpCiBFWFBBVF9TT1VSQ0UgPSBleHBhdC0kKEVYUEFUX1ZFUlNJT04pLnRhci54egogRVhQ
QVRfSU5TVEFMTF9TVEFHSU5HID0gWUVTCi0tIAoyLjQ3LjMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
