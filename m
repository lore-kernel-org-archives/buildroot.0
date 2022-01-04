Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992F0C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 12:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E35560BD0;
	Tue,  4 Jan 2022 12:39:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ReKNx9x3DDg6; Tue,  4 Jan 2022 12:39:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CEAC60AB0;
	Tue,  4 Jan 2022 12:39:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 507531BF288
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 12:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C63482881
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 12:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5LtY7QrvlWrX for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 12:39:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9836C818D0
 for <buildroot@busybox.net>; Tue,  4 Jan 2022 12:39:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 k66-20020a1ca145000000b00345fa984108so1359884wme.2
 for <buildroot@busybox.net>; Tue, 04 Jan 2022 04:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mAXznq9fAYs8W1+7sXalu1lGzjV7+vPh2vsmXHbaWM8=;
 b=WvkXdz/389NSh8yLt3edoCHieokkJAXSSmU6CF8Mb4mRBupmjGEXMP9lt2qBE90s54
 991yFBc9eZnQTniZdlmD0wboKHyuZM0xpbk76buSvXuDMK8EesKHfwW6ZfVRQCbyIWxi
 dSnUkkLoGNAyV9wr5zk4yF0yGPGz+6F11CRhTzZKRhXBKvVboiNRQm2uanfNJd11nHqP
 FRkF60ALy0xOvH79hNTO5j6FgtWV4CL0QQsOElvTCZZgNYMZmjrdOay+2u99UhiPA5rI
 G/wzqLI5K8ctsVasAfkXSr/J19FY2DhvsKjNLrS8uiWIoExIhJbz4SfXWzFuDKkGMb37
 0VBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mAXznq9fAYs8W1+7sXalu1lGzjV7+vPh2vsmXHbaWM8=;
 b=zwtK00h4qbdOJfDMaR6eKeE9BBQRzwiG3LN6t6cusLORIhuFQe/reXT5Fyoq0X3Cr3
 8Nd9glvmzfcW8QRF1rm7otSzSaGE5XiNLR0caoxtkv/nYp3TSmab+c13+lyElejJwQ0+
 UjVXo1GWwdUVBTLQlqMN0evg6/exaU5Alb0tmCcQIyI9t2REku/K31thqdgL6ycIXqQF
 FW8inRQgI1KbmNCaq/JJALerqIAq83RGRBN/luCvpWioTpgK6mhKa4Kh1GSKw2oqL1IM
 6I3BqDw+YkxhE4atvyGatoE62C12HtIWta7vJE15rWI/GckJAldfR3SpCJBQw6JBox6u
 XySg==
X-Gm-Message-State: AOAM532cKt74bpFjJ+R9rfBsrvnYE0yMODQT6e2Ad6MA/QrnhbX9j5NC
 8LObD/dSceuGrkdl3/dOS8ZZCnBcfTY=
X-Google-Smtp-Source: ABdhPJx94tDLsaa5YsmkL7mzyk8N7I2bvbJqd5Ou9mYeNl/28hwzyP9SOqddnkefeYsxj0ZfxTvqYg==
X-Received: by 2002:a1c:440a:: with SMTP id r10mr42588371wma.4.1641299985789; 
 Tue, 04 Jan 2022 04:39:45 -0800 (PST)
Received: from pc-140.home ([2a01:cb15:81e5:ad00:7afb:407b:e9ac:7e79])
 by smtp.gmail.com with ESMTPSA id g7sm38712303wrx.104.2022.01.04.04.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 04:39:45 -0800 (PST)
From: guillaume.bressaix@gmail.com
To: buildroot@busybox.net
Date: Tue,  4 Jan 2022 13:39:00 +0100
Message-Id: <20220104123901.23929-2-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220104123901.23929-1-guillaume.bressaix@gmail.com>
References: <cae0c1b2-34bb-b1a9-f02a-9e98ddd9fbe5@ideasonboard.com>
 <20220104123901.23929-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/3] package/python-pybind: bump to version
 2.8.1
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
Cc: tomi.valkeinen@ideasonboard.com, yann.morin.1998@free.fr,
 "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-pybind/python-pybind.hash | 2 +-
 package/python-pybind/python-pybind.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pybind/python-pybind.hash b/package/python-pybind/python-pybind.hash
index a68ac846e2..e1d86a4494 100644
--- a/package/python-pybind/python-pybind.hash
+++ b/package/python-pybind/python-pybind.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  cdbe326d357f18b83d10322ba202d69f11b2f49e2d87ade0dc2be0c5c34f8e2a  python-pybind-2.6.1.tar.gz
+sha256  f1bcc07caa568eb312411dde5308b1e250bd0e1bc020fae855bf9f43209940cc  python-pybind-2.8.1.tar.gz
 # License files, locally calculated
 sha256  83965b843b98f670d3a85bd041ed4b372c8ec50d7b4a5995a83ac697ba675dcb  LICENSE
diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index 442ed3328f..cf6a642922 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYBIND_VERSION = 2.6.1
+PYTHON_PYBIND_VERSION = 2.8.1
 PYTHON_PYBIND_SITE = $(call github,pybind,pybind11,v$(PYTHON_PYBIND_VERSION))
 PYTHON_PYBIND_LICENSE = BSD-3-Clause
 PYTHON_PYBIND_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
