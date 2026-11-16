Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCBF606A339
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 21:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Fs3YDiQ1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oMcLX8qy
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF840810E4;
	Mon, 16 Nov 2026 21:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0D4FcG9u-Hy3; Mon, 16 Nov 2026 21:36:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 440AA810CC
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794864988;
	b=arSaJ5hdhBv4OQN/OJwGJOqd/TxmljsWn/zw6WNEg16c0dD5Jk1y5oZVp9TFziQApj4o
	 u5RQ1/Ofa8Mmzo3rcg6Bd77ATj6Vjt1TGKOJkZcqsQH1yVYOXbPItMRUi80yXhjD1PQFa
	 ktAxqjoozNTY5PE923e/9MdcFH9LLEJ8ggoRakxhPD1OJB2MTDUzUHlGCihI9xQa/z6nA
	 5IEDTTcBjPqEOFrfNk9hei6MNMwKoQdLL29yU8n8eYNlLU5a/mAW9O6KB9mY5cQy9plu4
	 kzS72Rfi5yQga1eH5FRMWHNCuiXisKi6dWOygLtmMt1amXHwoY1ldwLVitjAnsRzBBA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794864988;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=ERyFcqGd7KlgACUm6JCmJqHuqG3RNE9h6EMFO+8GSps=;
	b=OKbImkAxgAqQMbtM8dsxEw3+wwwk8dDjjXZ77vaz0RwWimzPtLvt+dWee5PY9hQjX5fi
	 rw8Z7/rT2sEMru80auDCxLOk++PW+NiZqwtd13KD82ria1ZOZW7eL5zYxJ6GaeEoNn/9c
	 7PexAPXmUz0DDc8vkI2GWARpbFZtS+a7pFwvElBbcvc+zvM45shTMdqXccWo1CJiVQBqP
	 v89glgl5qsffusLhK4STyN+2TiyCz1KUnuL8lKfwRQrLwEnagA602iB9jvnADdK4Jjebw
	 i4x59KD7Q8aZndpnhWp6zTCsq5ja/Ih29c2lRg5mfYSNAts0toD3w8ekan6n6CMx+iw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794864988;
	bh=ERyFcqGd7KlgACUm6JCmJqHuqG3RNE9h6EMFO+8GSps=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Fs3YDiQ1LEBNSPOVcxR4RK0yqhpoXzJP6dJnBdMqkip5Xw8dDglFCVSHX+gPI7A+P
	 wRUJcv2f29GvqeLliy+WHV1F5K5AzerR/3gFt1qhUqKcHuioNiLy83vTxmLguRBJw/
	 1cHe8HKC5LZomV6XozIcbSV3CIdTEpSPJ6Sltkmn4LtVBi5doFoIXNhlhna7Za7FOW
	 ynka+6IKdgSSS2s4Aj1eJGSxzlU5G+f9jX0Z3QarteYpUlvtAcgbzFf0Pjt08hZHLx
	 XbO3yES3J4uMkcdEoEvUMoLMVfD+tiKxc9UbS8FTnFzzNJLJqWb79SoboClQ1wbup/
	 y9EcKHQ4MCQkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 440AA810CC;
	Mon, 16 Nov 2026 21:36:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10EC549B
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0329B60774
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:36:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRa_pZj_3JxM for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 21:36:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F1C3F6073B
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=oMcLX8qy
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1C3F6073B
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 21:36:24 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-490d59c3f0aso1609694f8f.1
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 13:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794864983; x=1795469783; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VqIy7CmL4OS+o711iqY1E06DY6EvyM/70A03WFMnhW0=;
 b=oMcLX8qyNr26G4iet5aKtsynP6uBoFWnz+DGD/JHaO4ZT/wruqorynLMj2aRon2UhP
 +ypqg5LhJH2vd8d8jQoUJbM9BaklfwarfxH16hcbrizPK2vYM0lGUkdLwh4Gst09Lbp9
 rhyk83HFvr8cG/jaExPYT+Y6UAsWUjDk9A+niOrjeQQXBq+CisY8gZMBoi75XCMRtKkI
 wLR5TJ6EtuWWq0G9Ni8UXPAdijEegVJGalPGQpfEWO9NUQT2Pq801TvwM8d23iKZgIA5
 Ob3mZ2OVvcuEzJNyVeQNNzt6QehdgpR8RP8HLWQxuuqexU0VeUef1XvUFWX7Nves0nA8
 AUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794864983; x=1795469783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VqIy7CmL4OS+o711iqY1E06DY6EvyM/70A03WFMnhW0=;
 b=UuYLMLgFCo4yhv9GWrL7iJNvMNo2WM/IjY5YtW1r/lmn1nh8Lt/k0TbrYpdpHbsUKe
 lRrvVITJvUtoLDWi46tWjhVv36vCNidxlF3+GNS7PK49W3KvxZbJnYQjwNb6uWpaPaN3
 N+8mn3SSyr0Lw8nSTDhCtpIdDQkQbvY+CR6ByQukaPCQjvEcZqbDQ7K8Nh/gSUPVMMMZ
 wCTWV4hJ7u3ThCCWUGK61yvAWSg6zD45FbdGsPKuWZ5luwzhuxPz0WMXswCHwkEuUfJf
 Usp+Cs7zrBFyBuq+OlnS4pBF+AOdKD/o56tUyoA2DM/szZBGnAMlaDuAkWRA4QulAK/I
 X+OA==
X-Gm-Message-State: APuU4Z/K3wZIyy54jLbXSO9+jR/yLvveQQHXf4sB4yUXXH+OKxv7ke2I
 D9C587Qg424x6zsM3Gi/mdlgaBMO0Mt5nAxvuXRHki5bduQ2x0XBxHeG1Yn6b5nV
X-Gm-Gg: AZFdTZddAbvjKr/AlySKXthtBbfjotcdYE8xVWbsgraC36druGw7UsySheKbfM+8rCY
 eRi2fKEpDQMqOzm9W7FkCAoDMG2EjWWqkXZWpSZ4tx7QPTFgyWtO7kX1DtguEnhYSwz6K0wC6gu
 UEkRifp6PqaZ++EWnFlLWozqppIXqpp93YFzqmbBW456ybFHvFolPHYTdmuYJUVXGk6Q8cdtUJr
 BskDb4EFHQEbdVuZBd+nK7GRYXvi2x0X9lh5mMwVHAtpYrPN+qNkUhDQFwlBQh+znxUKO6pDqh3
 k25SMNrS/eWKp0Q5VgtyGq9exH4TU4f2uxu4SsdwULvsgoaueMtP+xrp+nZTQNiOvz9fHaRZkIX
 S2xQobPZ/6FM9ZA+ppajuByt1QW+nuB/571OtJE37q8ZR51INnB0fb7qdxkcHP3eY4yrqWaNJVY
 rXzoHviG21kRcdclu4vmD1berhXZb2pGUyfiltIPLTD2owy4WWuzOJU+Iqg32R7EbEBI7mFpp3K
 kJxht03AIyUP+G8vYe8l0aZhOv/f60qkjNnzC97ZmYYYDBm/ZWr2XuUv/rbY9jtqymfNqwIos8w
 dKz2tEXfq1HhmoZlugh1DBzOlkm+3CkTkkw0juda3836CJszCtRk
X-Received: by 2002:a05:6000:4911:b0:48d:f39b:83de with SMTP id
 ffacd0b85a97d-49c6e68dacbmr25273424f8f.3.1794864982715; 
 Mon, 16 Nov 2026 13:36:22 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c18b9sm20248008f8f.20.2026.11.16.13.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 13:36:22 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Nov 2026 22:36:11 +0100
Message-ID: <20261116213612.873856-5-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116213612.873856-1-angelo.compagnucci@gmail.com>
References: <20261116212913.863975-1-angelo.compagnucci@gmail.com>
 <20261116213612.873856-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 4/5] package/python-matplotlib: add Qt6
 support to the Qt display
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Dylan Bespalko <dylan.bespalko@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The "qt display" option of matplotlib needs the Python bindings of Qt.
Until now, it only worked with Qt5 and python-pyqt5.

With Qt6, use python-pyside6. The Qt backend of matplotlib finds the
bindings at run time, and it supports both PyQt5 and PySide6.

Qt5 and Qt6 cannot be enabled together, so the option selects the
bindings that match the Qt version of the configuration.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v4 -> v5:
  - New patch: the Qt display of matplotlib works with Qt6 too, with
    python-pyside6. With Qt5 it still uses python-pyqt5. It was already
    in the second v4, sent by mistake

 package/python-matplotlib/Config.in            | 15 +++++++++++----
 package/python-matplotlib/python-matplotlib.mk |  6 ++++++
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index 13894004aa..8cd931ffb0 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -35,10 +35,17 @@ if BR2_PACKAGE_PYTHON_MATPLOTLIB
 
 config BR2_PACKAGE_PYTHON_MATPLOTLIB_QT
 	bool "qt display"
-	depends on BR2_PACKAGE_QT5 # python-pyqt5
-	select BR2_PACKAGE_PYTHON_PYQT5
-	select BR2_PACKAGE_QT5BASE_FONTCONFIG
-	select BR2_PACKAGE_QT5BASE_WIDGETS
+	depends on BR2_PACKAGE_QT5 || \
+		(BR2_PACKAGE_QT6 && \
+		BR2_PACKAGE_QT6_GL_SUPPORTS && \
+		BR2_PACKAGE_LLVM_ARCH_SUPPORTS) # python-pyside6
+	# Qt5
+	select BR2_PACKAGE_PYTHON_PYQT5 if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_FONTCONFIG if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_WIDGETS if BR2_PACKAGE_QT5
+	# Qt6
+	select BR2_PACKAGE_PYTHON_PYSIDE6 if BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT6BASE_FONTCONFIG if BR2_PACKAGE_QT6
 
 endif
 
diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
index 067bd68685..244663f719 100644
--- a/package/python-matplotlib/python-matplotlib.mk
+++ b/package/python-matplotlib/python-matplotlib.mk
@@ -27,8 +27,14 @@ PYTHON_MATPLOTLIB_CONF_ENV += \
 	_PYTHON_SYSCONFIGDATA_NAME=$(PKG_PYTHON_SYSCONFIGDATA_NAME) \
 	PYTHONPATH=$(PYTHON3_PATH)
 
+# The Qt backend of matplotlib finds the Python bindings of Qt at run
+# time: PyQt5 with Qt5, PySide6 with Qt6.
 ifeq ($(BR2_PACKAGE_PYTHON_MATPLOTLIB_QT),y)
+ifeq ($(BR2_PACKAGE_QT5),y)
 PYTHON_MATPLOTLIB_DEPENDENCIES += python-pyqt5
+else
+PYTHON_MATPLOTLIB_DEPENDENCIES += python-pyside6
+endif
 endif
 
 $(eval $(meson-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
