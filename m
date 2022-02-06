Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C594C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 21:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB3AB4023B;
	Sun,  6 Feb 2022 21:24:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OMbzhm6U3X6r; Sun,  6 Feb 2022 21:24:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C543140201;
	Sun,  6 Feb 2022 21:24:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2237E1BF44A
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 21:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1167D813AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 21:24:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LY81bBxgpHvZ for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 21:24:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43A5281398
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 21:24:11 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id q204so14486139iod.8
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 13:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WCK6bvonakNSyStbJvnFCuXJeC9lwGeMB65XFCDSfBs=;
 b=g2wo7CIYyzxL+jgzXV5t8bNDqAtA9e/0VKJCD/Jd7QIU2OuuiDQZtsUVcrLGsEvmQU
 z2cfuQckTw8BM3BYfcqmzoLzokMw5/WV2RLIT9HAiCruplL6lzFtqcGmO590zeh5zKCf
 So9Y87XuBcjUgzxbZ9FGa9KN19VvpcdlBLGiVD7sTzQhwGOdN1TSZCKCArJI4v7ZRAov
 N0xnP28BBRF/EzI7sBREmmBrjw/1DfEfuqQjNcuhwmavcfy85gGaCASI0j60fARkfNMU
 sAkpt5wHT1yWBHiawcGYyNrVSlzLryPievX44fP12IZ7B1aQ1+FiosYgu4eBGnDtA2jk
 Vt+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WCK6bvonakNSyStbJvnFCuXJeC9lwGeMB65XFCDSfBs=;
 b=ig4GqD/SdE+WfyffGwCWChsJ72SJKNJ3GSobDXHMi/td+esZ49Cgm7rHucMJYdsuLk
 C2aI0yxCP73LhUvr0YSKPd+GhMrmIVV9uwAmwq+8YXM2yfsXPy3P+bVI72BUpyzleu+9
 /8JFhteHzZdXDL4/Za70InUOGeae3KMWVy+vnF3S8FfBFjxIH+Htkuu0gh/JZIgDX55Z
 N7ZZvUM3xIOaewosPY8LyN2R8L1pgqfvmUJYfO/vGeOCsZTvBSVofMQBF6G0/BeL8Ns+
 UGLX/H92a9IMgJRqPqQhsgCEgJukY2NVNiJUMxyA6czQ01IXnQNTt8Ez33pfAHhl7wMy
 aU2Q==
X-Gm-Message-State: AOAM532EfoyjejWDfyk5m+1JcPSnDIFY03fbl0Jq249dkZYTP2tWJU6N
 NsQPMitNFT+7k/SyXFW9n/3/w5HALEo=
X-Google-Smtp-Source: ABdhPJy0+KDnQ4LlA/rLT94XJ3MoW6V4kb3pkZSadweZpUC4fhUFRd54vOsLfGqPQbtrkmsh8yJXEQ==
X-Received: by 2002:a5e:9916:: with SMTP id t22mr4075522ioj.146.1644182650198; 
 Sun, 06 Feb 2022 13:24:10 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id h3sm4354651ild.11.2022.02.06.13.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 13:24:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 14:24:05 -0700
Message-Id: <20220206212405.1787998-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5declarative: bump to version
 1d49a5b678957adde7e2db23a485a3f48157bc8f
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/qt5/qt5declarative/qt5declarative.hash | 2 +-
 package/qt5/qt5declarative/qt5declarative.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qt5/qt5declarative/qt5declarative.hash b/package/qt5/qt5declarative/qt5declarative.hash
index adda7e03ba..e5b016fc20 100644
--- a/package/qt5/qt5declarative/qt5declarative.hash
+++ b/package/qt5/qt5declarative/qt5declarative.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  14a4b9640a2cd94771108dc3658a77c04c680f3d6444750d55e313b20774ce00  qtdeclarative-9349f3975d26632befc036fc9f2ea6e03aee2182.tar.bz2
+sha256  afea60cbfa48f88c1f0f54b8dbbf90370f6d2535179b4ccaf489db8133ff37ea  qtdeclarative-1d49a5b678957adde7e2db23a485a3f48157bc8f.tar.bz2
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL2
diff --git a/package/qt5/qt5declarative/qt5declarative.mk b/package/qt5/qt5declarative/qt5declarative.mk
index e63a78021a..54aa3be1cb 100644
--- a/package/qt5/qt5declarative/qt5declarative.mk
+++ b/package/qt5/qt5declarative/qt5declarative.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QT5DECLARATIVE_VERSION = 9349f3975d26632befc036fc9f2ea6e03aee2182
+QT5DECLARATIVE_VERSION = 1d49a5b678957adde7e2db23a485a3f48157bc8f
 QT5DECLARATIVE_SITE = $(QT5_SITE)/qtdeclarative/-/archive/$(QT5DECLARATIVE_VERSION)
 QT5DECLARATIVE_SOURCE = qtdeclarative-$(QT5DECLARATIVE_VERSION).tar.bz2
 QT5DECLARATIVE_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
