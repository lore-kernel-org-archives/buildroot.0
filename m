Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4F2C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 04:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BBDD40242;
	Sat,  1 Jan 2022 04:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TotCxssJT94I; Sat,  1 Jan 2022 04:49:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D950401AD;
	Sat,  1 Jan 2022 04:49:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 091661BF28D
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 04:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F10B0401AD
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 04:49:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j8n2RntsSETX for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 04:49:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2381400C7
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 04:49:22 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id q5so34584346ioj.7
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 20:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=whzkQB51KfCWM2/k6Cbxerj4COTyOxogCOMeqI7AzG8=;
 b=HdTeH2gvkoNwlduXauZxv3io0EvM8rjI0D9qpKeFsMdhlcsPzuthk6Krs4guYiLbUH
 LzxULmHjMtK2gUth/EJgpjaurDFwLYSd9kw2alKg+fHEgIOJTHnlFW4nWo7GzTawSF7R
 NGcBxj3+gItN6YK/FjAvgTtSgIyPCjwO7HWgvdHayeYfSRqqiLxgi9PUaenLUmcUfd1D
 MB3JArtyE3gdvWBKdqomxlE4QxzJisS2xHjrKKVRxYhS8X7BkQ/N6nMQRglaUKEHcdpw
 65mZ1giz6GDxrXHuOGkwoReKyBIXk/+OXKRd3rQuRWR/mwTb4G0/03at/qPm1mta/y0i
 IzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=whzkQB51KfCWM2/k6Cbxerj4COTyOxogCOMeqI7AzG8=;
 b=KCcmPUVKjQPX3r5zy/05J9N6ZbaqlSJR0K6JNrbg0k3a/wDq4YocqiK7//v+YN5RNM
 LkutlgKUnsnZ87VCrezDwTEbsV7g3bcVZjtdODemywDrumT4uXXpug1S5o1dAAP4oGsS
 PkzacIrC2cKWeBM+NyAbTseAQ+gxUi66fsoqi5eEFMkIQehcnWDQpHXFMDvuDD8e++DJ
 8dS/12dQ7f6BiReW4hlvuRD6Dx/HdjaDUra3mYOX/fFOn9bVe6mLqH3pwMHONOAJz6xe
 PMX1GA/c7g04U3o0XitTKkmUmUeWzjpum2tpmv1AJE/+jrx8YVX83gl6PYjZhVlquUGB
 hN4w==
X-Gm-Message-State: AOAM533wBKcng2Resq3RVY5SURx+29Xs22sIk/nxsI3Zii6gitn/Mogu
 B2ttn8QaDTnS2JsR8ntRvPa0V9JtSks=
X-Google-Smtp-Source: ABdhPJzWY0N7DJ/k+rph2gsLg+S3j8dyzV0PbW6e9CGcLkkbhak/dwqlOZnMp83KvR3UG39+JqdHdA==
X-Received: by 2002:a6b:3bcc:: with SMTP id i195mr16461955ioa.28.1641012561815; 
 Fri, 31 Dec 2021 20:49:21 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id o14sm16789664ioo.36.2021.12.31.20.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 20:49:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 21:49:13 -0700
Message-Id: <20220101044913.1990522-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-remotes: bump to
 version 1.1.0
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
 package/python-aiohttp-remotes/python-aiohttp-remotes.hash | 4 ++--
 package/python-aiohttp-remotes/python-aiohttp-remotes.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-remotes/python-aiohttp-remotes.hash b/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
index a9a6cad2df..595340d5d8 100644
--- a/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
+++ b/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-remotes/json
-md5  e90fad4b7aa088207f831698fddd9eea  aiohttp_remotes-1.0.0.tar.gz
-sha256  caec1681de70bac82daa676078d9b125758fb3952fdaa893a6b42bdd995562ef  aiohttp_remotes-1.0.0.tar.gz
+md5  da13880f25ec3b9cf98c7baff92835a2  aiohttp_remotes-1.1.0.tar.gz
+sha256  e44f2c5fd5fc3305477c89bb25f14570589100cc58c48b36745d4239839d3174  aiohttp_remotes-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4e7d0edf250abe2a28027788b8c55a53d1b5c9ff961b8a00643c76aed637ba13  LICENSE
diff --git a/package/python-aiohttp-remotes/python-aiohttp-remotes.mk b/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
index f04cecd89d..e2bc3e1c18 100644
--- a/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
+++ b/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_REMOTES_VERSION = 1.0.0
+PYTHON_AIOHTTP_REMOTES_VERSION = 1.1.0
 PYTHON_AIOHTTP_REMOTES_SOURCE = aiohttp_remotes-$(PYTHON_AIOHTTP_REMOTES_VERSION).tar.gz
-PYTHON_AIOHTTP_REMOTES_SITE = https://files.pythonhosted.org/packages/40/b6/1178bd1e26e88f9f29b7d1bbfae7b38d39ec9cf787d4685f83ade2e7aa7f
+PYTHON_AIOHTTP_REMOTES_SITE = https://files.pythonhosted.org/packages/e3/fc/5523010172e2d8685a8934fbb49d564118c9ebc1e4233a62b77310f979db
 PYTHON_AIOHTTP_REMOTES_SETUP_TYPE = distutils
 PYTHON_AIOHTTP_REMOTES_LICENSE = MIT
 PYTHON_AIOHTTP_REMOTES_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
