Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6601C636D4
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 15:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E5A26119F;
	Thu,  2 Feb 2023 15:28:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E5A26119F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olaWagKlBvR1; Thu,  2 Feb 2023 15:28:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 121E560C14;
	Thu,  2 Feb 2023 15:27:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 121E560C14
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A60F41BF405
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 15:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E15260C14
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 15:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E15260C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RMHrAaPZ28w4 for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 15:27:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D75FF60AE2
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D75FF60AE2
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 15:27:54 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ud5so6993642ejc.4
 for <buildroot@buildroot.org>; Thu, 02 Feb 2023 07:27:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S97PwKQ1+zBTeuIVgMaWknoKptVdKIRF8xt3vKtgQJQ=;
 b=HpmnDtskDz18OOB/oZD2OEbhFEDOW68XhwTbJXO2xTPRBmkfJKYAaY74+Jor2b0kzr
 Qkc6s4K10cQ2jTHv7f7rRbCgkyr62l+HyGrAimoIE2R4kPycDd9XL2utGO7SojG1G/mo
 3aap8VjNOGnG28+wpLPVzIjgnif/A90oUGfGZKhz/9cnUxNA6zGWXowfDBREhKkEHnoi
 ewEvAK1RG9dkO0XTmtKdOmvB7bfq+iHm8e5luI7hrR+r3G/keXr9VqUkxT+/kYDVxxLc
 NOdiIZ4leYVfHyffn2hX9JmbhVKwm0zjE92PFkNqrsOR47cxKgBNDlanZ5xRVzjw7hCb
 10+Q==
X-Gm-Message-State: AO0yUKXGDnU4VM+R6hbQsAiTaH8f/jHbyxSgL7B0TvyV9BP+Vw64HO9t
 cEsR2m9zsjLsVfwEk8/IiSBva6nMqn7owi1f
X-Google-Smtp-Source: AK7set+Z+6B3dyZ6tbc1EeEhqYJOmwOEmBfJnYXN3Z2YgEEAbry/ukLc5iFOufZz/bubO9/B82W3Fw==
X-Received: by 2002:a17:907:9b05:b0:812:d53e:1084 with SMTP id
 kn5-20020a1709079b0500b00812d53e1084mr2291531ejc.70.1675351672913; 
 Thu, 02 Feb 2023 07:27:52 -0800 (PST)
Received: from localhost.localdomain
 (ptr-9fplejqcmbwz6qb22hk.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a170906951200b0088eb85e29c5sm1579462ejx.6.2023.02.02.07.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 07:27:52 -0800 (PST)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 16:27:43 +0100
Message-Id: <20230202152743.3916949-1-arnout@mind.be>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S97PwKQ1+zBTeuIVgMaWknoKptVdKIRF8xt3vKtgQJQ=;
 b=CEXulfYWn8F/F5VP15nwowclCwvfRJrCjky20Nhc6Y4l4JBIpY9nboGqvb+d4gH4z8
 ORk5GDUI98F+yrPrPSf1702FNGbPiXUitxhDpQljXnez3ICPquB7gF5lgi/3rsQJNFUY
 rRGtABwh8Vj0CJc9/XIcQs6zvAkoQQCu69mCA7fMx9udgSfGsoBs02rd5CFtqjy3xhBR
 7cBHyOafnra5FypXIs+jd2C0zfo4l5RVVV4TVgi+5wBXASA2T1GRpGoEqX4zd4QDSQnb
 uzEuBrZGVSBWhiHKu36LTZKae4m7QSyNVuyjwVt+nOVbVMzSiyOe+ziGUQ8IH9u60gbK
 YA8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CEXulfYW
Subject: [Buildroot] [PATCH] package/python-pytest: remove runtime
 dependency on python-toml
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since version 7.2 [1], with Python 3.11+ pytest no longer uses tomli to
parse pyproject.toml but instead uses tomllib which is part of Python
itself [2]. Note that toml was replaced with tomli in version 7.0, so
the dependency was anyway incorrect.

Note that tomllib is unconditionally installed as part of Python 3.11,
there is no PYTHON3_LIBTOML option or anything like that that needs to
be selected.

[1] https://docs.pytest.org/en/latest/changelog.html#pytest-7-2-0-2022-10-23
[2] https://github.com/pytest-dev/pytest/pull/9741

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
I can't be bother with sending a patch changing toml to tomli for
2022.11 - it's going EOL in two months anyway, and apparently nobody
noticed...
---
 package/python-pytest/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-pytest/Config.in b/package/python-pytest/Config.in
index c3956c76d2..9bbc9ea2d2 100644
--- a/package/python-pytest/Config.in
+++ b/package/python-pytest/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_PYTHON_PYTEST
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_PLUGGY # runtime
 	select BR2_PACKAGE_PYTHON_PY # runtime
-	select BR2_PACKAGE_PYTHON_TOML # runtime
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	help
 	  pytest is a framework that makes building simple and scalable
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
