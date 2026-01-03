Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DF8FC617F
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AE11407A4;
	Sat,  3 Jan 2026 11:41:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FX0YvVWLpMSL; Sat,  3 Jan 2026 11:41:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5885440779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767440465;
	bh=hnoX3/3F9mcO8zOR44Nm7HEhS+aI86Req7JZcBZVRlc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a/Zz2X59nIMfMxNrZchI73aoTYeUHF8y/BxQclYo2D+3OD75zsuQHzOXE9EiuviMI
	 V7W++5C2KUS9aArEAKYBEssWRfEbpxWmOT0w4oGRNwGMk/hFDm7TWCYSAAQiDcZkaB
	 9cE1JXNB8x4i1yMvwdIh1AkFwkCpD38gtItq9gp9j/kz4vabP1ZCmIhcZq+oGlb3Y5
	 HyBnaqAbaKRrR+9ecrgMzAIbuiPrngfeWpHVWOYY79Jk7bQmHoSxdO80eB63EpxyTK
	 l+MnC7NFuhboBAAKEbterJhx6hUHparcR6wLeUZ4UDGxo8BdpA7vcJdTH/6MS90GVN
	 GNQpGD+Z4F5Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5885440779;
	Sat,  3 Jan 2026 11:41:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 599E1351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F53780997
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Wyko0XwaWuE for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9EF5809CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9EF5809CB
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:40:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA9C58810F; Sat,  3 Jan 2026 11:40:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jan 2026 12:31:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d61b71af5d8c5f5cc235ea537bcd3de748512ec
X-Git-Newrev: be65832720b226516dcaf357fbb9276544bbf031
X-Patchwork-Hint: ignore
Message-Id: <20260103114057.AA9C58810F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bottle: bump to version
 0.13.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=be65832720b226516dcaf357fbb9276544bbf031
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-bottle/python-bottle.hash | 4 ++--
 package/python-bottle/python-bottle.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bottle/python-bottle.hash b/package/python-bottle/python-bottle.hash
index 3ea1f71ca6..722eccba94 100644
--- a/package/python-bottle/python-bottle.hash
+++ b/package/python-bottle/python-bottle.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bottle/json
-md5  3564bf7c5e348d6dee6dd13a89dd9330  bottle-0.13.2.tar.gz
-sha256  e53803b9d298c7d343d00ba7d27b0059415f04b9f6f40b8d58b5bf914ba9d348  bottle-0.13.2.tar.gz
+md5  a8dd2700b477b86a38510a2a31d07c78  bottle-0.13.4.tar.gz
+sha256  787e78327e12b227938de02248333d788cfe45987edca735f8f88e03472c3f47  bottle-0.13.4.tar.gz
 # Locally computed sha256 checksums
 sha256  af150257b1f7cce92b6207854f2e8f90ea9ae52d7cac758d13a47bd12e2a2443  LICENSE
diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index d6469b11d0..01a73514ad 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTTLE_VERSION = 0.13.2
+PYTHON_BOTTLE_VERSION = 0.13.4
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
-PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/1b/fb/97839b95c2a2ea1ca91877a846988f90f4ca16ee42c0bb79e079171c0c06
+PYTHON_BOTTLE_SITE = https://files.pythonhosted.org/packages/7a/71/cca6167c06d00c81375fd668719df245864076d284f7cb46a694cbeb5454
 PYTHON_BOTTLE_LICENSE = MIT
 PYTHON_BOTTLE_LICENSE_FILES = LICENSE
 PYTHON_BOTTLE_CPE_ID_VENDOR = bottlepy
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
