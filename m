Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF45C46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 11:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96EB540894;
	Tue, 26 Dec 2023 11:24:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96EB540894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dMCpEPGWDIav; Tue, 26 Dec 2023 11:24:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D96C84086D;
	Tue, 26 Dec 2023 11:24:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D96C84086D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C3E4F1BF309
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 11:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98350408C5
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 11:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98350408C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LUCgSGkekbgM for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 11:24:23 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AB11400EF
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 11:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AB11400EF
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d5aef534eso2596435e9.0
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 03:24:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703589860; x=1704194660;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4aqpHQPOxk0zZMUJiLZLH5YrN+N3shrP8N5t4QVB0cw=;
 b=X8RJAQPfSAK8AQD7BNaHpz4XMjUD2zAScqntfWOQA6lXXDQQ1xkn/kymYxskMl0kcT
 YR2SmgWtOH0pHRZfyl4AW8kZT7bnJCQml+kk9MTj28WGZyUJBo+h7WlRuaMj8fOnz7OX
 s8ltT4wLuhJEaWcMOE2pjklmMnxWiJfOijnydXy7jLqx/W0wGDrx7ek1gNFQMO1XwBTs
 /yU4jmEL3xM0yOk3+MCmDikSJgFmyEpNPcp1ph2si7yf6tAuPf0Vg/Ohuaobs0kxd2QU
 5bqtSPIWvuzv/esq/g/BsGP80kY67EWrIgUIFAyvNiKfE9f5s2n3GoQrxl0p9wqTRHHy
 KavQ==
X-Gm-Message-State: AOJu0YwKfr4pPlmu2AXWcVzeWLWwgrdUfEDTJuLskuygua/F9+UUJE67
 CP3c9utkR72+yLfAiJVB6MRxZQgy0qw=
X-Google-Smtp-Source: AGHT+IFL/sxMGmFk50R+k5szu9ZgUfk8Y/5F9nOjAVaVxbyiVj6edPR6JhuJckZku1p+IbJGfGACyQ==
X-Received: by 2002:a05:600c:1394:b0:40d:3b70:5365 with SMTP id
 u20-20020a05600c139400b0040d3b705365mr3850871wmf.123.1703589860294; 
 Tue, 26 Dec 2023 03:24:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0040c11fbe581sm20490035wmq.27.2023.12.26.03.24.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Dec 2023 03:24:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 12:24:17 +0100
Message-ID: <20231226112417.10657-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703589860; x=1704194660; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4aqpHQPOxk0zZMUJiLZLH5YrN+N3shrP8N5t4QVB0cw=;
 b=Kq/XkmUQiXqH9Ge+Z/eVmgJjDvoZI/IiB3ST972KODLLfIDqwQTAYItEFRsXiT4Uxh
 CiCxsRUp3Chf4Ohhbo4mp+HxUOW3AAsAn76dB4FvnQ7RIBY804Hkm8cydK9ktECrkvGf
 9W1hMgfF0xkIg5m6uOdQJhz2x8PHnnSQScpXwXjPKLJV8U0qAgyjrZ91rGpO09ZEUkmP
 jW9PSTbNFoxxajWUmOqZguSyz7bXH5lHdLOxK7YEZXobGyb9wglI9gQSIr0nFR9sBzEm
 NHLgcv6IIVN7PLg91LIj/Ph3ry2M29RSOqZD1jMpa8NjyNDba6dhK7FKy08jJDtnmjVg
 +KWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Kq/XkmUQ
Subject: [Buildroot] [PATCH 1/1] package/python-fastapi: add CPE variables
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:fastapi_project:fastapi is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/E6E33EA5-0404-4037-9B3E-FE718E1593E5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-fastapi/python-fastapi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index db86bfce30..dc6d919926 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -10,6 +10,8 @@ PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/77/bb/5941e6e2ce30
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
+PYTHON_FASTAPI_CPE_ID_VENDOR = fastapi_project
+PYTHON_FASTAPI_CPE_ID_PRODUCT = fastapi
 PYTHON_FASTAPI_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
