Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94ABC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 12:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F16083224;
	Mon,  6 Dec 2021 12:04:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gW4p08USxn7x; Mon,  6 Dec 2021 12:04:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BADFA8316F;
	Mon,  6 Dec 2021 12:04:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 19F311BF3C0
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 12:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0708A400D9
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 12:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PWfcM6_s6q2M for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 12:03:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17FDF4014B
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 12:03:39 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id z8so9910213ilu.7
 for <buildroot@buildroot.org>; Mon, 06 Dec 2021 04:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WhljE0vUmEYWsfcgtP32QZlvPmwFmySuwTJvtqNKOPY=;
 b=AcOOtArvv3JThBCJbPkR+VZgK0Ag6lTiCh+Gk+dyGUXEBiMwJNivzF2RdL3WTFrCOP
 +Lpye3y0jbc2X6yz/SSwZXHYKeb6wmCTmEEs94ljAqqcz/ju/5X8QHtkNOdEDg31g+fT
 URsH9b1D2/32SdKYYQMfeWZY8eMUsTs154ZMm/18CsQ+8MW0nL/oyvg/lfma/wxkcoAr
 oZfjF5US7MfQe9mit1rQnF+c1rO7+SA+KY6bk5vsQbtjrwYWy2l/AE5hrYVTHKpHXuKh
 lrDz2HfTj7emvpXrXUyLfTdiKgDJg1f+qBXQ7XfsEO5GU9Vg85EAvSoGj3dbhxBUOvWO
 QLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WhljE0vUmEYWsfcgtP32QZlvPmwFmySuwTJvtqNKOPY=;
 b=Xaa7ZcjuyZRDyiMI99/LIaMIOasAFfppwANZuDg3CN6vhpUTcBeSPqo0Pyt4erQA19
 ZdRPlR4NLVauc3SomEsrYYsb/K3K8BmSnM88yd0VMqCRI3exS+GpGxlReA8ktNJj32Qe
 PfpXbwvT3m+hw09Wkg5qDlUgA5szajYlAZj9JnJEQyv2I3kCguq8otnj5h3hvazsOd2w
 OmWJweB/Ia4kpZZUnyCPP7P+q1R8h687pQIKyunq3p2CJlu1fdXiudNTeszAietO6Xqr
 398+atdDnPgWUrLJcEJ3QVoKPml+Jm2/Q4AwB0Ju9Xf8D6OETsQMVofrafOijZBLiZYd
 pxKw==
X-Gm-Message-State: AOAM530sVRUENagWlg/Hq5w9MhZwJxRRUlQbldwrboJh5dCv7zvSRe9N
 RvlEvATuRZQIbvJs/TbpADvJZNME2Gk=
X-Google-Smtp-Source: ABdhPJyhWW60ha/4RksWjVXPw251W2NH7U3qAHo+TMxXxFa0WX4e/nO3jVxGM4nQyezVZRxqgmKu/Q==
X-Received: by 2002:a92:ca0f:: with SMTP id j15mr34298420ils.229.1638792219079; 
 Mon, 06 Dec 2021 04:03:39 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id u4sm7153406ilv.66.2021.12.06.04.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 04:03:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Dec 2021 05:03:22 -0700
Message-Id: <20211206120325.3120351-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211206120325.3120351-1-james.hilliard1@gmail.com>
References: <20211206120325.3120351-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/6] package/python-pyparsing: enable host build
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This will be required by host-python-packaging.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyparsing/python-pyparsing.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 0dacf2371d..5741458d65 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -10,5 +10,7 @@ PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/c1/47/dfc9c342c9
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = setuptools
+HOST_PYTHON_PYPARSING_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
