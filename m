Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63914C636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 17:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 133176FAD0;
	Tue, 21 Feb 2023 17:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 133176FAD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nJC3EtnPULon; Tue, 21 Feb 2023 17:25:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E72B46FB00;
	Tue, 21 Feb 2023 17:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E72B46FB00
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 728401BF956
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5296D82A6C
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5296D82A6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MIEYfxHjAbEp for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2F4882BED
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2F4882BED
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 36E1F21726;
 Tue, 21 Feb 2023 11:22:19 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 11:22:02 -0600
Message-Id: <20230221172205.2450111-12-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221172205.2450111-1-vfazio@xes-inc.com>
References: <20230221172205.2450111-1-vfazio@xes-inc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1677000139; bh=dxSKe7s2/hJYDgsGX5fdld403C7UJJ2Vd7xKlYsp/Ec=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KS5wV9XhqeTCJsv1HnirxGUjUEmrwGWWDJaYCY2R0r7m9OmPTtVbBrM9hJrxOLZzf
 dCNXw/9CxigoeLLO3i4NMSFsqxpI9CdgFMecgOyDs6/Lv5yR7nagMKAsY7ueC+ORyV
 FwSVz8cIC8ZrUg3dZQ/dlw03EyWDlCYtGTAKP0mc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=KS5wV9Xh
Subject: [Buildroot] [PATCH 12/15] package/popt: remove POPT_GETTEXTIZE
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Fazio <vfazio@gmail.com>

Commit 895bfba dropped POPT_AUTORECONF but did not drop POPT_GETTEXTIZE,
which requires POPT_AUTORECONF = YES.

Fixes: 895bfba ("package/popt: bump to version 1.19")

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 package/popt/popt.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 842cf0d035..5cee8e9673 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -11,7 +11,6 @@ POPT_LICENSE = MIT
 POPT_LICENSE_FILES = COPYING
 POPT_CPE_ID_VENDOR = popt_project
 
-POPT_GETTEXTIZE = YES
 POPT_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 POPT_CONF_ENV = ac_cv_va_copy=yes
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
