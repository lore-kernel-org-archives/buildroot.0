Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9153C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 21:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65FB660B50;
	Mon, 14 Feb 2022 21:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hpt1PN-o5rgx; Mon, 14 Feb 2022 21:11:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7418C60B25;
	Mon, 14 Feb 2022 21:11:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6475F1BF275
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8A4781496
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m5I3uLsApXfD for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 21:10:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FD9D818C2
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 21:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1644873052;
 bh=SQesHluTumbJqfYx13Q/NfByW+vhcVmsDe23NSpfQjQ=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=KgJrsKRlXCgMHQPGrhIgmBQ5hTqOcIdIsEDOjcmUUvHNx2Z8cpsJ9fx8opgTn2FuF
 L0uFqLiscOKiWIhKngzsGkfRJuWqVbzAVamWMUY+x20SXNIc5mwlNxw2RpJRo1Vefp
 Df2GxcfEku6k3gcKDlJm+5rsmXihZZvQATKCEcHA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.232]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1McpNo-1nsEQQ08tG-00ZvL5 for <buildroot@buildroot.org>; Mon, 14 Feb 2022
 22:10:52 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 22:10:51 +0100
Message-Id: <20220214211051.22421-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214211051.22421-1-ps.report@gmx.net>
References: <20220214211051.22421-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:d71/Vkz4GMXKCno/RbvSvHnNadE1cqc0FT6Mvjj4auNVcwZp8VI
 w5m4tTsbw8jbEzWG+DT2xsqbd+YpH9LvW0Hum4D2Ougmn7xVeeaBCprjESRyJsZvZB3vVUd
 EyMxCtaW7kU0Z2+I9nM82yL4QT7Ah/7I6ghSneBFgA21gjKK7+7ncMGwCR/Lr1iITgMusDL
 uoR2RksiX0aFJYdKy3BUw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nUnmvDdtoq0=:NVQ9rF3BZ07Snw3Px6SG2r
 t5kje68UgFP8RlHw4TnRwWe3+jB1tE9e2h/vKSTL9Q0D/PFPEQCvUmNYmdGDaJXrtEtAxwKca
 nAnT4ilGcwgAr+P1rY9WXHw9NGygYhu5njPB5CXUHXzWRVR91O5m22JAbDDqio94Vg7KxwbTj
 w7lV15w+yob63hOA5iwvmIX8fv8eJsdZ2RPAPUOwoZdzWAiDn7QJWB4v32uK9b/CvD5j5/RCZ
 MX2F0DsIZPXTYDq3n2/swMZjUzEchoprJgsz8BMZ55+K7FPamEzq2tFfifpCFE27FZEsEFUTm
 LmHrVlhqu5YDaf6yF6FCywO1jAffisI4/nRfjI4NU4b/B2MEKBCKAZVPmctqFfTtDoIphVFNg
 X453c1ysxw0ailZa8UioIKfa486mcWMqqXgfm5EQYYnQQrcwqxxzv22x2TnsKNtkvlPckEeyc
 r8A8BKGV8SiDaIWDPtF/hThPegV/2qgBu8S0i2cL5lzAMFyvG+mWii8er8j/pNrKUPtMUqwAP
 zaPUEPa2KD8KuH/3uRPFln2J6z4rFnDPNHcBo0KuIsgONfN60xJIk4xc6NTx9gN0SdusDn9S1
 6L4GQ9BbrX6v20Op0LQ6J6U85lXAoADUse5RzdUGDROebZQ8+sWObTphiM7uDPmsn6w1qmycV
 VsF2EgqUPq84ajzlom8eHV2ZmcI2XiBggN2FKl3pemQSKVg2aoiE2uSFO/jDRXywwIW3c28pE
 AeZlugIkwiIh1dCm7keyQ2QETUwY/I3otYyLdIAARWTwBqgVRxG1mYifQ5CLGoTUe2ZA12Ixb
 Mb6PUilLRb7wic32BJwNS4s7sWrKIlJD1BRhq0JCye3/VhPayLfj49cwvi3xzbaznm3BA9qfM
 RyTvkCjdgqJVAlG7wW922tDCRryRHGYEO3kEEeE610bFjdMhzW4npmjYtRDmcsBcAmMLNth/4
 LZ7SnLhdQHrTCLl+gfZaKoLgfblxIGWdvLHLJdqX5G38YYlDErnjrGcfYlVLATdgsg7f+ItXl
 ChGLJmoqpJpTMXZBc7vx1saIZwldRnpKAftcZAhXCJxZ6O5ACm7cQOahFyS8X+fLIrjONlYU5
 S/0ko5Ftmb6f+w=
Subject: [Buildroot] [PATCH v1 2/2] package/iwd: bump version to 1.24
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSByZW1vdmUgMDAxLWRwcC1maXgtaW1wbGljaXQtZGVjbGFyYXRpb24tb2YtZnVuY3Rpb24tZXhw
bGljaXRfYnoucGF0Y2gKICAodXBzdHJlYW0gYXBwbGllZCBbMV0pCgotIENoYW5nZWxvZyAoc2lu
Y2UgMS4yMSwgZnJvbSBbMl0pOgoKICB2ZXIgMS4yNDoKICAgIEZpeCBpc3N1ZSB3aXRoIGhhbmRz
aGFrZSBhbmQgbWlzc2luZyByZWtleWluZyBzdXBwb3J0LgogICAgRml4IGlzc3VlIHdpdGggQlNT
IHJhbmtpbmcgYW5kIHplcm8gc2lnbmFsIHN0cmVuZ3RoLgogICAgRml4IGlzc3VlIHdpdGggc2V0
dGluZyBPV0UgSUUgbGVuZ3RoIGNvcnJlY3RseS4KCiAgdmVyIDEuMjM6CiAgICBGaXggaXNzdWUg
d2l0aCBoYW5kbGluZyBoYW5kc2hha2Ugb2ZmbG9hZGluZy4KICAgIEZpeCBpc3N1ZSB3aXRoIGF0
X2NvbnNvbGUgYW5kIEQtQnVzIHBvbGljeS4KCiAgdmVyIDEuMjI6CiAgICBGaXggaXNzdWUgd2l0
aCBoYW5kbGluZyBwZXJpb2RpYyBzY2FubmluZy4KICAgIEZpeCBpc3N1ZSB3aXRoIGhhbmRsaW5n
IHNjYW5uaW5nIGNvbXBsZXRpb24uCiAgICBGaXggaXNzdWUgd2l0aCBoYW5kbGluZyBzY2Fubmlu
ZyBmb3IgT1dFIGF1dG8tY29ubmVjdC4KICAgIEFkZCBzdXBwb3J0IGZvciBhZGRpdGlvbmFsIERQ
UCBmZWF0dXJlcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbmV0d29yay93
aXJlbGVzcy9pd2QuZ2l0L2NvbW1pdC8/aWQ9NmNlNDFmNjIxMTU0ZWZmMDE0NWRhYjQxMzA4YmMx
NDVjMDQ0MGYxNgpbMl0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL25ldHdvcmsvd2ly
ZWxlc3MvaXdkLmdpdC90cmVlL0NoYW5nZUxvZwoKU2lnbmVkLW9mZi1ieTogUGV0ZXIgU2VpZGVy
ZXIgPHBzLnJlcG9ydEBnbXgubmV0PgotLS0KIC4uLi1kZWNsYXJhdGlvbi1vZi1mdW5jdGlvbi1l
eHBsaWNpdF9iei5wYXRjaCB8IDQxIC0tLS0tLS0tLS0tLS0tLS0tLS0KIHBhY2thZ2UvaXdkL2l3
ZC5oYXNoICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBwYWNrYWdlL2l3ZC9pd2Qu
bWsgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDQzIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvaXdkLzAwMDEtZHBwLWZpeC1pbXBsaWNpdC1kZWNsYXJhdGlvbi1vZi1mdW5jdGlvbi1leHBs
aWNpdF9iei5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvaXdkLzAwMDEtZHBwLWZpeC1pbXBs
aWNpdC1kZWNsYXJhdGlvbi1vZi1mdW5jdGlvbi1leHBsaWNpdF9iei5wYXRjaCBiL3BhY2thZ2Uv
aXdkLzAwMDEtZHBwLWZpeC1pbXBsaWNpdC1kZWNsYXJhdGlvbi1vZi1mdW5jdGlvbi1leHBsaWNp
dF9iei5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggM2U4MDhkZWI4OC4uMDAw
MDAwMDAwMAotLS0gYS9wYWNrYWdlL2l3ZC8wMDAxLWRwcC1maXgtaW1wbGljaXQtZGVjbGFyYXRp
b24tb2YtZnVuY3Rpb24tZXhwbGljaXRfYnoucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0MSAr
MCwwIEBACi1Gcm9tIDZjZTQxZjYyMTE1NGVmZjAxNDVkYWI0MTMwOGJjMTQ1YzA0NDBmMTYgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdt
eC5uZXQ+Ci1EYXRlOiBNb24sIDEwIEphbiAyMDIyIDIyOjMyOjE4ICswMTAwCi1TdWJqZWN0OiBb
UEFUQ0hdIGRwcDogZml4IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIGV4cGxpY2l0
X2J6ZXJvCi0gd2FybmluZwotTUlNRS1WZXJzaW9uOiAxLjAKLUNvbnRlbnQtVHlwZTogdGV4dC9w
bGFpbjsgY2hhcnNldD1VVEYtOAotQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAotCi0t
IGFkZCBtaXNzaW5nIHNyYy9taXNzaW5nLmggaW5jbHVkZSBmb3IgZXhwbGljaXRfYnplcm8sIGZp
eGVzIHVjbGliYwotICBjb21waWxlL2xpbmtpbmcKLQotRml4ZXM6Ci0KLSAgc3JjL2RwcC5jOjE2
NjoyOiB3YXJuaW5nOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhleHBsaWNp
dF9iemVyb+KAmSBbLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KLSAgICAxNjYgfCAg
ZXhwbGljaXRfYnplcm8oZHBwLT5yX25vbmNlLCBkcHAtPm5vbmNlX2xlbik7Ci0gICAgICAgIHwg
IF5+fn5+fn5+fn5+fn5+Ci0KLVtiYWNrcG9ydCBmcm9tIHVwc3RyZWFtXQotU2lnbmVkLW9mZi1i
eTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PgotW3lhbm4ubW9yaW4uMTk5OEBm
cmVlLmZyOiBhY3R1YWwgYmFja3BvcnQgbm93IHVwc3RyZWFtbiBhcHBsaWVkXQotU2lnbmVkLW9m
Zi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Ci0tLS0KLSBzcmMv
ZHBwLmMgfCAxICsKLSAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKLQotZGlmZiAtLWdp
dCBhL3NyYy9kcHAuYyBiL3NyYy9kcHAuYwotaW5kZXggODRlODlmNmMuLjgwOTFkZWQxIDEwMDY0
NAotLS0tIGEvc3JjL2RwcC5jCi0rKysgYi9zcmMvZHBwLmMKLUBAIC0zMCw2ICszMCw3IEBACi0g
Ci0gI2luY2x1ZGUgImxpbnV4L25sODAyMTEuaCIKLSAKLSsjaW5jbHVkZSAic3JjL21pc3Npbmcu
aCIKLSAjaW5jbHVkZSAic3JjL2RidXMuaCIKLSAjaW5jbHVkZSAic3JjL25ldGRldi5oIgotICNp
bmNsdWRlICJzcmMvbW9kdWxlLmgiCi0tLSAKLTIuMzQuMQotCmRpZmYgLS1naXQgYS9wYWNrYWdl
L2l3ZC9pd2QuaGFzaCBiL3BhY2thZ2UvaXdkL2l3ZC5oYXNoCmluZGV4IDhlMzRkMjk4M2YuLjFh
NThlYzg4ZTggMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvaXdkL2l3ZC5oYXNoCisrKyBiL3BhY2thZ2Uv
aXdkL2l3ZC5oYXNoCkBAIC0xLDUgKzEsNSBAQAogIyBGcm9tIGh0dHBzOi8vbWlycm9ycy5lZGdl
Lmtlcm5lbC5vcmcvcHViL2xpbnV4L25ldHdvcmsvd2lyZWxlc3Mvc2hhMjU2c3Vtcy5hc2MKLXNo
YTI1NiAgYmFjODkxZGY5MWM2MDUyNzFlOTFiNzNjZjAwMTVlMWJhODZmZjc4NDM0N2U1M2ZjNjc2
MDEzNjY4NTliMzg1MSAgaXdkLTEuMjEudGFyLnh6CitzaGEyNTYgIDYxYjVlNDgzODBjZDNhNmQw
NTI5ZjcyNWViNjk3NDE1N2YxNDEwYWYxNjVmNWQyNjZiODdhZGQwYmYzOTUyMjQgIGl3ZC0xLjI0
LnRhci54egogCiAjIExpY2Vuc2UgZmlsZXMKIHNoYTI1NiAgZWM2MGI5OTM4MzVlMmM2Yjc5ZTZk
OTIyNjM0NWY0ZTYxNGU2ODZlYjU3ZGMxM2I2NDIwYzE1YTMzYTg5OTZlNSAgQ09QWUlORwpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9pd2QvaXdkLm1rIGIvcGFja2FnZS9pd2QvaXdkLm1rCmluZGV4IGE3
MGRhODZlY2MuLjU0OGI1MDhlZGIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvaXdkL2l3ZC5taworKysg
Yi9wYWNrYWdlL2l3ZC9pd2QubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwogCi1JV0RfVkVSU0lPTiA9IDEuMjEKK0lXRF9WRVJTSU9OID0gMS4yNAogSVdEX1NP
VVJDRSA9IGl3ZC0kKElXRF9WRVJTSU9OKS50YXIueHoKIElXRF9TSVRFID0gJChCUjJfS0VSTkVM
X01JUlJPUikvbGludXgvbmV0d29yay93aXJlbGVzcwogSVdEX0xJQ0VOU0UgPSBMR1BMLTIuMSsK
LS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
