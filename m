Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96849C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 19:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F04224029B;
	Fri, 11 Mar 2022 19:17:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cbSqOvl1nCYD; Fri, 11 Mar 2022 19:17:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A939C40116;
	Fri, 11 Mar 2022 19:17:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 665201BF479
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 19:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A63F40116
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 19:17:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hH5ySQjm_OF0 for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 19:17:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52F4A40018
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 19:17:20 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id w7so11241281ioj.5
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 11:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=niQk+7SzI4lYjT2nwXjAMUwO73mQijTWpjL0SeTStig=;
 b=JLkwhWRCcFeCKbFQFmnLYm6XsJqmgc0lPcNczSUq3MnnCSJxlRCUGavZUPt/Z/KIbB
 3vfpLYfBgd4QGWj6+042dyUtvst92bREqkTQVrU5rPLUvO3Mxe7/LZaFiZ/Sa6I8MJaA
 STAQmw2c0HLefJLln2y6tB3arGUzwpQpkFxl8l9SO2ZLI72dmkeakRCiyds4DS6Lj0Tg
 EbMizelcZcwAGIlAjOoGOhmwrlunLQXtR28f62vnIHKNN3/B6EQKJqXFUyo3Vqa7Crae
 QSFIaU34u6j3oFSMwYnGLxxWBFsaZtqAgU4FYM7E5CQfTkR4dxS+FqlpN6rbwZfUyP2A
 xE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=niQk+7SzI4lYjT2nwXjAMUwO73mQijTWpjL0SeTStig=;
 b=Q5nMnslH0PEFXC45/hVpKCCmPnZTRAzwJso/P9bHswrp8ZSvUouYAHDBs4CQaMU5p/
 Cc8bLNnlGoPRJ1/iCkbkdMp3ZoVCZ4jZ4G+CqCM7STRf/aoETl8jVkBxvwsRd0GpHu6h
 5FoievU3PkN3vZx3dnsBgT5dGXWkRWZOqq7LVM+qve8nwHdEyGMh7VN0Aqiy1FmOlUrL
 d+rqxvNILlCo+2gHw1lvxFcqzxYusIDNuBRcKHHjXRkVuvYRhboAgAymkeNscL3PuZee
 0GjjBJ2W+OD3da+2eJ+uVypgI3cU+XrliIrtKvhw6RVCNwqcSBGcIoDtoqxgnWkJ5rB9
 gNtQ==
X-Gm-Message-State: AOAM5314esXuKkb8+WsoZsWgh8EVfq7DfSUVfeTP6zGYPo3lrmsLtFXP
 8QjgEsr1We+5Egpgf4loMb4OERGKuPg=
X-Google-Smtp-Source: ABdhPJwH30AYyyT+x43jNdDvQlUOJzVvthl91WZy2tUVOYOW8ecr86LgLGxe91TWi9upaufVhqyD9Q==
X-Received: by 2002:a05:6602:3ca:b0:63d:dfc8:fa66 with SMTP id
 g10-20020a05660203ca00b0063ddfc8fa66mr8940432iov.128.1647026239678; 
 Fri, 11 Mar 2022 11:17:19 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-247.hlrn.qwest.net.
 [97.118.243.247]) by smtp.gmail.com with ESMTPSA id
 g5-20020a05660203c500b006463f6dd453sm4854799iov.34.2022.03.11.11.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 11:17:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 12:17:17 -0700
Message-Id: <20220311191717.3878852-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-weasyprint: bump to version
 54.2
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

Migrate from distutils to flit package infrastructure.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index 8d231c50ba..90ccc1d057 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  a90fd2d5a581a0e218943af3a8b64a31  weasyprint-53.4.tar.gz
-sha256  10ccb17d55c73096bdf1edd3efe58cb855b07e4c307d9bad4ebc9a3f13ff4580  weasyprint-53.4.tar.gz
+md5  3917447c277db6931b8370f1d725db49  weasyprint-54.2.tar.gz
+sha256  d5e8aa82e3e2a2477a4543f0646d9fb14080c9ba34a0859751eb23757cc00466  weasyprint-54.2.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index 0a944825bb..925de855bc 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 53.4
+PYTHON_WEASYPRINT_VERSION = 54.2
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/72/25/336e274fde0e48cf9979d44667411fbcfa55d323fd7672068807b6de2f89
-PYTHON_WEASYPRINT_SETUP_TYPE = distutils
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/f3/dc/d3d6f1d87a0a0b09637a1f5076790e229cc803c3584ed4edb76553844001
+PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
