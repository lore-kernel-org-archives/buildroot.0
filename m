Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE40C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:56:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3D2060EFD
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3D2060EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90B074068E;
	Wed,  4 Aug 2021 00:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hb6fUxuGHce7; Wed,  4 Aug 2021 00:56:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41708406B5;
	Wed,  4 Aug 2021 00:56:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63F511BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7C6940FA1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F3T9BboHZZKk for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73E0D41464
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C70A687C2D; Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 11:11:11 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 60e11d60b05b9fdb2a454454ed967e0acfa100f0
X-Git-Newrev: bca1912e1f8e4386862b8cfa6460769ab6f02dd1
X-Patchwork-Hint: ignore
Message-Id: <20210803211023.C70A687C2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/refpolicy: fix build
 with cvs
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=bca1912e1f8e4386862b8cfa6460769ab6f02dd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix build failure with cvs raised since commit
da93f38cb19f7f7a9b75232f5f2bad25b8180982 by making inetd optional

Fixes:
 - http://autobuild.buildroot.org/results/838266bef1deec560e336d03a64d64fa1990c344

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...dules-services-cvs.te-make-inetd-optional.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/refpolicy/0002-policy-modules-services-cvs.te-make-inetd-optional.patch b/package/refpolicy/0002-policy-modules-services-cvs.te-make-inetd-optional.patch
new file mode 100644
index 0000000000..298f99c474
--- /dev/null
+++ b/package/refpolicy/0002-policy-modules-services-cvs.te-make-inetd-optional.patch
@@ -0,0 +1,37 @@
+From 21b0a5bc50e15e9af7edb3edad9fac0bf03f7028 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 30 Jul 2021 23:11:38 +0200
+Subject: [PATCH] policy/modules/services/cvs.te: make inetd optional
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ policy/modules/services/cvs.te | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/policy/modules/services/cvs.te b/policy/modules/services/cvs.te
+index f2f60556c..61589228f 100644
+--- a/policy/modules/services/cvs.te
++++ b/policy/modules/services/cvs.te
+@@ -15,7 +15,6 @@ gen_tunable(allow_cvs_read_shadow, false)
+ 
+ type cvs_t;
+ type cvs_exec_t;
+-inetd_tcp_service_domain(cvs_t, cvs_exec_t)
+ init_daemon_domain(cvs_t, cvs_exec_t)
+ application_executable_file(cvs_exec_t)
+ 
+@@ -98,6 +97,10 @@ tunable_policy(`allow_cvs_read_shadow',`
+ 	auth_tunable_read_shadow(cvs_t)
+ ')
+ 
++optional_policy(`
++	inetd_tcp_service_domain(cvs_t, cvs_exec_t)
++')
++
+ optional_policy(`
+ 	kerberos_read_config(cvs_t)
+ 	kerberos_read_keytab(cvs_t)
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
