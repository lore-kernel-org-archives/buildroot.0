Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA92C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 11:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6527830A8;
	Tue,  4 Oct 2022 11:15:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6527830A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l4dzKXp3n0GQ; Tue,  4 Oct 2022 11:15:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B97582FC9;
	Tue,  4 Oct 2022 11:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B97582FC9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 52EB81BF863
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3AFD960B46
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 11:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AFD960B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NV8DUuW0XRNx for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 11:15:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAD2360B43
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAD2360B43
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 11:15:40 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id b6so14907162ljr.10
 for <buildroot@buildroot.org>; Tue, 04 Oct 2022 04:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=O1m/ZThuWPFASKdlLzglNy3ogJSnnA9aYnJc+CxhYaE=;
 b=hoYAk2BZ5ECRhX1ZCAkPntWMlJ0FiYJv1l5kvp7DBX5ZjYRaqetcDRHbvfjyIKYw5x
 eRI7ZRk/7h3xKTfQnIAt+4BJ1K6lmxfjkpujmyWNuflsVSKVXh7GFpD/HOKeRjwiIqwe
 pVptgkBaEeOOdNqEACa8kI9wDQT8MI0Mz67qiefgaJjBMSqXQd43MHt6A9vAFwQYMAoT
 SAjIZj6cWXf1i5KasQ/v6TR9c+OGRjSinzLa9mnustqozIkskKT88OSQzz8/C70o3yZw
 7i56WML43TGouk38sviosI1RgluJwADNzMnCBTMrOZY9R3mXYjbdrN1KgXSb/p+H/T5s
 i3SQ==
X-Gm-Message-State: ACrzQf3Zf8IsjgG/nm/Ag4g+/53BXRrbcej+24wHNf9qCJZvGvf7AVUs
 zHDQQs9E3uZGnOIfjUrRqObOkccKVBqFZA==
X-Google-Smtp-Source: AMsMyM4eKiA05w2TY+ldNM0mbIjsvxKN07tjpT87j9v9z5ChKWyT1gAHc3PJac2cZqr+BFlymqV6Ng==
X-Received: by 2002:a05:651c:2107:b0:26c:504f:6de4 with SMTP id
 a7-20020a05651c210700b0026c504f6de4mr7617891ljq.414.1664882138720; 
 Tue, 04 Oct 2022 04:15:38 -0700 (PDT)
Received: from localhost.localdomain (dsl-129-78.bl27.telepac.pt.
 [176.79.129.78]) by smtp.googlemail.com with ESMTPSA id
 n18-20020a2e9052000000b0026acd11cd51sm1222701ljg.59.2022.10.04.04.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 04:15:38 -0700 (PDT)
From: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 12:15:27 +0100
Message-Id: <20221004111528.384625-2-nunog@fr24.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004111528.384625-1-nunog@fr24.com>
References: <20221004111528.384625-1-nunog@fr24.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fr24.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=O1m/ZThuWPFASKdlLzglNy3ogJSnnA9aYnJc+CxhYaE=;
 b=E91xc3PnDBjXh9Ugsapqy4w4SnpxbMzYewOgH9ufydlN3zObuQFIuzdIIJ27gmPCSv
 oVOJSROPvkIubuJWjl88F+ThAarEm/piRF8oHhE6u5bKON3n0xiMEwbzbKfX83n8QMrY
 iBF8a5Lfe8qKnzthH/jpHkszD42PLbyQpRgm5KIm32MUPXlv1Nnjn47bKgtKJ5kFDLGn
 A+0D6ybQL3Hy1PA4esyT4Q0A67V3D4t+LMTH66BfZQIgm+uSPKMBIqZW28KSWwyyu8JI
 gP98yLO73os9caar7TrdkkRRzcBEShOFDLg7ETU7j7z37qX/aMJcXo+i8RdN8ZVxXqYU
 2VSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=fr24.com header.i=@fr24.com
 header.a=rsa-sha256 header.s=google header.b=E91xc3Pn
Subject: [Buildroot] [PATCH 2/3] package/sudo: explicitly disable tzdir and
 tmpfiles as otherwise they are based on build host directories
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
Cc: =?UTF-8?q?Nuno=20Gon=C3=A7alves?= <nunog@fr24.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogTnVubyBHb27Dp2FsdmVzIDxudW5vZ0BmcjI0LmNvbT4KLS0tCiBwYWNr
YWdlL3N1ZG8vc3Vkby5tayB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL3N1ZG8vc3Vkby5tayBiL3BhY2thZ2Uvc3Vkby9zdWRvLm1r
CmluZGV4IDRmOWZkYjRiMmMuLjk3ZjgzZDlmNmYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvc3Vkby9z
dWRvLm1rCisrKyBiL3BhY2thZ2Uvc3Vkby9zdWRvLm1rCkBAIC0xNiw2ICsxNiw4IEBAIFNVRE9f
U0VMSU5VWF9NT0RVTEVTID0gc3VkbwogIyBUaGlzIGlzIHRvIGF2b2lkIHN1ZG8ncyBtYWtlIGlu
c3RhbGwgZnJvbSBjaG93bigpaW5nIGZpbGVzIHdoaWNoIGZhaWxzCiBTVURPX0lOU1RBTExfVEFS
R0VUX09QVFMgPSBJTlNUQUxMX09XTkVSPSIiIERFU1RESVI9IiQoVEFSR0VUX0RJUikiIGluc3Rh
bGwKIFNVRE9fQ09ORl9PUFRTID0gXAorCS0td2l0aC10emRpcj1ubyBcCisJLS1lbmFibGUtdG1w
ZmlsZXMuZD1ubyBcCiAJLS13aXRob3V0LWxlY3R1cmUgXAogCS0td2l0aG91dC1zZW5kbWFpbCBc
CiAJLS13aXRob3V0LXVtYXNrIFwKLS0gCjIuMzcuMwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
