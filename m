Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBB3C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 22:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E68541559;
	Tue,  4 Jan 2022 22:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L0IIzwDWpMHF; Tue,  4 Jan 2022 22:04:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40FF341552;
	Tue,  4 Jan 2022 22:04:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5079D1BF855
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 22:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A276410AC
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 22:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lv4adZSdgtkE for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 22:03:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 603E5410BB
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 22:03:52 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r17so78882072wrc.3
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 14:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xwTe0W45Gyj22P/jdk1cvkel+PSYv5AHFqe27IsBycc=;
 b=hNkELupzNHD6jx8tnNiqu78HbivpJ17QKnhCvdrYKdfdCn/esOIu/hQlI7mg3seeo0
 K7QLpUd/mYzBO0nW6s81fhp/bmlPIa+FqIe+P3T0U4/YXeCZrlbguro1mVeDZpAvm2iY
 q+WU+oI5DjasejCir7LLYoADBibkAyXVWCsYEk89K0VXCFNTK6vC+4sOn1k1vCeVA2iD
 Jl9E8ZvRdUMZjyO+bRuwwdJ3rB2+cDkVXq7jaVkzQs7JhiogEnbyHiaebFRcaez9pS5O
 7GK4Vl5TqzobRpWbnzKcjzywrWZJnm/rtjMI1UMw3W7uAv3VAqsupPMh5/39jiczCDSU
 QFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xwTe0W45Gyj22P/jdk1cvkel+PSYv5AHFqe27IsBycc=;
 b=LguEirqeu3BP25W6FHnDVql5vDK1+KG7RqHBaRwbaIpDYytPx/JXeOub94vSqxOfl4
 HfMrOGv8UQXcejPNwHUcHgMsrUmE3ByBwlX3VdhwZEWYbcm7SgJGCNefMyDzwXmBi0Mo
 0kA3OBpRnoSvB5Gz5yUwTJ6A/ntx4pPQ25KWX53fFo/YpwckSfdtT6OPX+Iv+QhpSLY2
 BQjvVR2DnusThaOTlYli8kEqySqHJDtii1RZqAjb0DeAFh6HSSdBLLo4RUoKQIChqt8a
 dKmeFJDyfgWYlYkoDk0NacR7YK78iYgUf1G9rdQdzwMIs6iFav8Z6JJmj6G6fhBNepTy
 b/fA==
X-Gm-Message-State: AOAM530ftTkW3gZci7pIwbDuS85ob1iua5GJTxIT6pLj6jeJYeqpzFWk
 4QpH4/+Yx/jpOsA826dZsa2CX8Vj+8M=
X-Google-Smtp-Source: ABdhPJwDKBrB4Ozhs8eiAhI96gh+SuYxFzbhdOKy/mUukTAZZhjIDHiaKCTRu0qO9skSGq7atHEYlA==
X-Received: by 2002:a05:6000:1a88:: with SMTP id
 f8mr45507735wry.75.1641333830509; 
 Tue, 04 Jan 2022 14:03:50 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id m5sm647543wml.14.2022.01.04.14.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 14:03:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 23:02:43 +0100
Message-Id: <20220104220245.3706221-4-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104220245.3706221-1-fontaine.fabrice@gmail.com>
References: <20220104220245.3706221-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/6] package/checkpolicy: bump to version 3.3
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Clayton Shotwell <clayton.shotwell@collins.com>,
 Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

https://github.com/SELinuxProject/selinux/releases/tag/3.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/checkpolicy/checkpolicy.hash | 4 ++--
 package/checkpolicy/checkpolicy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index c237913eaf..3586389047 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 9b1c81fa86fe3867842164448d90c8e7ea94b2987497809c65d4caa87a5c5bc8  checkpolicy-3.2.tar.gz
+sha256  25c84edfa3a10ab8cb073b97bc55cb66377532d54a2723da9accdabd05431485  checkpolicy-3.3.tar.gz
 
 # Hash for license file
-sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index f8ce48c175..af9a58cee8 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 3.2
+CHECKPOLICY_VERSION = 3.3
 CHECKPOLICY_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(CHECKPOLICY_VERSION)
 CHECKPOLICY_LICENSE = GPL-2.0
 CHECKPOLICY_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
