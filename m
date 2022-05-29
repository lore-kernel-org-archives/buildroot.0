Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6C5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 13:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2352384720;
	Sun, 29 May 2022 13:19:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yRuAW4E_QGKu; Sun, 29 May 2022 13:19:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCF8E84707;
	Sun, 29 May 2022 13:19:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 88A271BF4D8
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8597560F08
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 281-TFFnsiYA for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 13:18:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F0996108E
 for <buildroot@buildroot.org>; Sun, 29 May 2022 13:18:27 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id k19so3289382wrd.8
 for <buildroot@buildroot.org>; Sun, 29 May 2022 06:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/4XExNpL8za0CglT3T9baVW3D9x6nqTI/HabKaiWH7w=;
 b=YIA9Lp2IwxzCCq5E0bv+4fHR5oNaxHn1+rtjolcGoIbmqkTKIguPvyXqrgsBC5/oQ0
 vvGpvZcJVj9ty69xsd8bfp2AnrkKqOLSOE3HEAqWCdgHfhOD8b+2ePpQ8WHBKW9w7rXq
 l24TSEk7pwmR2GQJ+6rsGE+4rpEvqlFIt4TLTAjd75uRfUl4m5pf+ttdtUQH1eoqzlh0
 hHR3BgxiJM/bcqGngOcZkvU9mGRmkd3hdRN/xXcDLmeW7pvnrjqrHuadtnQnlfQ8iaxt
 mTtzAwPWup95Mh5SSdvxjY/D5SVYwJxY5cG6b7atqoyd56DXHqDgOdBD2pdAgis176y6
 ZX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/4XExNpL8za0CglT3T9baVW3D9x6nqTI/HabKaiWH7w=;
 b=P+0eiR6j8D4tUfQ19TPmfENwkVBzBD2xFKwIiAxH2ZSH92h/Ifx9TZAoFgI1IuNqSi
 1W9T2Oz+UvcIXQI6KyGVY9pGWeBKc1yIThTDqxRCrrJtG1/cfBFhml4LdP+65AxAt5Hu
 id2sVpWZIIKsB96MSXryaeuLCq6eF2w+Hm/TP1vF9ytE/jZhwrT8bE5mn3oK58ArJqHG
 O1jwUw/Vdgz0Pey2sOU/xn6K4cMmWpyr0o35tFp3TNtye72/0KgmmKYWqFd9jdLo1ojx
 BU91jXbd/oUC4W8+r4EQ2bgDDzJo5M4jHICt+0ZCKpLSj6EdLuUg0Uv7Zj/HR386MrGh
 UO6A==
X-Gm-Message-State: AOAM530P0Bor6UaZ+RBz6Dc9iclwiBl7zOMQsX4EU7t00lCnhzjTUPiH
 KyftVd+7X0wvaoEA/mCKjvecZRfAh7Q=
X-Google-Smtp-Source: ABdhPJyevFxLAoYfXiyNMuq42XVXsyiloIA2Ovr1Ui6qKXUZXg4WtW5OzUbpAHVIsnHru/szVWSICA==
X-Received: by 2002:adf:e30f:0:b0:210:346e:d5da with SMTP id
 b15-20020adfe30f000000b00210346ed5damr383663wrj.313.1653830305459; 
 Sun, 29 May 2022 06:18:25 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a05600c34cf00b003949dbc3790sm7492562wmq.18.2022.05.29.06.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 06:18:24 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 15:18:05 +0200
Message-Id: <20220529131811.481017-5-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220529131811.481017-1-romain.naour@gmail.com>
References: <20220529131811.481017-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for-next 05/11] toolchain: enable libquadmath
 for PowerPC with VSX
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
Cc: Romain Naour <romain.naour@gmail.com>, Cyril Bur <cyrilbur@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ZmxvYXQxMjggaXMgYXZhaWxhYmxlIG9uIFBvd2VyUEMgd2l0aCBWU1ggWzFdIGJ1dCBpdCByZXF1
aXJlcwpsaWJxdWFkbWF0aCBzdXBwb3J0LgoKWzFdIGh0dHBzOi8vZ2NjLmdudS5vcmcvb25saW5l
ZG9jcy9nY2MtOS4xLjAvZ2NjL0Zsb2F0aW5nLVR5cGVzLmh0bWwKClNpZ25lZC1vZmYtYnk6IFJv
bWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KQ2M6IEN5cmlsIEJ1ciA8Y3lyaWxi
dXJAZ21haWwuY29tPgpDYzogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KLS0tCiB0
b29sY2hhaW4vQ29uZmlnLmluIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3Rvb2xjaGFpbi9Db25maWcuaW4gYi90b29sY2hhaW4vQ29uZmlnLmlu
CmluZGV4IDczZWE3ODYyNGEuLjdlMTI5ZTU4ZDMgMTAwNjQ0Ci0tLSBhL3Rvb2xjaGFpbi9Db25m
aWcuaW4KKysrIGIvdG9vbGNoYWluL0NvbmZpZy5pbgpAQCAtODMzLDkgKzgzMywxMSBAQCBjb25m
aWcgQlIyX1RPT0xDSEFJTl9IQVNfQVRPTUlDCiAjIC0gQXQgbGVhc3QsIGxpYnF1YWRtYXRoIGlz
IGF2YWlsYWJsZSBvbjoKICMgICAtIGkqODYKICMgICAtIHg4Nl82NAorIyAgIC0gUG93ZXJQQyB3
aXRoIHZlY3RvciBzY2FsYXIgKFZTWCkgaW5zdHJ1Y3Rpb24gc2V0CiAjIC0gV2hlbiBhdmFpbGFi
bGUsIGxpYnF1YWRtYXRoIHJlcXVpcmVzIHdjaGFyIHN1cHBvcnQuCiBjb25maWcgQlIyX1RPT0xD
SEFJTl9IQVNfTElCUVVBRE1BVEgKIAlib29sCiAJZGVmYXVsdCB5IGlmIEJSMl9pMzg2IHx8IEJS
Ml94ODZfNjQKKwlkZWZhdWx0IHkgaWYgQlIyX1BPV0VSUENfQ1BVX0hBU19WU1gKIAogZW5kbWVu
dQotLSAKMi4zNS4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
