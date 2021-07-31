Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D30C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 22:06:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC59B6054F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 22:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC59B6054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1F6B402C1;
	Sat, 31 Jul 2021 22:06:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1zVunHViImTl; Sat, 31 Jul 2021 22:06:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06F86402CE;
	Sat, 31 Jul 2021 22:05:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 390121BF95A
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 22:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B6474027B
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 22:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YRyMe5FTrYon for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 22:04:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97427401C2
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 22:04:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C9ABB8A3F4; Sat, 31 Jul 2021 22:04:52 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 00:02:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ddd0330fe1360de5843f72306d2c766e3b4e6124
X-Git-Newrev: 5527ec47dee19559c206462931d0258b657d277c
X-Patchwork-Hint: ignore
Message-Id: <20210731220452.C9ABB8A3F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/refpolicy: fix build with ifplugd
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

commit: https://git.buildroot.net/buildroot/commit/?id=5527ec47dee19559c206462931d0258b657d277c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build failure raised since commit
499bf5319bf66ecd28d1b85c39ed7ffdeb5bf296

Fixes:
 - http://autobuild.buildroot.org/results/1e27f5b193d40dfb7c73fbe15d1bef91cb92c27d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...les-services-ifplugd.te-make-netutils-opt.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/refpolicy/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch b/package/refpolicy/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch
new file mode 100644
index 0000000000..b43354ed2b
--- /dev/null
+++ b/package/refpolicy/0003-policy-modules-services-ifplugd.te-make-netutils-opt.patch
@@ -0,0 +1,48 @@
+From 6dcfb6715de75677165221ee5bd8d4db6e4a01a7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 31 Jul 2021 10:58:42 +0200
+Subject: [PATCH] policy/modules/services/ifplugd.te: make netutils
+ optional
+
+Make netutils optional to avoid the following build failure:
+
+ Compiling targeted policy.30
+ env LD_LIBRARY_PATH="/tmp/instance-3/output-1/host/lib:/tmp/instance-3/output-1/host/usr/lib" /tmp/instance-3/output-1/host/usr/bin/checkpolicy -c 30 -U deny -S -O -E policy.conf -o policy.30
+ policy/modules/services/ifplugd.te:62:ERROR 'type netutils_exec_t is not within scope' at token ';' on line 73694:
+ #line 62
+ 	allow ifplugd_t netutils_exec_t:file { getattr open map read execute ioctl };
+ checkpolicy:  error(s) encountered while parsing configuration
+
+Fixes:
+ - http://autobuild.buildroot.org/results/1e27f5b193d40dfb7c73fbe15d1bef91cb92c27d
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ policy/modules/services/ifplugd.te | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/policy/modules/services/ifplugd.te b/policy/modules/services/ifplugd.te
+index f49b147f7..550eecca4 100644
+--- a/policy/modules/services/ifplugd.te
++++ b/policy/modules/services/ifplugd.te
+@@ -59,8 +59,6 @@ logging_send_syslog_msg(ifplugd_t)
+ 
+ miscfiles_read_localization(ifplugd_t)
+ 
+-netutils_domtrans(ifplugd_t)
+-
+ sysnet_domtrans_ifconfig(ifplugd_t)
+ sysnet_domtrans_dhcpc(ifplugd_t)
+ sysnet_delete_dhcpc_runtime_files(ifplugd_t)
+@@ -70,3 +68,7 @@ sysnet_signal_dhcpc(ifplugd_t)
+ optional_policy(`
+ 	consoletype_exec(ifplugd_t)
+ ')
++
++optional_policy(`
++	netutils_domtrans(ifplugd_t)
++')
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
