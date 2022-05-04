Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EFEDC433F5
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 23:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3739418E8;
	Wed,  4 May 2022 23:28:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 531ViB6jOBKP; Wed,  4 May 2022 23:28:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80773418B1;
	Wed,  4 May 2022 23:28:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 60F421BF484
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 23:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F1BC610D2
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 23:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KxtZPnH7VqU1 for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 23:27:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7AC4A60BC4
 for <buildroot@buildroot.org>; Wed,  4 May 2022 23:27:56 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id i20so3158820ion.0
 for <buildroot@buildroot.org>; Wed, 04 May 2022 16:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rwZnnx54pKpx/WT7ZV2UAyV0IaHef9iFh7Q8inThgc4=;
 b=ZtY5aYdSy8kFG7EjwR2Xf2gsUVko79MEv6lU+uj0TFD3k1sbrO4gZ4qu5imhJovwW1
 REXCYUpIbZi823XrmpHM4J2PMSrWpMKx0GhwJylZfwKJ9K/UDhMd5la8xTeMJfuJjhnP
 0DRKo2+dUiHRFm4nX+K6wUjMnwSum7i1oXK55J52KLam2/yPyCGi60+zWo8Y6JzKAgav
 4L9ke8ylK4dy332/siojny546cXnsEFwDP2lHWhb12yhh1vj3Hw/8JdJiK+SRHie93Rl
 u44WmOGm3hkh2b51apt+iR1j6KUVuJ8GjPIzf2vsAz2sm5/zL/KVMiFezs0IlC9AaVEK
 Cktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rwZnnx54pKpx/WT7ZV2UAyV0IaHef9iFh7Q8inThgc4=;
 b=ZcDuGhIFZ+iyorcHZ2pB74YKlyQmM8/uXeYUZwkPfNt92UTDo0W39JSJUFPEurtdVg
 PEsgfzn95atzu3Bls1YO1dOqbWL12t347rrSUc5bhx9eIW3gWM2YCZiO1FrEpVLytT4O
 d7CVqyLODqlqA/h74IRes8DbgLyoyQc5C0K1Da92654iqmfzRgr7n/nCitPo52hAtn3V
 KBFCE5EZRsGgTkFHcwAd7LMHclfFtYespfMVf/aIMPQOhx/dr45C5BAW+e9VfSKsHusv
 PP2krQ9HsDPY5Zg1UJvQTf33ww6l9NJzC8zva7pkZz5XdzyN25N26Eag0uNUHkGLFf81
 furQ==
X-Gm-Message-State: AOAM533CP6kw3RGwyKIDNpqigMZXe5JybzeYTpMqkItmtOLr0FcpJhZO
 BZDX+fuUDjsbQhbEUmyPS/CLhDEKsAM=
X-Google-Smtp-Source: ABdhPJxZhef2JjW69O8OnJ3KQ32Ogyff0qmag0xeVH0nDNyI9fIL68JOcSvVJdW5tW2D8CDp2M42sA==
X-Received: by 2002:a05:6602:2a42:b0:652:8e2d:e4b7 with SMTP id
 k2-20020a0566022a4200b006528e2de4b7mr9338206iov.142.1651706875382; 
 Wed, 04 May 2022 16:27:55 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 q13-20020a5d9f0d000000b0065a47e16f62sm3971069iot.52.2022.05.04.16.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 16:27:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 May 2022 17:27:52 -0600
Message-Id: <20220504232752.4188723-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ninja: add make jobserver support
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
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the Kitware(cmake maintainer) fork of ninja with make
jobserver support.

This fork has tagged releases based on upstream release tags with
jobserver support added.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ninja/ninja.hash | 2 +-
 package/ninja/ninja.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/ninja/ninja.hash b/package/ninja/ninja.hash
index fd2c594a77..ecde199844 100644
--- a/package/ninja/ninja.hash
+++ b/package/ninja/ninja.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  ce35865411f0490368a8fc383f29071de6690cbadc27704734978221f25e2bed  ninja-1.10.2.tar.gz
+sha256  549c31ee596566b952c600e23eb9b8d39a4112cd5fdeb2e5a83370669176da40  ninja-1.10.2.g51db2.kitware.jobserver-1.tar.gz
 sha256  eb7e9ab9690124c5c9f42bdc81383d886a3dede26345b6ed15bbad7caf81f7ea  COPYING
diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
index ab1941023e..bc84046414 100644
--- a/package/ninja/ninja.mk
+++ b/package/ninja/ninja.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-NINJA_VERSION = 1.10.2
-NINJA_SITE = $(call github,ninja-build,ninja,v$(NINJA_VERSION))
+NINJA_VERSION_MAJOR = 1.10.2
+NINJA_VERSION = $(NINJA_VERSION_MAJOR).g51db2.kitware.jobserver-1
+NINJA_SITE = $(call github,Kitware,ninja,v$(NINJA_VERSION))
 NINJA_LICENSE = Apache-2.0
 NINJA_LICENSE_FILES = COPYING
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
