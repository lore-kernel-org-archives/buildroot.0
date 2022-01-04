Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30077C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 22:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C718381D4D;
	Tue,  4 Jan 2022 22:04:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BV714FnwVqov; Tue,  4 Jan 2022 22:04:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D68481D4F;
	Tue,  4 Jan 2022 22:04:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F7021BF855
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 22:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F8DB410BB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 22:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l_GfI4mxQX96 for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 22:03:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8EBA5410AC
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 22:03:54 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 v10-20020a05600c214a00b00345e59928eeso584490wml.0
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 14:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oY2olZJ9+mXTaI+jXyauzEwOCQOV9J5aEsRfm2nDtN0=;
 b=LvKx4F7giTYHMORFuXB9lijTXBU8UEYxW2SSdxRRhvA/OysDK4B6jTtqHnB5EISIC0
 KsNsCcOy3sSFkCcrQypJk2jShOQPIuqvOJBX2eS3dp+GqKtzp2anKIdwwHkJFM8nQ2Cq
 JAERVw+Nc4RcvDmpa4ifPhmXeb6wfZssLAMGUPu2wjxJm/g15sJVXivHa5Fw/hh/yr5E
 hPTvpjUPivAVyBqkuV2zikYT+jCMCN3rvBkpmyFBIC86mLaRndGtqvTSx1ZM6d7rTSwy
 1ehQrZ2iO6jj6zhLNWEZBnhdqfAEon8/5gBzmV4MFqThtTVBmEACi/B4VhL6sOSKOEuD
 sf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oY2olZJ9+mXTaI+jXyauzEwOCQOV9J5aEsRfm2nDtN0=;
 b=hFwhoTq5xJCL9RZDOCQGURhEEjMOMPbcF4JwuBGpkgAG/5UIzNcA441GvSJ6ToPALG
 XrgYRMgo11iNSx+qwKEsrtCE+xMPv5230tsdKW7tDQ1li43JcLVrfMJ4zntP1x/a6wrR
 k+XmNj6rWcZ6hApDIKxlMSEhvP91RMMzh9ADnKYaAnZ3EsChRQqrcr6LMD/fDLRDAZVr
 9GnubqwCP3GbM3IwqQO5oy6LCOprTzm2EAKr+Csg+2xMuCOq2sfPzlbY+cKTnGIrhCwP
 Zqa65r+y64OhV+ZCoxQeJoiqjGnA6FoIxXV/27s0lOAbmUv9wOf1UlVx9aLMhExcT6h7
 rvVg==
X-Gm-Message-State: AOAM532VjZe+OP5SRZbTYjzR1H7LViKWPB1Z4C2ymZEPIy082J9M8+90
 Z382mHggfXHa8VUMe1bUXGym2GPNOOU=
X-Google-Smtp-Source: ABdhPJy+R+oRnGvgA9F8oE/U5Q9DKrzo5NRsApARbi8HcXfKWyjongdoIxs+EAwVw8xkfx3JgiYiNg==
X-Received: by 2002:a05:600c:2146:: with SMTP id
 v6mr287018wml.31.1641333832692; 
 Tue, 04 Jan 2022 14:03:52 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id m5sm647543wml.14.2022.01.04.14.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 14:03:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 23:02:45 +0100
Message-Id: <20220104220245.3706221-6-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220104220245.3706221-1-fontaine.fabrice@gmail.com>
References: <20220104220245.3706221-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/6] package/selinux-python: bump to version 3.3
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
 package/selinux-python/selinux-python.hash | 4 ++--
 package/selinux-python/selinux-python.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/selinux-python/selinux-python.hash b/package/selinux-python/selinux-python.hash
index 00c28b722c..93a28becdd 100644
--- a/package/selinux-python/selinux-python.hash
+++ b/package/selinux-python/selinux-python.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 770855ea8120ef23007fdb9db94b1ed6e8cd77917b584ed8877bbee9c16e74fb selinux-python-3.2.tar.gz
+sha256  8ad91061300387996ccb474962fb93dde263d924aa8f740618be16b22e2444ec  selinux-python-3.2.tar.gz
 
 # Hash for license file
-sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/selinux-python/selinux-python.mk b/package/selinux-python/selinux-python.mk
index 61ec7eb595..0cec602f3d 100644
--- a/package/selinux-python/selinux-python.mk
+++ b/package/selinux-python/selinux-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SELINUX_PYTHON_VERSION = 3.2
+SELINUX_PYTHON_VERSION = 3.3
 SELINUX_PYTHON_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(SELINUX_PYTHON_VERSION)
 SELINUX_PYTHON_LICENSE = GPL-2.0
 SELINUX_PYTHON_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
