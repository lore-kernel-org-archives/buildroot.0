Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B204CC83F11
	for <buildroot@archiver.kernel.org>; Sun, 27 Aug 2023 15:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C90E81EAF;
	Sun, 27 Aug 2023 15:00:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C90E81EAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zjuD-_3g_mYl; Sun, 27 Aug 2023 15:00:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DC7D81EAC;
	Sun, 27 Aug 2023 15:00:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DC7D81EAC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 683BB1BF5F5
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 15:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4254D812D0
 for <buildroot@lists.busybox.net>; Sun, 27 Aug 2023 15:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4254D812D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3_qBiBDJdl36 for <buildroot@lists.busybox.net>;
 Sun, 27 Aug 2023 15:00:37 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DCF08127C
 for <buildroot@buildroot.org>; Sun, 27 Aug 2023 15:00:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DCF08127C
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 842B913F8BB;
 Sun, 27 Aug 2023 17:00:31 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 27 Aug 2023 16:59:56 +0200
Message-ID: <20230827145956.3204254-3-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230827145956.3204254-1-ju.o@free.fr>
References: <20230827145956.3204254-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1693148435;
 bh=6YQAfanEBYuneBb+kqKX+lf+vhycaAewDMxnXU/b650=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dce+CixqiVoc2OMrJCatt0ttguF2Y5J4BUNV+9kUouY776TTCIkRvJboheUyhlfc6
 4+qOKTiiGfgF8MbRI1Cy7dMCfKCU0q0WSnNoOP25VVSjFIk3UuvoGW2jC+Oh4VJAbF
 b83vInLe7KltFWOHUtfDOYswfcZFXdUekkPgul3L7WlbOax1qZDbsCwgPGknD+VE3u
 SVuoStiYLDV3pSRMMXFP2uN/5oR1a2Y/mKY9NjOlQPrNjAcXnH+phlbqJFvUwc1NX9
 1W/P3PYzbpACv1qsz8aZIM8ZkGlQ+IZVUtpor+jqiZG4n4HtpjJpmc6askQwrrGm23
 uaJqcflWquOCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Dce+Cixq
Subject: [Buildroot] [PATCH next 3/3] package/edk2-non-osi: bump in sync
 with edk2-stable202308
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
dmVyc2lvbgplZGsyLXN0YWJsZTIwMjMwOCBvZiBlZGsyLCBiYXNlZCBvbiB0aGUgdGltZXN0YW1w
cy4KCkNjOiBEaWNrIE9sc3NvbiA8aGlAc2VuemlsbGEuaW8+CkNjOiBWaW5jZW50IFN0ZWhsw6kg
PHZpbmNlbnQuc3RlaGxlQGFybS5jb20+ClNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxq
dS5vQGZyZWUuZnI+Ci0tLQogcGFja2FnZS9lZGsyLW5vbi1vc2kvZWRrMi1ub24tb3NpLmhhc2gg
fCAyICstCiBwYWNrYWdlL2VkazItbm9uLW9zaS9lZGsyLW5vbi1vc2kubWsgICB8IDIgKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvZWRrMi1ub24tb3NpL2VkazItbm9uLW9zaS5oYXNoIGIvcGFja2FnZS9lZGsy
LW5vbi1vc2kvZWRrMi1ub24tb3NpLmhhc2gKaW5kZXggMjU5MzMyNGJjMS4uZTRlODRmMWNlZiAx
MDA2NDQKLS0tIGEvcGFja2FnZS9lZGsyLW5vbi1vc2kvZWRrMi1ub24tb3NpLmhhc2gKKysrIGIv
cGFja2FnZS9lZGsyLW5vbi1vc2kvZWRrMi1ub24tb3NpLmhhc2gKQEAgLTEsMyArMSwzIEBACiAj
IExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICBjMDQ4MTAxZDY1MzJkOWJiNGY2NDUwMDk1ZTBi
NTA4MTJkOWE4MzFmN2UzYzExOWRiNDhlNWNhZjJiZjAyMGE2ICBlZGsyLW5vbi1vc2ktNDE4NzYw
NzNhZmI3YzczMDkwMTgyMjNiYWExYTZmODEwOGJmMjNmMC50YXIuZ3oKK3NoYTI1NiAgNmZlMDU5
YzRlZTVkNGZhZDYyNDVhNmViNTNlZDZiNjJiODg5MGU5NDgxY2ZiNTJjOWZiZGI4M2E1YjJlMGVk
YiAgZWRrMi1ub24tb3NpLThjMDliZDA5NTUzMzhkYjM4ODEzZTBkOGFlMWZhYTYzNGY1NDVmNzMu
dGFyLmd6CiBzaGEyNTYgIDM4ZDczZGIyZjlkZmIzMmUxNjY2ZDg5OGNiOWQ3YzFjY2Q3ODMwMmRk
OTkyMmQ1ZmFjNGE5Y2Y2MWZhODcyZDkgIFNpbGljb24vTWFydmVsbC9Bcm1hZGE3azhrL0Rldmlj
ZVRyZWUvQXJtYWRhODB4ME1jQmluLmluZgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9lZGsyLW5vbi1v
c2kvZWRrMi1ub24tb3NpLm1rIGIvcGFja2FnZS9lZGsyLW5vbi1vc2kvZWRrMi1ub24tb3NpLm1r
CmluZGV4IDExMDM3NzI3NjguLmQ3ODdjODgyYjMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZWRrMi1u
b24tb3NpL2VkazItbm9uLW9zaS5taworKysgYi9wYWNrYWdlL2VkazItbm9uLW9zaS9lZGsyLW5v
bi1vc2kubWsKQEAgLTUsNyArNSw3IEBACiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCiAjIEtl
ZXAgaW4gc3luYyB3aXRoIGxhdGVzdCBjb21taXQgYXMgb2YgdGhlIHJlbGVhc2UgZGF0ZSBmb3Ig
Ym9vdC9lZGsyCi1FREsyX05PTl9PU0lfVkVSU0lPTiA9IDQxODc2MDczYWZiN2M3MzA5MDE4MjIz
YmFhMWE2ZjgxMDhiZjIzZjAKK0VESzJfTk9OX09TSV9WRVJTSU9OID0gOGMwOWJkMDk1NTMzOGRi
Mzg4MTNlMGQ4YWUxZmFhNjM0ZjU0NWY3MwogRURLMl9OT05fT1NJX1NJVEUgPSAkKGNhbGwgZ2l0
aHViLHRpYW5vY29yZSxlZGsyLW5vbi1vc2ksJChFREsyX05PTl9PU0lfVkVSU0lPTikpCiBFREsy
X05PTl9PU0lfSU5TVEFMTF9UQVJHRVQgPSBOTwogRURLMl9OT05fT1NJX0lOU1RBTExfU1RBR0lO
RyA9IFlFUwotLSAKMi40MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
