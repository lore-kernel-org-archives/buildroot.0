Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B57BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 23:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38D6C40915;
	Thu, 13 Jan 2022 23:38:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KWQKcVULNN3h; Thu, 13 Jan 2022 23:38:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88D1B41499;
	Thu, 13 Jan 2022 23:38:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC51A1BF3E1
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 23:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA66D84B46
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 23:38:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1BQ92J47Otta for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 23:38:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 198D883F08
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 23:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=glv6jTO3y/RqfJoblbe16AW3JPozM5lJF9C/1M3Av2E=; b=AJu7ElXJtbydyAsvaNhrpB0fMa
 orj7TVCGTUKmHj7xJI0iNLMbHgf59zJYzb5RUr2oLSE7Bop5nnhT5qU9+rnitsdybr6qMS+nSkjKJ
 zpTUZ79hZiTCMdHqQwZfnJ54wErbFRk7qIG6j9Mr0FA8arWGdIybHY+WWrJGtxdBbtyfFPgJ5l+/K
 Sxwqbj4N/Id5ESp6PFEJ3JtVaMB5vI6qwPLhtpPBfop26uvnUUGzuRxh2B8Ku+ntWHDAOp4FqdvIK
 CSUWpN+p7wAhMRfDmokZLn4PqLc69vKtM4dZCtph1zWoh/IKTO9X+fCXk8kMTaguypj0wEKRgdu6Z
 bQMQvkWQ==;
Received: from 91-153-34-128.elisa-laajakaista.fi ([91.153.34.128] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1n89fW-0004W9-50; Fri, 14 Jan 2022 00:38:10 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id a16371ed;
 Thu, 13 Jan 2022 23:37:58 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 01:37:58 +0200
Message-Id: <20220113233758.110264-1-aperez@igalia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/kf5/kf5-extra-cmake-modules: do not
 build documentation
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
Cc: Pierre Ducroquet <pinaraf@pinaraf.info>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pass needed CMake options to disable generating documentations. The
documentation is built using python-sphinx, which is not packaged in
Buildroot.

Prior to this change, if the build host would have a Python installation
with the sphinx module installed the automatic detection tried to build
documentation, which would fail in cases where the sphinxcontrib-qthelp
package is missing from the host Python installation. The error message
in this case was:

  Extension error:
  Could not import extension ecm (exception: cannot import name
    'htmlescape' from 'sphinx.util.pycompat'
    (/usr/lib/python3.10/site-packages/sphinx/util/pycompat.py))

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 .../kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk
index 3c4281b960..ba2748456e 100644
--- a/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk
+++ b/package/kf5/kf5-extra-cmake-modules/kf5-extra-cmake-modules.mk
@@ -14,4 +14,9 @@ KF5_EXTRA_CMAKE_MODULES_DEPENDENCIES = host-pkgconf
 KF5_EXTRA_CMAKE_MODULES_INSTALL_STAGING = YES
 KF5_EXTRA_CMAKE_MODULES_INSTALL_TARGET = NO
 
+KF5_EXTRA_CMAKE_MODULES_CONF_OPTS += \
+	-DBUILD_HTML_DOCS=OFF \
+	-DBUILD_MAN_DOCS=OFF \
+	-DBUILD_QTHELP_DOCS=OFF
+
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
