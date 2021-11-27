Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B5FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 27 Nov 2021 10:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2A38403F5;
	Sat, 27 Nov 2021 10:02:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CjZA2-9lDvgd; Sat, 27 Nov 2021 10:02:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B47F54035B;
	Sat, 27 Nov 2021 10:02:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D116B1BF33F
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 10:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0B5460668
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 10:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0VGJVlyn2kAp for <buildroot@lists.busybox.net>;
 Sat, 27 Nov 2021 10:02:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A35196061F
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 10:02:29 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id i9so11578349ilu.1
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 02:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iUg0Vh9cSsptCN2f0t/X5/ktB6AAZiLVSD2WS1w0nxs=;
 b=dlUI4cB/EM9d2RAVx49B1oO9jGPihHFFBx0W3TDaHMI70V8YHUYzXgXZbfNVg3xcjS
 9h0V5jQBs6EqoqNfp1AWL5hE1dwsdPhyWm3scHJaU3vPJKT9dTxhTiwp7FHr8benGdBb
 uogsR+tv0mKDhzadP8T+7mSR/jj9N9UIYYfXaa3Pp2ncMgBnHNsYCtbnwOtdmSDG5x+3
 8LfwNWvJNPqtbwofIMEf7VaIySzhuo/rg+/7rgLXGtDLAovISSzMBUxgWavOruXx/zgY
 0I+t9RvLNACCoBBXw0bjuPhEkgceGbFKhaL/jBXrAZ6N3eyQKaKPRHzv7CO7QF33kcO1
 BORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iUg0Vh9cSsptCN2f0t/X5/ktB6AAZiLVSD2WS1w0nxs=;
 b=eNumWPEiLdxdSUsX8P0qSUFsWDpDZ+/rt+Du+oiYnnuzVx0xM/m5P3Ac6wuJjPWJwF
 ucebMFrljdtydI/J6jDaSXcEzA1Fy9ME9AJn++qXxoS8dMRnZQ7k+6iRRmC+NppxN9c6
 EsOlTSQfOsO3XmQWgWd2ZFazUuZjIsgRHQD/HF+WS3fdOGFQRUI0imNDu2jJYXQpoTiQ
 4s6HBdqkAii45qO7eE41Rq1FaL/yUyyGzVoqbou6C+nWyUT7YPxydZXJcU+gttf2OHcP
 1UXKw3GF5jnritXkQJ7K3n7gSO7+Y1IJKJ9frmSTErnRl0VJ+ex0xo/wm4lKDIOTOBc8
 8x7g==
X-Gm-Message-State: AOAM531uczoUFTxOe2n1+8pZJVOAlSikj8ckXgezmGVtorPuFhlHu0WG
 H96rJEa2sLIEu4W4YEvzsGg15ttJChQ=
X-Google-Smtp-Source: ABdhPJwFaWlVl5kRHJknphqVwUXv4CzKCG4NrGLkO8jNPlEsPZh01U/kHYT+cJ/gqrpiy9Opxncb0A==
X-Received: by 2002:a92:6e06:: with SMTP id j6mr41345018ilc.98.1638007348669; 
 Sat, 27 Nov 2021 02:02:28 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id f16sm5105710iov.33.2021.11.27.02.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 02:02:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Nov 2021 03:02:18 -0700
Message-Id: <20211127100219.2121658-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211127100219.2121658-1-james.hilliard1@gmail.com>
References: <20211127100219.2121658-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/python-urllib3: add host variant
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A host variant of the python-urllib3 package will be needed for the
host-python-requests package.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-urllib3/python-urllib3.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index a1d22e023a..9580d9b6b9 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -12,5 +12,7 @@ PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
 PYTHON_URLLIB3_CPE_ID_PRODUCT = urllib3
 PYTHON_URLLIB3_SETUP_TYPE = setuptools
+HOST_PYTHON_URLLIB3_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
