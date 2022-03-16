Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C4CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C27D842E6;
	Wed, 16 Mar 2022 21:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24X5TSazqIFG; Wed, 16 Mar 2022 21:24:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFCFD84258;
	Wed, 16 Mar 2022 21:24:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FCFA1BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8912A40018
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yrQo2a7KjDZs for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:24:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB71340AC8
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:24:08 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 q7-20020a7bce87000000b00382255f4ca9so3934668wmj.2
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 14:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yLsTbnas7rb2chw4adNNwttIwFYgqb/D8fdrZN0kI60=;
 b=lujBWvlpHRfyhpxQmrs8DkB77Ce5lWRFt+/h9whz2VPqd9T307U8w6PeGY8RevPT6W
 /ynqgi+73Yby2u/krwExsS+zUJ3EIRh/ZFT4rOXybFcUNCxpbOLPb8eDwG9EWJLOadjT
 tNq6fxlEyXUEb7oMJKDP6PwbP1csed5E5BRNd8H1SbK3eIrFf3ErHSOo5dFtt/15Q7cg
 J9ToPvOpthhYOvXw3lsBQQRuVn9p/E7g7LgBHEpM9yDGkYVpcqwNtaCcwM5lvvewVzy4
 CWzzuhvhkqmTWh4yqaMrbzSyJE0eYKCRViYvgbC7dyuZEfUTkVPMZ7vPSMt0zyuZbix6
 Nnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yLsTbnas7rb2chw4adNNwttIwFYgqb/D8fdrZN0kI60=;
 b=juCoXCxf8j9Zvj0QK/+lvH5mx5Q0DoNKepD99O99zJKExVIj4yhUvV54+jpsX1pk67
 j2NuMydO+/ZIPsAH/1BJNtnbLtXjsFvYlkAQWm1/JB7VnmpxDq2sCP20MjRMiXGa8T3x
 sQMa5S6VioFDltr6ZzIfFTs5dXZio/QJfza1fi0Zr9Xwm5sDdH5ACIp5Uv6/twsg1eIV
 WWmel43Opg8Z/taGvsZc+jh7+Tm7tsbOduu9z+ICTZc5jz3BcYZ/BNoUN0CL03hE+g7i
 hWUOJUeYxRNISjy6J4RcWHzIdRCPd3Uu4Te7/nDX4mojB9o1FlRvWhbmgCj/Fj/zBou/
 rw+w==
X-Gm-Message-State: AOAM533ki32oL78BOiP6T/V7l6euCVv8sV0qRnLtF6MzRrkthOsceoR7
 VyvnJIQjLZVdrmXu85FP77OE8Qdyw0o=
X-Google-Smtp-Source: ABdhPJxgBAGULVDpkvBvA72+Dx4tUe1TGYIIOSz/bbYhi2H9/qV4GacsgEO1NkbpZD6SmF0zWQeDzw==
X-Received: by 2002:a1c:f312:0:b0:387:8bf:bd3 with SMTP id
 q18-20020a1cf312000000b0038708bf0bd3mr1278148wmq.112.1647465846784; 
 Wed, 16 Mar 2022 14:24:06 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a5d4586000000b001f0436cb325sm2440959wrq.52.2022.03.16.14.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 14:24:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:22:20 +0100
Message-Id: <20220316212220.3437314-6-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316212220.3437314-1-fontaine.fabrice@gmail.com>
References: <20220316212220.3437314-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/6] package/zynaddsubfx: add portaudio optional
 dependency
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

portaudio is an optional dependency (enabled by default) since the
addition of the package in commit
18a863063735e2c658fa6947a4e540e9dda6c431

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zynaddsubfx/zynaddsubfx.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/zynaddsubfx/zynaddsubfx.mk b/package/zynaddsubfx/zynaddsubfx.mk
index 461146aae8..aff9ac4bf4 100644
--- a/package/zynaddsubfx/zynaddsubfx.mk
+++ b/package/zynaddsubfx/zynaddsubfx.mk
@@ -37,4 +37,11 @@ else
 ZYNADDSUBFX_CONF_OPTS += -DJackEnable=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+ZYNADDSUBFX_DEPENDENCIES += portaudio
+ZYNADDSUBFX_CONF_OPTS += -DPaEnable=ON
+else
+ZYNADDSUBFX_CONF_OPTS += -DPaEnable=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
