Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3D0C83F11
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 15:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE00181E81;
	Sun, 27 Aug 2023 15:00:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE00181E81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xpkoDx4HOn-w; Sun, 27 Aug 2023 15:00:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49AA28127C;
	Sun, 27 Aug 2023 15:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49AA28127C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0878A1BF5F5
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 15:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E36358127C
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 15:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E36358127C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EkWlpWrlVUow for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 15:00:27 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B5A58126A
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 15:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B5A58126A
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 540CC13F85F;
 Sun, 27 Aug 2023 17:00:20 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 27 Aug 2023 16:59:54 +0200
Message-ID: <20230827145956.3204254-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1693148424;
 bh=AxEktExxUarL/yUdmJGoALfTEeQSRFcDmAi0Ry0r5SI=;
 h=From:To:Cc:Subject:Date:From;
 b=LJDTKVLs+zSK4gFwCcieq/Se/nUPfYm9NrLwHaC95uv1ZrzOnrVZeuNLiCmx7/Up+
 Y0rIiIVAUZWFRD/4YwWxY1L7l8w1cyB0NiAp9XME8p+2vfqVDPBq488kNlx3hIn2Qj
 FSQC99VTp8lCKrkmAV1vFO3fylSwhPH4+M5ksq3e1KU2XFNa8Wu/HwHUYN+p092x7f
 oLfFg9IviyCXA+lT1AlDLndOjyYQisvwiSJRkxCG/uv2xlS/KsuezXzaxc2IYrOZkN
 CwpLTWyaNX8lsgroyMnQZyWPbFoFJR8W/odiyTZino57fSuVY4lnFcVv0/vNXYG66l
 Hp4lwf4NsJpxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LJDTKVLs
Subject: [Buildroot] [PATCH next 1/3] boot/edk2: bump to version
 edk2-stable202308
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
Cc: Julien Olivain <ju.o@free.fr>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIGNoYW5nZSBsb2cgc2luY2UgdmVyc2lvbiBlZGsyLXN0YWJsZTIwMjMwNSwgc2VlOgotIGh0
dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi9yZWxlYXNlcy90YWcvZWRrMi1zdGFibGUy
MDIzMDgKClRoZSBtYWluIG1vdGl2YXRpb25zIG9mIHRoaXMgYnVtcCBhcmUgdGhlIFJJU0MtViBR
RU1VIFZpcnQgc3VwcG9ydAppbXByb3ZlbWVudHMgKG5vdCB5ZXQgc3VwcG9ydGVkIGluIEJ1aWxk
cm9vdCkuCgpDYzogRGljayBPbHNzb24gPGhpQHNlbnppbGxhLmlvPgpDYzogVmluY2VudCBTdGVo
bMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFp
biA8anUub0BmcmVlLmZyPgotLS0KUGF0Y2ggc2VyaWVzIHRlc3RlZCBvbiBicmFuY2ggbmV4dCBh
dCBjb21taXQgN2IwMmNhOCB3aXRoIGNvbW1hbmRzOgoKICAgIG1ha2UgY2hlY2stcGFja2FnZQog
ICAgLi4uCiAgICAwIHdhcm5pbmdzIGdlbmVyYXRlZAoKICAgIG1ha2UgcWVtdV9hYXJjaDY0X3Ni
c2FfZGVmY29uZmlnCiAgICBtYWtlCiAgICBvdXRwdXQvaW1hZ2VzL3N0YXJ0LXFlbXUuc2gKCiAg
ICBzdXBwb3J0L3Rlc3RpbmcvcnVuLXRlc3RzIFwKICAgICAgICAtZCBkbCAtbyBvdXRwdXRfZm9s
ZGVyIFwKICAgICAgICB0ZXN0cy5ib290LnRlc3RfZWRrMgogICAgLi4uCiAgICBPSwoKICAgIHN1
cHBvcnQvdGVzdGluZy9ydW4tdGVzdHMgXAogICAgICAgIC1kIGRsIC1vIG91dHB1dF9mb2xkZXIg
XAogICAgICAgIHRlc3RzLmJvb3QudGVzdF9ncnViCiAgICAuLi4KICAgIE9LCgogICAgc3VwcG9y
dC90ZXN0aW5nL3J1bi10ZXN0cyBcCiAgICAgICAgLWQgZGwgLW8gb3V0cHV0X2ZvbGRlciBcCiAg
ICAgICAgdGVzdHMuZnMudGVzdF9pc285NjYwCiAgICAuLi4KICAgIE9LCi0tLQogYm9vdC9lZGsy
L2VkazIuaGFzaCB8IDIgKy0KIGJvb3QvZWRrMi9lZGsyLm1rICAgfCAyICstCiAyIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ib290
L2VkazIvZWRrMi5oYXNoIGIvYm9vdC9lZGsyL2VkazIuaGFzaAppbmRleCAzNGQ0YjEwZTI5Li4x
NzkxOGVlN2JiIDEwMDY0NAotLS0gYS9ib290L2VkazIvZWRrMi5oYXNoCisrKyBiL2Jvb3QvZWRr
Mi9lZGsyLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2
ICBjYTU1MzUxOTEzZTYyNThlYmQ4YzA4MTA2ZjM2OWFjNzEwNzNkOWNmYWE4MDQyN2ZjNWYxMzFi
MDZkODA4OTQwICBlZGsyLWVkazItc3RhYmxlMjAyMzA1LWJyMS50YXIuZ3oKK3NoYTI1NiAgOTM4
OWFkMjBiYzc1ZjJhOGZhOWU3YzFiMTk0OGVmMDc0ODFjOTRlOTZkZWM1N2FlMmY5ZjliZTljNzU0
ZjkyYyAgZWRrMi1lZGsyLXN0YWJsZTIwMjMwOC1icjEudGFyLmd6CiBzaGEyNTYgIDUwY2UyMGM5
Y2ZkYjBlMTllZTM0ZmUwYTUxZmMwYWZlOTYxZjc0MzY5N2IwNjgzNTlhYjJmODYyYjQ5NGRmODAg
IExpY2Vuc2UudHh0CmRpZmYgLS1naXQgYS9ib290L2VkazIvZWRrMi5tayBiL2Jvb3QvZWRrMi9l
ZGsyLm1rCmluZGV4IGY0OTI1OGVjYjUuLjE4Njg1NGExNGMgMTAwNjQ0Ci0tLSBhL2Jvb3QvZWRr
Mi9lZGsyLm1rCisrKyBiL2Jvb3QvZWRrMi9lZGsyLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotRURLMl9WRVJTSU9OID0gZWRrMi1zdGFibGUyMDIzMDUK
K0VESzJfVkVSU0lPTiA9IGVkazItc3RhYmxlMjAyMzA4CiBFREsyX1NJVEUgPSBodHRwczovL2dp
dGh1Yi5jb20vdGlhbm9jb3JlL2VkazIKIEVESzJfU0lURV9NRVRIT0QgPSBnaXQKIEVESzJfTElD
RU5TRSA9IEJTRC0yLUNsYXVzZS1QYXRlbnQKLS0gCjIuNDEuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
