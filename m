Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A08D59F75
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 22:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 363A0405C5;
	Wed,  6 Nov 2024 22:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fvx9CZhIvIoE; Wed,  6 Nov 2024 22:24:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB8A34054C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB8A34054C;
	Wed,  6 Nov 2024 22:24:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B86DA4C3B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A52C740490
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f866p7oAHXgA for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 22:24:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A893F40452
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A893F40452
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:24:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94A7B85E1B; Wed,  6 Nov 2024 22:24:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Nov 2024 23:22:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 549dde9f1a40200376b72bd7f522bfff885382b4
X-Git-Newrev: 2ab014babb7123e27dc816b6eadcc1686e4459d2
X-Patchwork-Hint: ignore
Message-Id: <20241106222425.94A7B85E1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bleak: use poetry setup type
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ab014babb7123e27dc816b6eadcc1686e4459d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-bleak/python-bleak.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index 5cb42aa2a5..f47440388e 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -7,9 +7,8 @@
 PYTHON_BLEAK_VERSION = 0.22.3
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
 PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/fb/96/15750b50c0018338e2cce30de939130971ebfdf4f9d6d56c960f5657daad
-PYTHON_BLEAK_SETUP_TYPE = pep517
+PYTHON_BLEAK_SETUP_TYPE = poetry
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
-PYTHON_BLEAK_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
