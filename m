Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A42C433EF
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 15:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3B1A60ABE;
	Fri, 21 Jan 2022 15:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5b4Llq6yO-CJ; Fri, 21 Jan 2022 15:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D96C606CB;
	Fri, 21 Jan 2022 15:43:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF67C1BF423
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 15:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACB954011C
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 15:42:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-TCWGKFu91v for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 15:42:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AD62404D0
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 15:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qsmXdyU0hrBFMth0PtMhXc1fm5NXvD48If7wAnAcRzk=; b=qmUXMukGkDzVqAE2qAZeBlCw/k
 akNHyopqXPn+vI86NFLm/1ZHOm47bgKW17yVyq2BgEWKqeGfkqaxsM1UauM0SCvbuIy3PHGbl/9F2
 LBJzBEMkl7y4NSKdxn+VLzkq7ixeVC6hEVdDpFd7lgaE0GjEAZcbJnTVocxTPrlZxtgDzh4434g6/
 t2xoztEzAkkJyQdtuEttbg6u49yvhJnwnIvkn1E9j293jq/1CTZPSBr5biWTxxA29E3ltA9hoJAe+
 U4at3yQUGHeo6YOcWO+uqiIndPuo13D01VCus7+t7lGRyN+68Wo2oWdNluwWnIOtndYqAqPUaLHgJ
 LRkfz9GA==;
Received: from 91-153-34-128.elisa-laajakaista.fi ([91.153.34.128] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nAw40-000BCQ-J1; Fri, 21 Jan 2022 16:42:56 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 2245ca95;
 Fri, 21 Jan 2022 15:42:35 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jan 2022 17:42:31 +0200
Message-Id: <20220121154235.798255-4-aperez@igalia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121154235.798255-1-aperez@igalia.com>
References: <20220112132618.2634250-2-aperez@igalia.com>
 <20220121154235.798255-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH RFC v2 3/7] package/musepack: use
 MUSEPACK_NINJA_OPTS
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Pierre Ducroquet <pinaraf@pinaraf.info>, Samuel Martin <s.martin49@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace the usage of MUSEPACK_MAKE with MUSEPACK_NINJA_OPTS to disable
the parallel build. Unfortunately switching to Ninja for building CMake
packages has not solved the parallel build issues.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
Changes v1 -> v2:
  - Tweak muspack package to disallow parallel builds with Ninja.
---
 package/musepack/musepack.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/musepack/musepack.mk b/package/musepack/musepack.mk
index fc66c684a5..000db5fd76 100644
--- a/package/musepack/musepack.mk
+++ b/package/musepack/musepack.mk
@@ -9,8 +9,8 @@ MUSEPACK_SITE = http://files.musepack.net/source
 MUSEPACK_SOURCE = musepack_src_$(MUSEPACK_VERSION).tar.gz
 MUSEPACK_DEPENDENCIES = libcuefile libreplaygain
 MUSEPACK_INSTALL_STAGING = YES
-MUSEPACK_MAKE = $(MAKE1)
 MUSEPACK_LICENSE = BSD-3-Clause (*mpcdec), LGPL-2.1+ (*mpcenc)
 MUSEPACK_LICENSE_FILES = libmpcdec/COPYING libmpcenc/quant.c
+MUSEPACK_NINJA_OPTS = -j1
 
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
