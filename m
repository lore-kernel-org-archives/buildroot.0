Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B08C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 15:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4AB6404B0;
	Tue,  7 Feb 2023 15:36:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4AB6404B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Q3HtTcLBNtr; Tue,  7 Feb 2023 15:36:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D147840448;
	Tue,  7 Feb 2023 15:36:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D147840448
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BFA571BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 15:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6E6C60FE6
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 15:36:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6E6C60FE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GYHPWeLaSc_q for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 15:36:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B90560F93
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6B90560F93
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 15:36:50 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id 3B1FCFF812;
 Tue,  7 Feb 2023 15:36:44 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: buildroot@buildroot.org,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Date: Tue,  7 Feb 2023 16:36:20 +0100
Message-Id: <20230207-host-python-libuuid-v1-1-de34da87efd8@theobroma-systems.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailer: b4 0.11.2
Subject: [Buildroot] [PATCH] package/python3: use pure python UUID backend
 for host variant
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
Cc: Quentin Schulz <foss+buildroot@0leil.net>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogUXVlbnRpbiBTY2h1bHogPHF1ZW50aW4uc2NodWx6QHRoZW9icm9tYS1zeXN0ZW1zLmNv
bT4KCmhvc3QtcHl0aG9uMyBjdXJyZW50bHkgZG9lcyBub3QgYnVpbGQgaWYgdXRpbC1saW51eC11
dWlkIG9wdGlvbiBpcyBub3QKZW5hYmxlZCwgZmFpbGluZyB3aXRoIHRoZSBmb2xsb3dpbmcgZXJy
b3IgbWVzc2FnZXM6CiIiIgovdXNyL2xpYjY0L2NjYWNoZS9nY2MgLWZQSUMgLVdzaWduLWNvbXBh
cmUgLUROREVCVUcgLWcgLWZ3cmFwdiAtTzMgLVdhbGwgLU8yIC1JL2hvbWUvcXNjaHVsei93b3Jr
L3Vwc3RyZWFtL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9pbmNsdWRlIC1zdGQ9YzExIC1XZXh0cmEg
LVduby11bnVzZWQtcGFyYW1ldGVyIC1Xbm8tbWlzc2luZy1maWVsZC1pbml0aWFsaXplcnMgLVdz
dHJpY3QtcHJvdG90eXBlcyAtV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uIC1m
dmlzaWJpbGl0eT1oaWRkZW4gLUkuL0luY2x1ZGUvaW50ZXJuYWwgLUkuL0luY2x1ZGUgLUkuIC1J
L2hvbWUvcXNjaHVsei93b3JrL3Vwc3RyZWFtL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9pbmNsdWRl
IC1JL3Vzci9sb2NhbC9pbmNsdWRlIC1JL2hvbWUvcXNjaHVsei93b3JrL3Vwc3RyZWFtL2J1aWxk
cm9vdC9vdXRwdXQvYnVpbGQvaG9zdC1weXRob24zLTMuMTEuMS9JbmNsdWRlIC1JL2hvbWUvcXNj
aHVsei93b3JrL3Vwc3RyZWFtL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvaG9zdC1weXRob24zLTMu
MTEuMSAtYyAvaG9tZS9xc2NodWx6L3dvcmsvdXBzdHJlYW0vYnVpbGRyb290L291dHB1dC9idWls
ZC9ob3N0LXB5dGhvbjMtMy4xMS4xL01vZHVsZXMvX3V1aWRtb2R1bGUuYyAtbyBidWlsZC90ZW1w
LmxpbnV4LXg4Nl82NC0zLjExL2hvbWUvcXNjaHVsei93b3JrL3Vwc3RyZWFtL2J1aWxkcm9vdC9v
dXRwdXQvYnVpbGQvaG9zdC1weXRob24zLTMuMTEuMS9Nb2R1bGVzL191dWlkbW9kdWxlLm8KL2hv
bWUvcXNjaHVsei93b3JrL3Vwc3RyZWFtL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQvaG9zdC1weXRo
b24zLTMuMTEuMS9Nb2R1bGVzL191dWlkbW9kdWxlLmM6IEluIGZ1bmN0aW9uIOKAmHB5X3V1aWRf
Z2VuZXJhdGVfdGltZV9zYWZl4oCZOgovaG9tZS9xc2NodWx6L3dvcmsvdXBzdHJlYW0vYnVpbGRy
b290L291dHB1dC9idWlsZC9ob3N0LXB5dGhvbjMtMy4xMS4xL01vZHVsZXMvX3V1aWRtb2R1bGUu
YzoyNzoxMjogZXJyb3I6IHN0b3JhZ2Ugc2l6ZSBvZiDigJh1dWkg4oCZIGlzbuKAmXQga25vd24K
ICAgMjcgfCAgICAgdXVpZF90IHV1aWQ7CiAgICAgIHwgICAgICAgICAgICBefn5+Ci9ob21lL3Fz
Y2h1bHovd29yay91cHN0cmVhbS9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2hvc3QtcHl0aG9uMy0z
LjExLjEvTW9kdWxlcy9fdXVpZG1vZHVsZS5jOjMxOjExOiBlcnJvcjogaW1wbGljaXQgZGVjbGFy
YXRpb24gb2YgZnVuY3Rpb24g4oCYdXVpZF9nZW5lcmF0ZV90aW1lX3NhZmXigJk7IGRpZCB5b3Ug
bWVhbiDigJhweV91dWlkX2dlbmVyYXRlX3RpbWVfc2FmZeKAmT8gWy1XZXJyb3I9aW1wbGljaXQt
ZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgIDMxIHwgICAgIHJlcyA9IHV1aWRfZ2VuZXJhdGVfdGlt
ZV9zYWZlKHV1aWQpOwogICAgICB8ICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fgog
ICAgICB8ICAgICAgICAgICBweV91dWlkX2dlbmVyYXRlX3RpbWVfc2FmZQovaG9tZS9xc2NodWx6
L3dvcmsvdXBzdHJlYW0vYnVpbGRyb290L291dHB1dC9idWlsZC9ob3N0LXB5dGhvbjMtMy4xMS4x
L01vZHVsZXMvX3V1aWRtb2R1bGUuYzoyNzoxMjogd2FybmluZzogdW51c2VkIHZhcmlhYmxlIOKA
mHV1aWTigJkgWy1XdW51c2VkLXZhcmlhYmxlXQogICAyNyB8ICAgICB1dWlkX3QgdXVpZDsKICAg
ICAgfCAgICAgICAgICAgIF5+fn4KL2hvbWUvcXNjaHVsei93b3JrL3Vwc3RyZWFtL2J1aWxkcm9v
dC9vdXRwdXQvYnVpbGQvaG9zdC1weXRob24zLTMuMTEuMS9Nb2R1bGVzL191dWlkbW9kdWxlLmM6
NDc6MTogd2FybmluZzogY29udHJvbCByZWFjaGVzIGVuZCBvZiBub24tdm9pZCBmdW5jdGlvbiBb
LVdyZXR1cm4tdHlwZV0KICAgNDcgfCB9CiAgICAgIHwgXgpjYzE6IHNvbWUgd2FybmluZ3MgYmVp
bmcgdHJlYXRlZCBhcyBlcnJvcnMKClRoZSBuZWNlc3NhcnkgYml0cyB0byBidWlsZCB0aGVzZSBv
cHRpb25hbCBtb2R1bGVzIHdlcmUgbm90IGZvdW5kOgpfZGJtICAgICAgICAgICAgICAgICBfZ2Ri
bSAgICAgICAgICAgICAgICBfdGtpbnRlcgpuaXMgICAgICAgICAgICAgICAgICByZWFkbGluZQpU
byBmaW5kIHRoZSBuZWNlc3NhcnkgYml0cywgbG9vayBpbiBzZXR1cC5weSBpbiBkZXRlY3RfbW9k
dWxlcygpIGZvciB0aGUgbW9kdWxlJ3MgbmFtZS4KClRoZSBmb2xsb3dpbmcgbW9kdWxlcyBmb3Vu
ZCBieSBkZXRlY3RfbW9kdWxlcygpIGluIHNldHVwLnB5IGhhdmUgbm90CmJlZW4gYnVpbHQsIHRo
ZXkgYXJlICpkaXNhYmxlZCogYnkgY29uZmlndXJlOgpfY3R5cGVzX3Rlc3QgICAgICAgICBfc3Fs
aXRlMyAgICAgICAgICAgICBfdGVzdGJ1ZmZlcgpfdGVzdGNhcGkgICAgICAgICAgICBfdGVzdGlt
cG9ydG11bHRpcGxlICAgX3Rlc3RpbnRlcm5hbGNhcGkKX3Rlc3RtdWx0aXBoYXNlICAgICAgX3h4
dGVzdGZ1enoKCkZhaWxlZCB0byBidWlsZCB0aGVzZSBtb2R1bGVzOgpfdXVpZAoiIiIKClRoZXJl
Zm9yZSwgbGV0J3MgZGlzYWJsZSBidWlsZGluZyB0aGUgX3V1aWQgZXh0ZW5zaW9uIHRoZSBzYW1l
IHdheSBpdCdzCmRvbmUgZm9yIHRoZSB0YXJnZXQgcGFja2FnZSBzaW5jZSBjb21taXQgMGI2ODcx
M2FhZTI4ICgicHl0aG9uMzogdXNlCnB1cmUgcHl0aG9uIFVVSUQgYmFja2VuZCIpLgoKQ2M6IFF1
ZW50aW4gU2NodWx6IDxmb3NzK2J1aWxkcm9vdEAwbGVpbC5uZXQ+ClNpZ25lZC1vZmYtYnk6IFF1
ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekB0aGVvYnJvbWEtc3lzdGVtcy5jb20+Ci0tLQpP
bmx5IGJ1aWxkIHRlc3RlZCB3aXRoIG1ha2UgaG9zdC1weXRob24zIHdpdGggcmFzcGJlcnJ5cGk0
X2RlZmNvbmZpZyBjb25maWd1cmF0aW9uLgotLS0KIHBhY2thZ2UvcHl0aG9uMy9weXRob24zLm1r
IHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3B5dGhvbjMvcHl0aG9uMy5tayBiL3BhY2thZ2UvcHl0aG9uMy9weXRob24zLm1rCmluZGV4
IDIxOWQxMzViM2YuLmZiNmRiZjJlNjQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uMy9weXRo
b24zLm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uMy9weXRob24zLm1rCkBAIC0zMSw2ICszMSw3IEBA
IEhPU1RfUFlUSE9OM19DT05GX09QVFMgKz0gXAogCS0tZW5hYmxlLXVuaWNvZGVkYXRhIFwKIAkt
LWRpc2FibGUtdGVzdC1tb2R1bGVzIFwKIAktLWRpc2FibGUtaWRsZTMgXAorCS0tZGlzYWJsZS11
dWlkIFwKIAktLWRpc2FibGUtb3NzYXVkaW9kZXYKIAogIyBNYWtlIHN1cmUgdGhhdCBMRF9MSUJS
QVJZX1BBVEggb3ZlcnJpZGVzIC1ycGF0aC4KCi0tLQpiYXNlLWNvbW1pdDogMjZkZDcwZTk1NGE3
YzkxNDJiMDc4ODM3YWIxYmJmYWQ1NGQwZTVjYgpjaGFuZ2UtaWQ6IDIwMjMwMjA3LWhvc3QtcHl0
aG9uLWxpYnV1aWQtZDYwMGQzMmY3MGFlCgpCZXN0IHJlZ2FyZHMsCi0tIApRdWVudGluIFNjaHVs
eiA8cXVlbnRpbi5zY2h1bHpAdGhlb2Jyb21hLXN5c3RlbXMuY29tPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
