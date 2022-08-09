Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74703C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 08:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DFD58188B;
	Tue,  9 Aug 2022 08:34:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DFD58188B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Tbj0DGalGQ0; Tue,  9 Aug 2022 08:34:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17B068176D;
	Tue,  9 Aug 2022 08:34:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17B068176D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76FEE1BF5F5
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 08:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E9978176D
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 08:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E9978176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id stPnM77ki0od for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 08:34:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 860328142A
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 860328142A
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 08:34:33 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 az6-20020a05600c600600b003a530cebbe3so3611147wmb.0
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 01:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=zWw9XilfMKXM9FQYqwkMTKLROorDh4AXVhXFcv1FFm0=;
 b=5DAxqEpMPtqvSJVjylk7K6ArmVxmETpsXDg1CV7mrCNrztB8BiAH/KHv4OWJXTqf7l
 BRvgmKDf1BB6zO6wk4X+deNF0EsSwXSieqiRYNELK5UJg/VXiNtj420My4NDD32fwQwX
 Xc2Vj8S5b2MRau0DIIuESIO8fLA0KEotalCOvZEBOkZFiq8pgjAuInosyRlxVO5sHC7g
 o4oL7/4rGTxvY39D63ec+CjYpYU6A8m7nFXSqSBf/mf8p4D23e9RtaSfr8Bk40Qohitx
 CJD+VQkrEgf3kUHxTeElM4ML0ZAMWJcxERpSm4jLw5nqpIqgy8UjxXQsS+gnHQpmCjtJ
 Dkjw==
X-Gm-Message-State: ACgBeo3B1luBRWS1Z+NxPuvRE/LL7JAoKP53N+tO4eXZruWXJr7zt9AU
 HwZvQytwEjHtM8H295Tk7dVlFecYvzw=
X-Google-Smtp-Source: AA6agR4jmJsVRqJCz29RxhowKpYJQqonUX9qBhC4SXu0hmvKYAry52xRonNaEBTEuipdIxVmEy6FRA==
X-Received: by 2002:a05:600c:348d:b0:3a3:1fe6:6b38 with SMTP id
 a13-20020a05600c348d00b003a31fe66b38mr14948648wmq.144.1660034071505; 
 Tue, 09 Aug 2022 01:34:31 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c510200b003a55e5d0d54sm1561857wms.36.2022.08.09.01.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 01:34:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 10:33:24 +0200
Message-Id: <20220809083325.1906594-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=zWw9XilfMKXM9FQYqwkMTKLROorDh4AXVhXFcv1FFm0=;
 b=In0W6T+FXC0aJUlw/0+ehV4tZax02vLTJuw74UaADqT6y2wbfKnjuCCXKtWr07k4cU
 d1MdU/KpGKey7zbjcDS83GO7EU0d/aX1vkJMA+t2e62ZrUIdbE0qm2hw617/+0DGokM4
 CF/qq0vl331z99d4A/1BzuqHtgkgpxpmvlN24RQ9/f/IAIWV8mN5X2PZLEVOMnUj4RjN
 7N3NpEd8l2U7AZFEkhh0VW/0a7C4lwdJ7J30RlE3yjDs6jNNBg2ye+Ko77Ff9Z54+s2i
 qh/d0BR6lXazNUZxsTBtC7B14yvsnmN6uHVH+agHmSIaI1bZdrk+S416VNLZBva9MDm5
 XO1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=In0W6T+F
Subject: [Buildroot] [PATCH 1/2] Revert "utils/genrandconfig: add refpolicy
 custom git handling"
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 0f3115b2ca9fbdcf7a4e02aba45104f2d423fdb8 which is
broken because of a missing space and doesn't seem the best solution
afterall.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/genrandconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index a56f03681a..75757917c2 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -535,13 +535,6 @@ def fixup_config(sysinfo, configfile):
         if 'BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT=y\n' in configlines:
             return False
 
-   if 'BR2_PACKAGE_REFPOLICY=y\n' in configlines and \
-       'BR2_PACKAGE_REFPOLICY_CUSTOM_GIT=y\n' in configlines and \
-       'BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL=""\n' in configlines:
-        configlines.remove('BR2_PACKAGE_REFPOLICY_CUSTOM_GIT=y\n')
-        configlines.append('BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION=y\n')
-        configlines.remove('BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL=""\n')
-
     if 'BR2_PACKAGE_XVISOR=y\n' in configlines and \
        'BR2_PACKAGE_XVISOR_USE_CUSTOM_CONFIG=y\n' in configlines and \
        'BR2_PACKAGE_XVISOR_CUSTOM_CONFIG_FILE=""\n' in configlines:
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
