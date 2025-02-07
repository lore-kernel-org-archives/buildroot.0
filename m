Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C26C02194
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 19:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D44781403;
	Fri,  7 Feb 2025 19:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXagkd8DrRov; Fri,  7 Feb 2025 19:30:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A73FC81A39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A73FC81A39;
	Fri,  7 Feb 2025 19:30:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0DCC1B5
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFC3581403
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dVXn5sAW928i for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 19:30:31 +0000 (UTC)
X-Greylist: delayed 433 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 07 Feb 2025 19:30:30 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EF01681A39
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF01681A39
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=162.248.234.2;
 helo=mail.xes-mad.com; envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF01681A39
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:30:30 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id 2392E202AC;
 Fri,  7 Feb 2025 13:23:16 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Fri,  7 Feb 2025 13:23:12 -0600
Message-Id: <20250207192312.4058639-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1738956196; bh=dcVzuMuf0VHIn3qq9EE7a68EN/U4hbpMZem3irWQeAs=;
 h=From:To:Cc:Subject:Date:From;
 b=ZhOHxpYdf2ZA400uWNFYmVRcajdH05BlvXgqyXUx9cO1oPBpLI6mBJ4X8q4wL5cfk
 GdS44jwHqTVopTGumzCN77s24PhQDugtzJo54LRyPsQH/3+qOsgayOp7Efl+WBrZFs
 W4fQUawu/JLPxMvARBa4MlQ0oLDBy5kL6uFTwH4I=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=mail header.b=ZhOHxpYd
Subject: [Buildroot] [PATCH] package/python3: bump to version 3.12.9
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
Cc: Vincent Fazio <vfazio@xes-inc.com>,
 James Hilliard <james.hilliard1@gmail.com>, Vincent Fazio <vfazio@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Brings a number of bugfixes:
https://docs.python.org/release/3.12.9/whatsnew/changelog.html#python-3-12-9

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 package/python3/python3.hash | 4 ++--
 package/python3/python3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index ea026376fd..b44bca4340 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
 # From https://www.python.org/downloads/release/python-3128/
-md5  d46e5bf9f2e596a3ba45fc0b3c053dd2  Python-3.12.8.tar.xz
+md5  880942124f7d5c01e7b65cbad62dc873  Python-3.12.9.tar.xz
 # Locally computed
-sha256  c909157bb25ec114e5869124cc2a9c4a4d4c1e957ca4ff553f1edc692101154e  Python-3.12.8.tar.xz
+sha256  7220835d9f90b37c006e9842a8dff4580aaca4318674f947302b8d28f3f81112  Python-3.12.9.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 2be6bb7004..b15c27053f 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).9
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
