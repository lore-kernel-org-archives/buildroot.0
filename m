Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B4CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 21:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B588831F2;
	Mon, 10 Jan 2022 21:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wgV12V2eQlwh; Mon, 10 Jan 2022 21:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C6FD83280;
	Mon, 10 Jan 2022 21:39:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D01EB1BF2B3
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 21:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEEDD60A7D
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 21:39:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WX4MLacD5no4 for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 21:39:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E648960E2B
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 21:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641850742;
 bh=qN3//NJLCJk2A3I3E+Lk4+ENsi2eHDDjV0qNarDEUxI=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=ddJcF6H8bNIGtJi1c9MLfH7yOQ1IJmvzh47QXhFDhlwgkHfFMRlkcSY2CMlQaE0d1
 ZCPmduG3h2B9LfQC7o7t/RfIQPfwuyDG/2kHcljNbpPXeMHmKuJEaFD6wwxCYvKYOE
 up8AsqAfQWiXsAK4Z0hZzdfxoVZ0bl+fgcmiio/U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.151]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MxUnz-1m9s9H1Z9d-00xvv2 for <buildroot@buildroot.org>; Mon, 10 Jan 2022
 22:39:02 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 22:39:01 +0100
Message-Id: <20220110213901.13597-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220110213901.13597-1-ps.report@gmx.net>
References: <20220110213901.13597-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:8cv0r+Mv2UgJJDC0ifOr5dTz8GfTTXfXOqqAJvcfZRC93YU/PAt
 reTBrsW+RqQoKxjoi4eMRMeFjx7DL9DLRoCF5k8c46SFGTBv2PyjtFX86FyhGEIw1c5PVwO
 LRHAz0XtCWzTSxnp4uS4C/pR4CDmVsi48j8UUTt+8aATLT+YA+iXHCMDgjib8JiwZS23S++
 q5Z7FLS/WdL2BSL+LtSwA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9tWw+6Qv940=:UalAZ0qwL8KSJtwP6To7ur
 X/Px1/d9f8R7MdnRYqCc5Weu/v922ZvxkToOB3IT7gnxYaVLe+w8fA7+FgS5ETxmSqkyXpt6A
 +6t+1nT2sIdrU2k7a73BP83wGYTyw469Eo17wX9JNDbBVhJm0EXRbfY4v2diF6dB6FMR4q2fl
 vRqMmpGikczUSk8El/BcKVz517jcGX5N8NPtgLtetoNq2okAZ3OayzsWX7A/hHQ6fG/7pdNvC
 oZZqgYlKP65YSY8HbAFqVmQ6rpkWOciraomp4Jbvvvfh93N6g1zlmU/8zzy5W66gYBj8G+seU
 BXfbR3C8kKpH3U7H6mYoUOJEmGKN8L1VnH7Z+H1IByKwfEtoKg52npiYpKQIzRsPRThnuFWGo
 MY3HgQKcP0WPYMIV36qZUPkrmMDCRS1MKepoTk9ZFZ4eJpECtUHfMXuGC/PgFh/HqBLD6d/JR
 eIfoXjv1auzc6WpDprv0RxTtWriGsL5kavMDkKDexBNK1xu/05Jc2hWCFyNiwmCMTZBC8UG50
 ifGI3+Ps78KiLfj89XFYDEDrtfnhTLzeITrQ8xpearXK4tNOVRKGTJ2sJkZ9ruEe+NA1gYfO/
 qMa+1P5rG14eP61ON+jyUyfO/oG1RB9d0pP0u5rCxmwP73ZboXw6/yGCZ/UxwNfdbAhF9YpvW
 2AQKe0M27tFA1OnmqpDAN68GwCRLdKXhMDInNsaRoMRWVorM3qs/bbuvx507t7Qgl6Yagpp4/
 hW60qELQgIOXbCulGGrETUOtHRRM05t7jLNJ9YMpXzCTG9udTjR3jk+62iZXUsx1F4hp/JMB2
 906k7oslc16Ih//HPyZic5gklk1GBSGFC9rjNNTTzK17p8IM818WrYvRlRgSvezB4yLlRh3tM
 gub1DPTu4+08vfqeblllSE4z5c95hv+5Srux8iWfq0FWatiLPt/4S5Dse5B/3URLgMUTyU0xi
 sAvQGa8Tjvw10sWlkyMrG6GkQFU0TtnAizwX2BBSdqeTY3KmXuRs8KbC2cj+U1PS4beueeH68
 q/3DORnYJeFc/BIfaUBQuzVxCI5mCjLCspe6rLO01zN5XOIihvtuzES0nIYFV7ZrAy+sxz1KM
 s8eWRYh0QFKgQk=
Subject: [Buildroot] [PATCH v1 2/2] package/iwd: bump version to 1.21
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

LSBhZGQgMDAwMS1kcHAtZml4LWltcGxpY2l0LWRlY2xhcmF0aW9uLW9mLWZ1bmN0aW9uLWV4cGxp
Y2l0X2J6LnBhdGNoCgotIENoYW5nZWxvZyAoc2luY2UgMS4yMCwgZnJvbSBbMV0pOgoKICB2ZXIg
MS4yMToKICBGaXggaXNzdWUgd2l0aCBoYW5kbGluZyBkaXNjb25uZWN0IGV2ZW50cyBpc3N1ZWQg
YnkgQVAuCiAgQWRkIGV4cGVyaW1lbnRhbCBzdXBwb3J0IGZvciBEUFAgZmVhdHVyZS4KClsxXSBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbmV0d29yay93aXJlbGVzcy9pd2QuZ2l0L3Ry
ZWUvQ2hhbmdlTG9nCgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdt
eC5uZXQ+Ci0tLQogLi4uLWRlY2xhcmF0aW9uLW9mLWZ1bmN0aW9uLWV4cGxpY2l0X2J6LnBhdGNo
IHwgMzkgKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS9pd2QvaXdkLmhhc2ggICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDIgKy0KIHBhY2thZ2UvaXdkL2l3ZC5tayAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9pd2QvMDAwMS1kcHAt
Zml4LWltcGxpY2l0LWRlY2xhcmF0aW9uLW9mLWZ1bmN0aW9uLWV4cGxpY2l0X2J6LnBhdGNoCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9pd2QvMDAwMS1kcHAtZml4LWltcGxpY2l0LWRlY2xhcmF0aW9u
LW9mLWZ1bmN0aW9uLWV4cGxpY2l0X2J6LnBhdGNoIGIvcGFja2FnZS9pd2QvMDAwMS1kcHAtZml4
LWltcGxpY2l0LWRlY2xhcmF0aW9uLW9mLWZ1bmN0aW9uLWV4cGxpY2l0X2J6LnBhdGNoCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmZjMWU2N2ZlOWMKLS0tIC9kZXYvbnVs
bAorKysgYi9wYWNrYWdlL2l3ZC8wMDAxLWRwcC1maXgtaW1wbGljaXQtZGVjbGFyYXRpb24tb2Yt
ZnVuY3Rpb24tZXhwbGljaXRfYnoucGF0Y2gKQEAgLTAsMCArMSwzOSBAQAorRnJvbSA2ODA1ODg0
NzQzNjQ1ZDhkMTYxODZkYmIwZGU3ZDljZDUwY2ZkOWE1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PgorRGF0ZTogTW9uLCAx
MCBKYW4gMjAyMiAyMjoyMDo1MyArMDEwMAorU3ViamVjdDogW1BBVENIXSBkcHA6IGZpeCBpbXBs
aWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiBleHBsaWNpdF9iemVybworIHdhcm5pbmcKK01J
TUUtVmVyc2lvbjogMS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgK
K0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKKworLSBhZGQgbWlzc2luZyBzcmMvbWlz
c2luZy5oIGluY2x1ZGUgZm9yIGV4cGxpY2l0X2J6ZXJvLCBmaXhlcyB1Y2xpYmMKKyAgY29tcGls
ZS9saW5raW5nCisKK0ZpeGVzOgorCisgIHNyYy9kcHAuYzoxNjY6Mjogd2FybmluZzogaW1wbGlj
aXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYZXhwbGljaXRfYnplcm/igJkgWy1XaW1wbGlj
aXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCisgICAgMTY2IHwgIGV4cGxpY2l0X2J6ZXJvKGRwcC0+
cl9ub25jZSwgZHBwLT5ub25jZV9sZW4pOworICAgICAgICB8ICBefn5+fn5+fn5+fn5+fgorCitb
VXBzdHJlYW06IGh0dHBzOi8vbGlzdHMuMDEub3JnL2h5cGVya2l0dHkvbGlzdC9pd2RAbGlzdHMu
MDEub3JnL3RocmVhZC9IWFYyQjdMM1JYRElGTUtGWlRJNzJUS1pSSzJJTVVQUF0KK1NpZ25lZC1v
ZmYtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KKy0tLQorIHNyYy9kcHAu
YyB8IDEgKworIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQorCitkaWZmIC0tZ2l0IGEv
c3JjL2RwcC5jIGIvc3JjL2RwcC5jCitpbmRleCA4NGU4OWY2Yy4uODA5MWRlZDEgMTAwNjQ0Cist
LS0gYS9zcmMvZHBwLmMKKysrKyBiL3NyYy9kcHAuYworQEAgLTMwLDYgKzMwLDcgQEAKKyAKKyAj
aW5jbHVkZSAibGludXgvbmw4MDIxMS5oIgorIAorKyNpbmNsdWRlICJzcmMvbWlzc2luZy5oIgor
ICNpbmNsdWRlICJzcmMvZGJ1cy5oIgorICNpbmNsdWRlICJzcmMvbmV0ZGV2LmgiCisgI2luY2x1
ZGUgInNyYy9tb2R1bGUuaCIKKy0tIAorMi4zNC4xCisKZGlmZiAtLWdpdCBhL3BhY2thZ2UvaXdk
L2l3ZC5oYXNoIGIvcGFja2FnZS9pd2QvaXdkLmhhc2gKaW5kZXggNTgyMjQxNzBlNi4uOGUzNGQy
OTgzZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9pd2QvaXdkLmhhc2gKKysrIGIvcGFja2FnZS9pd2Qv
aXdkLmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIEZyb20gaHR0cHM6Ly9taXJyb3JzLmVkZ2Uua2Vy
bmVsLm9yZy9wdWIvbGludXgvbmV0d29yay93aXJlbGVzcy9zaGEyNTZzdW1zLmFzYwotc2hhMjU2
ICA3ZDUxZTJjY2FiZTdjNTAwZTQ0MDYxYWM3MjVkYmQ0ZjZiMGZiNTE4YjVlM2RlMTY4MTA2M2Qw
ZjE1ZDMwNTBmICBpd2QtMS4yMC50YXIueHoKK3NoYTI1NiAgYmFjODkxZGY5MWM2MDUyNzFlOTFi
NzNjZjAwMTVlMWJhODZmZjc4NDM0N2U1M2ZjNjc2MDEzNjY4NTliMzg1MSAgaXdkLTEuMjEudGFy
Lnh6CiAKICMgTGljZW5zZSBmaWxlcwogc2hhMjU2ICBlYzYwYjk5MzgzNWUyYzZiNzllNmQ5MjI2
MzQ1ZjRlNjE0ZTY4NmViNTdkYzEzYjY0MjBjMTVhMzNhODk5NmU1ICBDT1BZSU5HCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2l3ZC9pd2QubWsgYi9wYWNrYWdlL2l3ZC9pd2QubWsKaW5kZXggNDJmMTc2
YjA1Yi4uYTcwZGE4NmVjYyAxMDA2NDQKLS0tIGEvcGFja2FnZS9pd2QvaXdkLm1rCisrKyBiL3Bh
Y2thZ2UvaXdkL2l3ZC5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjCiAKLUlXRF9WRVJTSU9OID0gMS4yMAorSVdEX1ZFUlNJT04gPSAxLjIxCiBJV0RfU09VUkNF
ID0gaXdkLSQoSVdEX1ZFUlNJT04pLnRhci54egogSVdEX1NJVEUgPSAkKEJSMl9LRVJORUxfTUlS
Uk9SKS9saW51eC9uZXR3b3JrL3dpcmVsZXNzCiBJV0RfTElDRU5TRSA9IExHUEwtMi4xKwotLSAK
Mi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
