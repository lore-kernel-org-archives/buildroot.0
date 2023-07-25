Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5F6C00528
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 16:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 891AD40949;
	Tue, 25 Jul 2023 16:16:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 891AD40949
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6lYUgSatKpw; Tue, 25 Jul 2023 16:16:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA13741566;
	Tue, 25 Jul 2023 16:16:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA13741566
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 61F921BF83B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 16:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BD5F60AFB
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 16:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BD5F60AFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5IWT0s3UdrCR for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 16:16:38 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB9A960737
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 16:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB9A960737
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5217ad95029so7570077a12.2
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 09:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690301796; x=1690906596;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eKoYh0E+r8LyfDpzqr19bghoPDAmTJV4xnY9MwsanlI=;
 b=MW7W/0NQ4GVa6A/p6kbrx1mDSPkwn5w/yceAYvdidzthWWhWy4GE9lSJGXGZv+vj29
 0ZnAHGyrCqNU4Jj0oKb93JYaqyiL827iIkRVqiesLvt4l83eIrThY0gh0YDzcAloOfLB
 D+fF2I1l7XdHqhoiB9L9RPl5q48iKVrU7f39qK+a4j2MZum0wb3VcAMK4tokH02wezOO
 A2v1S/k0EcKoK6EBQ3/lS0sMnkHC3tvWu/ZvOGudkJ7YK0Yn9DSgWHmmR4W7v6Ahep+w
 0bRC6WlK4zcj1FtjEeqdD2r1f50BdafOPi8aGm4/4cAPf0ZN8dyF2Lhua508q7VD4o1o
 6oPQ==
X-Gm-Message-State: ABy/qLYJBdZhm3MFknETBgX4PNwz2YnIWOFABl7IRXhjxfK9+dPfFN+F
 fFhzSsNhREQBnCKFl+6VaIn8adz3oT0=
X-Google-Smtp-Source: APBJJlGcVO5/48ZmzEeUhTcdZGPE0BAUZRobEvAoLD1gWqVRsaJ8LuGlIVF1Yj0YHCuO8VMcWSXj2A==
X-Received: by 2002:aa7:d34d:0:b0:522:2aba:bb32 with SMTP id
 m13-20020aa7d34d000000b005222ababb32mr5166244edr.13.1690301795545; 
 Tue, 25 Jul 2023 09:16:35 -0700 (PDT)
Received: from fedora.. (cpezg-94-253-129-196-cbl.xnet.hr. [94.253.129.196])
 by smtp.googlemail.com with ESMTPSA id
 c5-20020a056402100500b0051dd19d6d6esm7823949edu.73.2023.07.25.09.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 09:16:35 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 18:16:33 +0200
Message-ID: <20230725161633.791156-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690301796; x=1690906596;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eKoYh0E+r8LyfDpzqr19bghoPDAmTJV4xnY9MwsanlI=;
 b=fILFiLJdUmEFRisxUoI+rjAXdHkHxQP6je1oydn2BWCh87VcAVW+262Ug5rdnfsn9a
 +s05xi6A9CAKa4W4DgP6Q3St510s5u4EFjRjHkNwqpVWmppWSwiOxs8Xen4iwfw81igt
 FBfEwlpKTkjlT+IQoF826mNsE3GWfWJyNt00vM2ZkK5LCpMT5VWcgRlLACPEeCmoOiBX
 w0xaV0jQqSc5oHD8/3HsTOi/3+NCpDk+aqYbegnVkNOH3c5JmrJj1wnQKuG5H+TCg+Oo
 UlcaibpEpFTu6WlRZbuTzhqhpHOQ4L43L/qCvBBzuLtm8qyW0ocXut2VNthDQ04nJtuR
 3aBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fILFiLJd
Subject: [Buildroot] [PATCH] package/mdio-tools: bump version to 1.3.0
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
Cc: Robert Marko <robimarko@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kernel 6.3 has split the C22 and C45 MDIO support and mdio-tools needed to
be adapted to that.

So, now that new release with support for kernel 6.3 and later is available
lets update to it.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 package/mdio-tools/mdio-tools.hash | 2 +-
 package/mdio-tools/mdio-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mdio-tools/mdio-tools.hash b/package/mdio-tools/mdio-tools.hash
index 0111165f27..1a9d598923 100644
--- a/package/mdio-tools/mdio-tools.hash
+++ b/package/mdio-tools/mdio-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c5e17431c62392f6c1da1ba4fb0a6f5918521509a377af74485851f93ff2a106  mdio-tools-1.2.0.tar.gz
+sha256  d2ab71d92173053af41d754e9c229e1ead768b9f8b7f4947b3b87b84c4c5e360  mdio-tools-1.3.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
index c4be54142e..fb8ec39f35 100644
--- a/package/mdio-tools/mdio-tools.mk
+++ b/package/mdio-tools/mdio-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDIO_TOOLS_VERSION = 1.2.0
+MDIO_TOOLS_VERSION = 1.3.0
 MDIO_TOOLS_SITE = https://github.com/wkz/mdio-tools/releases/download/$(MDIO_TOOLS_VERSION)
 MDIO_TOOLS_LICENSE = GPL-2.0
 MDIO_TOOLS_LICENSE_FILES = COPYING
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
