Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45562D0BB43
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 22:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B6B540892;
	Wed, 23 Oct 2024 22:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_ZmMqg-2Fxe; Wed, 23 Oct 2024 22:45:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0164B40887
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0164B40887;
	Wed, 23 Oct 2024 22:45:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BC1864960
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8A3F4087B
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IAw9BmowyvP4 for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 22:45:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A02A40879
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A02A40879
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A02A40879
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 22:45:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.59.23]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2jC-1thygg0BdK-00e2E3; Thu, 24
 Oct 2024 00:45:32 +0200
Date: Thu, 24 Oct 2024 00:45:27 +0200
MIME-Version: 1.0
Message-Id: <20241024-ska-bump-v1-3-776aa5d8b655@gmx.net>
References: <20241024-ska-bump-v1-0-776aa5d8b655@gmx.net>
In-Reply-To: <20241024-ska-bump-v1-0-776aa5d8b655@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723527; l=1106;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=3hBJuCJGFundAT4keEVX+w9L64Oa7iaJu//8nY6UCPQ=;
 b=Uo5Uezh5TiAMQwQnYT0zYWghdG+qaIjWmQ1shyQ42p7KLqv8me0O0OCOt21rG1rgQcW6XC7RA
 lZjn6Hf75zgAt3s6vIDNyC1ZAYcFezDClaOBYrV+Xp6QS8x17rGD3SP
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:Ub2M8sOIz1Y2/8C+EwMkagVdI3ewagDyyayQmdMTvGxX/ytU77M
 5DDoPuP7YkzNV3eUyt3vfpM4xR6Ov26TaYqiKB+6YVndoYFwQnOdtB/ZuTV55AhsypxOVEG
 A1Z+7pk9Ysk3gcovI6h5BahSwqbgUXSWo9KJy+xcL2KQo8rMB/3qLkxqah23L5X9lsFAxaL
 2bKpytauhtKsEzEDhTSuw==
UI-OutboundReport: notjunk:1;M01:P0:xCwJ1Vhbgvs=;hyw8z9XsQNfKdzbq+FEBUOWULSV
 NasQYndjsxpHOSz5+OmxQBhJmsdZmrQdng8fZWqwqmaAKw9dQdQKZ6CqZFlib7NW+77GFvlkb
 uwMCnUrFxbkwcC7o2iVBS/ohK1KhSZLUV/cFOKme+fLJ9qI5jneQLSJG1sjAkcr/eh6+Nn0+v
 DzA8nC0y9BavgOCnOL2n3aOthpsQJuwk0gp6zDuhLDuQh8BTdiu0bTcxcnSeSE+bNNUGh4gun
 MpAa+4P9bIu9v/Hin6Xm/g1sEJ+8FlOxJbUXIWfqm4cf6IfM1d/ERfnf/9p3wHacD5LOCG1/m
 d1tJg+IK3FEiHrJEo++fx9EDE7+uZmDtoX/C15TDNqK11X27AynkRn1mlzWfzwINHREWPQpH0
 RwwERRTR2ec+K+a7/x4D5R0im8gRRQm5Pw/+p6m80OCgAmSMA7/yhaBR3rzRRUd+C18l1+aLt
 4baxgHFRFROaxvH3X5vKFNZCgMciPfbuwS5tFVP11H2nZR92sxSL1Vu7jaQveNhnpS4OMQU2P
 p75XtV9wmXMOGPLlX4oA+r6Hr8fXOPecqFRlDuF+AOgF6Hq7KrFgfH0TWvElpstV1u8AWvnNa
 gM5gQyJcpBEs2/XpNCF5hS4tcKqZptN5wKf6+bAsa5j4K8klokY0EwdW8JGsICwJIn8z7XK1U
 dQ/RtYRwrHLVbrPF5k5k+DVj34Gn0UQ4x6rqGFuMQX6UEuRjMAIBlPn5N7bBZN6KEnj163Ran
 Rn6jO/jgpxnAgRviMt9dkdkjX2if26JDxocUdvm3mGkk85/UHYgAL0aqRMt05YaIYsYCfVNPa
 Mqc5ZhVdvN+BEP8Q6S1So4pg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1729723532; x=1730328332; i=j.neuschaefer@gmx.net;
 bh=FoyiGTFPAPWKMJ5b7ZhMUEYyHFaqKVlLO5wEtTdHPvM=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Pfm5ZDWIDwKgkAXrE+lMzcchxulK7939COkSoO/vFaHTqVEgpTyqEk83OpBzbtTV
 2cMmXVOyC7HfXsuxIhwJu9yGtMWjT3slXJ8wGf3Iai3JpWhsXDOxNt9M2tS8oVeqa
 2EKo2P2A1SDbV+VIFgiYbeXOSAIwli9hweE8oFwXdpRFDdtyr4xGQ/rkCKE1/wDjy
 gRsNlo25KUNojQAz5Rpue1mPp4cXiOK9scaW6qR0O/xkbV9ibfICuqlEkS6aDb1+H
 jdGC5JnZqNB5zcttL6WM37q+rsng8jrG+FfIcJIeI++/Tt3P5FhemGzDyACE54B86
 LK4zjgEVA93+kAqrGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Pfm5ZDWI
Subject: [Buildroot] [PATCH 3/3] package/execline: Remove -D_GNU_SOURCE
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ZXhlY2xpbmUgaXMgd3JpdHRlbiBhZ2FpbnN0IFBPU0lYIEMgYW5kIGF1dG9tYXRpY2FsbHkgc2V0
cwotRF9QT1NJWF9DX1NPVVJDRT0yMDA4MDlMIGFuZCAtRF9YT1BFTl9TT1VSQ0U9NzAwLiB1Y2xp
YmMgaGFkIGEgYnVnCmNvbnNpc3RlbnQgd2l0aCB0aGUgZXJyb3IgcmVwb3J0ZWQgaW4gdGhlIGNv
bW1pdCB0aGF0IGFkZGVkCi1EX0dOVV9TT1VSQ0VbMV0sIGJ1dCBpdCBoYXMgc2luY2UgYmVlbiBm
aXhlZFsyXS4KClsxXTogc2VlIGNvbW1pdCAxMDZlNDNlMzAzICgicGFja2FnZS9leGVjbGluZTog
Zml4IHVjbGliYyBidWlsZCIpClsyXTogaHR0cHM6Ly9jZ2l0LnVjbGliYy1uZy5vcmcvY2dpL2Nn
aXQvdWNsaWJjLW5nLmdpdC9jb21taXQvP2lkPTM1NDEyOTgwN2RiMTJjNzkyNjk2Yjc0ZDBjZDM4
ZjJjNWQyZmQ3MDQKClNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVy
QGdteC5uZXQ+Ci0tLQogcGFja2FnZS9leGVjbGluZS9leGVjbGluZS5tayB8IDEgLQogMSBmaWxl
IGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2V4ZWNsaW5lL2V4
ZWNsaW5lLm1rIGIvcGFja2FnZS9leGVjbGluZS9leGVjbGluZS5tawppbmRleCA0ZDliNjY4ODE5
Y2MyOTZiMDgzOGMwOWQ3MDkxZDBmMDM4OTAyYzI2Li45ZjYwMmNmNjBhZjcwM2ViMDBlYzNkZmY0
MDliM2UxNGFjYzc2NmFjIDEwMDY0NAotLS0gYS9wYWNrYWdlL2V4ZWNsaW5lL2V4ZWNsaW5lLm1r
CisrKyBiL3BhY2thZ2UvZXhlY2xpbmUvZXhlY2xpbmUubWsKQEAgLTEyLDcgKzEyLDYgQEAgRVhF
Q0xJTkVfSU5TVEFMTF9TVEFHSU5HID0gWUVTCiBFWEVDTElORV9ERVBFTkRFTkNJRVMgPSBza2Fs
aWJzCgogRVhFQ0xJTkVfQ09ORl9PUFRTID0gXAotCUNGTEFHUz0iJChUQVJHRVRfQ0ZMQUdTKSAt
RF9HTlVfU09VUkNFIiBcCiAJLS13aXRoLXN5c2RlcHM9JChTVEFHSU5HX0RJUikvdXNyL2xpYi9z
a2FsaWJzL3N5c2RlcHMgXAogCS0td2l0aC1pbmNsdWRlPSQoU1RBR0lOR19ESVIpL2luY2x1ZGUg
XAogCS0td2l0aC1keW5saWI9JChTVEFHSU5HX0RJUikvbGliIFwKCi0tCjIuNDUuMgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
