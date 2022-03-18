Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE53DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 13:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5D3F605B7;
	Fri, 18 Mar 2022 13:11:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d7lNodDIiU37; Fri, 18 Mar 2022 13:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7CB760736;
	Fri, 18 Mar 2022 13:11:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC21B1BF27E
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 13:11:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C91464051E
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 13:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vU7UQRABGl_x for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 13:11:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8CF6640123
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 13:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647609059;
 bh=+y7J+rfXTdpN7+jST9ZxpwK+lT5QyNRI13Gehj4873o=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=KRsY7Ng6VrTUen6b1JaZf6W8PjxoxI1Vz4B3RVXz4cqffXHMQcPzmUtBCtkOyn11m
 9NdjxwIR2NpS4V6DnHtH2UOD6K+1tu5da62uhbgOoxJ1THrBb3SpEfUpqFJHHI+ElZ
 tuH9n3aHXjrOrv6kOsw45XrCQFzqdfYnpH14tCtE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.203]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MTRMs-1nfCmN2C1E-00Tj8T for <buildroot@buildroot.org>; Fri, 18 Mar 2022
 14:10:59 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 14:10:58 +0100
Message-Id: <20220318131058.32240-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318131058.32240-1-ps.report@gmx.net>
References: <20220318131058.32240-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ymvnnIjU4RIHFC279K+0PHnZ3GfaANISNGqJXsZxAWIJFzuW8/w
 UzjAmIEK1tHJHxEPilpTycJatNJYQTxZj9cWZsmWrGKKLIiCamgv2snvmjla3z4xpQF2EX/
 kExEeB2vepyda3lx2saaooh5cso8oDmAcxKJPNfXbR5Oe9LsCMDP7tNOvbPeAm23+SlAUXn
 5yLiMHSYETuv1K7/PMPZQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:KC9AVLFQBNg=:Z3ZBu2ZaClgGCk4vfZsKbr
 zKmGIT9ADoyzfFonqSDg7brAPFT/EuEqPOr9qpvfWlmRSaIXabXZUNN8phnwepoZrtYeQ/hwj
 SAPph/aJLdYrYtCCSJ80mmjLaW0lMWnl4Q1Oi3vosK//p5VcSKfQfukFau0NqS2/COMHnGXTa
 XzDOxAxMwYtcnAceb79V6Pzi37ZbcqVI7Ntqbaa5ucGNXmxAjBx3D5BgF48cYDSq1NixjVMdD
 uPRu7ZPOH6WjYIuw9joGgMRYUad0Iq9fNy6icZjSsVKXFiIGclkYTZMqc2tZ1pfC2Jg8Bdc7M
 +vmSusTgtq0M/kyglVOcY2IDQDBc6fw8YEzdVL5iXX8SVt/yN2WZgG0uL+7mWZirIpuCbLB6i
 PivX/7ZHFO/VG2XHQbK429UkJ6BwhL31J3fi5QUUgeaAspl75AqDusYQQpx2jpbw7tBk1lKgm
 6jXSxkMNV4Li+CZRmVwsM1G5T4s1BxIUlxugG9nOOgKX+EclIlWq08MB7aKo01o3pt1VQ8J4P
 rVxn9oKooITL128rnzt+2uBPOSW90SvHvKMDrvHxM7GYBgV9a+CTMdkWaCCWCHWlC/lBH77Lj
 MOQWT7RIa0E8vLdR4TmrYHC0HtP4bcsWvj0QtDR9rPNiN0CFZt2/s2OSBLx2yj3lq5hGamtvB
 /JYqYappSdCRanShwEjFqQxaa9LuQfkuv9argLp/FN83EM45J3esMnKOS+7g5uhmVKAgmlv8w
 CvXGuhX9KVGUk3o8KJFelQhzG7kEhWwNayjyTdiYBks7ecQOkywPwILKHfwOHUviUTcG1vOHx
 /vFFynT5ti7GnrKWVJML8mmmyZE34TYOz99e63+Au3QAo5JPzxH4xvUKLhMr/K99jVzdVKJfJ
 hj+9PLr3Bs6zP4OjdbDyO3CMiNGzEmx3N+SEl4wLLn9Nl4glda1P0GB7w0un/51SvAxLzrHie
 qm99kjR/MO+GMEpLmQLtDK82pTe+6XOOq8xhIL2e4nDZz0PpVHKl1dgIdeojw7hSYDYkw/Ke/
 i9Azbj2VT1pkBGMYD6T4d4sK5aTGy+/ePhgZONyOA2hV0Nt4E7cGbALOZddy9TTxwKAcI4Vbb
 mPB1SdI8vM7TQM=
Subject: [Buildroot] [PATCH v1 2/2] package/libcamera-apps: add
 '-fpermissive' (fixes X11 preview compile)
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

LSBhZGQgcGF0Y2ggdG8gYWRkICctZnBlcm1pc3NpdmUnIGNvbXBpbGVyIGNvbW1hbmQgbGluZSBv
cHRpb24gdG8gZml4CiAgZWdsX3ByZXZpZXcuY3BwIGNvbXBpbGUKCkZpeGVzOgoKICAuLi4vYnVp
bGQvbGliY2FtZXJhLWFwcHMtMmQxMDA5ZTNiYWRjYzgwNDczNjFmZjgxMTQ5YWQ2Y2JhM2I5MTFi
NS9wcmV2aWV3L2VnbF9wcmV2aWV3LmNwcDozMjk6Njk6IGVycm9yOiBpbnZhbGlkIGNvbnZlcnNp
b24gZnJvbSDigJhXaW5kb3figJkge2FrYSDigJhsb25nIHVuc2lnbmVkIGludOKAmX0gdG8g4oCY
RUdMTmF0aXZlV2luZG93VHlwZeKAmSB7YWthIOKAmGZiZGV2X3dpbmRvdyrigJl9IFstZnBlcm1p
c3NpdmVdCiAgICAzMjkgfCAgICAgICAgIGVnbF9zdXJmYWNlXyA9IGVnbENyZWF0ZVdpbmRvd1N1
cmZhY2UoZWdsX2Rpc3BsYXlfLCBjb25maWcsIHdpbmRvd18sIE5VTEwpOwogICAgICAgIHwgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBefn5+fn5+CiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKICAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgV2luZG93IHtha2EgbG9uZyB1bnNpZ25lZCBpbnR9CgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBT
ZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Ci0tLQogLi4ubWlzc2l2ZS1jb21waWxlci1jb21t
YW5kLWxpbmUtb3B0aW9uLnBhdGNoIHwgMzcgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDM3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmNh
bWVyYS1hcHBzLzAwMDItY21ha2UtYWRkLWZwZXJtaXNzaXZlLWNvbXBpbGVyLWNvbW1hbmQtbGlu
ZS1vcHRpb24ucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmNhbWVyYS1hcHBzLzAwMDIt
Y21ha2UtYWRkLWZwZXJtaXNzaXZlLWNvbXBpbGVyLWNvbW1hbmQtbGluZS1vcHRpb24ucGF0Y2gg
Yi9wYWNrYWdlL2xpYmNhbWVyYS1hcHBzLzAwMDItY21ha2UtYWRkLWZwZXJtaXNzaXZlLWNvbXBp
bGVyLWNvbW1hbmQtbGluZS1vcHRpb24ucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uMGJmYzdlMWFkNAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbGliY2Ft
ZXJhLWFwcHMvMDAwMi1jbWFrZS1hZGQtZnBlcm1pc3NpdmUtY29tcGlsZXItY29tbWFuZC1saW5l
LW9wdGlvbi5wYXRjaApAQCAtMCwwICsxLDM3IEBACitGcm9tIGIwNDc3N2U2YjM4NmVkMGM2YjEw
MzZkNGMxMTc4YjRiOGExYzg4ZDUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBQZXRl
ciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+CitEYXRlOiBGcmksIDE4IE1hciAyMDIyIDEy
OjM5OjI3ICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIGNtYWtlOiBhZGQgLWZwZXJtaXNzaXZlIGNv
bXBpbGVyIGNvbW1hbmQgbGluZSBvcHRpb24KK01JTUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5
cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6
IDhiaXQKKworRml4ZXMgKHdpdGggYm9vdGxpbiBhcm0gdG9vbGNoYWluKToKKworICAuLi4vYnVp
bGQvbGliY2FtZXJhLWFwcHMtMmQxMDA5ZTNiYWRjYzgwNDczNjFmZjgxMTQ5YWQ2Y2JhM2I5MTFi
NS9wcmV2aWV3L2VnbF9wcmV2aWV3LmNwcDozMjk6Njk6IGVycm9yOiBpbnZhbGlkIGNvbnZlcnNp
b24gZnJvbSDigJhXaW5kb3figJkge2FrYSDigJhsb25nIHVuc2lnbmVkIGludOKAmX0gdG8g4oCY
RUdMTmF0aXZlV2luZG93VHlwZeKAmSB7YWthIOKAmGZiZGV2X3dpbmRvdyrigJl9IFstZnBlcm1p
c3NpdmVdCisgICAgMzI5IHwgICAgICAgICBlZ2xfc3VyZmFjZV8gPSBlZ2xDcmVhdGVXaW5kb3dT
dXJmYWNlKGVnbF9kaXNwbGF5XywgY29uZmlnLCB3aW5kb3dfLCBOVUxMKTsKKyAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5+fn5+fn4KKyAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKKyAgICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFdpbmRvdyB7YWthIGxvbmcgdW5zaWduZWQgaW50fQorCitTaWduZWQtb2ZmLWJ5OiBQ
ZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+CistLS0KKyBDTWFrZUxpc3RzLnR4dCB8
IDIgKy0KKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKKwor
ZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01ha2VMaXN0cy50eHQKK2luZGV4IDFjYTFl
MzkuLmVkZGRhMWYgMTAwNjQ0CistLS0gYS9DTWFrZUxpc3RzLnR4dAorKysrIGIvQ01ha2VMaXN0
cy50eHQKK0BAIC0xMSw3ICsxMSw3IEBAIGVuZGlmKCkKKyAKKyBzZXQgKENNQUtFX0VYUE9SVF9D
T01QSUxFX0NPTU1BTkRTIE9OKQorIHNldCAoQ01BS0VfQ1hYX1NUQU5EQVJEIDE3KQorLWFkZF9j
b21waWxlX29wdGlvbnMoLVdhbGwgLVdleHRyYSAtcGVkYW50aWMgLVduby11bnVzZWQtcGFyYW1l
dGVyIC1mYWxpZ25lZC1uZXcpCisrYWRkX2NvbXBpbGVfb3B0aW9ucygtV2FsbCAtV2V4dHJhIC1w
ZWRhbnRpYyAtV25vLXVudXNlZC1wYXJhbWV0ZXIgLWZhbGlnbmVkLW5ldyAtZnBlcm1pc3NpdmUp
CisgYWRkX2RlZmluaXRpb25zKC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQpCisgCisgaWYgKENNQUtF
X0NPTVBJTEVSX0lTX0dOVUNYWCkKKy0tIAorMi4zNS4xCisKLS0gCjIuMzUuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
