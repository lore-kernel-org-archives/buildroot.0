Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B2CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 11:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D45C83E45;
	Fri, 25 Feb 2022 11:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KiBUDwgixpWa; Fri, 25 Feb 2022 11:34:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DE5B833CA;
	Fri, 25 Feb 2022 11:34:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C09C51BF34C
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 11:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE90F832D4
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 11:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HGjFUpbRWydU for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 11:34:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4DED83145
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 11:34:11 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id BEB3A200004;
 Fri, 25 Feb 2022 11:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1645788847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQaJM0v26xjGskRSMiXQFzKWmdz35YJygHX5Z2tcS4o=;
 b=VbKPIvyleDVdXkP7XBVecKVDLRgWzC9CzNgKqqVMV7g+AEMOEn0DscVq/bo1ahIXvfPm9A
 Qcq8xLQRO6kbS8giIuEpiYKt4GTN1GAOhJ7v/1oxDbI3aA+72F6AfrTuDFAsAlspAmWTwJ
 SoTg8ZofxNhiPUA0HgxU3nt428aHOO+0HLijKT5+7jDWAqPuDieKRRmqB4drg7JVDGK1rh
 k6Uv5oU78zNQapMGAe0AXfhZ/5bYYoDYIoClKRyv3nHs0LkpUr3/PeraxwvbWq0gQhoJQ+
 kgnTBzRutIpWp0esXdEkf6Eq6XH0iF+mqFtxJej9mDXZvBhOJEYFe9KZSXZhYA==
To: buildroot@buildroot.org
Date: Fri, 25 Feb 2022 12:33:59 +0100
Message-Id: <20220225113400.802049-4-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220225113400.802049-1-kamel.bouhara@bootlin.com>
References: <20220225113400.802049-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/libodb: add host variant
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
From: Kamel Bouhara via buildroot <buildroot@buildroot.org>
Reply-To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libodb/libodb.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libodb/libodb.mk b/package/libodb/libodb.mk
index 11ca9de866..b25e8ac501 100644
--- a/package/libodb/libodb.mk
+++ b/package/libodb/libodb.mk
@@ -12,5 +12,7 @@ LIBODB_INSTALL_STAGING = YES
 LIBODB_LICENSE = GPL-2.0
 LIBODB_LICENSE_FILES = LICENSE
 LIBODB_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+HOST_LIBODB_CONF_ENV = CXXFLAGS="$(HOST_CXXFLAGS) -std=c++11"
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
