Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BC5C64EC4
	for <buildroot@archiver.kernel.org>; Mon,  6 Mar 2023 21:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7BE440A35;
	Mon,  6 Mar 2023 21:23:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7BE440A35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dzwiFrdmP7dX; Mon,  6 Mar 2023 21:23:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 325D540A49;
	Mon,  6 Mar 2023 21:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 325D540A49
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CD9C1BF2E4
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 21:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E79660F32
 for <buildroot@lists.busybox.net>; Mon,  6 Mar 2023 21:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E79660F32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dccfS0nSDvRj for <buildroot@lists.busybox.net>;
 Mon,  6 Mar 2023 21:23:31 +0000 (UTC)
X-Greylist: delayed 00:05:31 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D13C660A98
Received: from smtp-outgoing-1802.laposte.net (smtp-outgoing-1802.laposte.net
 [160.92.124.103])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D13C660A98
 for <buildroot@buildroot.org>; Mon,  6 Mar 2023 21:23:30 +0000 (UTC)
X-mail-filterd: {"version":"1.5.1", "queueID":"4PVryQ6Gbtz10MQN",
 "contextId":"44a1055b-35a1-42b1-9665-34edf4315c0a"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0120.laposte.net (SMTP Server) with ESMTP id 4PVryQ6Gbtz10MQN;
 Mon,  6 Mar 2023 22:17:50 +0100 (CET)
X-mail-filterd: {"version":"1.5.1", "queueID":"4PVryQ5Ym0z10MQ4",
 "contextId":"92c2e2b6-168a-414a-bfaf-83c25b27a3d0"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (unknown [88.169.129.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0120.laposte.net (SMTP Server) with ESMTPSA id 4PVryQ5Ym0z10MQ4;
 Mon,  6 Mar 2023 22:17:50 +0100 (CET)
Received: from radicelle.bergerie (radicelle.bergerie [192.168.124.12])
 by romuald.bergerie (Postfix) with ESMTP id 4FA6E51B1EF1;
 Mon,  6 Mar 2023 22:17:50 +0100 (CET)
Received: from vincent by radicelle.bergerie with local (Exim 4.96)
 (envelope-from <vincent@radicelle.bergerie>) id 1pZICo-000147-0Q;
 Mon, 06 Mar 2023 22:17:14 +0100
To: buildroot@buildroot.org
Date: Mon,  6 Mar 2023 22:16:46 +0100
Message-Id: <20230306211646.3717-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1678137808;
 bh=9uJ9Op9wIxfEvAT4qB6gcfmLvQj3ABpLRUhrqEmNR8o=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=T6RyYi46oT7s0ztt+3WmANoGNehvIJ5qxX8hNidziN1ItrLfNsfxb+75etR+SDvKYcKNxlyYAW+RN22u4g9x09OH2J0PRltCh+iq78IVtyyX7yH59OmpKNq0yLfBijra2UG8rwu9xNrlMD1OOM3/5i92xfKJiRVv0bHi2UQuS7jfF6pDsBsZo6Mldc4c2WvWHCU5xqxfoLltSwiU5vcVmxEiOoDUJ4amooEb/TFdZq+JD/Q7MebAC1CuScuzGa5hlgvY5Mg+ZQQGf4sPbI9ooYTXdb29frtT4VmtABYbNFNFpEwjyUFlmCz1dHvVTEoFO0RzDht06HKtXCKTcIbeEg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net
 header.a=rsa-sha256 header.s=lpn-wlmd header.b=T6RyYi46
Subject: [Buildroot] [PATCH next] package/openfpgaloader: fix typos
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: Jean Burgat <jeanburgat33@gmail.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4IGEgdHlwbyBpbiB0aGUgbmFtZSBvZiB0d28gY29uZmlndXJhdGlvbiBvcHRpb25zLgpUaGlz
IHJlcGFpcnMgdGhlIHNlbGVjdGlvbiBvZiBsaWJncGlvZCBzdXBwb3J0LgoKU2lnbmVkLW9mZi1i
eTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KQ2M6IEplYW4g
QnVyZ2F0IDxqZWFuYnVyZ2F0MzNAZ21haWwuY29tPgotLS0KCgpIaSwKClRoZSBmaXggZm9yIHRo
ZSBCUjJfUEFDS0FHRV9PUEVORlBHQUxPQURFUl9MSUJHUElPRCBoYXMgYSBmdW5jdGlvbmFsIGNo
YW5nZSBhbmQKaXMgYXBwbGljYWJsZSB0byB0aGUgbmV4dCBicmFuY2ggb25seS4KClRoZSBmaXgg
Zm9yIHRoZSBCUjJfUEFDS0FHRV9PUEVORlBHQUxPQURFUl9DTVNJUyBpcyBhbHNvIGFwcGxpY2Fi
bGUgdG8gdGhlCm1hc3RlciBicmFuY2ggaWYgZGVzaXJlZCwgYnV0IGFzIGl0IGhhcyBubyBmdW5j
dGlvbmFsIGVmZmVjdCBJIHRoaW5rIGl0IGlzIG5vdAp0aGF0IHVyZ2VudC4KCkJlc3QgcmVnYXJk
cywKVmluY2VudC4KCgogcGFja2FnZS9vcGVuZnBnYWxvYWRlci9Db25maWcuaW4gICAgICAgICB8
IDIgKy0KIHBhY2thZ2Uvb3BlbmZwZ2Fsb2FkZXIvb3BlbmZwZ2Fsb2FkZXIubWsgfCA0ICsrLS0K
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3BhY2thZ2Uvb3BlbmZwZ2Fsb2FkZXIvQ29uZmlnLmluIGIvcGFja2FnZS9vcGVuZnBn
YWxvYWRlci9Db25maWcuaW4KaW5kZXggNGJhMDFkMTJkMy4uYmQ4M2FkNDE1YiAxMDA2NDQKLS0t
IGEvcGFja2FnZS9vcGVuZnBnYWxvYWRlci9Db25maWcuaW4KKysrIGIvcGFja2FnZS9vcGVuZnBn
YWxvYWRlci9Db25maWcuaW4KQEAgLTEyLDcgKzEyLDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX09Q
RU5GUEdBTE9BREVSCiAKIGlmIEJSMl9QQUNLQUdFX09QRU5GUEdBTE9BREVSCiAKLWNvbmZpZyBC
UjJfUEFDQUtHRV9PUEVORlBHQUxPQURFUl9DTVNJUworY29uZmlnIEJSMl9QQUNLQUdFX09QRU5G
UEdBTE9BREVSX0NNU0lTCiAJYm9vbCAiQ01TSVMtREFQIHN1cHBvcnQiCiAJZGVwZW5kcyBvbiBC
UjJfUEFDS0FHRV9IQVNfVURFViAjIGhpZGFwaQogCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9I
QVNfVEhSRUFEU19OUFRMICMgaGlkYXBpCmRpZmYgLS1naXQgYS9wYWNrYWdlL29wZW5mcGdhbG9h
ZGVyL29wZW5mcGdhbG9hZGVyLm1rIGIvcGFja2FnZS9vcGVuZnBnYWxvYWRlci9vcGVuZnBnYWxv
YWRlci5tawppbmRleCAwNDJiMTY2MTJlLi42ZDdmYmQ5ODUwIDEwMDY0NAotLS0gYS9wYWNrYWdl
L29wZW5mcGdhbG9hZGVyL29wZW5mcGdhbG9hZGVyLm1rCisrKyBiL3BhY2thZ2Uvb3BlbmZwZ2Fs
b2FkZXIvb3BlbmZwZ2Fsb2FkZXIubWsKQEAgLTE3LDE0ICsxNywxNCBAQCBlbHNlCiBPUEVORlBH
QUxPQURFUl9DT05GX09QVFMgKz0gLURFTkFCTEVfVURFVj1PRkYKIGVuZGlmCiAKLWlmZXEgKCQo
QlIyX1BBQ0FLR0VfT1BFTkZQR0FMT0FERVJfQ01TSVMpLHkpCitpZmVxICgkKEJSMl9QQUNLQUdF
X09QRU5GUEdBTE9BREVSX0NNU0lTKSx5KQogT1BFTkZQR0FMT0FERVJfREVQRU5ERU5DSUVTICs9
IGhpZGFwaQogT1BFTkZQR0FMT0FERVJfQ09ORl9PUFRTICs9IC1ERU5BQkxFX0NNU0lTREFQPU9O
CiBlbHNlCiBPUEVORlBHQUxPQURFUl9DT05GX09QVFMgKz0gLURFTkFCTEVfQ01TSVNEQVA9T0ZG
CiBlbmRpZgogCi1pZmVxICgkKEJSMl9QQUNBS0dFX09QRU5GUEdBTE9BREVSX0xJQkdQSU9EKSx5
KQoraWZlcSAoJChCUjJfUEFDS0FHRV9PUEVORlBHQUxPQURFUl9MSUJHUElPRCkseSkKIE9QRU5G
UEdBTE9BREVSX0RFUEVOREVOQ0lFUyArPSBsaWJncGlvZAogT1BFTkZQR0FMT0FERVJfQ09ORl9P
UFRTICs9IC1ERU5BQkxFX0xJQkdQSU9EPU9OCiBlbHNlCi0tIAoyLjM1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
