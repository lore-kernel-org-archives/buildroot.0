Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49076FA1FD7
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 16:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FE4842824;
	Wed, 22 Apr 2026 16:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mQInTi2S9tSh; Wed, 22 Apr 2026 16:49:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6C5042823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776876549;
	bh=rRDeIyZveVPoZo0XN5hE6eeeQ5bcArLADE4Euun19Cs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=f8Gj8DhhpLvFXtmThsF1YmaWy+j9AV4/CLPA+JDqafvCX12cib8oHGm+kQ1zKt9Bo
	 kam5w+XdbFfuXQeqGPgBua990AFH/M0GqdbL2DAoz+yQi+7MgvJUtxjnXHDOY1DXjp
	 TA8C+RFLLoGbQRCKN795JsLWAn0gGjAZcGDSyOFOcWr1OrrVMdAn3M0QzCqp2/sFTo
	 38qvir3WpS5ka+oVc6AfJhi8DUvwrJoQeP7iUh/BvtYd3QTtfmNPp5d37YJorPzRCL
	 aqHC/Z6i5m5BO5NB5eN7sj9tdk3BL4b8uWJ5DQONME4OiXlMleFgkicTRXhZlYxXY1
	 zRM9KgA1wigOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6C5042823;
	Wed, 22 Apr 2026 16:49:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EEBC2183
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 16:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D471740625
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 16:49:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZAFBnBSzsGn for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 16:49:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B364B40607
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B364B40607
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 16:49:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55674825FC; Wed, 22 Apr 2026 16:49:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Apr 2026 18:46:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f40dacf08f322745df07f316cfb34bc7fc01dc06
X-Git-Newrev: 1d5c6d18da663d42643e33bee1c56e968f9bcbfe
X-Patchwork-Hint: ignore
Message-Id: <20260422164906.55674825FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/log4cxx: security bump to v1.7.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1d5c6d18da663d42643e33bee1c56e968f9bcbfe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://logging.apache.org/log4cxx/1.7.0/changelog.html

This fixes the following vulnerability:
- CVE-2026-40023:
    Apache Log4cxx's XMLLayout
    https://logging.apache.org/log4cxx/1.7.0/classlog4cxx_1_1xml_1_1XMLLayout.html,
    in versions before 1.7.0, fails to sanitize characters forbidden
    by the  XML 1.0 specification https://www.w3.org/TR/xml/#charsets
    in log messages, NDC, and MDC property keys and values, producing
    invalid XML output. Conforming XML parsers must reject such
    documents with a fatal error, which may cause downstream log
    processing systems to drop or fail to index affected records.
    An attacker who can influence logged data can exploit this
    to suppress individual log records, impairing audit trails and
    detection of malicious activity.  Users are advised to upgrade to
    Apache Log4cxx 1.7.0, which fixes this issue.
    https://www.cve.org/CVERecord?id=CVE-2026-40023

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: add link to change log in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/log4cxx/log4cxx.hash | 4 ++--
 package/log4cxx/log4cxx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
index f6770e287c..af97ebca18 100644
--- a/package/log4cxx/log4cxx.hash
+++ b/package/log4cxx/log4cxx.hash
@@ -1,4 +1,4 @@
-# From https://downloads.apache.org/logging/log4cxx/1.6.1/apache-log4cxx-1.6.1.tar.gz.sha512
-sha512  6ee406314bd7ab02a46c98cc8a0d5ad5aec8928a23716a81a152775ca315cd3b950d600b2e221d5b4a88416ae9bbda1215fae43626107feea4df2f3e074303ad  apache-log4cxx-1.6.1.tar.gz
+# From https://downloads.apache.org/logging/log4cxx/1.7.0/apache-log4cxx-1.7.0.tar.gz.sha512
+sha512  0e94946457423689af6d85074ab97b717e0cec85a4f548e6650b060e8f98b780f980b7d4a7780410fa64681376fb4bc62fab6ed9068fc944e07f9f32ac0413af  apache-log4cxx-1.7.0.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 57f9b1e844..ea47073d3c 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOG4CXX_VERSION = 1.6.1
+LOG4CXX_VERSION = 1.7.0
 LOG4CXX_SITE = https://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
 LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
 LOG4CXX_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
