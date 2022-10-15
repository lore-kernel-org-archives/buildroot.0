Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E12C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 10:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0310415FD;
	Sat, 15 Oct 2022 10:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0310415FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FplmAavagSaE; Sat, 15 Oct 2022 10:53:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BEF5415F0;
	Sat, 15 Oct 2022 10:53:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BEF5415F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B36A41BF292
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 10:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EF6140323
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 10:53:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EF6140323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x5T7-rNUkNjC for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 10:53:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84D05400D3
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.67.158])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84D05400D3
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 10:53:08 +0000 (UTC)
X-QQ-mid: bizesmtp63t1665831183tvh21jmc
Received: from pc.. ( [202.188.176.82]) by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 15 Oct 2022 18:53:02 +0800 (CST)
X-QQ-SSF: 01000000002000206000B00A0000000
X-QQ-FEAT: HH6/KuQOBEbux29qBZscB8qvQ1fzBGsbgXYMctgHpeNyKzCrbU4sVCUEIZ736
 6da04zuSwpDYQC6wuwEEsCMZIsaXoVNplqq+O68td4wWb226CBfbuHwqb2+1sOmc8lgJpGa
 jxJuNkxeM6OzZIlW/ON1aXqE1nSdzBVPlyD5cCuus/+hfrxtNngjfHSrgkdHHqM5cAZZ9h/
 gRxbCZ1bxWp4XPFt4uVVK5+0k9eab4D9tYAVbcR4gawnh/C/ha6F+6EjSCXIxsMOzP4B9O6
 1tQeLfbhtW0R/u2opcnnDNnCgEHEC5JQTl1vm3cECup6ywRf0QcOi0a2Ip9VLTGP+oQEt9m
 9cTu1KFmOsw2uQTVDBh1CoXUCrRWUNfWMjvrjaIae0sA6jzAXriYHvVRUWrwF2Wp0D29EqC
X-QQ-GoodBg: 0
From: Tan En De <ende.tan@linux.starfivetech.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 16:47:56 +0800
Message-Id: <20221015084757.277050-3-ende.tan@linux.starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221015084757.277050-1-ende.tan@linux.starfivetech.com>
References: <20221015084757.277050-1-ende.tan@linux.starfivetech.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr4
Subject: [Buildroot] [2/3] package/libkcapi: support building kcapi-dgst
 application
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
Cc: Tan En De <ende.tan@linux.starfivetech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Just add a new Kconfig option in order to support building kcapi-dgst
application.

Signed-off-by: Tan En De <ende.tan@linux.starfivetech.com>
---
 package/libkcapi/Config.in   | 3 +++
 package/libkcapi/libkcapi.mk | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/package/libkcapi/Config.in b/package/libkcapi/Config.in
index 8243f6b738..176767e338 100644
--- a/package/libkcapi/Config.in
+++ b/package/libkcapi/Config.in
@@ -28,4 +28,7 @@ config BR2_PACKAGE_LIBKCAPI_TEST
 	bool "build test program"
 	depends on BR2_USE_MMU # fork()
 
+config BR2_PACKAGE_LIBKCAPI_DGSTAPP
+	bool "build dgst application"
+
 endif
diff --git a/package/libkcapi/libkcapi.mk b/package/libkcapi/libkcapi.mk
index 30d500696b..214999ddd2 100644
--- a/package/libkcapi/libkcapi.mk
+++ b/package/libkcapi/libkcapi.mk
@@ -47,4 +47,10 @@ else
 LIBKCAPI_CONF_OPTS += --disable-kcapi-test
 endif
 
+ifeq ($(BR2_PACKAGE_LIBKCAPI_DGSTAPP),y)
+LIBKCAPI_CONF_OPTS += --enable-kcapi-dgstapp
+else
+LIBKCAPI_CONF_OPTS += --disable-kcapi-dgstapp
+endif
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
