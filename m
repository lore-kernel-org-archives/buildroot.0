Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB77BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 09:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F07F833DB;
	Wed, 27 Apr 2022 09:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KW5y3xNeHFKQ; Wed, 27 Apr 2022 09:46:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A21BA832FF;
	Wed, 27 Apr 2022 09:46:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18AB21BF2F8
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 09:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DDA382EBA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 09:46:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RP9lHOuE8FX5 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 09:46:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D23B882E19
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 09:46:29 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d5so1686505wrb.6
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 02:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dCY/8OxhRqECDes2nxvctUL7VToa2vyXSpshLYxC5Yc=;
 b=cpHTe7it0CMbGOpAKCiDJVp0CAb8167uerT6jpnsBTZl9qaDGgKSkEo+qZ6BnZsx2v
 n3moC4wIMTJY7sBnGKN1KBXttSAiEliGFwl0Wg8hOMTscYxebPTu8TFGF7VavP94tgs4
 8xSPLRF8SmwBDmdQONL9H0g/ZLe0RP77JLUDPXT2P/WD4wsbMjTFDrBUYkq4Z5D13xND
 DkEm9WtauR2CdPHYB0p/OxTMGNRhhBR3VVTvkbwTP6AHZucHyX6mzuprwEJs6P03WndI
 MzYmQzwGO1hTC0STE6jTe+jbra0GP0H1kz3HVvwpth3mjn/gIQNxK2GyWM/Z1RJPn5HJ
 +Gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dCY/8OxhRqECDes2nxvctUL7VToa2vyXSpshLYxC5Yc=;
 b=6wKgH01GvFOv0y//Z7iY6dHCoYyihz+Ug7b4vRJoTbyOijvNIJ7AlrDlX6lL4cRpmX
 l9SKsXcgIukIfqYgdHX4rHzPA/+dBZV8iflXqVMPFOk60JjF2Re8Y39f08GX1tZC7J0q
 KNJjSjDTXsmvNyGTN/HjNh3q6Cv5q1lEZUJo8eSuoDssXVkwek4lkKkOCWYD6aOfnlzv
 t6TZcMx2f4E0KC6DIlst0A4ldzn6BhaQSo5UnNEHzXDpyczpovXXxJBKLbtoiXsYwa6v
 C1d/2EuGIUejYSHuYxPuzvBSs//tO0tJhPlQFYXj6esHLOqY0Z/JN5kD3kzqd7JUD52N
 Vv9w==
X-Gm-Message-State: AOAM533j+OHm+08w8SNYVsciZI/Q/H7QMuNAa193GtrFWNHdmk1ab9bn
 pAyj1xKrfFVzTZMyzhOfEdQS/uefJ9mMQw==
X-Google-Smtp-Source: ABdhPJyDHAQl5tsHWymkJT8NFXYcwjy2etZIc7OArwEDndP7EpXTyMXyF/JrESffWCVdmi3UWvy5TA==
X-Received: by 2002:a05:6000:10c4:b0:20a:d4ee:d962 with SMTP id
 b4-20020a05600010c400b0020ad4eed962mr15545435wrx.649.1651052787766; 
 Wed, 27 Apr 2022 02:46:27 -0700 (PDT)
Received: from lmecxl0524.lme.st.com
 ([2a04:cec0:116a:ef1f:b81d:eca1:1a27:59be])
 by smtp.gmail.com with ESMTPSA id
 bi26-20020a05600c3d9a00b0038ed39dbf00sm1169198wmb.0.2022.04.27.02.46.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 02:46:27 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Wed, 27 Apr 2022 11:45:59 +0200
Message-Id: <20220427094608.16698-1-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] boot/optee-os: bump to version 3.17.0
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVtcCBPUC1URUUgT1MgcGFja2FnZSB2ZXJzaW9uIHRvIE9QLVRFRSByZWxlYXNlIDMuMTcuMC4K
CkNjOiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+ClNpZ25lZC1v
ZmYtYnk6IEV0aWVubmUgQ2FycmllcmUgPGV0aWVubmUuY2FycmllcmVAbGluYXJvLm9yZz4KLS0t
CiBib290L29wdGVlLW9zL0NvbmZpZy5pbiAgICAgfCA0ICsrLS0KIGJvb3Qvb3B0ZWUtb3Mvb3B0
ZWUtb3MuaGFzaCB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4gYi9ib290
L29wdGVlLW9zL0NvbmZpZy5pbgppbmRleCAzMGI2ZjYyNDM0Li5mYjhhMTg5YTc1IDEwMDY0NAot
LS0gYS9ib290L29wdGVlLW9zL0NvbmZpZy5pbgorKysgYi9ib290L29wdGVlLW9zL0NvbmZpZy5p
bgpAQCAtMTgsNyArMTgsNyBAQCBjaG9pY2UKIAkgIFNlbGVjdCB0aGUgdmVyc2lvbiBvZiBPUC1U
RUUgT1MgeW91IHdhbnQgdG8gdXNlCiAKIGNvbmZpZyBCUjJfVEFSR0VUX09QVEVFX09TX0xBVEVT
VAotCWJvb2wgIjMuMTYuMCIKKwlib29sICIzLjE3LjAiCiAJZGVwZW5kcyBvbiBCUjJfUEFDS0FH
RV9IT1NUX1JVU1RDX0FSQ0hfU1VQUE9SVFMKIAlzZWxlY3QgQlIyX1RBUkdFVF9PUFRFRV9PU19O
RUVEU19QWVRIT05fQ1JZUFRPR1JBUEhZCiAJaGVscApAQCAtNTIsNyArNTIsNyBAQCBlbmRpZgog
CiBjb25maWcgQlIyX1RBUkdFVF9PUFRFRV9PU19WRVJTSU9OCiAJc3RyaW5nCi0JZGVmYXVsdCAi
My4xNi4wIglpZiBCUjJfVEFSR0VUX09QVEVFX09TX0xBVEVTVAorCWRlZmF1bHQgIjMuMTcuMCIJ
aWYgQlIyX1RBUkdFVF9PUFRFRV9PU19MQVRFU1QKIAlkZWZhdWx0IEJSMl9UQVJHRVRfT1BURUVf
T1NfQ1VTVE9NX1JFUE9fVkVSU0lPTiBcCiAJCQkJaWYgQlIyX1RBUkdFVF9PUFRFRV9PU19DVVNU
T01fR0lUCiAKZGlmZiAtLWdpdCBhL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MuaGFzaCBiL2Jvb3Qv
b3B0ZWUtb3Mvb3B0ZWUtb3MuaGFzaAppbmRleCBkM2EyNjM3YTRlLi41YzEwNDdiYWMzIDEwMDY0
NAotLS0gYS9ib290L29wdGVlLW9zL29wdGVlLW9zLmhhc2gKKysrIGIvYm9vdC9vcHRlZS1vcy9v
cHRlZS1vcy5oYXNoCkBAIC0xLDQgKzEsNCBAQAotIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9P
UC1URUUvb3B0ZWVfb3MvYXJjaGl2ZS8zLjE2LjAvb3B0ZWUtb3MtMy4xNi4wLnRhci5negotc2hh
MjU2ICBlYmM4ZTE4YWQyMDM5ZWU5N2MzNGY3NGE3NTQ2ZGU5MTE5ZTI2ZjA0YzM2OGI2YzdmZDBj
NTVmOTNkMzNkMmQ2ICBvcHRlZS1vcy0zLjE2LjAudGFyLmd6CisjIEZyb20gaHR0cHM6Ly9naXRo
dWIuY29tL09QLVRFRS9vcHRlZV9vcy9hcmNoaXZlLzMuMTcuMC9vcHRlZS1vcy0zLjE2LjAudGFy
Lmd6CitzaGEyNTYgIDVkNWEzYmRhODNhYmRkZmViNWVlNzY1YTE1NTI1ZjIzYWRmMjcwOWJhMjQ3
NWEwNWUwYzVmMjU3OTBjMTg4M2YgIG9wdGVlLW9zLTMuMTcuMC50YXIuZ3oKICMgTG9jYWxseSBj
b21wdXRlZAogc2hhMjU2ICAxMjQ3ZWU5MDg1OGY0MDM3YjZjYWM2M2NiZmZkZGZlZDQzNWQwZDcz
YzYzMWIzN2Q3OGMxZTZlNmFiM2U1ZDFhICBMSUNFTlNFCi0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
