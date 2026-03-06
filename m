Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B05EFCC048
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 17:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9947983D4F;
	Fri,  6 Mar 2026 17:51:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BwBLCR7sNu8f; Fri,  6 Mar 2026 17:51:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F147F83BED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772819465;
	bh=5+sduB5q/uLgvLAuBVDy6hO5H3l1jhtUm4nTRmPLISg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W4t/chbdWlFdUn/DcMTdsS51h2ZfAMDfILF3yjOH3VfSozmbauEmSw3a8efZCbVvo
	 6fPBjgKoEnYmg54FgoliLjA5bF5HesCsBk0sJKdvb8EqRmc61lJylAkS2XLnHh952G
	 0ONmhc6Tv67LQe/fINX/ttfwd/+Hltp6AIqnPxt51IbjOwgphOQ8uQmLIw6dW/sf9m
	 3dRoJO7OTkaNT5siX3ODdhKJ+RIbr7zY8BXRGWcSVODEBNK3E/XGlZeEoxkgnNoQee
	 Vax5RjZy3/RUip7DoPUbmtl9S9V13i+np4xtU3KbfprAWgXvPcT4ggVtwRmipkmJu3
	 LKpZGpMYzGxpA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F147F83BED;
	Fri,  6 Mar 2026 17:51:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3026F223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 17:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1522D6119F
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 17:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bWk_ZwWg4fcw for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 17:51:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8D1E6118D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8D1E6118D
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 17:51:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9EF0861E3; Fri,  6 Mar 2026 17:51:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 18:50:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1c4276c2d0fb266ccf08c03b8d50961b8f7553b
X-Git-Newrev: f489b40190e47ad13f2d7566abefffee8214cea0
X-Patchwork-Hint: ignore
Message-Id: <20260306175101.D9EF0861E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-microcode: bump version to
 20260227
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f489b40190e47ad13f2d7566abefffee8214cea0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260227

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 41041370e2..588cf7cde3 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9232313161ce9dee5facd2870a7bd361d6000b1d409552b5c12efc6498e7f402  intel-microcode-20260210-rev1.tar.gz
+sha256  fcac5a08d7559a2ce4ad3b1ce5d59619c8adb364b9c51988fedd94220392bb37  intel-microcode-20260227.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 9f6592132a..321272e10d 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20260210-rev1
+INTEL_MICROCODE_VERSION = 20260227
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
