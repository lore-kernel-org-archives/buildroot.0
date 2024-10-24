Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE4ED0BB66
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 07:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 374E7812C3;
	Thu, 24 Oct 2024 07:32:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmqOpYl0lokD; Thu, 24 Oct 2024 07:32:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41910812F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41910812F7;
	Thu, 24 Oct 2024 07:32:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B028972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F90980A5B
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sm9IfKbs7ucB for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 07:31:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3DAB80594
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C3DAB80594
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B02C97FEA2; Thu, 24 Oct 2024 07:31:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 09:28:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 542456cd93da2e3fa9ce4d449096e9b3b814cdfa
X-Git-Newrev: 8cfb215d5543d9ab76b9c16eca62a29168ceb671
X-Patchwork-Hint: ignore
Message-Id: <20241024073112.B02C97FEA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-humanize: use hatch setup
 type
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8cfb215d5543d9ab76b9c16eca62a29168ceb671
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-humanize/python-humanize.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-humanize/python-humanize.mk b/package/python-humanize/python-humanize.mk
index 196645a28f..4915da2cef 100644
--- a/package/python-humanize/python-humanize.mk
+++ b/package/python-humanize/python-humanize.mk
@@ -7,9 +7,9 @@
 PYTHON_HUMANIZE_VERSION = 4.11.0
 PYTHON_HUMANIZE_SOURCE = humanize-$(PYTHON_HUMANIZE_VERSION).tar.gz
 PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/6a/40/64a912b9330786df25e58127194d4a5a7441f818b400b155e748a270f924
-PYTHON_HUMANIZE_SETUP_TYPE = pep517
+PYTHON_HUMANIZE_SETUP_TYPE = hatch
 PYTHON_HUMANIZE_LICENSE = MIT
 PYTHON_HUMANIZE_LICENSE_FILES = LICENCE
-PYTHON_HUMANIZE_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
+PYTHON_HUMANIZE_DEPENDENCIES = host-python-hatch-vcs
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
