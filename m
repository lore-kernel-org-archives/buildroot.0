Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4671CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 22:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4803402D0;
	Mon, 31 Jan 2022 22:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ijmxmLAlw69V; Mon, 31 Jan 2022 22:54:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA33B40189;
	Mon, 31 Jan 2022 22:54:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E76B01BF836
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 22:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E407D81331
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 22:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id USoicDdkSC6H for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 22:54:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 085E58132C
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 22:54:31 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e2so28408144wra.2
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 14:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VdHqWwyMVF9IxBnKWSsfm4Dc0hHGIGysF8kfD3YhW7k=;
 b=ZA+bAzzqCgyC9cwVmkM9YzS+SmR0rI7j//0p/OmGYwdkTGNve85xuRWF4YR+wwhJ62
 89QjlyfEclLdNcVclQUJ8FbDgKKd1CAb0B2WRPLkssl9uGPSdO+m0CzS6m0+N9+RpwQR
 QNgGSTNzuA7Nnxxvq3RUsT1vLZqHEpypWCIWIeGWfBTq/Mk8CR8KPXxXWqb9U0FAjHdz
 qn/nDjvCADTF3fYOg/1PvAZP/4/Xwz3FJvbSuC6PMm42wuQgCLXYK8huBRu3phqBqb8J
 1oTWu82eDNJJ7V0AFn2xCGuILVLwTdn2AnWzvmwc5xOs/7JHXHmZPhNJ1dhCl0mYsjHK
 XiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VdHqWwyMVF9IxBnKWSsfm4Dc0hHGIGysF8kfD3YhW7k=;
 b=JXHSIHb8ASviVWIm+O9y8OQvq8NWTeaAyKBX6ioelIwC/f2TYSGGFsh/ooEvfICrsb
 Kd4e/BTmaBuAm0LHrNlbaFtJXF+awf2z9MYrt3wcb1zj0yrF69RWAOhg7ICY5BoOAEN5
 RulkvVYiFOFKcDcRvyTxCuu7wwkXgY0P10g/IPXxLZG/swQbnvBiwcEkrwv+GCLtPOFm
 38rmXbiBHbhIR3Zfnx4/m/mJP5QmkaCxPv142pwpp/rkWTuAzSfDZw5whOpt7IebwAxj
 C2hlU66j7XLbtM1PdSIB/Kmu+wZMn42cavFvPjCA3nwjBuorpoQhLZz0hMxjH+nl0O3S
 U90Q==
X-Gm-Message-State: AOAM532omBOgYmq1dUxrGdQk3L6jLXgu45mV/1R1hBYdbFmXR45NKsb5
 0Lv6h11O3+pRIMaGAuGJdN6+QCIgVsg=
X-Google-Smtp-Source: ABdhPJy9EZOlpP/UNj6QbjwG89tyM0Og19EaoPiT6AAPJbRj+UwxAks+GmESmzGgCHBg5QC3GNV+cQ==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr19089464wru.549.1643669670058; 
 Mon, 31 Jan 2022 14:54:30 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id i94sm12818110wri.21.2022.01.31.14.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 14:54:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 23:52:30 +0100
Message-Id: <20220131225230.178602-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/expat: security bump to version
 2.4.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Expat 2.4.4 has been released yesterday. Besides a memory leak bugfix to
xmlwf and fixes to the build system, this release is about security
fixes. There are 2 CVEs involved, both related to fixed-size integer
math (integer overflow) near memory allocation, not unlike what we had
with 2.4.3 before. Impact is denial of service, or more.

Fix CVE-2022-23852 and CVE-2022-23990

https://blog.hartwork.org/posts/expat-2-4-4-released/
https://github.com/libexpat/libexpat/blob/R_2_4_4/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 0853c3c76d..10e13206d0 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.4.3/
-md5  b1137f030590b3f0c41c69c6cd68fa90  expat-2.4.3.tar.xz
-sha1  cfaacc4f929b34cfbde2b8f33b74ec84c0cbb329  expat-2.4.3.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.4.4/
+md5  a712d23b7afb32e7527cf0b3fd8f12ac  expat-2.4.4.tar.xz
+sha1  6028b04d3505fc519c4c7c6bd67e1ad1a08cd7b6  expat-2.4.4.tar.xz
 
 # Locally calculated
-sha256  b1f9f1b1a5ebb0acaa88c9ff79bfa4e145823b78aa5185e5c5d85f060824778a  expat-2.4.3.tar.xz
+sha256  b5d25d6e373351c2ed19b562b4732d01d2589ac8c8e9e7962d8df1207cc311b8  expat-2.4.4.tar.xz
 sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index a7ace66095..250600c25e 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.4.3
+EXPAT_VERSION = 2.4.4
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
