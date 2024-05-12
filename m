Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9A8C25B4F
	for <buildroot@archiver.kernel.org>; Sun, 12 May 2024 16:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECC89402E0;
	Sun, 12 May 2024 16:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tbs-6OSA9swt; Sun, 12 May 2024 16:19:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC69640104
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC69640104;
	Sun, 12 May 2024 16:19:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 793FE1BF3C6
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 16:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 663026066F
 for <buildroot@lists.busybox.net>; Sun, 12 May 2024 16:19:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tjui1VXTbS3W for <buildroot@lists.busybox.net>;
 Sun, 12 May 2024 16:19:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0A3E86065D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A3E86065D
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A3E86065D
 for <buildroot@buildroot.org>; Sun, 12 May 2024 16:19:19 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0291E3520D48; Sun, 12 May 2024 18:19:15 +0200 (CEST)
Date: Sun, 12 May 2024 18:19:15 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZkDsA9NqjGG5GwdB@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1715530756; bh=P+715f2YR6AVvnRCYr7c0PY5Mr5UFc6fyEQnb3wDmW8=;
 h=Date:From:To:Subject:From;
 b=GwQfCWhLXdz7HvH7jbCB2WG2wscHtoCGsb3yleY6GMv0ugRridNOcWtiS/5sLmrxt
 jIdHFRugFaMjY9NTsi6HiNCZzvrYsRPzViGh6eSGOSwI/uXwzGkdg6GFGLuh4kumtW
 eNtzzX4nz3ArJ0TRSvhOdY+Jq2Db1HoZtQJ93P4XWbyA8iU5T9If5bLJvS+CvjfeAU
 3bDxpzNTpAa8aTylYInpBBdSHqEIWE2Ur1DL7LYi925QcqYJ5rFgA7ySwNSLzbSlcS
 syzjqerlj/8/1oXzPQPyXJiGeGHJZH4zg8zPJ+b/H0K7+i3ijcyzsLBKvdaplLUgq9
 t8xIO7hnr8tnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=GwQfCWhL
Subject: [Buildroot] [PATCH] package/gcc: enable obsolete nios2 target
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GCC 14.1.0 deprecated NIOS2 so we had to enable it explicitely.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/gcc/gcc-final/gcc-final.mk     | 5 +++++
 package/gcc/gcc-initial/gcc-initial.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 99d7047b5f..5feb96b568 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -117,6 +117,11 @@ else
 HOST_GCC_FINAL_CONF_OPTS += --disable-libgomp
 endif
 
+# allow to build gcc 14.x
+ifeq ($(BR2_nios2),y)
+HOST_GCC_FINAL_CONF_OPTS += --enable-obsolete
+endif
+
 # End with user-provided options, so that they can override previously
 # defined options.
 HOST_GCC_FINAL_CONF_OPTS += \
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 1f8b76a942..8b4247bdad 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -42,6 +42,11 @@ HOST_GCC_INITIAL_CONF_OPTS = \
 	--disable-largefile \
 	$(call qstrip,$(BR2_EXTRA_GCC_CONFIG_OPTIONS))
 
+# allow to build gcc 14.x
+ifeq ($(BR2_nios2),y)
+HOST_GCC_INITIAL_CONF_OPTS += --enable-obsolete
+endif
+
 HOST_GCC_INITIAL_CONF_ENV = \
 	$(HOST_GCC_COMMON_CONF_ENV)
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
