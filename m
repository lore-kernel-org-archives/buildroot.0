Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B29D0BB6B
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 07:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3858A60856;
	Thu, 24 Oct 2024 07:31:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ub6iqJsQxC7O; Thu, 24 Oct 2024 07:31:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B916608B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B916608B8;
	Thu, 24 Oct 2024 07:31:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0769427ED
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC28440A60
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3LHjeg-cQ9Ln for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 07:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2D7840132
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2D7840132
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF9A081152; Thu, 24 Oct 2024 07:31:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 09:27:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4791c1757dd7cc2f1d463891d96c95dc4d4f0a1
X-Git-Newrev: 361f77eebed48dd6715952aa88829c4362144a7d
X-Patchwork-Hint: ignore
Message-Id: <20241024073110.CF9A081152@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-service-identity: use hatch
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

commit: https://git.buildroot.net/buildroot/commit/?id=361f77eebed48dd6715952aa88829c4362144a7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-service-identity/python-service-identity.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
index 4092461634..3c04a9d4c6 100644
--- a/package/python-service-identity/python-service-identity.mk
+++ b/package/python-service-identity/python-service-identity.mk
@@ -9,9 +9,8 @@ PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERS
 PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/38/d2/2ac20fd05f1b6fce31986536da4caeac51ed2e1bb25d4a7d73ca4eccdfab
 PYTHON_SERVICE_IDENTITY_LICENSE = MIT
 PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
-PYTHON_SERVICE_IDENTITY_SETUP_TYPE = pep517
+PYTHON_SERVICE_IDENTITY_SETUP_TYPE = hatch
 PYTHON_SERVICE_IDENTITY_DEPENDENCIES = \
-	host-python-hatchling \
 	host-python-hatch-vcs \
 	host-python-hatch-fancy-pypi-readme
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
