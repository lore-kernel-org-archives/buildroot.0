Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68448D0BB66
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 07:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2878D812CE;
	Thu, 24 Oct 2024 07:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btyKEFksGclg; Thu, 24 Oct 2024 07:31:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3208F812DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3208F812DF;
	Thu, 24 Oct 2024 07:31:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AD92972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00DE540B28
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ac1siXFrIQdB for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 07:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB8B540B07
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB8B540B07
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6CB78648C; Thu, 24 Oct 2024 07:31:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 09:28:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a30aba8e3e9abddd48e526189eabe42b28b9019
X-Git-Newrev: e70dd18d50d997546c31ce53c2a2b1fd796e4429
X-Patchwork-Hint: ignore
Message-Id: <20241024073112.E6CB78648C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wtforms: use hatch setup
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

commit: https://git.buildroot.net/buildroot/commit/?id=e70dd18d50d997546c31ce53c2a2b1fd796e4429
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-wtforms/python-wtforms.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
index 58cd463095..4f020151cd 100644
--- a/package/python-wtforms/python-wtforms.mk
+++ b/package/python-wtforms/python-wtforms.mk
@@ -7,9 +7,9 @@
 PYTHON_WTFORMS_VERSION = 3.1.2
 PYTHON_WTFORMS_SOURCE = wtforms-$(PYTHON_WTFORMS_VERSION).tar.gz
 PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/6a/c7/96d10183c3470f1836846f7b9527d6cb0b6c2226ebca40f36fa29f23de60
-PYTHON_WTFORMS_SETUP_TYPE = pep517
+PYTHON_WTFORMS_SETUP_TYPE = hatch
 PYTHON_WTFORMS_LICENSE = BSD-3-Clause
 PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst docs/license.rst
-PYTHON_WTFORMS_DEPENDENCIES = host-python-babel host-python-hatchling
+PYTHON_WTFORMS_DEPENDENCIES = host-python-babel
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
