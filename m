Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D11C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 07:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D6B440182;
	Thu, 10 Feb 2022 07:58:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aKgRkvidGWAs; Thu, 10 Feb 2022 07:58:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC7DB402A6;
	Thu, 10 Feb 2022 07:58:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7D9E1BF340
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 07:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B54C44047C
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 07:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ik32hz8yObvp for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 07:57:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 994A540465
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 07:57:57 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id k41so1772116wms.0
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 23:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CpDcOuNpQo/CpqUu69JzzUgAoSPwCRpYJWGRSUHFESQ=;
 b=BHOrYLwnjnxF4F/YTSk/Ws5DukRsUY57wmlQ3QtznO1p+griV0scuKg/LwARwODB5e
 fH7lQwD8xPPNlvMkMm/Rryu/3NGuuuL36YIptVXpRwBnsK4gRjzktzcgmv6DC1sN5ib6
 xUnExit+6vZcM7G5QxykEUdlloTs5slmpiWxUNM306+zGlE81mUAhnre0fQ+gL6rH7sG
 5SgrsLt0gGuDYGT0WL7HLWmpE0lcEV62kdxXMiZJ1ndqcEkBjyCugFJtNd4JHpPBVNru
 n7PLMbKuyffQRZeSk9ukJvy6xND6Jjg2B3goTz9m/Ah1Qw08kgRfRYyfJblLhJMkw3Fb
 Xu0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CpDcOuNpQo/CpqUu69JzzUgAoSPwCRpYJWGRSUHFESQ=;
 b=g7en/NSHOhszhLGaeyIg3UCqPwQ7uXcjz2L1XSdaTL29Fk5urQ/JUqpvo9cVmnqC3S
 el4b3dlsgluAxe1YqNxWcML4g3dEiBMRSc22LW7Pq2EHUYGKyPP42FX5Xa/9dL1CZxii
 QwtojL9V7rXvWqtwnPXjj2SeMvzfmlGdBCluWlmZhVprDbagb0DYFlvzl4XFv4C1YmrC
 irZd/9S5mAJTCnPCIQVZm7EUKx6maaMzdbdhKWeG6+HuIoJOZ9g98AWKACf9F/Rqdx5U
 73pX+BBK+icEc/ixnLvJjM2c18h9xFaH1b1IUOiGch8/NghUN6RJnUFq8NXeOZzX6qic
 1doA==
X-Gm-Message-State: AOAM530cm9LpLHBqVZWcAz3vgD91vBEDYNtdO1vy2KTRTk1SwUFvezVY
 PYmnXd91WkuMCZ+lKFK3KaQTpafYZ8s=
X-Google-Smtp-Source: ABdhPJzKSirOnidOTJluahSIvdxSW/oLX5hJlR7EZWRrWgi6wiVChvjtGCnJcFqcin9ttwAE6i6Q5g==
X-Received: by 2002:a05:600c:348e:: with SMTP id
 a14mr1076881wmq.80.1644479875430; 
 Wed, 09 Feb 2022 23:57:55 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id i2sm978503wmq.45.2022.02.09.23.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 23:57:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 08:58:21 +0100
Message-Id: <20220210075821.493485-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/omniorb: switch to host-python3
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to host-python3 which is supported since version 4.2.1 and
https://sourceforge.net/p/omniorb/svn/HEAD/tree/tags/4_2_1/omniORBpy/update.log
to avoid the following build failure since removal of host-python in
commit 2743ce00ca61fde1537b64a165a69d497052be58:

make: *** No rule to make target 'host-python', needed by '/home/buildroot/autobuild/instance-1/output-1/build/host-omniorb-4.3.0/.stamp_configured'.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/d415c2501b27cacf2356f0f6924ee7706d7a4070

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/omniorb/omniorb.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/omniorb/omniorb.mk b/package/omniorb/omniorb.mk
index a1943968f1..b44ec53fd5 100644
--- a/package/omniorb/omniorb.mk
+++ b/package/omniorb/omniorb.mk
@@ -11,11 +11,7 @@ OMNIORB_INSTALL_STAGING = YES
 OMNIORB_LICENSE = GPL2+, LGPL-2.1+
 OMNIORB_LICENSE_FILES = COPYING COPYING.LIB
 OMNIORB_DEPENDENCIES = host-omniorb
-HOST_OMNIORB_DEPENDENCIES = host-python
-
-# omniorb is not python3 friendly, so force the python interpreter
-OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/bin/python2
-HOST_OMNIORB_CONF_OPTS = ac_cv_path_PYTHON=$(HOST_DIR)/bin/python2
+HOST_OMNIORB_DEPENDENCIES = host-python3
 
 # Defaulting long double support to a safe option for the
 # mix of embedded targets, this could later be automated
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
