Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9352C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 01:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51E5E4038D;
	Tue, 26 Apr 2022 01:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H1V-hHF77WSn; Tue, 26 Apr 2022 01:23:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 568AF401D6;
	Tue, 26 Apr 2022 01:23:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 255CF1BF37A
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 01:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21FA282AA7
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 01:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8yna-rKeSD3U for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 01:23:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41EC282A83
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 01:23:18 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id o5so10499734ils.11
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 18:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zYwPMuwgsDcuQvKbAtOYrIoGQQclePF7JAXBMAABsdU=;
 b=VOMTeLlICG/riSjjzS2uww5cknGxnbbBoLO/TA5muIdzHzRaQ0CxEeteo2kpj58cVG
 g4RVc+oG7E+ucn556impbgDttVA0oxMSd+axx2YvNvKrHQV6OuD7wj0L2sSaovDlnPiL
 4w/6gd8ydR8oqwbVYOlMnXYTuFziSxaXhZV4jeNn7vLd6jdXX3mc/VH34pC0VmBIpyPx
 ey5GCXgtj4fRIE+/63EJpnWdlPcPR+tfn31gYYedDt5+Hr3D8XvKkRxEGFaSFlQB+WSn
 OaomTGFI3QzC5/kmntNgqZpkjVdsJxfNN126quE2U3/4t6iJ/Ac6Qd+EecgNwNAJDfDG
 kcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zYwPMuwgsDcuQvKbAtOYrIoGQQclePF7JAXBMAABsdU=;
 b=FdwZeeOItat/XywWPY1qNch5tdof3aZ+unEAq4kAZxuSGxNs7rLTxugr7cyGgKqgpI
 x6oAQvafUN8WQ1QO/EKIy46o6MbG4pN4gb9qQ7UcmGkTmQ2SfgckhUbhJfrxPD9tJ0WU
 JVtwq4ePM9HWN25hoc92ne9aVaiwX0RKOsuhFXj4lfPaRxyjVJw1S7FX2mfJanLyPwM0
 /xhcKHe0ZNgBQCZPNyTJrNVyVjxkcnkwfFbMvIFWtzsVSalf3ABSsJPNDHEMTD4m788G
 VqwmEgR0hgJ/jcEmfJjX0xP24g8vdTSEWkhIZD35EJt02Cb3884ope7Pcy5j0Yw6x+yF
 jg7Q==
X-Gm-Message-State: AOAM530+o3jokTKH1kAON/n+V8paogXjg/5vjx17plHqHoMCVFZxcOnj
 9jIqVAtYraTrYVg0bL+ylr8EeYednoZheQ==
X-Google-Smtp-Source: ABdhPJxDR1s7ED7/ZD1/TFYPAtrNVq/RPFCe53KRW3+rg3MD7N6bbZm5wrz7rDMHvHgDFaAZZYHFMA==
X-Received: by 2002:a05:6e02:12ef:b0:2cd:94ed:885 with SMTP id
 l15-20020a056e0212ef00b002cd94ed0885mr3123695iln.173.1650936196910; 
 Mon, 25 Apr 2022 18:23:16 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 f15-20020a056e020c6f00b002cbc9935527sm7016073ilj.83.2022.04.25.18.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 18:23:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 19:23:11 -0600
Message-Id: <20220426012311.1738027-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pep517: migrate setup type
 to flit
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is moving to flit, we need to use flit-bootstrap
since host-python-pypa-build depends on host-python-pep517.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pep517/python-pep517.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
index 99aa62d51d..45c4f8dd39 100644
--- a/package/python-pep517/python-pep517.mk
+++ b/package/python-pep517/python-pep517.mk
@@ -9,7 +9,7 @@ PYTHON_PEP517_SOURCE = pep517-$(PYTHON_PEP517_VERSION).tar.gz
 PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/0a/65/6e656d49c679136edfba25f25791f45ffe1ea4ae2ec1c59fe9c35e061cd1
 PYTHON_PEP517_LICENSE = MIT
 PYTHON_PEP517_LICENSE_FILES = LICENSE
-PYTHON_PEP517_SETUP_TYPE = distutils
+PYTHON_PEP517_SETUP_TYPE = flit-bootstrap
 HOST_PYTHON_PEP517_DEPENDENCIES = host-python-tomli
 
 $(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
