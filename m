Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFA8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 16:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDE39409E5;
	Mon, 28 Feb 2022 16:17:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xuUjSl3Dccpb; Mon, 28 Feb 2022 16:17:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03BD040987;
	Mon, 28 Feb 2022 16:17:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 740A61BF307
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 16:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 622B740987
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 16:17:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8KvpQSUx0gMK for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 16:17:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51DA640943
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 16:17:04 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [217.70.183.197])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 7DF2AC5819
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 16:14:00 +0000 (UTC)
Received: (Authenticated sender: theo.lebrun@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 98A321C0008;
 Mon, 28 Feb 2022 16:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646064834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3p+N5l8EsMN469ogmWCouW2C9dYGZLtQ4bawnNUSY6Y=;
 b=hSM1jCD4B4BEv/eOL4C/8bXxIT9snmrgDYtT1enRP3fBmA91XUnndraZ1/KR45fjUMd73o
 FPvikQsreIgae/6lCT7ADSp6kpBzAQWo6t4DBuRQYSWEPHWVs4fyccPi4D6A1qQdzm6ZZL
 HSCXylfAdS2WrEj4/+9ZdeUFR2OCHscEkrjNsXiSzzNFj7vSm3XmAGZj0ZYzUPQgMRp/2/
 0HG//xIxY0ZedmHKJXrI6BpnGO4DkThyHfb6j0HBIdXyH/UaVDKRrdPfy1Vs7dvVH2wYjC
 eBgDDIPnz/4x27tZWB2sb5JviRA/AxJGvhOyPvgTCW8mawWJ1G3IX/WEB60c0w==
To: buildroot@buildroot.org
Date: Mon, 28 Feb 2022 17:13:45 +0100
Message-Id: <20220228161345.378966-1-theo.lebrun@bootlin.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wireplumber: bump version to 0.4.8
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
From: =?utf-8?q?Th=C3=A9o_Lebrun_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Cc: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hhbmdlbG9nOgpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvcGlwZXdpcmUvd2lyZXBs
dW1iZXIvLS9ibG9iL2UxNGJiNzJkY2M4NWUyMTMwZDBlYTk2NzY4ZTVhZTNiMzc1YTA0MWUvTkVX
Uy5yc3QKClNpZ25lZC1vZmYtYnk6IFRow6lvIExlYnJ1biA8dGhlby5sZWJydW5AYm9vdGxpbi5j
b20+Ci0tLQogcGFja2FnZS93aXJlcGx1bWJlci93aXJlcGx1bWJlci5oYXNoIHwgMiArLQogcGFj
a2FnZS93aXJlcGx1bWJlci93aXJlcGx1bWJlci5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS93
aXJlcGx1bWJlci93aXJlcGx1bWJlci5oYXNoIGIvcGFja2FnZS93aXJlcGx1bWJlci93aXJlcGx1
bWJlci5oYXNoCmluZGV4IDU2MWZjYzJlNWUuLjIwNmQ3ZDE1YWYgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2Uvd2lyZXBsdW1iZXIvd2lyZXBsdW1iZXIuaGFzaAorKysgYi9wYWNrYWdlL3dpcmVwbHVtYmVy
L3dpcmVwbHVtYmVyLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAot
c2hhMjU2ICA0MWYxNzRlYWFlNWE2MzBlMTk1MDAxZmRkNTgwOTE4ZmE1MTQzYTcxZWRjZWIwNTBi
MzIwZjg1YThlNjVlNTNiICB3aXJlcGx1bWJlci0wLjQuMi50YXIuYnoyCitzaGEyNTYgIDY0Mjll
OGE5NWUzNTVjZTIxYjRjNGYxYTVlYmM3NjlmMDM3ZThkYmVlYzUxOTA1YWQ5MDljZTYwOWEzOGQw
Y2UgIHdpcmVwbHVtYmVyLTAuNC44LnRhci5iejIKIHNoYTI1NiAgZmYyZWI5YWY1YjA1ZDkyYWMz
YTM4Y2ZmY2FkMjc1ODJlZjU1NWEzMWZmMTc4MWUxYzFkNGUwODdmNzdjOWM4MSAgTElDRU5TRQpk
aWZmIC0tZ2l0IGEvcGFja2FnZS93aXJlcGx1bWJlci93aXJlcGx1bWJlci5tayBiL3BhY2thZ2Uv
d2lyZXBsdW1iZXIvd2lyZXBsdW1iZXIubWsKaW5kZXggMmRhYjYwNDJlYS4uM2JmN2NlY2U0NSAx
MDA2NDQKLS0tIGEvcGFja2FnZS93aXJlcGx1bWJlci93aXJlcGx1bWJlci5taworKysgYi9wYWNr
YWdlL3dpcmVwbHVtYmVyL3dpcmVwbHVtYmVyLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKIAotV0lSRVBMVU1CRVJfVkVSU0lPTiA9IDAuNC4yCitXSVJFUExV
TUJFUl9WRVJTSU9OID0gMC40LjgKIFdJUkVQTFVNQkVSX1NPVVJDRSA9IHdpcmVwbHVtYmVyLSQo
V0lSRVBMVU1CRVJfVkVSU0lPTikudGFyLmJ6MgogV0lSRVBMVU1CRVJfU0lURSA9IGh0dHBzOi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9waXBld2lyZS93aXJlcGx1bWJlci8tL2FyY2hpdmUvJChX
SVJFUExVTUJFUl9WRVJTSU9OKQogV0lSRVBMVU1CRVJfTElDRU5TRSA9IE1JVAotLSAKMi4zNS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
