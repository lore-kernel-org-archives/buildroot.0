Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501CCD0BB6C
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 07:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 153B78088F;
	Thu, 24 Oct 2024 07:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IAHoHm9n2Oeq; Thu, 24 Oct 2024 07:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1562080893
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1562080893;
	Thu, 24 Oct 2024 07:31:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02C71972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1728480841
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCqa-um7Iuxq for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 07:31:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B70B18055A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B70B18055A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B386F822A0; Thu, 24 Oct 2024 07:31:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 09:27:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27af91823e3213d6a03029b1d8cba5b28f421654
X-Git-Newrev: d4791c1757dd7cc2f1d463891d96c95dc4d4f0a1
X-Patchwork-Hint: ignore
Message-Id: <20241024073110.B386F822A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jsonschema: use hatch setup
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4791c1757dd7cc2f1d463891d96c95dc4d4f0a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jsonschema/python-jsonschema.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 21e4adab48..9f99628b5d 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -7,16 +7,14 @@
 PYTHON_JSONSCHEMA_VERSION = 4.23.0
 PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
 PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/38/2e/03362ee4034a4c917f697890ccd4aec0800ccf9ded7f511971c75451deec
-PYTHON_JSONSCHEMA_SETUP_TYPE = pep517
+PYTHON_JSONSCHEMA_SETUP_TYPE = hatch
 PYTHON_JSONSCHEMA_LICENSE = MIT
 PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING json/LICENSE
 PYTHON_JSONSCHEMA_DEPENDENCIES = \
-	host-python-hatchling \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
 HOST_PYTHON_JSONSCHEMA_DEPENDENCIES = \
-	host-python-hatchling \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
