Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B826C433F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Apr 2022 07:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1618760ABB;
	Fri,  8 Apr 2022 07:09:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XAKPSWPowua0; Fri,  8 Apr 2022 07:09:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A25B60B0C;
	Fri,  8 Apr 2022 07:09:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E39981BF2F8
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 07:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D182D4012F
 for <buildroot@lists.busybox.net>; Fri,  8 Apr 2022 07:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (3072-bit key) header.d=samba.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QKEMlCxcqdWg for <buildroot@lists.busybox.net>;
 Fri,  8 Apr 2022 07:09:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from hr2.samba.org (hr2.samba.org [IPv6:2a01:4f8:192:486::2:0])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C90E24010E
 for <buildroot@buildroot.org>; Fri,  8 Apr 2022 07:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=YO2/YufiYowlRkJPWUXB070jinvO2M5KUeUHzDnKhzc=; b=xYlaBmFSaJMDBG8FHiM/6obDC2
 MgPReb/l0WkzIvL0ITG6f2OZJrvZPuzAJcIV+u6HVzpujOml3/0tH/c/ZwdVOpYc6vSSRXZgr+bP6
 B2o9Jqy92xEqxBDqlu/D/RewWGscuF0e45XRfeufRCF4mOCnl1rq+Uk39Ls27krca0l5N2vh+Wr3F
 Ky3ialGSZlPpgVI631DkG69Rid9KYlfITlAGlrn1iGGZKNY7LhAZtrFNi9qEye8Dg/2N5ZA5m32xc
 SeAC+6lVmtGqH/xjw2/txCTkESmxQuqvWi81RhOzkcTQW1BizlQAE6Azkt/m9Q4odIW6uYhbnk9zJ
 aEew0zZHIgu5IpEYPaL+QGHnHFL7mtLwAwvZ8eJJke5ZQRWHcua1HzzB7fR7HmqMutjdr/ltuXSR/
 iFJm/4w4Z9U1IIRhp0VW1+6DlwLmwg5agtyhyuWppXnAhBM+U1Z5q0nV7S8QGpVE0VwCMIaVgI57x
 xB4CcBSp8qeoM7RjfleIXA9N;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ncikO-005zFp-5v; Fri, 08 Apr 2022 07:09:32 +0000
To: buildroot@buildroot.org
Date: Fri,  8 Apr 2022 09:09:21 +0200
Message-Id: <20220408070921.1786-2-ambi@samba.org>
X-Mailer: git-send-email 2.27.0.windows.1
In-Reply-To: <20220408070921.1786-1-ambi@samba.org>
References: <20220408070921.1786-1-ambi@samba.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/openjdk: enable for host
 architecture aarch64
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
From: Christian Ambach via buildroot <buildroot@buildroot.org>
Reply-To: ambi@samba.org
Cc: Tudor Holton <buildroot@tudorholton.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Ambach <ambi@samba.org>

Signed-off-by: Christian Ambach <ambi@samba.org>
---
 package/openjdk/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 8b7fd4653e..8fbe51a27f 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_OPENJDK_BIN_ARCH_SUPPORTS
 	bool
 	default y if BR2_HOSTARCH = "x86_64"
+	default y if BR2_HOSTARCH = "aarch64"
 
 # Taken from make/autoconf/platform.m4
 config BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
-- 
2.27.0.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
