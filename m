Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3957F4485A
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 13:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D24AD410E9;
	Fri, 10 Apr 2026 13:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNWSEG9MOERg; Fri, 10 Apr 2026 13:23:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78719410D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775827401;
	bh=CAQpAkvWX0GzhQ7f6ol+52Ad1aq+p7SHESOjW4LNzH0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ffML2emoGDVyOERbgPePpghjpNCTz3q4yiN75LCx/aQ7EOviTZ1XFU5VtRLTlnECP
	 df8jIA/pXRBW3WMBozN4XZrHU2vlL6uTtW3J2t7l+ZDMwL0956m9oLYsTQVrkzXwyo
	 4Nd/G8QnWJYr68L7a5g2vZPdb/tLSMGleDoNLksBapvzyDpVGSvg6kfYSfwLyMI28b
	 sdjTVUrutXln9S7TQ0j/iIHHqMGGq2zRUT9mg32cdgNABPRtI9lcaK8FkAFIkImz+r
	 9GR3HZVJMTAEMoM/A9JziTTGaFlFtAfQv1Tt1shFifstytPM7oJUWIGL+6l99xuP/F
	 jp3K927V1jYpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78719410D8;
	Fri, 10 Apr 2026 13:23:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8521D237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 13:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B6C2410D8
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 13:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QLLmhMNJwwx for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 13:23:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52DDB4107C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52DDB4107C
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 13:23:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF960810A4; Fri, 10 Apr 2026 13:23:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 15:22:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82518f8cb41f1377b7a65abc659adc96ffcbe05b
X-Git-Newrev: 1afd1a6d4dbef3c78d92fb3f228c9bc5e592d90b
X-Patchwork-Hint: ignore
Message-Id: <20260410132316.CF960810A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpiod2: bump to version 2.2.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1afd1a6d4dbef3c78d92fb3f228c9bc5e592d90b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.2.3

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/libgpiod2/libgpiod2.hash | 2 +-
 package/libgpiod2/libgpiod2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
index 24bcfafc6c..157e605ed5 100644
--- a/package/libgpiod2/libgpiod2.hash
+++ b/package/libgpiod2/libgpiod2.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  7e3bff0209d75fbca2e9fcff1fd5f07cc58b543e129e08b6d4bb1e4a56cfec0d  libgpiod-2.2.2.tar.xz
+sha256  70012b0262e4b90f140431efa841ca89643b02ea6c09f507e23cec664a51b71a  libgpiod-2.2.3.tar.xz
 # Hash for license file
 sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index ae3bcfa207..8803a282fe 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD2_VERSION = 2.2.2
+LIBGPIOD2_VERSION = 2.2.3
 LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
 LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD2_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
