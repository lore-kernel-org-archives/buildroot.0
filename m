Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49065C7EE21
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 23:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD7AB60FB8;
	Tue,  2 May 2023 23:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD7AB60FB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YNDPnx0JaDRI; Tue,  2 May 2023 23:23:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5C0B60F9A;
	Tue,  2 May 2023 23:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5C0B60F9A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C4971BF3FC
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 23:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4502440201
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 23:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4502440201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x339oMCZ175o for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 23:23:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C283401B1
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C283401B1
 for <buildroot@buildroot.org>; Tue,  2 May 2023 23:23:12 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1a516fb6523so43738705ad.3
 for <buildroot@buildroot.org>; Tue, 02 May 2023 16:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683069791; x=1685661791;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=373OGJe6u3LrG5I+1vhhdtwiNtK2X4Z4TItTL8pfMto=;
 b=TTEx7AVbDjfULlYuCDafRfzSLzCP1lA81rMxEG43l+eX506qizWlASSBHM+qih2Tyi
 0FKLm/sXvxOyrRkcRgNN6Qtkio1ZuuVmHLkUhxpsieLA1v3axP+OKoaZOQ1rFE8fSzC+
 iObuWkwf6Q1buGfr9LdcXccyF/0Ri2UVrmOHDuV9VUOHuM8ZVP/biRJlmncq2g8KuMef
 KqRAJFQAVk3qfgaXjG3W/UiFnH7HjWhrNf3ozEwfA/bULBoX5Ycb326jRU0J1RkNlKkT
 7TXtVQOPb9We2RvCe5tkOzQEpWMKJdMGUyzqixYvVxASysN8BDO3WekPq+XrGquq/oBS
 WEQQ==
X-Gm-Message-State: AC+VfDzk8NsZSAKDvgj1IxCwEOlOQ0T/qBsm2YIlybvHleIvvBCt8JXD
 vrEeVdn8vWzpFKjG7tQ5m+2lw8tAVjrJ4Q==
X-Google-Smtp-Source: ACHHUZ5AVthVScAWVhRqN0to8JmBeowRNWiP8z2lnGZ7lvJpiYGV/5LX3bs1T7NCim2E5oNh4GZ9Ew==
X-Received: by 2002:a17:902:6849:b0:1a9:90bc:c3c5 with SMTP id
 f9-20020a170902684900b001a990bcc3c5mr87005pln.62.1683069790958; 
 Tue, 02 May 2023 16:23:10 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 t13-20020a1709028c8d00b001a4fe00a8d4sm20231420plo.90.2023.05.02.16.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 16:23:10 -0700 (PDT)
From: Christian Stewart <christian@aperture.us>
To: buildroot@buildroot.org
Date: Tue,  2 May 2023 16:23:08 -0700
Message-Id: <20230502232308.2974424-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: security bump to version 1.19.9
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
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.19.9 (released 2023-05-02) includes three security fixes to the
html/template package, as well as bug fixes to the compiler, the runtime, and
the crypto/subtle, crypto/tls, net/http, and syscall packages.

CVE-2023-24539: html/template: improper sanitization of CSS values
CVE-2023-24540: html/template: improper handling of JavaScript whitespace
CVE-2023-29400: html/template: improper handling of empty HTML attributes

https://go.dev/doc/devel/release#go1.19.9
https://github.com/golang/go/issues?q=milestone%3AGo1.19.9+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 5488ed9710..ffe42bf395 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  1d7a67929dccafeaf8a29e55985bc2b789e0499cb1a17100039f084e3238da2f  go1.19.8.src.tar.gz
+sha256  131190a4697a70c5b1d232df5d3f55a3f9ec0e78e40516196ffb3f09ae6a5744  go1.19.9.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 37554ddf86..89c3577982 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.8
+GO_VERSION = 1.19.9
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
