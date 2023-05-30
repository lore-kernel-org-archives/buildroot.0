Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82B3C77B7A
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 20:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EC9160F17;
	Tue, 30 May 2023 20:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EC9160F17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uQ06dT1NKSHv; Tue, 30 May 2023 20:08:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7566660EF1;
	Tue, 30 May 2023 20:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7566660EF1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A4D91BF284
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 20:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1410660E65
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 20:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1410660E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 64naEOKC_lC8 for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 20:07:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AA5460E5E
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4AA5460E5E
 for <buildroot@buildroot.org>; Tue, 30 May 2023 20:07:58 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.2.119])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 10FB5200588;
 Tue, 30 May 2023 22:07:52 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 30 May 2023 22:07:28 +0200
Message-Id: <20230530200728.12239-3-ju.o@free.fr>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530200728.12239-1-ju.o@free.fr>
References: <20230530200728.12239-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1685477277;
 bh=PzWhmxtgNPf93v9FfmKunN2QXka5P1c0Xq5dnwYLkOQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gOyX+gvyBSHV+NmempXKT4Y81oRtTgaCFStI2ryhL+NSc3mWwzkuzdxI2C+Jus/fs
 VTP32EBm1RPqc3hlAQ6CkdBcc6ViUaOqtX/eAY2YrkT4TPcyYZ/OqsR/B4Pj2e57aa
 HXOBeguhLyyb0L4oYvfpLigdUPHBq1o8FL/ZqIOfaFwy5Ak2vvHXPgSa8mtfIdPPrE
 PFH+wsmSQQCesRDBDh7oddSSqJ4hseh6/JjBgPgCG27BIqGwynx8NhIDo4HcTbs1rv
 V5IsAkJcLV9Lwz+K9ofqVbHAXAmpPvwaUv+pmiOXmhaFjg6ZniGX3aSJLHkDXWm45L
 ur3pbgEUg2V0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gOyX+gvy
Subject: [Buildroot] [PATCH 3/3] package/edk2-non-osi: bump in sync with
 edk2-stable202305
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

QnVtcCB0aGUgZWRrMi1ub24tb3NpIGNvbW1pdCB0byB0aGUgb25lIGNvcnJlc3BvbmRpbmcgdG8g
dmVyc2lvbgplZGsyLXN0YWJsZTIwMjMwNSBvZiBlZGsyLCBiYXNlZCBvbiB0aGUgdGltZXN0YW1w
cy4KCkNjOiBEaWNrIE9sc3NvbiA8aGlAc2VuemlsbGEuaW8+CkNjOiBWaW5jZW50IFN0ZWhsw6kg
PHZpbmNlbnQuc3RlaGxlQGFybS5jb20+ClNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxq
dS5vQGZyZWUuZnI+Ci0tLQogcGFja2FnZS9lZGsyLW5vbi1vc2kvZWRrMi1ub24tb3NpLmhhc2gg
fCAyICstCiBwYWNrYWdlL2VkazItbm9uLW9zaS9lZGsyLW5vbi1vc2kubWsgICB8IDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvZWRrMi1ub24tb3NpL2VkazItbm9uLW9zaS5oYXNoIGIvcGFja2FnZS9lZGsy
LW5vbi1vc2kvZWRrMi1ub24tb3NpLmhhc2gKaW5kZXggNzk0MWRmMWYyZi4uMjU5MzMyNGJjMSAx
MDA2NDQKLS0tIGEvcGFja2FnZS9lZGsyLW5vbi1vc2kvZWRrMi1ub24tb3NpLmhhc2gKKysrIGIv
cGFja2FnZS9lZGsyLW5vbi1vc2kvZWRrMi1ub24tb3NpLmhhc2gKQEAgLTEsMyArMSwzIEBACiAj
IExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICA3ZDI3YjFlNmQ5MGEyNmYzNTg1YWI1OGEyZTA1
MWRhNjllYWUxYjk3NzU0ZDNlMmQ4MGE1MzcyODc5YWUyNTAxICBlZGsyLW5vbi1vc2ktNjE2NjJl
ODU5NmRkOWE2NGUzMzcyZjlhM2JhNjYyMmQyNjI4NjA3Yy50YXIuZ3oKK3NoYTI1NiAgYzA0ODEw
MWQ2NTMyZDliYjRmNjQ1MDA5NWUwYjUwODEyZDlhODMxZjdlM2MxMTlkYjQ4ZTVjYWYyYmYwMjBh
NiAgZWRrMi1ub24tb3NpLTQxODc2MDczYWZiN2M3MzA5MDE4MjIzYmFhMWE2ZjgxMDhiZjIzZjAu
dGFyLmd6CiBzaGEyNTYgIDM4ZDczZGIyZjlkZmIzMmUxNjY2ZDg5OGNiOWQ3YzFjY2Q3ODMwMmRk
OTkyMmQ1ZmFjNGE5Y2Y2MWZhODcyZDkgIFNpbGljb24vTWFydmVsbC9Bcm1hZGE3azhrL0Rldmlj
ZVRyZWUvQXJtYWRhODB4ME1jQmluLmluZgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9lZGsyLW5vbi1v
c2kvZWRrMi1ub24tb3NpLm1rIGIvcGFja2FnZS9lZGsyLW5vbi1vc2kvZWRrMi1ub24tb3NpLm1r
CmluZGV4IDBhYmIzNzcwYzcuLjExMDM3NzI3NjggMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZWRrMi1u
b24tb3NpL2VkazItbm9uLW9zaS5taworKysgYi9wYWNrYWdlL2VkazItbm9uLW9zaS9lZGsyLW5v
bi1vc2kubWsKQEAgLTUsNyArNSw3IEBACiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCiAjIEtl
ZXAgaW4gc3luYyB3aXRoIGxhdGVzdCBjb21taXQgYXMgb2YgdGhlIHJlbGVhc2UgZGF0ZSBmb3Ig
Ym9vdC9lZGsyCi1FREsyX05PTl9PU0lfVkVSU0lPTiA9IDYxNjYyZTg1OTZkZDlhNjRlMzM3MmY5
YTNiYTY2MjJkMjYyODYwN2MKK0VESzJfTk9OX09TSV9WRVJTSU9OID0gNDE4NzYwNzNhZmI3Yzcz
MDkwMTgyMjNiYWExYTZmODEwOGJmMjNmMAogRURLMl9OT05fT1NJX1NJVEUgPSAkKGNhbGwgZ2l0
aHViLHRpYW5vY29yZSxlZGsyLW5vbi1vc2ksJChFREsyX05PTl9PU0lfVkVSU0lPTikpCiBFREsy
X05PTl9PU0lfSU5TVEFMTF9UQVJHRVQgPSBOTwogRURLMl9OT05fT1NJX0lOU1RBTExfU1RBR0lO
RyA9IFlFUwotLSAKMi40MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
