Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A74F459F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 16:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41B384065B;
	Fri, 10 Apr 2026 16:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPJ12BNEwwtE; Fri, 10 Apr 2026 16:35:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B6B6406AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775838905;
	bh=iSgLKx6tLv4D3QL0cuTgpcyfOPqmjK39X3B/ykA3MF0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WW8e/26EAguX+89SSbdwPsZ7R6wwpFwfrwdaLSs27ZCXHxNsmTWrSuTAgte6i9ET/
	 7Q9G3Cfq0f/uQrLLWkJs3KftAATWNsDUlBU3bqpR47YK5pMe0cqhIRbfcs+QGid6RN
	 +V9Tz6mve7IIWQPjbvCAEiB1QAh9asG6OLHTk6Wq45zFHarBOXdLEHkSoi1X/zgJzt
	 ogf3LA9gDuDvfWAZLfVZVkoPxuPfNRtRnewVGfuU+8xn5DDg9zPr49BtbSLeahCh+E
	 4FHfAEyLbuj1XvtoHm7F808K5xr+I2LJIxMu+OcmgeBDqqGLmOA+PmtF+YCw4FoZ0+
	 LesPAbXYRcJwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B6B6406AA;
	Fri, 10 Apr 2026 16:35:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56BAF1F6
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 16:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CAA280D6E
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 16:35:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h66hbUMHvZtd for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 16:35:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2602580D13
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2602580D13
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 16:35:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF43D810CA; Fri, 10 Apr 2026 16:35:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 18:33:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1afd1a6d4dbef3c78d92fb3f228c9bc5e592d90b
X-Git-Newrev: 0a9b365de4c0d4d2ba6c493b0dafda28dc00ec2b
X-Patchwork-Hint: ignore
Message-Id: <20260410163501.AF43D810CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libftdi1: enable static only build
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0a9b365de4c0d4d2ba6c493b0dafda28dc00ec2b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

libfdti1 provides configuration options SHAREDLIBS and STATICLIBS
that allow any combination of static/shared libraries.

Fixes:
https://autobuild.buildroot.org/results/d7b9a45ccffc1c9e3fd796c3e46ee396b7d88272/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Marcus: explicitly check for BR2_SHARED_STATIC_LIBS]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/libftdi1/libftdi1.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 31ffa1aca3..4fac8d2e39 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -13,6 +13,14 @@ LIBFTDI1_LICENSE_FILES = LICENSE COPYING.LIB
 LIBFTDI1_CONFIG_SCRIPTS = libftdi1-config
 LIBFTDI1_CONF_OPTS = -DDOCUMENTATION=OFF -DEXAMPLES=OFF
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBFTDI1_CONF_OPTS += -DSTATICLIBS=ON -DSHAREDLIBS=OFF
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBFTDI1_CONF_OPTS += -DSTATICLIBS=OFF -DSHAREDLIBS=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LIBFTDI1_CONF_OPTS += -DSTATICLIBS=ON -DSHAREDLIBS=ON
+endif
+
 ifeq ($(BR2_PACKAGE_LIBFTDI1_LIBFTDIPP1),y)
 LIBFTDI1_LICENSE += , GPL-2.0 with exception (libftdipp1)
 LIBFTDI1_LICENSE_FILES += COPYING.GPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
