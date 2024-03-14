Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4E3C54E5D
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 16:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42FF460586;
	Thu, 14 Mar 2024 16:17:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3wijqBE2XhAc; Thu, 14 Mar 2024 16:17:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C56B60597
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C56B60597;
	Thu, 14 Mar 2024 16:17:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7203C1BF3A6
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 16:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FAC54179C
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 16:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QXDy5ZUV0AOf for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 16:17:17 +0000 (UTC)
X-Greylist: delayed 333 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 14 Mar 2024 16:17:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D05824178D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D05824178D
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.154.239.219;
 helo=forward202c.mail.yandex.net; envelope-from=leo@yuriev.ru;
 receiver=<UNKNOWN> 
Received: from forward202c.mail.yandex.net (forward202c.mail.yandex.net
 [178.154.239.219])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D05824178D
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 16:17:15 +0000 (UTC)
Received: from forward103c.mail.yandex.net (forward103c.mail.yandex.net
 [IPv6:2a02:6b8:c03:500:1:45:d181:d103])
 by forward202c.mail.yandex.net (Yandex) with ESMTPS id BF27B67ECB
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 19:11:48 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-46.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-46.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:28d:0:640:8410:0])
 by forward103c.mail.yandex.net (Yandex) with ESMTPS id 7C9FA60AC9
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 19:11:36 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-46.myt.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id ZBr4QhWmBuQ0-90iW2rsU; 
 Thu, 14 Mar 2024 19:11:35 +0300
X-Yandex-Fwd: 1
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Date: Thu, 14 Mar 2024 19:11:13 +0300
Message-ID: <20240314161116.714877-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; 
 t=1710432696; bh=jEBBX4Iy7KAKERR5YrwSlcwffzJgC65aWIK69SkRNKo=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=B2bQCaTH9Nc3h+XppNfVs+JM5n3mBW2G3SQlenD4ETXNPjpaP7bfbBqL5z6x7nW31
 2aF+ixGr9p9ixUB4K671IBcCX1HlqVrxGa0QTz81KIanK9IEr6t9jCaHBHgFx1NEtH
 LZrS/cIHOffc6E/IcitRRB6761qunT9CmEn2lm/Y=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yuriev.ru
X-Mailman-Original-Authentication-Results: mail-nwsmtp-smtp-production-main-46.myt.yp-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.12.10 "SEM"
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
Cc: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C?=
 =?UTF-8?q?=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?= <leo@yuriev.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBpcyBidWdmaXggcmVsZWFzZSBvZiBzdGFibGUgbGlibWRieCBicmFuY2gsIGluIG1lbW9y
eSBvZiB0aGUgSGVybwpvZiBSdXNzaWEgR3VhcmQgTWFqb3IgRG1pdHJ5IFNlbWVub3Ygd2l0aCB0
aGUgY2FsbCBzaWduICJTRU0iLgoKSXQgaXMgcmVhc29uYWJsZSB0byBiYWNrcG9ydCB0aGlzIHBh
dGNoIHRvIGFsbCBhcHBsaWNhYmxlIHJlbGVhc2VzL2JyYW5jaGVzIG9mIEJ1aWxkcm9vdC4KClRo
ZSBtb3N0IHNpZ25pZmljYW50IGZpeGVzIHNpbmNlIHYwLjEyLjggKHByZXZpb3VzIHZlcnNpb24g
cGlubmVkIHRvIGJ1aWxkcm9vdCk6CgogLSBGaXhlZCBhbiBtYWpvciBidWcgaW5oZXJpdGVkIGZy
b20gTE1EQiAoTGlnaHRuaW5nIE1lbW9yeS1NYXBwZSBEYXRhYmFzZSkKICAgdGhhdCBjYXVzZXMg
ZGF0YWJhc2UgY29ycnVwdGlvbiBkdXJpbmcgdXNlIHRoZSBNREJYX0RVUEZJWEVEIG1vZGUuCiAg
IEluIExNREIsIHRoZSBwcm9ibGVtIGhhcyBleGlzdGVkIGZvciBtb3JlIHRoYW4gMTAgeWVhcnMg
YW5kIGlzIHN0aWxsCiAgIHByZXNlbnQgKGFzIHdlbGwgYXMgbW9yZSB0aGFuIGEgZG96ZW4gb3Ro
ZXIgYnVnIGFuZCBzaG9ydGNvbWluZ3MKICAgZml4ZWQgaW4gbGlibWRieCkuCgogLSBGaXhlZCBv
ZiBhIGZhbHNlIGVycm9yIE1EQlhfQ09SUlVQVEVEICgtMzA3OTYpIGluIHRoZSBzY2VuYXJpbyBv
ZgogICB3b3JraW5nIGluIHRoZSBtb2RlIE1EQlhfRFVQRklYRUQgd2l0aCBvZGQgbGVuZ3RoIG9m
IG11bHRpLXZhbHVlcy4KCiAtIEZpeGVkIGEgYnVnIGluIGFkanVzdGluZyB0aGUgY3Vyc29ycyBp
biB0aGUgY2FzZSBzcGxpdHRpbmcgYSBwYWdlIGJ5CiAgIGFkZGluZyBhIG5ldyBwYWdlIG9uIHRo
ZSBsZWZ0LgoKIC0gVHJvdWJsZXNob290aW5nIGFuIGVycm9yIHdoZW4gb3BlbmluZyBhIGRhdGFi
YXNlIG9uIGEgcmVhZC1vbmx5IGZpbGUgc3lzdGVtLgoKIC0gQSBzZXQgb2YgQysrIEFQSSBpbXBy
b3ZlbWVudHM6CgogICAgLSBhZGRlZCB0aGUgbWRieDo6Y3Vyc29yOjplc3RpbWF0aW9uX3Jlc3Vs
dCB0eXBlLCBhbmQgdGhlIGJlaGF2aW9yCiAgICAgIG9mIG1ldGhvZHMgY3Vyc29yOjplc3RpbWF0
ZSgpIGlzIHVuaWZpZWQgd2l0aCBjdXJzb3I6Om1vdmUoKTsKCiAgICAtIHRvIHByZXZlbnQgdW5u
b3RpY2VhYmxlIGluY29ycmVjdCB1c2Ugb2YgdGhlIEFQSSwgZm9yIGluaXRpYWxpemluZwogICAg
ICBzbGljZXMgcmV0dXJuZWQgYnkgcmVmZXJlbmNlIHRoZSBzbGljZTo6aW52YWxpZCgpIGlzIHVz
ZWQsIGluc3RlYWQgb2YKICAgICAgZW1wdHkgc2xpY2VzOwoKICAgIC0gYWRkZWQgYWRkaXRpb25h
bCBDKysgY29udmVyc2lvbiBvcGVyYXRvcnMgdG8gQyBBUEkgdHlwZXM7CgogICAgLSB0eXBlcyBi
dWZmZXI6Om1vdmVfYXNzaWduX2FsbG9jIGFuZCBidWZmZXI6OmNvcHlfYXNzaWduX2FsbG9jIGFy
ZSBwdWJsaWMKICAgICAgbm93IGZvciBjb21wYXRpYmlsaXR5IHdpdGggb2xkZXIgQysrIHN0YW5k
YXJkcyBhbmQgb2xkZXIgU1RMIHZlcnNpb25zOwoKICAgIC0gYWRkZWQgYSBuZXcgbWRieDo6ZGVm
YXVsdF9idWZmZXIgdHlwZTsKCiAgICAtIGFkZGVkIG1ldGhvZHMgZm9yIHNsaWNlcyBhbmQgYnVm
ZmVycyBoZXhfZGVjb2RlKCksIGJhc2U2NF9kZWNvZGUoKSwKICAgICAgYmFzZTU4X2RlY29kZSgp
OwoKICAgIC0gYWRkZWQgdHlwZSBtZGJ4Ojpjb21wYXJhdG9yKCkgYW5kIG1kYng6OmRlZmF1bHRf
Y29tcGFyYXRvcigpIGZ1bmN0aW9uczsKCiAgICAtIGFkZGVkIHN0YXRpYyBtZXRob2RzIGJ1ZmZl
cjo6aGV4KCksIGJ1ZmZlcjo6YmFzZTY0KCksIGJ1ZmZlcjo6YmFzZTU4KCk7CgogICAgLSBhZGRl
ZCBtZXRob2RzIGZvciB0cmFuc2FjdGlvbnMgYW5kIGN1cnNvcnMgZ2V0L3NldF9jb250ZXh0KCk7
CgogICAgLSBhZGRlZCB0aGUgY3Vyc29yOjpjbG9uZSgpIG1ldGhvZDsKCiAgICAtIGltcGxlbWVu
dGF0aW9uIG9mIGJhc2U1OCBub3cgaXMgaW4gYWNjb3JkYW5jZSB3aXRoIHRoZSBSRkMgZHJhZnQu
CgpUaGUgY29tcGxldGUgQ2hhbmdlTG9nOiBodHRwczovL2dpdGZsaWMucnUvcHJvamVjdC9lcnRo
aW5rL2xpYm1kYngvYmxvYj9maWxlPUNoYW5nZUxvZy5tZAoKU2lnbmVkLW9mZi1ieTog0JvQtdC+
0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYpIDxsZW9AeXVyaWV2LnJ1PgotLS0KIHBh
Y2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2ggfCAyICstCiBwYWNrYWdlL2xpYm1kYngvbGlibWRi
eC5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaCBiL3BhY2th
Z2UvbGlibWRieC9saWJtZGJ4Lmhhc2gKaW5kZXggODJjZjI4ZDZhOS4uMWRiZGVmN2M2OSAxMDA2
NDQKLS0tIGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaAorKysgYi9wYWNrYWdlL2xpYm1k
YngvbGlibWRieC5oYXNoCkBAIC0xLDUgKzEsNSBAQAogIyBIYXNoZXMgZnJvbTogaHR0cHM6Ly9s
aWJtZGJ4LmRxZGtmYS5ydS9yZWxlYXNlL1NIQTI1NlNVTVMKLXNoYTI1NiAgYzc4YzU2YzUzNzA4
YmJmYzUxOWJmNTNlYmY1MjBkMWYwOWQzMGVlNjQyN2E0YmVkZjcxMzMxNjY5NmU2NzFkMCAgbGli
bWRieC1hbWFsZ2FtYXRlZC0wLjEyLjgudGFyLnh6CitzaGEyNTYgIDQ2MzdlMDY3NjhhOWE4ZmM3
NTc3ZTZlNDU4ZTA0NWFkMWY5YThiYWVlNzQ5OTZhM2M4OGJjMGFkNjRjYmNmNjcgIGxpYm1kYngt
YW1hbGdhbWF0ZWQtMC4xMi4xMC50YXIueHoKIAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKIHNoYTI1
NiAgMzEwZmUyNWM4NThhOTUxNWZjOGM4ZDdkMWYyNGE2N2M5NDk2Zjg0YTkxZTBhMGU0MWVhOTk3
NWIxMzcxZTU2OSAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYngu
bWsgYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5tawppbmRleCA0Y2M2Y2JkMDhlLi42ZTA1NzFm
ZjI0IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5taworKysgYi9wYWNrYWdl
L2xpYm1kYngvbGlibWRieC5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCiAKLUxJQk1EQlhfVkVSU0lPTiA9IDAuMTIuOAorTElCTURCWF9WRVJTSU9OID0gMC4x
Mi4xMAogTElCTURCWF9TT1VSQ0UgPSBsaWJtZGJ4LWFtYWxnYW1hdGVkLSQoTElCTURCWF9WRVJT
SU9OKS50YXIueHoKIExJQk1EQlhfU0lURSA9IGh0dHBzOi8vbGlibWRieC5kcWRrZmEucnUvcmVs
ZWFzZQogTElCTURCWF9TVVBQT1JUU19JTl9TT1VSQ0VfQlVJTEQgPSBOTwotLSAKMi40My4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
