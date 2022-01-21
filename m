Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A10FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 15:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9755812B8;
	Fri, 21 Jan 2022 15:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uw8hJL2BF3ym; Fri, 21 Jan 2022 15:44:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BDB3815CD;
	Fri, 21 Jan 2022 15:44:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6444C1C115D
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 15:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 526B460DC2
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 15:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UZQ6Hdev5Pwm for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 15:43:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98BE860D7B
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 15:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GPzpvVFFXkksNmh1eyB3AA83P31CZt+b5iiXklVQNIk=; b=QMIlDgkOL14gO0NQQ/vTdwAUf5
 TsClB1qzp/BiADcZXUc1/YeBJwcgCYwI8T0vnkdDRRKRwNJebhzF3dyoZoZRk+gtzvx27rWEyDEWp
 8DsXVyTptJGieABnw/3ciQ14G4nUG+hZM5q8s0PcDH7Mt1b8bJzXJG+vCwt4qYX+9PxLD5KWJSwMW
 Td05yNmul/5ZOaEecbaJVZUXquWBlwzuafF4qtcMsIrfFPHi72W9yyQ8js6v+P4WxOgYV6W6TRuZA
 7nEib9RpB+3JO0n2x6HGyKDnfWBWCFwJA3pNtwU3KvVqYnh6TAA+NsZeBLoiYl+0+2nbs6b2PrGdb
 YWRxJb6A==;
Received: from 91-153-34-128.elisa-laajakaista.fi ([91.153.34.128] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nAw44-000BCQ-9y; Fri, 21 Jan 2022 16:43:00 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 6c9757a0;
 Fri, 21 Jan 2022 15:42:35 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jan 2022 17:42:33 +0200
Message-Id: <20220121154235.798255-6-aperez@igalia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121154235.798255-1-aperez@igalia.com>
References: <20220112132618.2634250-2-aperez@igalia.com>
 <20220121154235.798255-1-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH RFC v2 5/7] package/kf5/kf5-extra-cmake-modules:
 do not build documentation
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
Changes v1 -> v2:
  - Add CMake options to skip trying to build documentation.
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
