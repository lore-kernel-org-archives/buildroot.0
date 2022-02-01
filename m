Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62376C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 01:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A11CA82BC3;
	Tue,  1 Feb 2022 01:33:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FYzDnGzW60tA; Tue,  1 Feb 2022 01:33:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D714782B93;
	Tue,  1 Feb 2022 01:33:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A9E681BF333
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 01:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9431D82B93
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 01:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LK0LBX0a3hw2 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 01:33:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA65682B24
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 01:33:11 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id w7so19340588ioj.5
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 17:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UfCFpUDTsbtTmOR2CtU7lPzC5Ul/Zaw/Ww+w6rvts/w=;
 b=nBcadoVfKc2QxoPZivm8nbt+PEzkQloezifUhe2V+xYOutBtfG1yefh0ahdIu+tfYp
 ix0jBn/HqEjB/a32aubJFqzYOWwZrxxBekFZNdlHYhwsQRDOwJl1gJWZ8/QwxKFM7jB8
 2hBcJfjVJ26fqUDyKqtCRJKmQvfPUPG2ysnu5ofxduX4rnufAmLR49foy/37yF6yfe+G
 NtwCiy1e0eYmaV+lb2TdiFbGq5GdtdVZ5JCd9yzPwUbuP7Dd0kieGBPsMGUmFYD+xnou
 NSmzOgRtcgLzFzuTj9BWQN4wUQnebL49kQ0eFd1e17qMHYnpdL+nXEO0kGSHxQ7PhvIP
 pcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UfCFpUDTsbtTmOR2CtU7lPzC5Ul/Zaw/Ww+w6rvts/w=;
 b=frgYB0vthrUVPPl6ONTBxbQH9Ii5Usb4OceE/A7zjrdB5X8TDiEtV/uAgboVgujn34
 4mx0E5rMPsBgEhuPRVxoxkUclaMBaG39nqwuixQF3zuGq4MPCmgwrn/oJZsXDsARjCL8
 KvdYeO+w9wRjRUPEginsT0Fxbq/59ege1qXgRgKemwxinIMrmfXYpD6Fs+MwPMYvIK3U
 /So6Bmd1v9FERv16xcquhlqrxtkk9kDnuCf9wG7f3Xtd4QBMLVCZg9+rAoZ6jUFL2RJ8
 ggW6W7TS7Y2GO+vrYq0ZbNNxf28oszAEEBsV7lz3sewQAciyOQ/XPL27nKqxcLVvVsIm
 HXDQ==
X-Gm-Message-State: AOAM532WeMMTq93BXr01Me+QXwN91XH01r5aSmNU5WzQJGSNRlk475hp
 2vwSpCMserK/wa87lZkn17ZxvYDthu8=
X-Google-Smtp-Source: ABdhPJwvlqFmvS1ea9OIIwhxOAT5ZeGVlNt804acxq87bv2mNnqM2S/6UueunQd6+FkE8WjGFTyAjw==
X-Received: by 2002:a6b:f406:: with SMTP id i6mr12710995iog.52.1643679190618; 
 Mon, 31 Jan 2022 17:33:10 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id m4sm18497134iln.48.2022.01.31.17.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 17:33:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 18:33:07 -0700
Message-Id: <20220201013307.1956972-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-session: bump to
 version 2.11.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp-session/python-aiohttp-session.hash | 4 ++--
 package/python-aiohttp-session/python-aiohttp-session.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-session/python-aiohttp-session.hash b/package/python-aiohttp-session/python-aiohttp-session.hash
index 3842f0c7af..8b44318307 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.hash
+++ b/package/python-aiohttp-session/python-aiohttp-session.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-session/json
-md5  d57d463a9db13b681f7924b38aa77f64  aiohttp-session-2.10.0.tar.gz
-sha256  2af19af9f435937baacbb6420f887b21e5021bb34be146c2702c58e6ebf6b76b  aiohttp-session-2.10.0.tar.gz
+md5  797273eb5f0ef9e95fa92c6a933cf4ad  aiohttp-session-2.11.0.tar.gz
+sha256  0fdf39600f6a05c4943ef6c7b099071ca9854413111a26761626244be5015dc4  aiohttp-session-2.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7bc5dd2f229a6b922befb1427fd4ad2c0b255f12c1b1869370ba77520dc22bc7  LICENSE
diff --git a/package/python-aiohttp-session/python-aiohttp-session.mk b/package/python-aiohttp-session/python-aiohttp-session.mk
index a28b1ae143..3d59b75e3d 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.mk
+++ b/package/python-aiohttp-session/python-aiohttp-session.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_SESSION_VERSION = 2.10.0
+PYTHON_AIOHTTP_SESSION_VERSION = 2.11.0
 PYTHON_AIOHTTP_SESSION_SOURCE = aiohttp-session-$(PYTHON_AIOHTTP_SESSION_VERSION).tar.gz
-PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/d6/3f/ab6288e8bbf4a9ae63ea0d3d5711bccc3a6dad1cb85a420c14fdeabc209e
+PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/3b/a7/0b97b9a2e3a553a86a6703f86b0e9b1afb2b262849700e8f80015c0f643f
 PYTHON_AIOHTTP_SESSION_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SESSION_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SESSION_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
