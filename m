Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E24EC433F5
	for <buildroot@archiver.kernel.org>; Fri, 31 Dec 2021 09:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB9F640942;
	Fri, 31 Dec 2021 09:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3eqEYjgB5qZB; Fri, 31 Dec 2021 09:01:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AE8840904;
	Fri, 31 Dec 2021 09:01:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9BD01BF297
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 09:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98D6E40904
 for <buildroot@lists.busybox.net>; Fri, 31 Dec 2021 09:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PlN1hcF_i470 for <buildroot@lists.busybox.net>;
 Fri, 31 Dec 2021 09:01:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB60B4017E
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 09:01:36 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id l4so17010266wmq.3
 for <buildroot@buildroot.org>; Fri, 31 Dec 2021 01:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CdDTVDLbVxQBtqkeICa7bqhORpKYlKmCpWtJ2VddfAI=;
 b=gH1dND42ywp78ZBvE/fLkSPcq5vhuBu+BmI2SpaVrq5Bzlq3t8JWs5C54k3eIRz8Wk
 6rSkzej/mSXodLRaWZ00rdTZD03omAGUPobiHEyAgVihy9yKl23VgekCGxU2T4CPE7d2
 OYBeOvYBaJR+Q4k7uR+9VLqaSgnHnXKVEdqUTDgEWdLKBAdwUG9mhV5PJ706DFe5KtAE
 tkZkYCgViGOIJAq0nd/dDHrUMEBz+rNT92HkLXhCehXk3j9hdW3kE05NfFrncLqOHZ0L
 KRZiFw3anZVAB2dYBrlrTvHtm/0S5wvrXn2WlRgrXr/aNEa3qyvujWoYwCIm9J2jG/BW
 PX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CdDTVDLbVxQBtqkeICa7bqhORpKYlKmCpWtJ2VddfAI=;
 b=AYeleCwDSzAWE8IMKI1YaauWbCOSwaTFrXJ8qE8Bbu16X3McVVpW1zgOWHcZlBpoDv
 AqAE204ZYAx3xGz4L1wJMPSYFZ9c5r7J4hOuEyHhQltnIy/2Wo2dOER7rqsZgjgoi8eV
 CNiHXWe3TyAStqvnZKQFRlqC8p8aJ+GUGXwXOALiIPOLvhHknpafueKnY2p2NLWE9MES
 eH9InuFtoksIN/+ZXaz++ly2NlWBzj2fiOx44O/DejzWXJK3E5obyRMrhmgIyfHuNEqr
 J+meNklf05MjcPeCO0Gndc1h3fF0WUDHp+shhZGNA1S24CGfBpLtkpjcQydzBtvD7e0F
 Wxyg==
X-Gm-Message-State: AOAM5325zBzWRc2qjCCxZBPOAf42gD5IA5TTeJl9IbHs/1qCQeGFgMYG
 9xZEMkOrM/APEXWSE55M+rNw1ykAg5Y=
X-Google-Smtp-Source: ABdhPJwSDU0HZtIibpBW0NiKJz+QJVjVqHKn5EZwQlAjifNMfCosiB0mzduVdX3GJIVUm1ep69HQpA==
X-Received: by 2002:a1c:4b02:: with SMTP id y2mr28622371wma.164.1640941294695; 
 Fri, 31 Dec 2021 01:01:34 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id e18sm31325657wrx.36.2021.12.31.01.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 01:01:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 31 Dec 2021 10:00:30 +0100
Message-Id: <20211231090030.3437133-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ogre: disable csharp
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable csharp to avoid the following build failure with python since
bump to version 1.12.12 in commit
4e814227caa0a5d190e36cd5174239fe5c627279 and
https://github.com/OGRECave/ogre/commit/3fd839c76a153e614c9e3131ff9959234099e749:

/bin/sh: 1: mcs: not found

Fixes:
 - http://autobuild.buildroot.org/results/5f384dbed8e5241f91072bfffa54ba6b9c509751

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ogre/ogre.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ogre/ogre.mk b/package/ogre/ogre.mk
index 72c96cb33a..72fd616c0c 100644
--- a/package/ogre/ogre.mk
+++ b/package/ogre/ogre.mk
@@ -33,6 +33,7 @@ OGRE_CXXFLAGS = $(TARGET_CXXFLAGS) -DGLEW_NO_GLU
 # Disable java and nvidia cg support.
 # Disable imgui overlay to avoid extra download from CMake.
 OGRE_CONF_OPTS = -DOGRE_BUILD_DEPENDENCIES=OFF \
+	-DOGRE_BUILD_COMPONENT_CSHARP=OFF \
 	-DOGRE_BUILD_COMPONENT_JAVA=OFF \
 	-DOGRE_BUILD_PLUGIN_CG=OFF \
 	-DOGRE_BUILD_COMPONENT_OVERLAY_IMGUI=OFF \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
