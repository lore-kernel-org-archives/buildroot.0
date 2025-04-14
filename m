Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D1AC369B2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 11:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1DC4612B5;
	Mon, 14 Apr 2025 11:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tWJcpS3cl91o; Mon, 14 Apr 2025 11:20:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FC9661170
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FC9661170;
	Mon, 14 Apr 2025 11:20:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67CB0108
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 11:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4338C401FB
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 11:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-h3kHmRAmb9 for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 11:20:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 969AB40B89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 969AB40B89
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 969AB40B89
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 11:20:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.1.210.117]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mplbx-1tEhHj0Jh7-00nFXp; Mon, 14
 Apr 2025 13:20:10 +0200
Date: Mon, 14 Apr 2025 13:19:34 +0200
MIME-Version: 1.0
Message-Id: <20250414-ska-bump-v2-3-efb0a276750d@gmx.net>
References: <20250414-ska-bump-v2-0-efb0a276750d@gmx.net>
In-Reply-To: <20250414-ska-bump-v2-0-efb0a276750d@gmx.net>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744629607; l=1127;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=eWFkbpsYIbA/4SPN/8GjOy7SlcIOHU+7ZXV62n0yRxY=;
 b=i8ga6yQ2MYa8eeEon2VxzrrcjMh9tsKU6XmVdU5X/rkdUej9afkL9rlbxD3vGbXImlQmIqZzt
 88/JELsVeHGC5FPh/uxgyIHKYJ/dKngxD6T4NxBFatmfNj2tOuCABee
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:rPmhs73yjnS3J5rO0ChpL37MMQSmFU4mbLTOrgajQ5NM6MMR0kG
 2IhPgDFuZoOZ8isZVsiNs9NlD906LtmENHBMf8LYj7id0kZCEy7ecTorB2/x63xTNe+wKak
 Xx6dWcwRJm3xw7/UZCqYrny+116QI53k8Yt088jpmyzFcXwvipgkcANWT0tfDnzlVfrSNdb
 RKUeokDKK+S/Fg6xKUtqw==
UI-OutboundReport: notjunk:1;M01:P0:joFE9GD6R8I=;CAsbOcmgBWJwKCT1B59YyYWoa5a
 Es/Zbc2H5GnsiAnGqmfodfCKfnsQrEKdsJSuhXbXRqwoyvbRvXAf3IOfMcRd0/CX3Ehp39XsA
 yy1bB2VlaEfwVkSktR1IT2ufZpGaCR/Xy7fbsQ5H5ZBRmSwWgQ+nOlTeWM1hHyO+Uagy8bD6a
 Npg2NXfgF/Jgt3TzaPdvWLhavTSO2Inui25fBCq+xMjFowS8IdCccffVNJ6pCe3N56zGcAEJB
 wI1TQW9CXiIdzJ7VD7GsZAh61Gfck7HJdLKa4J8RtXXSPGO7qnhCSkz5KLydIAAjS8jSxa8fd
 sF8EKapXbIB3+PtdYNc3PEbP5bdyN3XOn/yiAdDZ4qU36vWJCE6sOJcwHqHh1cWgfRYainLNR
 kno4oaMtNuStkoGA8bDpas58boBh1f+y3/gP7myJNQvroJZXPhSBV/KauoiKjg+pxLy10NNuI
 jkLFVilkZYUULetGo9ETn2NXY3lpTukTJxkAdftJfJkvdd8sNJJSoCqzzH7rZPpNp/mbkHUhO
 ZG9O6oES8U4VMxoyHkyF4p6EM9L/OQ5npUchbm4o4ma1mn1HTkKLjLawIvN4VavUySwe8++kV
 tx5RDBtYE56uNReAbEzvCEGEMsCIx2Ah2785QajjAzVHVxJJrz9+0Fr5lYZ6WNcva5vfPZPBz
 2jZueSFR9m3T0imU3oaktBoLrQQn4QaVY5Ne97+PVtndt9IG9pJSVM7zmTpHHX+q6h8VZaiai
 thQhArS87CXaj7rXOhu0wGCLRtRvOWmKz9ppltxXUy01BSMRtWl+1rbvr4VBt/PCWh0/X4aub
 zD8xrVlT4Xl0B7MpI+y5W/3xjkAtZD2czSEU2H3fwdsMoFOFsGYyGIsq92X32EpX73owfTjpv
 pLF6B3viXqhLUQxLE961DgQD6DqWLXe/e8vJ6fgOuJABBg2z2x4JgbOLoZwaTjcP7ivWtYQHi
 fCA/yO4JZ4X1CkWEvNnGkzV+anAZzAzSehF1EaA59fjQzstMV/wEBf1jeYOR77/93jgOQ+nBq
 y35fJDRzdBdO/1T46J6fU4rqNDDqiBSscqPfnocG8mMjKRZTt2Y9aHUSocVWoxjFOd0Li1nMc
 nix7jZgr4ref6Lze1zyT2AXdWAxVb4t52lpWdqiEC7OGpreCrZtiz+WPZkw8DTVyWHqTqyn0Q
 PEv4m1ljYsU/amQIEbQs+ktjDunPVcUxG0tIBWxSOC59eGF1J7K9V10SgWBZHCPKKkNpLZA0d
 qeTWAa5+3/W87FrBFe8csXL0tFKsRrIf4OXeEKypAza4Mg0W7gsrPgEbb7RN8mQDqIi+aOB5+
 wFpVQ254LA+qKrlL4PsGktn/F0AE4uPjQOEryA+9DMU10iFKILGn/UFwYfDiFdKIaFoaqZ5c8
 m6BD5XUztMQ79YzjeA5PbPdEdqBcfAKqc1vtvZa5S32447VJicMTHf8pqGGCIXjk4tLK0fIL9
 vhSZAKz5aoYNP9vKQkYG+EF3RQEkHbmj5ayZg3+1CVGzfOjDe
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1744629610; x=1745234410; i=j.neuschaefer@gmx.net;
 bh=fESAOXe+kCNgLDWwzI4SRX5Ver5T9sYri9DmKOOQL9w=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=kaITV/GLTRJQdea/PPDfBCIY8W+faWwlYl4ZPaai4pwJ3MAgU03j2wHMWunC4d/f
 0vePUw+6HOnxKPMqNm4t1IowemJZjk0ZHCtp/cKV4PeeCkIj4jV+Vzf5M5tJKlt7M
 qGwzZFpVvZ3XdhORtaJXUHR9PdshOSGfNnooe71BHlsVi6Onqx0G0oQpxyZCiIzVc
 ScWvZc2bFC/Xc4wufVk75Q8yo34zhn/tejMztb7583IHnw9mohiqL0pvakhiza83m
 ahZVRKRr6FYvv9I+J+Bbvjx52OwYcxdKkThGYdecCP8t7o6MKlqlx03+n0PCDD6nV
 2LcP/KHp1REtnDSZdg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=kaITV/GL
Subject: [Buildroot] [PATCH v2 3/3] package/execline: remove -D_GNU_SOURCE
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
XAogCS0td2l0aC1keW5saWI9JChTVEFHSU5HX0RJUikvbGliIFwKCi0tCjIuNDguMC5yYzEuMjE5
LmdiNmI2NzU3ZDc3MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
