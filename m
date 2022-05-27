Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5F4C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 18:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A0B040920;
	Fri, 27 May 2022 18:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vGW0-86E9g06; Fri, 27 May 2022 18:45:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85113404EC;
	Fri, 27 May 2022 18:45:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 426281BF255
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 18:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3064542809
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 18:45:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=broadcom.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nEQ6zDWwG-7d for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 18:45:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1ED2427ED
 for <buildroot@buildroot.org>; Fri, 27 May 2022 18:45:12 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 x2-20020a17090a1f8200b001e07a64c461so7831084pja.4
 for <buildroot@buildroot.org>; Fri, 27 May 2022 11:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FOtosUAi8O+js8RqsIBR8pBRUkK5PZcYDqUvW4cBNn8=;
 b=hvKCZWEjzLDZmb3BG0t+9omIfCXGfi1uer1HM12xVfWAb7Zn2VUTHiXaMFMB1lPJbP
 7vmcPRPU+h/FXWdXZGvUTkpl6n5BYNKIS3l25EOJAA8Lb93VL3sEcUa7QfkVMwRs8E8+
 xYX4GTtN0QZtnpvsAnQsjjhRUcdf5NM5Cl5mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FOtosUAi8O+js8RqsIBR8pBRUkK5PZcYDqUvW4cBNn8=;
 b=lTjbR9MZevgj1LSjjFZcTzRmEIuCy6iaQqNMev+JiN3UTUMsyy5dLhZXJaCwEQXpGk
 pzdyMuhv3nthY7YELc3v311B4DWYXML2vXY2YIETyvSeMB0Vj4Fg1hrhlN69xC3tQ6IY
 lmW67Wj8jgKaNwYLG2L49jNxyRb3KzA+yD4g9YoopBrLY9Y0iRbgomtJSmJj8+M0CvVv
 w8qPuLoUEUBKLaCj3FjQzrX+vuvvF1M+jqpaANslIq8OoeOT90A7zYRBkqQfd0zFIY0R
 PtzsRDuqxX2doecstjmBRCPE2BPrt39vRHxB07ei5f1TXBffH43Hv6Ehm7GdBC/5t6dt
 P3zw==
X-Gm-Message-State: AOAM5320HuQ8ITtNpkNL/pyNKFAFZpbCyD7pKgacSWkZwOGkopS6m5sv
 KSQVjgFtFg33ZVDTtuIpOhw5Sqd3SipznjSG
X-Google-Smtp-Source: ABdhPJwFsh93LiM/t/WpbRglWtkCsEbRPx4Ok6zWA/xlbA32CH+5qAB83DzLlYk2t3lm0IsE3ErwmQ==
X-Received: by 2002:a17:90a:8909:b0:1e0:bba8:32c3 with SMTP id
 u9-20020a17090a890900b001e0bba832c3mr9774099pjn.39.1653677111572; 
 Fri, 27 May 2022 11:45:11 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 n18-20020aa79852000000b0050dc7628195sm3862170pfq.111.2022.05.27.11.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:45:11 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id 611A3466CBF0; Fri, 27 May 2022 11:45:09 -0700 (PDT)
To: Buildroot Mailing List <buildroot@buildroot.org>
Date: Fri, 27 May 2022 11:45:01 -0700
Message-Id: <20220527184501.1992852-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/strace: download from Github
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some corporate networks may be blocking access to Russian servers.
The server "strace.io" is in Russia, which will make it inaccessible
from some networks.

Use Github instead to download the sources.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---

Not sure if there is a precedence for such a change or if it'll be deemed
acceptable. I am putting this out there in case it is considered helpful.

Thanks,
-Markus

 package/strace/strace.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index c35e0c84da22..67924d4b660a 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -6,7 +6,7 @@
 
 STRACE_VERSION = 5.17
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
-STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
+STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
 STRACE_LICENSE_FILES = COPYING LGPL-2.1-or-later
 STRACE_CPE_ID_VENDOR = strace_project
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
