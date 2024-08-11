Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB29C52D7C
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 10:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F1B2405C4;
	Sun, 11 Aug 2024 10:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dsh4SWCn135l; Sun, 11 Aug 2024 10:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66738405A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66738405A3;
	Sun, 11 Aug 2024 10:01:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D15A11BF2AA
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 10:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1A9440582
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 10:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBZ2RhUZoyPf for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 10:01:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CDD604042D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDD604042D
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDD604042D
 for <buildroot@buildroot.org>; Sun, 11 Aug 2024 10:01:28 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.195]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPGRp-1spXZ71Svd-00Ocse; Sun, 11
 Aug 2024 12:01:20 +0200
Date: Sun, 11 Aug 2024 12:01:13 +0200
MIME-Version: 1.0
Message-Id: <20240811-s6-multicall-v2-3-14249fd20cbd@gmx.net>
References: <20240811-s6-multicall-v2-0-14249fd20cbd@gmx.net>
In-Reply-To: <20240811-s6-multicall-v2-0-14249fd20cbd@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723370475; l=1442;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=m1Py5yeMrsW0DWQSESQasKHcTW2AEqX2LU0z+wnMl74=;
 b=RZKJdJZGUYDTNsY0ayzVEuk+2O+2XhGQBmpw0nHve1yx1gXnRZo/gyY6oQhJUjf3cOZ2QbsKx
 cANHHvcf4eBBg9FMuFa/CHlJ+G1glSvyiQO6DqFa5SXiEgWqN9ji05G
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:ukXSXCo6tA5WBjR+d8P2hdC8TECoSykHtwBqKyAkRzbu1IaPqVG
 xHh1YdIbo6X81uYU9AOpbHctAmvDaLrP8bUYnLGBm7RBKc6c5Yg/PNhyMclkA++8jF6Y6Dr
 evyBAcYMNZleA5AFGtjNN5ZLAMOs614TWgpc2/MstZ7/NVYm6Ubt3FQBvUKhbOGW/6jxerH
 ah0qjnhAiN1n93ecZ2k0w==
UI-OutboundReport: notjunk:1;M01:P0:foB50nZneZI=;j7L/rlFAZC96rGwXWyt9/HrPgBd
 CUQi5BXIv0NSKGxCQudjSY2LeiMCT8aFHLiG/4KERBjMP/jvLMbRGUSDofvz6/r355jcNDBZz
 kdMMC4N9Un8anHqjRbFQyhZtYpc60onwCRWBqEZfGTX8oqxXNUjpW9MCBCu2gLtNXFmtv9sHG
 fvGZIuf8XP3xvuuFDH66ieVDZ+2IzMEFIqIurqGT0OwbxINbOgHMhw3i3oDtSQZfiiyxzXNqF
 E+djRq1+bPFSJrNdk0vxEXHnWznXNvGZBbU8tEOqQm81inq70fEHhKRd8NjObQ0a/Rw87UQ8C
 ISHLTrzhc/DeD9Oq0/CzQ+bOvkbILfTM0RDWUV41Dtdzz0ZG0KiqmUqTGY4r4nrkw88soHqOk
 2DCZ8AeQliolRARiWhoBeEyJ/F9GkIqecao79884NR0tMhXf1JZtaoE7xcaPfTcVEktsrVZlO
 IVT9nq0sfujurcnl0IWZrYpz3HInFC02hLBz5S/m748N76BjvpV1/FfJWw6o1cYohFS2gF84a
 /1dpir/Yy+84J5Iyr1WMr3Chiay+1ptro4u3cCQiJ4AyPBkldrKbDtz+FJ/6MDuKjvcjADbi2
 V4IIXWPxoPPSSvaL0iMFLHiJ1JbVk1vYdxaZUN1McxxkF+dhXhAns55lyXCKtUjrMDienEGWw
 mcLGPQ1LJOja8M/8y5GOYLPZJ8IVNu4eWMwD5L+vitdHHq6tUGsRj/AcveCCT6fjromH8OLo7
 7y7/m3k3JqoJq4ylPL/8JiLbDrWhDi0S1jHQ1J16G7EwwKNXpPkrFOxAheSCDwcjjseMFLEdO
 2x40etQmgTFyW64BMT1Fjy5Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1723370480; x=1723975280; i=j.neuschaefer@gmx.net;
 bh=GCEwQ2uf4KTtIQBjRypxHOEkl1sRawQ4FyXNkLZKFzc=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Ht4zC8AWYe8uF8GwFcmFeTAMmPm8Ah1DS95JydiCdbonyjD8bT53PSmQPGmAIiq8
 5zZ0YsoqKF6vae6NITp+4C+1NmHIT95TaF6FxGmDJosVTzOOKHWlbGUJ51ndmNQYQ
 rKPS3Yijki7jj5ayG2s2VSF97dxejxJANALtrycohhD6FuNHNAimCCTCUZUiKDK7K
 pUcQmoDu6RHCN8TQ3owpxCJwZ+yveONYb6OUS/NsPli3qDrRDXsZx3JWm3ADZuFxh
 iOkBrACJB82yG5RK23fadQd5MK9+xGk+pNdLvtYeC9D2YYpI7FlWIVHuaXuBNkC5Z
 k2jh+IKG97Ct2+ggmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Ht4zC8AW
Subject: [Buildroot] [PATCH v2 3/4] package/s6-linux-utils: Add option to
 build multicall binary
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2luY2UgdmVyc2lvbiAyLjYuMS4wLCB3aXRoIGFub3RoZXIgYnVnZml4IGluIDIuNi4yLjAsIHM2
LWxpbnV4LXV0aWxzCmNhbiBiZSBidWlsdCBhcyBhIG11bHRpY2FsbCBiaW5hcnksIHNpbWlsYXIg
dG8gYnVzeWJveC4KClNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVy
QGdteC5uZXQ+Ci0tLQogcGFja2FnZS9zNi1saW51eC11dGlscy9Db25maWcuaW4gICAgICAgICB8
IDkgKysrKysrKysrCiBwYWNrYWdlL3M2LWxpbnV4LXV0aWxzL3M2LWxpbnV4LXV0aWxzLm1rIHwg
MSArCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3M2LWxpbnV4LXV0aWxzL0NvbmZpZy5pbiBiL3BhY2thZ2UvczYtbGludXgtdXRpbHMvQ29u
ZmlnLmluCmluZGV4IDQzZTZiYjkxNDQuLjIwYjI2N2EyY2MgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
czYtbGludXgtdXRpbHMvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvczYtbGludXgtdXRpbHMvQ29u
ZmlnLmluCkBAIC03LDMgKzcsMTIgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1M2X0xJTlVYX1VUSUxT
CiAJICBzeXN0ZW0gdXRpbGl0aWVzLgoKIAkgIGh0dHA6Ly9za2FybmV0Lm9yZy9zb2Z0d2FyZS9z
Ni1saW51eC11dGlscy8KKworaWYgQlIyX1BBQ0tBR0VfUzZfTElOVVhfVVRJTFMKKworY29uZmln
IEJSMl9QQUNLQUdFX1M2X0xJTlVYX1VUSUxTX01VTFRJQ0FMTAorCWJvb2wgInM2LWxpbnV4LXV0
aWxzIG11bHRpY2FsbCBiaW5hcnkiCisJaGVscAorCSAgQnVpbGQgczYtbGludXgtdXRpbHMgYXMg
YSBtdWx0aWNhbGwgYmluYXJ5IHRvIHNhdmUgZGlzayBzcGFjZS4KKworZW5kaWYKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvczYtbGludXgtdXRpbHMvczYtbGludXgtdXRpbHMubWsgYi9wYWNrYWdlL3M2
LWxpbnV4LXV0aWxzL3M2LWxpbnV4LXV0aWxzLm1rCmluZGV4IGY4M2Y0N2FjM2UuLjA0ZTA4YzNk
NDMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvczYtbGludXgtdXRpbHMvczYtbGludXgtdXRpbHMubWsK
KysrIGIvcGFja2FnZS9zNi1saW51eC11dGlscy9zNi1saW51eC11dGlscy5tawpAQCAtMTcsNiAr
MTcsNyBAQCBTNl9MSU5VWF9VVElMU19DT05GX09QVFMgPSBcCiAJLS13aXRoLWR5bmxpYj0kKFNU
QUdJTkdfRElSKS9saWIgXAogCS0td2l0aC1saWI9JChTVEFHSU5HX0RJUikvbGliL3NrYWxpYnMg
XAogCSQoaWYgJChCUjJfU1RBVElDX0xJQlMpLCwtLWRpc2FibGUtYWxsc3RhdGljKSBcCisJJChp
ZiAkKEJSMl9QQUNLQUdFX1M2X0xJTlVYX1VUSUxTX01VTFRJQ0FMTCksLS1lbmFibGUtbXVsdGlj
YWxsLCkgXAogCSQoU0hBUkVEX1NUQVRJQ19MSUJTX09QVFMpCgogZGVmaW5lIFM2X0xJTlVYX1VU
SUxTX0NPTkZJR1VSRV9DTURTCgotLQoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
