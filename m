Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146ADC433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 11:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70074610A7;
	Tue, 26 Apr 2022 11:30:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T548FWZpr4OG; Tue, 26 Apr 2022 11:30:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6815D6100F;
	Tue, 26 Apr 2022 11:30:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 209081BF2B3
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 11:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D2676100F
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 11:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O74PexXJBPEH for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 11:30:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB48260E72
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 11:30:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso355117wmh.2
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 04:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1QV1gGmnulhQVDeBsYZf9WD1Hjkj+5ov5RI2ILhdmN8=;
 b=fTF5aFelccRMopciNr8+iY0qvJHWvQrbFVUzJVWhxZn5uG9AsHoblDjfJfO+Q8WlGS
 gR/4/AHtBqGKUeHyGRAonmOrtvgp7QAMrzjeMYO8y2woX6kvbKyuTTEPt2fcbtQ24PeP
 PpAfuZQu9U7RdL/fLKj4OSAORSY38B1E+IKu2a8jkQwgXn8L2A6uErkOn6Sy7hpDzW3d
 /ewWcnHgUI/X/0K15DyUJIUs/Uz7pqodfaMIHO85o6uaqQAgDYqoUGE4j4AFdbVPdDQ2
 hpzCLQSVpriaaHlj8fdRZlt0u+2Q+A81ucNAjqMxp4NmqnN66JqMTxH1yODjLwW7XIcE
 vf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1QV1gGmnulhQVDeBsYZf9WD1Hjkj+5ov5RI2ILhdmN8=;
 b=2enwR/CcPJhhG8j/0dsqj7jOD+a5XVeHfxU+9EA+vntPJKsuh+Gxm475hJ4KrLXLqW
 Ml07ffGRCAMdNe5inH8RBAQlmbMLFaXcuNI0cBZtzZ/rsxA5w+38sBlWSymVKSUH4oHo
 nV3JzPR7t5nYWvkLXPrangngblOwv5zz6XV3fl7XrHj0UphUsKonQ7ILCdq4OtQJegKU
 QC3xNt2s8rSImysF8izJelU8pwKRhl06g2WBnw5pAUT2rgHagQ9MzpbyxarcbKPhjs1C
 GfWUr8pxDVfwLj04KBIvTENdxVoMoAd3DHqaJIIcfHvsDVxbH60Vu+ARkzyPKJE4EMVd
 Koew==
X-Gm-Message-State: AOAM531MRH0q0WWlWqP9TyEt47B7MQ7DSqUyoVNjVOypO7ffMPBF7Y3Q
 3Z2b6gSbCRU/ejAhxXphroCYuOwTP5nqdA==
X-Google-Smtp-Source: ABdhPJzMXGcfrtzSeMMu9j0ejXAezFMxXaVXLaJDrRwUqdSAVtzPO7CIo5eGSiY1Y4foTeT/CnjBVw==
X-Received: by 2002:a7b:c5d1:0:b0:37f:a8a3:9e17 with SMTP id
 n17-20020a7bc5d1000000b0037fa8a39e17mr29244467wmk.109.1650972629825; 
 Tue, 26 Apr 2022 04:30:29 -0700 (PDT)
Received: from localhost ([207.188.150.225]) by smtp.gmail.com with ESMTPSA id
 p2-20020a1c7402000000b0038159076d30sm13644260wmc.22.2022.04.26.04.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 04:30:29 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 Philippe Serbruyns <Philippe.Serbruyns@ugent.be>,
 Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Apr 2022 13:30:09 +0200
Message-Id: <20220426113010.1463133-1-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/zfs: refactor test cases
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
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UGF0Y2ggdGl0bGU6IHBhY2thZ2UvemZzOiByZWZhY3RvciB0ZXN0IGNhc2VzCgpTaWduZWQtb2Zm
LWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNv
bT4KLS0tClRoZXNlIHBhdGNoIHNlcmllcyByZWZhY3RvciB0aGUgdGVzdCBjYXNlIGFuZCBhZGQg
bXVzbCB0b29sY2hhaW4uCkhlcmUgaXMgdGhlIGZpcnN0IG9uZSwgdGhhdCBvbmx5IHJlZmFjdG9y
IHRoZSBjdXJyZW50IHpmcyB0ZXN0IGNhc2VzLgoKIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3Rlc3RfemZzLnB5IHwgNjIgKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCA1MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weSBiL3N1cHBvcnQvdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5CmluZGV4IDcwNjkzNGNhNjUuLjFjYzAzMGU3OGMgMTAw
NjQ0Ci0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5CisrKyBi
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5CkBAIC0zLDEzICszLDEy
IEBAIGltcG9ydCBvcwogaW1wb3J0IGluZnJhLmJhc2V0ZXN0CiAKIAotY2xhc3MgVGVzdFpmc0ds
aWJjKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6CitjbGFzcyBUZXN0WmZzQmFzZShpbmZyYS5iYXNl
dGVzdC5CUlRlc3QpOgogICAgIGNvbmZpZyA9IFwKICAgICAgICAgIiIiCiAgICAgICAgIEJSMl94
ODZfNjQ9eQogICAgICAgICBCUjJfeDg2X2NvcmVpNz15CiAgICAgICAgIEJSMl9UT09MQ0hBSU5f
RVhURVJOQUw9eQotICAgICAgICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fWDg2XzY0
X0NPUkVfSTdfR0xJQkNfU1RBQkxFPXkKICAgICAgICAgQlIyX1JPT1RGU19ERVZJQ0VfQ1JFQVRJ
T05fRFlOQU1JQ19FVURFVj15CiAgICAgICAgIEJSMl9MSU5VWF9LRVJORUw9eQogICAgICAgICBC
UjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKQEAgLTYwLDU4ICs1OSwxNyBAQCBjbGFz
cyBUZXN0WmZzR2xpYmMoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKICAgICAgICAgICAgIHNlbGYu
YXNzZXJ0UnVuT2soY21kKQogCiAKLWNsYXNzIFRlc3RaZnNVY2xpYmMoaW5mcmEuYmFzZXRlc3Qu
QlJUZXN0KToKLSAgICBjb25maWcgPSBcCitjbGFzcyBUZXN0WmZzR2xpYmMoVGVzdFpmc0Jhc2Up
OgorICAgIGNvbmZpZyA9IFRlc3RaZnNCYXNlLmNvbmZpZyArIFwKKyAgICAgICAgIiIiCisgICAg
ICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9YODZfNjRfQ09SRV9JN19HTElCQ19T
VEFCTEU9eQorICAgICAgICAiIiIKKworCitjbGFzcyBUZXN0WmZzVWNsaWJjKFRlc3RaZnNCYXNl
KToKKyAgICBjb25maWcgPSBUZXN0WmZzQmFzZS5jb25maWcgKyBcCiAgICAgICAgICIiIgotICAg
ICAgICBCUjJfeDg2XzY0PXkKLSAgICAgICAgQlIyX3g4Nl9jb3JlaTc9eQotICAgICAgICBCUjJf
VE9PTENIQUlOX0VYVEVSTkFMPXkKICAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09U
TElOX1g4Nl82NF9DT1JFX0k3X1VDTElCQ19TVEFCTEU9eQotICAgICAgICBCUjJfUk9PVEZTX0RF
VklDRV9DUkVBVElPTl9EWU5BTUlDX0VVREVWPXkKLSAgICAgICAgQlIyX0xJTlVYX0tFUk5FTD15
Ci0gICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQotICAgICAgICBCUjJf
TElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1LjE1LjM1IgotICAgICAgICBCUjJf
TElOVVhfS0VSTkVMX1VTRV9DVVNUT01fQ09ORklHPXkKLSAgICAgICAgQlIyX0xJTlVYX0tFUk5F
TF9DVVNUT01fQ09ORklHX0ZJTEU9ImJvYXJkL3FlbXUveDg2XzY0L2xpbnV4LmNvbmZpZyIKLSAg
ICAgICAgQlIyX1BBQ0tBR0VfWkZTPXkKLSAgICAgICAgQlIyX1BBQ0tBR0VfUFlUSE9OMz15Ci0g
ICAgICAgIEJSMl9QQUNLQUdFX1BZVEhPTl9DRkZJPXkKLSAgICAgICAgQlIyX1BBQ0tBR0VfUFlU
SE9OX1NFVFVQVE9PTFM9eQotICAgICAgICBCUjJfUEFDS0FHRV9aTElCX05HPXkKLSAgICAgICAg
QlIyX1BBQ0tBR0VfTElCUkVTU0w9eQotICAgICAgICBCUjJfVEFSR0VUX1JPT1RGU19DUElPPXkK
LSAgICAgICAgIyBCUjJfVEFSR0VUX1JPT1RGU19UQVIgaXMgbm90IHNldAogICAgICAgICAiIiIK
IAotICAgIGRlZiB0ZXN0X3J1bihzZWxmKToKLSAgICAgICAga2VybmVsID0gb3MucGF0aC5qb2lu
KHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAiYnpJbWFnZSIpCi0gICAgICAgIGNwaW9fZmlsZSA9
IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgInJvb3Rmcy5jcGlvIikKLSAg
ICAgICAgc2VsZi5lbXVsYXRvci5ib290KAotICAgICAgICAgICAgYXJjaD0ieDg2XzY0IiwKLSAg
ICAgICAgICAgIGtlcm5lbD1rZXJuZWwsCi0gICAgICAgICAgICBrZXJuZWxfY21kbGluZT1bImNv
bnNvbGU9dHR5UzAiXSwKLSAgICAgICAgICAgIG9wdGlvbnM9WyItY3B1IiwgIk5laGFsZW0iLCAi
LW0iLCAiMzIwIiwgIi1pbml0cmQiLCBjcGlvX2ZpbGVdLAotICAgICAgICApCi0gICAgICAgIHNl
bGYuZW11bGF0b3IubG9naW4oKQogCi0gICAgICAgIGNtZHMgPSBbCi0gICAgICAgICAgICAjIElu
aXQKLSAgICAgICAgICAgICJtb2Rwcm9iZSB6ZnMiLAotICAgICAgICAgICAgIm1vdW50IC1vIHJl
bW91bnQsc2l6ZT0xMzJNIC90bXAiLAotICAgICAgICAgICAgImZhbGxvY2F0ZSAtbCA2NE0gL3Rt
cC9jb250YWluZXIxLnJhdyIsCi0gICAgICAgICAgICAiZmFsbG9jYXRlIC1sIDY0TSAvdG1wL2Nv
bnRhaW5lcjIucmF3IiwKLSAgICAgICAgICAgICJ6cG9vbCBjcmVhdGUgLW0gL3Bvb2wgcG9vbCBy
YWlkeiAvdG1wL2NvbnRhaW5lcjEucmF3IC90bXAvY29udGFpbmVyMi5yYXciLAotICAgICAgICAg
ICAgImRkIGlmPS9kZXYvdXJhbmRvbSBicz0xTSBjb3VudD04IG9mPS9wb29sL3VyYW5kb20iLAot
ICAgICAgICAgICAgInNoYTI1NnN1bSAvcG9vbC91cmFuZG9tID4gL3RtcC91cmFuZG9tLnNoYTI1
NiIsCi0gICAgICAgICAgICAjIENoZWNrIFpGUwotICAgICAgICAgICAgInpwb29sIGV4cG9ydCBw
b29sIiwKLSAgICAgICAgICAgICJ6cG9vbCBpbXBvcnQgcG9vbCAtZCAvdG1wL2NvbnRhaW5lcjEu
cmF3IC1kIC90bXAvY29udGFpbmVyMi5yYXciLAotICAgICAgICAgICAgImRkIGNvbnY9bm90cnVu
YyBicz0xTSBjb3VudD0zMiBzZWVrPTE2IGlmPS9kZXYvdXJhbmRvbSBvZj0vdG1wL2NvbnRhaW5l
cjEucmF3IiwKLSAgICAgICAgICAgICJ6cG9vbCBzY3J1YiAtdyBwb29sIiwKLSAgICAgICAgICAg
ICJzaGEyNTZzdW0gLWMgL3RtcC91cmFuZG9tLnNoYTI1NiIsCi0gICAgICAgICAgICAienBvb2wg
c3RhdHVzIC12IiwKLSAgICAgICAgICAgICMgQ2hlY2sgUHlaRlMKLSAgICAgICAgICAgICJhcmNf
c3VtbWFyeSIsCi0gICAgICAgIF0KLSAgICAgICAgZm9yIGNtZCBpbiBjbWRzOgotICAgICAgICAg
ICAgc2VsZi5hc3NlcnRSdW5PayhjbWQpCi0tIAoyLjM2LjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
