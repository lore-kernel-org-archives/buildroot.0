Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD86C001DE
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 21:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D50E4025F;
	Wed,  9 Aug 2023 21:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D50E4025F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0V8cAcvv-Klj; Wed,  9 Aug 2023 21:52:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEBC1417E0;
	Wed,  9 Aug 2023 21:52:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEBC1417E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C2C41BF28A
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4072B40223
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 21:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4072B40223
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "Content-Type"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qqi8H60l3ntG for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 21:52:26 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8F33400D9
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 21:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8F33400D9
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.171]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MhlGq-1pqPby2HQG-00dkWl; Wed, 09 Aug 2023 23:52:22 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 23:52:21 +0200
Message-ID: <20230809215221.29965-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Ypn/QixqHBsLb1kLYKOTysSpxqgX2skuF3wheLDJAjCpUrpcaXQ
 Cr4ygSiFOe9X10totb44NsggwjHDGj6rbSHSN1FI3urbwEKbthX/YEnkJ5FPtvwmZe2iJoq
 DNPP9PAjJXzaoz0McCKCSY7wvdSOC1pbMdV3E3eLRC5N2lFIADLuHqcV3w7U17h7uQTFm14
 Y27X7mj++OasmmWvhKpwA==
UI-OutboundReport: notjunk:1;M01:P0:efCEWoSOpGw=;HScvHHNDHLhQlJPiiWN6FNnlAMj
 kmvgP5AlgLSXpIMwRXfzjlo3MUqzyP69IERXcRtUpDEmSwOSN0BJSrqi8nb9CsdgqHtmBDfMS
 kzdUtd+hAnqLwWej5kP4pWv+C+2zfwlib+aKxSFgSloqzmlNdnyXl5KJE/asj2JHEv9PgkUJj
 meEqNvA+dcpOPPtstlnu6931mvE1CzIOOTigj554WGyeGwYJT33KLY9cUOmbyqyCyVyNMsnwM
 +xkOQIpz+JhuOIo5Hl5g9B7aOaaiAvRDjmNdVnIm2ywGz6fFYfcTxC+f2uqVWYTorGJIVtbYQ
 cv/z4+cgi+x0LPOeyiDqQukyLlZBNYIm7RXyEadOgN5mlo6sRip/h0I3QFKTzZ4e0LhOX1xmC
 zbc4v8/dV3l3M0rOQcpwB2jlzJwPonvy8nCy4HREW9NAuLE8gL9PrsEtyqrBSgx578OityIDN
 E8oy+VBNRA8o1OnZFd9K9XWchKP1tce03E3UMlZpsV8MRdld4RJSQ39n/my8Zguh29800D0IB
 zAldwyL/+z9IyAVh6Y+yXyvwGW7VAxt9gXzWRDrAsoTcIn39eFxp2+BOmILAeU1OQ1eOv0i/Q
 7g+CFcHyJNx6XtSFjqLV893aSLScz+heAgWsB87JTX2j6RWeupGTNK3Og/pt6absXrN5MzovU
 wKvYRF+YeTnjJilu/5Y5w/XTdh1Sj0MHEpITO9CtTb91cxTb/fFKgx5I13JHTor1O18puolXr
 qOvnDLHExqUf83iOwXFZIpUkXbdDmgeYv7q6G90xZFEF6QSvcm/dj8IalBXj7oSyhXBj7hvNz
 1GIPhZoCY2ZXzFwUnS5MFw7RV+ALvStuLM0BoAGB/t3NDUh2Yd0i5CB1xMRwMDCl0UR/k0BZC
 3wsV5fx7P2ru1lJPh6uqut4xikdwydIYs2eInsI4Lkq/x6pblxgeds1H54dLnQAWNTTPnLCNM
 Cs49NxuSFRfEFWyGBiQvfDiUiTA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1691617942; x=1692222742; i=ps.report@gmx.net;
 bh=c/pl+iz8NY17EIs4S1hcSmzpmU9EvmfKguEqHCi5wQg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=VXUhqQ4M8Lfuu1+0w1VoR1i+sk7CUQjf0B2zAV0W9/DGUJGoIDWaFhdDZ8NpiPQ8b7xUvBm
 lShSI466Ohp9x7wjt1tXoUsl1Bl7TmZ/8O28/TR2csFiUHW23hdXTX8y7ibgunBeAG+RY+iMD
 cry+74iCc06M1ORmuDRWG/upubBqNpOHF/8XEQG4LC3YlzsITipKxAfaHzZhjkq6dTFz6o5Jm
 FnaWJjuhEKRWwlkw+a0fba/rc6GquXNshCRZkOdMMcFzdSN5a1cX4T7RXqb/9MRWoMy6Dl9Ft
 Y4TOInuuqvd9bhKr/vU7LeWdtGOFyNmsF0oxwdynFjyBAhQ1A9GQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=VXUhqQ4M
Subject: [Buildroot] [PATCH v1] package/libserial: fix gcc-13.x compile (add
 patch to add missing cstdint include)
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
Cc: Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIHBhdGNoIHRha2VuIGZyb20gdXBzdHJlYW0gcHVsbCByZXF1ZXN0IChbMV0pIHRvIGZpeCBn
Y2MtMTMueCBjb21waWxlCmZhaWx1cmUgYmVjYXVzZSBvZiBhIG1pc3NpbmcgY3NkdGludCBpbmNs
dWRlLgoKRml4ZXM6CgogIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBsaWJzZXJpYWwvU2VyaWFsU3Ry
ZWFtQnVmLmg6MzYsCiAgICAgICAgICAgICAgICAgICBmcm9tIFNlcmlhbFN0cmVhbUJ1Zi5jcHA6
MzQ6CiAgLi9saWJzZXJpYWwvU2VyaWFsUG9ydENvbnN0YW50cy5oOjkzOjM3OiBlcnJvcjog4oCY
dWludDhfdOKAmSB3YXMgbm90IGRlY2xhcmVkIGluIHRoaXMgc2NvcGUKICAgICA5MyB8ICAgICB1
c2luZyBEYXRhQnVmZmVyID0gIHN0ZDo6dmVjdG9yPHVpbnQ4X3Q+IDsKICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn4KClsxXSBodHRwczovL2dpdGh1
Yi5jb20vY3JheXplZXd1bGYvbGlic2VyaWFsL3B1bGwvMTg2CgpTaWduZWQtb2ZmLWJ5OiBQZXRl
ciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Ci0tLQogLi4uc2luZy1jc3RkaW50LWhlYWRl
ci1mb3ItdWludDhfdC10eXBlLnBhdGNoIHwgMjggKysrKysrKysrKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xp
YnNlcmlhbC8wMDAzLUFkZC1taXNzaW5nLWNzdGRpbnQtaGVhZGVyLWZvci11aW50OF90LXR5cGUu
cGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnNlcmlhbC8wMDAzLUFkZC1taXNzaW5nLWNz
dGRpbnQtaGVhZGVyLWZvci11aW50OF90LXR5cGUucGF0Y2ggYi9wYWNrYWdlL2xpYnNlcmlhbC8w
MDAzLUFkZC1taXNzaW5nLWNzdGRpbnQtaGVhZGVyLWZvci11aW50OF90LXR5cGUucGF0Y2gKbmV3
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uY2FmMDJkODRmNwotLS0gL2Rldi9u
dWxsCisrKyBiL3BhY2thZ2UvbGlic2VyaWFsLzAwMDMtQWRkLW1pc3NpbmctY3N0ZGludC1oZWFk
ZXItZm9yLXVpbnQ4X3QtdHlwZS5wYXRjaApAQCAtMCwwICsxLDI4IEBACitGcm9tIGI0YWUzMzEz
ZmIzMTNiNmFjYjdmNzAxZDg5OGY4MzQxMzNmNWJkNTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tOiBKdXNzaSA8anVzc2kuaGlldGFuZW5AaWtpLmZpPgorRGF0ZTogTW9uLCAzIEp1bCAy
MDIzIDE1OjU5OjA3ICswMzAwCitTdWJqZWN0OiBbUEFUQ0hdIEFkZCBtaXNzaW5nIGNzdGRpbnQg
aGVhZGVyIGZvciB1aW50OF90IHR5cGUKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNl
dD0idXRmLTgiCitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK1Vwc3RyZWFtOiBo
dHRwczovL2dpdGh1Yi5jb20vY3JheXplZXd1bGYvbGlic2VyaWFsL2NvbW1pdC8zYjUwYmMyYjc0
NjRlZDUyN2QxNzA5YjVjN2JhODY2ODhlNmFhM2VjCitTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlk
ZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+CistLS0KKyBzcmMvbGlic2VyaWFsL1NlcmlhbFBvcnRD
b25zdGFudHMuaCB8IDEgKworIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQorCitkaWZm
IC0tZ2l0IGEvc3JjL2xpYnNlcmlhbC9TZXJpYWxQb3J0Q29uc3RhbnRzLmggYi9zcmMvbGlic2Vy
aWFsL1NlcmlhbFBvcnRDb25zdGFudHMuaAoraW5kZXggNGYwNWJkNS4uODhkY2EwYiAxMDA2NDQK
Ky0tLSBhL3NyYy9saWJzZXJpYWwvU2VyaWFsUG9ydENvbnN0YW50cy5oCisrKysgYi9zcmMvbGli
c2VyaWFsL1NlcmlhbFBvcnRDb25zdGFudHMuaAorQEAgLTMzLDYgKzMzLDcgQEAKKyAKKyAjcHJh
Z21hIG9uY2UKKyAKKysjaW5jbHVkZSA8Y3N0ZGludD4KKyAjaW5jbHVkZSA8bGltaXRzPgorICNp
bmNsdWRlIDxzdGRleGNlcHQ+CisgI2luY2x1ZGUgPHN0cmluZz4KKy0tIAorMi40MS4wCisKLS0g
CjIuNDEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
