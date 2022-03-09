Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28487C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 22:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D286B84241;
	Wed,  9 Mar 2022 22:01:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oRwIWeieQFNY; Wed,  9 Mar 2022 22:01:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8710584345;
	Wed,  9 Mar 2022 22:01:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E18DB1BF37E
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 22:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D20CD418AA
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 22:01:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHrablRNVftM for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 22:01:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADD4C418A3
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 22:01:04 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k24so5109381wrd.7
 for <buildroot@buildroot.org>; Wed, 09 Mar 2022 14:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nt5YzfW7sYT7yQ2j7Ov82/MxlyS6mODEhzKFOjK5JV4=;
 b=gDu7xw+VEQ88yX4senkABPnWyvfeWI12r5RB/SCNWjBRLZT3Ac1WD80pYetpXRnDGQ
 N87V4DFG2roAz4mcSPnTsRV9hJ/8GzgHWYmfOhEG+Gu5rOTobGj763XiG4mW0cotnsDB
 PCCMqbiGtYKvYEartM4roM0t1um0EHhVnXvdc6dpgVvfLD3BjGN2I80yr+BwNFKG58ba
 R3CpIvnx3bf5e20JL9OBSAXgwmHw0wD1c2wqdF9xvp2dQW44VOtUgq/dzuFfMRTBoRKc
 iZUnZB3vmwTWHQevpbqdS3FLWKwP70+MRLJadkSyDHtEJPy9gxyJz9RCtYEMNtDGx48J
 1QgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Nt5YzfW7sYT7yQ2j7Ov82/MxlyS6mODEhzKFOjK5JV4=;
 b=LxILBnvW1J4dxFzOwg5qZImn7XgbY5nRFn+W5MkTPzTWuOStul+nctkGR7/b1y1x4i
 wYKkFyUeJeLcWPOnIYffDCwBCR5jEZGxrcbIerxYyQ040h8mDQGS35hEK3cUAu3uzD8l
 RM7saxN0Da/p9y3RhyZGJIjsxlg7kJ3yp1TQhqh2Bl66N2q6Q/i/FE8BGvjfTsWaAJo0
 agnVhU+QesP8khPMZ66douz63GOUDVrkqXRamXTB8ImQFXihlALtvD6G6oIfwE/fHoQB
 WyGvZ1lEQpCQBe19fKedt9mtZVkZyP9mtnqhoojoTW9VProQj4wk33q5Asy9G2oYh8cF
 dylw==
X-Gm-Message-State: AOAM532jzavWqNPXOnAEHXzSjJJfOhruIE3vbqQddnuSraJZmhRosxYU
 1T2ek0+V1mxxtdsLm+dAXX2lMNlDD+U=
X-Google-Smtp-Source: ABdhPJw+9JLeM6v452/8ttWjGi2F/poAJP2w+vAvZBe0sEXw/e+pJbvTJ3txrqpWAlpROzIZpwxq0A==
X-Received: by 2002:a5d:6d83:0:b0:203:6a0e:8854 with SMTP id
 l3-20020a5d6d83000000b002036a0e8854mr1190080wrs.259.1646863262588; 
 Wed, 09 Mar 2022 14:01:02 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a5d6b43000000b001e317fb86ecsm2553128wrw.57.2022.03.09.14.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 14:01:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Mar 2022 23:00:16 +0100
Message-Id: <20220309220018.786891-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/3] package/cmake: bump to version 3.18.6
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update hash of Copyright.txt (year updated and Qt Company Ltd. added:
https://gitlab.kitware.com/cmake/cmake/-/commit/1edc4a8a7e759c4047dd1a1b9864b34f6cb4cc50
https://gitlab.kitware.com/cmake/cmake/-/commit/f8c505d4b30aa636b013486913591060b2040716)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cmake/cmake.hash | 6 +++---
 package/cmake/cmake.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 97e83a274c..da514a6d6b 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.16/cmake-3.16.9-SHA-256.txt
-sha256  1708361827a5a0de37d55f5c9698004c035abb1de6120a376d5d59a81630191f  cmake-3.16.9.tar.gz
+# From https://cmake.org/files/v3.18/cmake-3.18.6-SHA-256.txt
+sha256  124f571ab70332da97a173cb794dfa09a5b20ccbb80a08e56570a500f47b6600  cmake-3.18.6.tar.gz
 
 # Locally calculated
-sha256  dc628fb936a5d229296d42083f9a8218aa32204c016919e784404c9ec58776e9  Copyright.txt
+sha256  131b9ff756b64a25b7461c3c1382e70b16c70a5b4833a1577897fa3ea6d88f8d  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index b1b214982e..4177b119ab 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.16
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).9
+CMAKE_VERSION_MAJOR = 3.18
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).6
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
