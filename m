Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA63C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 05:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 095E784346;
	Tue, 22 Mar 2022 05:14:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OVSPsL7_SWyJ; Tue, 22 Mar 2022 05:14:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF48F84342;
	Tue, 22 Mar 2022 05:14:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C2E31BF31C
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 05:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8648640A17
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 05:14:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o1gsaZ-gbeI2 for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 05:14:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93362400B8
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 05:14:53 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id n18so14523822plg.5
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 22:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=htYWyC8Ebbcx2eYt/z36vIDzktuANCSfzLzWQfxuvQE=;
 b=yARAJ6B4H9FJSOQva3KLNkJgEN3YU0+BRIzALjyLXLaHgdwhbicKfcS5SBsdbx+3UT
 aiq50EIgAdt8Rq+ygWDG7wkR0zjGcfK/XaUB6lvHRnfGy08/BKH5xjb8Grn9IH4q2qSK
 aXJN3SC450wba73OjRwyseHykB0tYp0XLKfmpA0RmsFecwy+OcaMK5nI8BBRs2GOWD7w
 J7pJ0kWKOa7ceYHgnc8M2vCy6SzS4Wgt/3aFjHLhzu/gOruANCzMGstlpzAl9s5eMBVB
 EXEMVAaUuzKpuSTIcL7XPIy1fGHqxcQZqyOPJiva0I45+h3Jx1Z+cCXOj93IADNAa1kv
 h4dQ==
X-Gm-Message-State: AOAM533MLRK/q7SWvfeqIg/utaVJ2A9oMhviY1r7b/0NwghaMbyIfb98
 4ElVkAV+XB6cmkQmMoAJJ7e2uk20BNg=
X-Google-Smtp-Source: ABdhPJxwTkxvZH4fqSC4m6pmYeZJ5spC7ZvO7E/NqTMK08uunVvt5NvTnePYj+/bfbVKhZJTf+1XzA==
X-Received: by 2002:a17:902:9889:b0:153:abee:fbc7 with SMTP id
 s9-20020a170902988900b00153abeefbc7mr16264705plp.117.1647926092638; 
 Mon, 21 Mar 2022 22:14:52 -0700 (PDT)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a056a0022d600b004f7a0b47b0dsm22982196pfj.109.2022.03.21.22.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 22:14:52 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 22:14:48 -0700
Message-Id: <20220322051448.2589854-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: bump to version 1.18
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The latest Go release, version 1.18, is a significant release, including changes
to the language, implementation of the toolchain, runtime, and libraries.

https://go.dev/doc/go1.18

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 85e6adfb8c..e03050b1d3 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  2effcd898140da79a061f3784ca4f8d8b13d811fb2abe9dad2404442dabbdf7a  go1.17.8.src.tar.gz
+sha256  38f423db4cc834883f2b52344282fa7a39fbb93650dc62a11fdf0be6409bdad6  go1.18.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 3df16c9a68..049f846220 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.17.8
+GO_VERSION = 1.18
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
