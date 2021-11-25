Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDC2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 12:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5445A40273;
	Thu, 25 Nov 2021 12:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KE99mePDEpnr; Thu, 25 Nov 2021 12:56:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60E214027D;
	Thu, 25 Nov 2021 12:56:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 833FC1BF30B
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 12:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7041940273
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 12:56:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SUZvWCE5fSdJ for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 12:56:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B59C402EC
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 12:56:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id 137so5515817wma.1
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 04:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6uv229cX3woLcPbFUdabmRv8uX0nicUyFDrivN0FI4o=;
 b=L7XfaQU7T/BzZmlEP1FR0cijnRWM+FjnSbzh/TAiw4HHxC44a2TXWIKjP/eCFLee0K
 d+p8E7YmDJ1B9j4oSTkNVNdtgUXzGpCHLqHTD977qmkFGLLNbUJadUN9b5Kuk37YuPTa
 +C5l/jko+/4rgMjmS+leeJrnV2r0GS9z3BNhkMnqOHO/0tEzeFljXPk8IsdTU2B8zEQW
 T8xsul2NkG6uGLIs5a45fUVESGc+VocmwdyGcYbgw7MBY5NTF2siIe3h51exMbKJZaZZ
 93bCrUA9Csiq3AgecH/SzX7MvqhPpcC5ZSbv984VS9zfWYhrVDPMaK+ZOpsoGnR95tWh
 axiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6uv229cX3woLcPbFUdabmRv8uX0nicUyFDrivN0FI4o=;
 b=aWerDH8WULvIB15Jha7ZvZgB2zWmqch3EmEuiaHKOweBZbMIXiAhk5O6d+I1wHjbKO
 loOam7z/nmIs4CtNUjKnT3iyIFNuwIJoUyjGpAG5ac35lR5+EFb6+EIMn1dlBkZXQOmy
 CNv37A6MgaAEkhG8EswqVk7zxFv6alCtvkBkga3ID6o3rRKXN1745KJewpW17ZJ+QegI
 WEty+WLhbKz7cz3TKMp6N01kcrOTBm25Oc6RS9VHKLg8hQxFWTrX/y7Yz9H6nU+1LOi8
 3AxgqnS2o4Nb9QeROEP4hmxIsDaT6UcAeLjOofkL+HpFGcoQ64ALDg4alNUMTBoWaZIx
 dHzw==
X-Gm-Message-State: AOAM531P62fYpJX5jyHmQDGonKGX1ZxvUvpAZKHwQfSkiTBADjBdEUgZ
 H2BB8/rPzNmkl9Y7ncI+go3XYyUt3FE=
X-Google-Smtp-Source: ABdhPJyXS9m+QZhn/BpJ3RZidMYhDpT1rI3PHEyOua68uj7HvwXnp9c/OiaS9iuPq6SCxir6xmI2ZQ==
X-Received: by 2002:a05:600c:510d:: with SMTP id
 o13mr7012435wms.104.1637844983178; 
 Thu, 25 Nov 2021 04:56:23 -0800 (PST)
Received: from hthiery.fritz.box ([2a02:810c:8d40:ec0:e54:15ff:fe38:2651])
 by smtp.gmail.com with ESMTPSA id r62sm2909178wmr.35.2021.11.25.04.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:56:22 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 13:55:59 +0100
Message-Id: <20211125125558.1087094-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211125125558.1087094-1-heiko.thiery@gmail.com>
References: <20211125125558.1087094-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/libnetconf2: bump version to 2.0.24
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Vadim Kochan <vadim4j@gmail.com>,
 =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSGVpa28gVGhpZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29tPgotLS0K
IC4uLklYLW5ldG9wZWVyMi1idWlsZC1mYWlscy13aGVuLWJ1aWxkaS5wYXRjaCB8IDM0ICsrKysr
KysrKysrKysrKysrKysKIHBhY2thZ2UvbGlibmV0Y29uZjIvbGlibmV0Y29uZjIuaGFzaCAgICAg
ICAgICB8ICAyICstCiBwYWNrYWdlL2xpYm5ldGNvbmYyL2xpYm5ldGNvbmYyLm1rICAgICAgICAg
ICAgfCAgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGlibmV0Y29uZjIvMDAwMS1saWJuZXRj
b25mMi1CVUdGSVgtbmV0b3BlZXIyLWJ1aWxkLWZhaWxzLXdoZW4tYnVpbGRpLnBhdGNoCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9saWJuZXRjb25mMi8wMDAxLWxpYm5ldGNvbmYyLUJVR0ZJWC1uZXRv
cGVlcjItYnVpbGQtZmFpbHMtd2hlbi1idWlsZGkucGF0Y2ggYi9wYWNrYWdlL2xpYm5ldGNvbmYy
LzAwMDEtbGlibmV0Y29uZjItQlVHRklYLW5ldG9wZWVyMi1idWlsZC1mYWlscy13aGVuLWJ1aWxk
aS5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5jMDNmZGM5OTk5
Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9saWJuZXRjb25mMi8wMDAxLWxpYm5ldGNvbmYy
LUJVR0ZJWC1uZXRvcGVlcjItYnVpbGQtZmFpbHMtd2hlbi1idWlsZGkucGF0Y2gKQEAgLTAsMCAr
MSwzNCBAQAorRnJvbSBlMDZmMjkxY2MzNmM5ZTlhM2M5YzIyNGUyMzEwOWFjNmRhZDRlYjFjIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogSGVpa28gVGhpZXJ5IDxoZWlrby50aGllcnlA
Z21haWwuY29tPgorRGF0ZTogVGh1LCAyNSBOb3YgMjAyMSAxMjoyOTo0NyArMDEwMAorU3ViamVj
dDogW1BBVENIXSBsaWJuZXRjb25mMiBCVUdGSVggbmV0b3BlZXIyIGJ1aWxkIGZhaWxzIHdoZW4g
YnVpbGRpbmcgd2l0aAorIG11c2wgbGliYworTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlw
ZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzog
OGJpdAorCisvaG9tZS9odGhpZXJ5L3NvdXJjZXMvbWFpbmxpbmUvYnVpbGRyb290L291dHB1dC9o
b3N0L3g4Nl82NC1idWlsZHJvb3QtbGludXgtbXVzbC9zeXNyb290L3Vzci9pbmNsdWRlL2xpYm5l
dGNvbmYyL3Nlc3Npb25fc2VydmVyLmg6NDM5OjU1OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg
4oCYbW9kZV904oCZCisgIDQzOSB8IGludCBuY19zZXJ2ZXJfZW5kcHRfc2V0X3Blcm1zKGNvbnN0
IGNoYXIgKmVuZHB0X25hbWUsIG1vZGVfdCBtb2RlLCB1aWRfdCB1aWQsIGdpZF90IGdpZCk7CisK
K0ZvciBtdXNsIGxpYmMgdGhlIGluY2x1ZGUgInN5cy90eXBlcy5oIiBpcyByZXF1aXJlZC4KKwor
U2lnbmVkLW9mZi1ieTogSGVpa28gVGhpZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29tPgorLS0t
Cisgc3JjL3Nlc3Npb25fc2VydmVyLmggfCAxICsKKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKKworZGlmZiAtLWdpdCBhL3NyYy9zZXNzaW9uX3NlcnZlci5oIGIvc3JjL3Nlc3Npb25f
c2VydmVyLmgKK2luZGV4IDQ1MDdlZWEuLjQ3NzkxMTkgMTAwNjQ0CistLS0gYS9zcmMvc2Vzc2lv
bl9zZXJ2ZXIuaAorKysrIGIvc3JjL3Nlc3Npb25fc2VydmVyLmgKK0BAIC0xOSw2ICsxOSw3IEBA
CisgZXh0ZXJuICJDIiB7CisgI2VuZGlmCisgCisrI2luY2x1ZGUgPHN5cy90eXBlcy5oPgorICNp
bmNsdWRlIDxsaWJ5YW5nL2xpYnlhbmcuaD4KKyAjaW5jbHVkZSA8c3RkaW50Lmg+CisgCistLSAK
KzIuMzAuMgorCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm5ldGNvbmYyL2xpYm5ldGNvbmYyLmhh
c2ggYi9wYWNrYWdlL2xpYm5ldGNvbmYyL2xpYm5ldGNvbmYyLmhhc2gKaW5kZXggMjRjYzNhNTU1
Ny4uMmRlZTkzY2M0YyAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJuZXRjb25mMi9saWJuZXRjb25m
Mi5oYXNoCisrKyBiL3BhY2thZ2UvbGlibmV0Y29uZjIvbGlibmV0Y29uZjIuaGFzaApAQCAtMSwz
ICsxLDMgQEAKICMgTG9jYWxseSBjYWxjdWxhdGVkCi1zaGEyNTYgIDY2MTM5ZmM5ZTY4YWE4OWM4
MjIzNWY0MTM1ZGJhOWU0NGY1ZGI2NjM1NDEyNzljMTRjNzQxMzFlMjJiN2Y1NzEgIGxpYm5ldGNv
bmYyLTEuMS40My50YXIuZ3oKK3NoYTI1NiAgNzhmZmEwYmQ4NTgyM2FiZDMyMWExZGJiMDljMWVh
ZDM2NjEyZjJhMTIwNDk2MzhhMTRiYjA4MTU2N2Y4NmFkZSAgbGlibmV0Y29uZjItMi4wLjI0LnRh
ci5negogc2hhMjU2ICBiZDk2MmFiNDU3YzhhOGNiOGZhYWFhMzZjMTE0ODQ2ODBmM2M5YTQ3ZGJj
MzM2NTA3ODE3YWU4OTM1Mzg0MDY0ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm5l
dGNvbmYyL2xpYm5ldGNvbmYyLm1rIGIvcGFja2FnZS9saWJuZXRjb25mMi9saWJuZXRjb25mMi5t
awppbmRleCA0MGZhOTM1YmIxLi4zM2UxZmFkZjc2IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm5l
dGNvbmYyL2xpYm5ldGNvbmYyLm1rCisrKyBiL3BhY2thZ2UvbGlibmV0Y29uZjIvbGlibmV0Y29u
ZjIubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1MSUJO
RVRDT05GMl9WRVJTSU9OID0gMS4xLjQzCitMSUJORVRDT05GMl9WRVJTSU9OID0gMi4wLjI0CiBM
SUJORVRDT05GMl9TSVRFID0gJChjYWxsIGdpdGh1YixDRVNORVQsbGlibmV0Y29uZjIsdiQoTElC
TkVUQ09ORjJfVkVSU0lPTikpCiBMSUJORVRDT05GMl9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKIExJ
Qk5FVENPTkYyX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UKLS0gCjIuMzAuMgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
