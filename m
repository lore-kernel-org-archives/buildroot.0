Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721BAC46467
	for <buildroot@archiver.kernel.org>; Tue,  3 Jan 2023 13:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2D124172A;
	Tue,  3 Jan 2023 13:56:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2D124172A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DTd9oD8AIymI; Tue,  3 Jan 2023 13:56:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E46A4172F;
	Tue,  3 Jan 2023 13:56:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E46A4172F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A06801BF2BB
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 13:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B3AB4172A
 for <buildroot@lists.busybox.net>; Tue,  3 Jan 2023 13:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B3AB4172A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WLtD3dMdljoX for <buildroot@lists.busybox.net>;
 Tue,  3 Jan 2023 13:56:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E04F1416FC
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E04F1416FC
 for <buildroot@buildroot.org>; Tue,  3 Jan 2023 13:56:28 +0000 (UTC)
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <martin@geanix.com>)
 id 1pChmE-000NCI-T3; Tue, 03 Jan 2023 14:56:26 +0100
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <martin@geanix.com>)
 id 1pChmE-000Lfe-Nw; Tue, 03 Jan 2023 14:56:26 +0100
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: buildroot@buildroot.org
Date: Tue,  3 Jan 2023 14:56:16 +0100
Message-Id: <20230103135617.3211318-1-martin@geanix.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.7/26770/Tue Jan  3 09:59:01 2023)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=W8uj1qYkhrSJXgRF+ewpzeTxyzz9WWPdWs1o7+DEURQ=; b=D2Ct/P8H0hyv3R3Ta3glzPzUkJ
 cHmnxq2lOjKOtlG5e0W40sQ81s5CiqbkwOvaU4zvgUiF3DLhis/I7DVdqiI+/ppQf8+KMg4VlI23Y
 DQDLsexQ62UB+1cXqs9RHTITYV0DROdU0G9uLAst4yOjSJ/611htv14ubbBW5KwonD1NnZLSkNOlb
 SCU5F/hH9LVoLnIGH3njzWQngxiLxrrIAZaQ8BxxurJnAiz2jp7IcfKdCDoyTozLUy4ngZ6nw0MtO
 /x+GzwgruupT2ZqUrG3ncaWDYKf161mdNJgstRt1fTkrI1foSRpZ1fAKxSRkvAQ6JKlhD7n/uuR7c
 GJagIHEQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com
 header.a=rsa-sha256 header.s=default2211 header.b=D2Ct/P8H
Subject: [Buildroot] [PATCH 1/2] readline: bump version to 8.2
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogTWFydGluIEh1bmRlYsO4bGwgPG1hcnRpbkBnZWFuaXguY29tPgotLS0K
IHBhY2thZ2UvcmVhZGxpbmUvcmVhZGxpbmUuaGFzaCB8IDQgKystLQogcGFja2FnZS9yZWFkbGlu
ZS9yZWFkbGluZS5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9yZWFkbGluZS9yZWFkbGluZS5o
YXNoIGIvcGFja2FnZS9yZWFkbGluZS9yZWFkbGluZS5oYXNoCmluZGV4IGIwNTMwYTJkNzIuLjYy
Nzc0NmQ4MjEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcmVhZGxpbmUvcmVhZGxpbmUuaGFzaAorKysg
Yi9wYWNrYWdlL3JlYWRsaW5lL3JlYWRsaW5lLmhhc2gKQEAgLTEsNiArMSw2IEBACiAjIExvY2Fs
bHkgY2FsY3VsYXRlZCBhZnRlciBjaGVja2luZyBwZ3Agc2lnbmF0dXJlIGZyb20KLSMgaHR0cHM6
Ly9mdHAuZ251Lm9yZy9nbnUvcmVhZGxpbmUvcmVhZGxpbmUtOC4xLjIudGFyLmd6LnNpZwotc2hh
MjU2ICA3NTg5YTIzODFhODQxOWU2ODY1NGE0NzYyM2NlN2RmY2I3NTY4MTVjOGZlZTcyNmI5OGY5
MGJmNjY4YWY3YmM2ICByZWFkbGluZS04LjEuMi50YXIuZ3oKKyMgaHR0cHM6Ly9mdHAuZ251Lm9y
Zy9nbnUvcmVhZGxpbmUvcmVhZGxpbmUtOC4yLnRhci5nei5zaWcKK3NoYTI1NiAgM2ZlYjcxNzFm
MTZhODRlZTgyY2ExOGEzNmQ3YjliZTEwOWE1MmMwNGY0OTJhMDUzMzMxZDdkMTA5NTAwN2MzNSAg
cmVhZGxpbmUtOC4yLnRhci5negogCiAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZQogc2hhMjU2ICA4
Y2ViNGI5ZWU1YWRlZGRlNDdiMzFlOTc1YzFkOTBjNzNhZDI3YjZiMTY1YTFkY2Q4MGM3YzU0NWVi
NjViOTAzICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3JlYWRsaW5lL3JlYWRsaW5lLm1r
IGIvcGFja2FnZS9yZWFkbGluZS9yZWFkbGluZS5tawppbmRleCBiMWZkMTgxYjc4Li42NjgxMmRl
ZTc3IDEwMDY0NAotLS0gYS9wYWNrYWdlL3JlYWRsaW5lL3JlYWRsaW5lLm1rCisrKyBiL3BhY2th
Z2UvcmVhZGxpbmUvcmVhZGxpbmUubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwogCi1SRUFETElORV9WRVJTSU9OID0gOC4xLjIKK1JFQURMSU5FX1ZFUlNJT04g
PSA4LjIKIFJFQURMSU5FX1NJVEUgPSAkKEJSMl9HTlVfTUlSUk9SKS9yZWFkbGluZQogUkVBRExJ
TkVfSU5TVEFMTF9TVEFHSU5HID0gWUVTCiBSRUFETElORV9ERVBFTkRFTkNJRVMgPSBuY3Vyc2Vz
IGhvc3QtYXV0b2NvbmYKLS0gCjIuMzkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
