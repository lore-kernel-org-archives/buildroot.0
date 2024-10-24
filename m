Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0193ED0BB6A
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 07:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC2A4812C1;
	Thu, 24 Oct 2024 07:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJEO1VMRV6QO; Thu, 24 Oct 2024 07:32:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C872181327
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C872181327;
	Thu, 24 Oct 2024 07:32:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1792C972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFEE480838
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SbwhiPWBGSl3 for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 07:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0214A809D3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0214A809D3
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1B0585C78; Thu, 24 Oct 2024 07:31:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 09:28:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e70dd18d50d997546c31ce53c2a2b1fd796e4429
X-Git-Newrev: 23c9648fd15762136518572bb9e41d85785e80a1
X-Patchwork-Hint: ignore
Message-Id: <20241024073112.F1B0585C78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-annotated-types: use hatch
 setup type
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

commit: https://git.buildroot.net/buildroot/commit/?id=23c9648fd15762136518572bb9e41d85785e80a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-annotated-types/python-annotated-types.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-annotated-types/python-annotated-types.mk b/package/python-annotated-types/python-annotated-types.mk
index e7a3b7e64b..b962c1a07d 100644
--- a/package/python-annotated-types/python-annotated-types.mk
+++ b/package/python-annotated-types/python-annotated-types.mk
@@ -7,9 +7,8 @@
 PYTHON_ANNOTATED_TYPES_VERSION = 0.7.0
 PYTHON_ANNOTATED_TYPES_SOURCE = annotated_types-$(PYTHON_ANNOTATED_TYPES_VERSION).tar.gz
 PYTHON_ANNOTATED_TYPES_SITE = https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5
-PYTHON_ANNOTATED_TYPES_SETUP_TYPE = pep517
+PYTHON_ANNOTATED_TYPES_SETUP_TYPE = hatch
 PYTHON_ANNOTATED_TYPES_LICENSE = MIT
 PYTHON_ANNOTATED_TYPES_LICENSE_FILES = LICENSE
-PYTHON_ANNOTATED_TYPES_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
