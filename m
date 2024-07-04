Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5380DC3271F
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 19:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EE3884723;
	Thu,  4 Jul 2024 19:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KygCzX18WPgq; Thu,  4 Jul 2024 19:45:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E62B84725
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E62B84725;
	Thu,  4 Jul 2024 19:45:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C12AF1BF2C1
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD798405E6
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lFGUy_wmIK3H for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 19:45:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0CC4A404C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CC4A404C5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CC4A404C5
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 19:45:43 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MqaxU-1s3Gdh2Soq-00pR2u; Thu, 04
 Jul 2024 21:40:37 +0200
Date: Thu, 04 Jul 2024 21:40:27 +0200
MIME-Version: 1.0
Message-Id: <20240704-tipidee-v1-1-5ef0942b2025@gmx.net>
References: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
In-Reply-To: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720122036; l=1162;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=BJSiYLeecrISifAXilZX07ptnm+/RZN3tYrqBE9lfAo=;
 b=5CbtxNWnDu1886Vqj20mfg8EhFJ26CkuULhkguLHRzXoIpl7t5vlqXnT219jOVacEZgA4jxej
 tN0K3e/WAQ9AqfCUPoWpVkT2BNODSslwE5fnD+Yb7s34qI4sdNwa9wd
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:iA0G6o2FSMgUkgiWDCclHbdtj0I4erRCeDgVumC54mlekcid7Ab
 Yd+cmGuwJDmcvK8F3Tg26tij0eJzwv8b5yE7EgrRCFTV5FMfi204WH5ULWOyxaYqVWI0MSD
 HPl7w9NEa11Zub5afKAt+8y44P/azA1v7pxvBFPOuCO8lRq9c+7D2Erk1xV+URf54AyShir
 mFOM5o9E762Bjp7w6MZKA==
UI-OutboundReport: notjunk:1;M01:P0:wszjz+rl8AM=;B+ywTMgOaCzgrjeeH9W3UgUZTn+
 +E3tkI5HnR9RRs9vaRBIYGwZh2ogpCYgY4jvIy2j6h0xkdoUcr+yQ30XKulEnL736DE+pDti3
 lbGc7HMsaaf5kpv25cCGIT0yOZ+leiv+dHbPHGHQrsEL5A5eJgX7n/ORnXKBLJ5obubMjt3EW
 jsM+pwAWHBwhzsamU8pWVxOSJzqUoc0ykI2WJOL2OezzHF8E101Bajr8g/dCm3bSXccSd1vFp
 yyUfwg3rn6bpKyTyVox7fi2YGmUXDC7y15ODjhBZabb44YbaUeF37mjDqpxBpGtNi+Fkfsah2
 J0Gl8y/z8Z+fQcBI6suZD7HklumJHaBPZaTkuc0HaQQHNnEoABO0D+yBLUMQF1BXT02gLudea
 RY5BD/qVOIzqfVE2ktY6szKi396NJ3Gnr/qQIQFCnNz638gcSDJa/SpORyNBjFyD5eSAR1qpz
 XX0HIx5JkVTiucdSxVwCc/CRb76SniIp/Ww6NtSU06hLa1lS9Mz3wiGq/qUe6Dx5rM+y2INaY
 SeOlK2WA0Scce3iuK0UmibWfCoEPv/LjdyjjYcsNhGu8rvwNc3NGONAAa3k+ao+NEXzmkIvUV
 a+GC58/Tp6VazPHaU4kdDyOdarG2Y5Bjg1ogMVLq5vRNxkkW12cL5UKvj3VtSPoNBQQrOSSiQ
 L6SF0vJmbbH/FTVqt8hIZdSCSrPTeixaUf7Ud/WtWSFmnsgdiSEYgV3rIulM2qYgdCQ9TnaNY
 8UVDTJDYlwcZKH2g8UUZnn/7tKS/Bhv1ZtKlTs/GjYU4FTp+jidMWto6nhfjbPJ3qbPI5SSf2
 oHCgyhwhur3+kfrz34TC85VPPSuVqJcguLyv9JsBzAspU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720122342; x=1720727142; i=j.neuschaefer@gmx.net;
 bh=myinIF/2v7RkkFqfyQg0OhRVt5kpLFckuE8ewkTADI4=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=da4R9ebrO4hF9ZFyXQJ0Pcfowzo8ni8X2RxddteCv8nblGC2lhZrnZQ0XHUDOUQd
 OFrUAgrgVJDGlQp8bl0wFHqJ2gWVmt5sWuP6FG4xQqkQ5vKFtnkvzC/GVj8zwEmtW
 kgCUTKSuA9BA6tsupyPg+CX15F3Rmuh8hL8HePrA6kKLjLnHEO4FcvPSQKeMHs6Dd
 WoOJWnGjFsWIQA2AHqA1WyZhLa/CAxl2Y+X3a2kSAdA9vaUibGzHg0XJjwPXMGu6n
 dsLcivah5dpWVLLnN2c4ZVyUnEXjm4QIzbtH75ybweVYycil+ZWlfQS4tVo6ude+D
 VdaO27MBf1WScPnDTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=da4R9ebr
Subject: [Buildroot] [PATCH 1/8] skalibs: bump to version 2.14.2.0
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KLS0t
CiBwYWNrYWdlL3NrYWxpYnMvc2thbGlicy5oYXNoIHwgMiArLQogcGFja2FnZS9za2FsaWJzL3Nr
YWxpYnMubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc2thbGlicy9za2FsaWJzLmhhc2ggYi9w
YWNrYWdlL3NrYWxpYnMvc2thbGlicy5oYXNoCmluZGV4IGQ4NzFlZTY1MDMuLjFlNmJkOTY2NzEg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc2thbGlicy9za2FsaWJzLmhhc2gKKysrIGIvcGFja2FnZS9z
a2FsaWJzL3NrYWxpYnMuaGFzaApAQCAtMSwzICsxLDMgQEAKICMgTG9jYWxseSBnZW5lcmF0ZWQK
LXNoYTI1NiAgYjZiNzliODE2ZjRiYTBiNjgwMTY3NmIwZWQ0MTc5YjU5YzhjNzgwOWVlZmZlMjZk
YjY3MmU0MDQ2MzZiZWZjMyAgc2thbGlicy0yLjE0LjEuMS50YXIuZ3oKK3NoYTI1NiAgZGRmZWM1
NzMwZTViMmYxOWQwMzgxZWNmN2Y3OTZiMzlhNmU0NzMyMzZiZGEwYWQ4ZDM3NzZhM2ZlN2IwN2U0
MyAgc2thbGlicy0yLjE0LjIuMC50YXIuZ3oKIHNoYTI1NiAgZmRjOTMxMjk1NTI1ZGQwMDA5Y2Rm
MzM5MTg5Y2JlY2QyMjhkNjVjZWZlMzM0MDJmMDM3ZjliMDQ2ZjA3OTg5ZSAgQ09QWUlORwpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9za2FsaWJzL3NrYWxpYnMubWsgYi9wYWNrYWdlL3NrYWxpYnMvc2th
bGlicy5tawppbmRleCA2N2UzYzY5NGZjLi40NWYzZTE1YTdiIDEwMDY0NAotLS0gYS9wYWNrYWdl
L3NrYWxpYnMvc2thbGlicy5taworKysgYi9wYWNrYWdlL3NrYWxpYnMvc2thbGlicy5tawpAQCAt
NCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCgotU0tBTElCU19WRVJTSU9O
ID0gMi4xNC4xLjEKK1NLQUxJQlNfVkVSU0lPTiA9IDIuMTQuMi4wCiBTS0FMSUJTX1NJVEUgPSBo
dHRwczovL3NrYXJuZXQub3JnL3NvZnR3YXJlL3NrYWxpYnMKIFNLQUxJQlNfTElDRU5TRSA9IElT
QwogU0tBTElCU19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwoKLS0KMi40My4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
