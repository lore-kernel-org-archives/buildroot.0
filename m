Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54679C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 19:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F8D781D0B;
	Sun, 27 Mar 2022 19:48:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sh8nYmqL-uPr; Sun, 27 Mar 2022 19:48:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B1FD81C6F;
	Sun, 27 Mar 2022 19:48:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 192C51BF386
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 19:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 089AD81C6F
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 19:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7_Ddjri6iy9k for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 19:48:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB3C481C44
 for <buildroot@busybox.net>; Sun, 27 Mar 2022 19:48:13 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 bi13-20020a05600c3d8d00b0038c2c33d8f3so11818819wmb.4
 for <buildroot@busybox.net>; Sun, 27 Mar 2022 12:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1oR5ysYR6cYBUtuKNIr1f0R+KAedMJ0gxRbL6/702gQ=;
 b=QpwfgvJ5CAQYuH/hxbe0vHuW715Ylc5Rx3IZgJU9eYOvEwnsG7npG6jv9gJlGkHP/k
 od1AT+e9wJk6OjbRLuU2BLmYH4slb6fac+XZdbj0jfFKeD3BVi059bOhpzZFIE42JwrR
 v/+IUJyxal+XxALpdTXsK0GOguwLXZskaMCc+rptZdVKYFR19rbq07LIaeCUSLJxs0NZ
 FxJZ7bl4RuAVi+viEnWALucqzkYuQXqRqp2fWo/1JeNY3n6hDUXLG6837sf5C9ZuTJkK
 NNSxe0Y1ZT7YNp3pAA3C411MCNHBF5tUOJn8yK5QCzNicUsA8ZDUkO/czrQty7iq+UU0
 xHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1oR5ysYR6cYBUtuKNIr1f0R+KAedMJ0gxRbL6/702gQ=;
 b=shhmtlLNOzLDmNxxDSBngqyzdeq5Ir6WiUGSAUDb2yK585prTZ+AsjL7OVQ9H1+L6w
 +YvdV0jL7V6FOInT7KcO8Q09NDYGPErwu8Rr9j26T4nQsq+xFXaytE00pQ3BXyqbHt4t
 kBMfwev9DHtSKLt9K1EoqJX4SInM6DNX7jzJBBHTdcioBgagnZci+Kvj7MNaQ/lOBGuv
 /39uSoWHrY/LrnMQ7ldgsBxVV6a8X6k2BNZwmR5zUrR7J71O2OitfNfP+7LvXgL5TBpU
 SuN2k63WdpRNVcJKRfp5maBD7Iu+rexYtwHC5+DXVygOhCj2ZUIwVwpx8bfTQH+2/Ni+
 VxDg==
X-Gm-Message-State: AOAM530ElGIJEQPfokDeNpua3sB8yL3XLrmXIcjRs95DuvgMCTABRoOz
 Bg/BxVqLT6je7YDypgBPYgjbjqjj9qI=
X-Google-Smtp-Source: ABdhPJzeLEZKmc1Ls+MKOAIMqBA027sGWLPRelMs8EzPhFYzt+auHdJhuRUVYEkYlbhswIKKxYkY0A==
X-Received: by 2002:a05:600c:1d95:b0:38c:f943:c20c with SMTP id
 p21-20020a05600c1d9500b0038cf943c20cmr8363631wms.19.1648410491943; 
 Sun, 27 Mar 2022 12:48:11 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 bj26-20020a0560001e1a00b0020597757ebcsm9452540wrb.7.2022.03.27.12.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 12:48:11 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 27 Mar 2022 21:47:40 +0200
Message-Id: <20220327194740.1482539-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/luasocket: bump to version 3.0.0
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

bW92ZWQgdW5kZXIgdGhlIGhhdCBvZiBodHRwczovL2dpdGh1Yi5jb20vbHVuYXJtb2R1bGVzCgpk
aWZmIExJQ0VOU0U6Ci1MdWFTb2NrZXQgMy4wIGxpY2Vuc2UKLUNvcHlyaWdodCDvv70gMjAwNC0y
MDEzIERpZWdvIE5laGFiCitDb3B5cmlnaHQgKEMpIDIwMDQtMjAyMiBEaWVnbyBOZWhhYgoKU2ln
bmVkLW9mZi1ieTogRnJhbmNvaXMgUGVycmFkIDxmcmFuY29pcy5wZXJyYWRAZ2Fkei5vcmc+Ci0t
LQogcGFja2FnZS9sdWFzb2NrZXQvQ29uZmlnLmluICAgICAgfCAyICstCiBwYWNrYWdlL2x1YXNv
Y2tldC9sdWFzb2NrZXQuaGFzaCB8IDQgKystLQogcGFja2FnZS9sdWFzb2NrZXQvbHVhc29ja2V0
Lm1rICAgfCA0ICsrLS0KIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHVhc29ja2V0L0NvbmZpZy5pbiBiL3BhY2th
Z2UvbHVhc29ja2V0L0NvbmZpZy5pbgppbmRleCA0NTI2MzAzMGYuLjVhZDAwZjVjNCAxMDA2NDQK
LS0tIGEvcGFja2FnZS9sdWFzb2NrZXQvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvbHVhc29ja2V0
L0NvbmZpZy5pbgpAQCAtNiw0ICs2LDQgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0xVQVNPQ0tFVAog
CSAgSXQgcHJvdmlkZXMgZWFzeSBhY2Nlc3MgdG8gVENQLCBVRFAsIEROUywgU01UUCwKIAkgIEZU
UCwgSFRUUCwgTUlNRSBhbmQgbXVjaCBtb3JlLgogCi0JICBodHRwOi8vbHVhZm9yZ2UubmV0L3By
b2plY3RzL2x1YXNvY2tldC8KKwkgIGh0dHBzOi8vZ2l0aHViLmNvbS9sdW5hcm1vZHVsZXMvbHVh
c29ja2V0CmRpZmYgLS1naXQgYS9wYWNrYWdlL2x1YXNvY2tldC9sdWFzb2NrZXQuaGFzaCBiL3Bh
Y2thZ2UvbHVhc29ja2V0L2x1YXNvY2tldC5oYXNoCmluZGV4IDg0MzY0N2IyNy4uYjY2YWU1N2I5
IDEwMDY0NAotLS0gYS9wYWNrYWdlL2x1YXNvY2tldC9sdWFzb2NrZXQuaGFzaAorKysgYi9wYWNr
YWdlL2x1YXNvY2tldC9sdWFzb2NrZXQuaGFzaApAQCAtMSwzICsxLDMgQEAKICMgY29tcHV0ZWQg
YnkgbHVhcm9ja3MvYnVpbGRyb290Ci1zaGEyNTYgNDUzZmMxZDBlOWI2YTQ0YmJhZGE0MjkwZDU2
NWY4NDBhNWU5NmJhMmQxYjQ3NTYyYmEzOGJkOWM3ZTgyMTk1YSAgbHVhc29ja2V0LTMuMHJjMS0x
LnNyYy5yb2NrCi1zaGEyNTYgOGU4YzYzMTRkOWU3OGZlNDUyZWUzNTUxNjdmMmM0MGNmYmVlODIw
N2UxNGRjYjVkZGQ0YTI2NTVjYjVjNmFhZCAgbHVhc29ja2V0LTMuMC1yYzEvTElDRU5TRQorc2hh
MjU2ICA2M2ZkMmRkMThkZmUyNDJjYTViY2MxMjAzODM5ZTg2YTljODkzNjI2MWE5Y2E5ZjMyMDBm
MmRlYWI0MzFkYTg4ICBsdWFzb2NrZXQtMy4wLjAtMS5zcmMucm9jaworc2hhMjU2ICAyMjRhZmU0
MmQwNzM4ZWFhZWI1N2FiMjg5NDY2YTFjNGU3NzA5MTU5MWU2OWRiY2VmMmRiYjM4NTU4OWYyZjQx
ICBsdWFzb2NrZXQvTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdWFzb2NrZXQvbHVhc29j
a2V0Lm1rIGIvcGFja2FnZS9sdWFzb2NrZXQvbHVhc29ja2V0Lm1rCmluZGV4IDIwOTI3ZmMxZC4u
ZWVlY2UyNmZkIDEwMDY0NAotLS0gYS9wYWNrYWdlL2x1YXNvY2tldC9sdWFzb2NrZXQubWsKKysr
IGIvcGFja2FnZS9sdWFzb2NrZXQvbHVhc29ja2V0Lm1rCkBAIC00LDggKzQsOCBAQAogIwogIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotTFVBU09DS0VUX1ZFUlNJT04gPSAzLjByYzEtMQotTFVB
U09DS0VUX1NVQkRJUiA9IGx1YXNvY2tldC0zLjAtcmMxCitMVUFTT0NLRVRfVkVSU0lPTiA9IDMu
MC4wLTEKK0xVQVNPQ0tFVF9TVUJESVIgPSBsdWFzb2NrZXQKIExVQVNPQ0tFVF9MSUNFTlNFID0g
TUlUCiBMVUFTT0NLRVRfTElDRU5TRV9GSUxFUyA9ICQoTFVBU09DS0VUX1NVQkRJUikvTElDRU5T
RQogCi0tIAoyLjMyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
