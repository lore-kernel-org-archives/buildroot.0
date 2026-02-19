Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1107CE9A048
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 13:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D86E382348;
	Thu, 19 Feb 2026 13:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QiS01e0DT41q; Thu, 19 Feb 2026 13:43:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E03B82339
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771508581;
	bh=n1VBww46oJuDZGAZvXzMw4MImlSZGqgIu4qt7XpX33Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rqu0EG+duC0LgbnZaKiiEqK3tuEOP2WMMaqEUGab11Zd/g/YYpKos43lgXGg/t825
	 FFGrPgjbtExj2zBkzNHOe/mME342FTPrr6X/OFsaMkqGtA76P8BsgbrgZm4yPHqTvy
	 7LFB/YMZsU90afJLiPIby74A7saSAreO7m1pEWCaCFC/9Ms7f1des8ViP2CAuqGEZ2
	 kTvXu+0o/B5vYNksonJCkuu7dZgNgc1zmabTm+I4Oqm9kp7XT7S3C30wTCwZrRDmwd
	 hSxBGl61bRUx2eiq75CsOCPeuYoxW7moTTfY32JSnUoFC3RlzGDxkB6gpczu85NuGM
	 rqzcfXLZUds6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E03B82339;
	Thu, 19 Feb 2026 13:43:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A95D41CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AFC060D74
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:42:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qogQ16RI5rKv for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 13:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B638360D6F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B638360D6F
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 13:42:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEC498703D; Thu, 19 Feb 2026 13:42:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 14:41:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d3d55662923f9aa898ac4a2663bdce6cadfd421d
X-Git-Newrev: 575bd0d04d14781c95e9563fac09abe57b3e6d1a
X-Patchwork-Hint: ignore
Message-Id: <20260219134258.AEC498703D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jsonschema: bump to version
 4.26.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/575bd0d04d14781c95e9563fac09abe57b3e6d1a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes here:
https://github.com/python-jsonschema/jsonschema/blob/main/CHANGELOG.rst/\#v4260

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-jsonschema/python-jsonschema.hash | 4 ++--
 package/python-jsonschema/python-jsonschema.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-jsonschema/python-jsonschema.hash b/package/python-jsonschema/python-jsonschema.hash
index d35f8c383c..30a65afdb3 100644
--- a/package/python-jsonschema/python-jsonschema.hash
+++ b/package/python-jsonschema/python-jsonschema.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jsonschema/json
-md5  e33f133a5b56b9f9756b38065849c86f  jsonschema-4.25.1.tar.gz
-sha256  e4a9655ce0da0c0b67a085847e00a3a51449e1157f4f75e9fb5aa545e122eb85  jsonschema-4.25.1.tar.gz
+md5  3c1deb667257ae19924dede13332d906  jsonschema-4.26.0.tar.gz
+sha256  0c26707e2efad8aa1bfc5b7ce170f3fccc2e4918ff85989ba9ffa9facb2be326  jsonschema-4.26.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4f92a015a13c4d1a040bef018aa13430b4f1bc73b41b16bb846c346766de7439  COPYING
 sha256  837402bd25fad9b704265801ca3f92566a98157c1f9a7acd6f446299ba1c305a  json/LICENSE
diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 1407a414e0..4f245f2431 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JSONSCHEMA_VERSION = 4.25.1
+PYTHON_JSONSCHEMA_VERSION = 4.26.0
 PYTHON_JSONSCHEMA_SOURCE = jsonschema-$(PYTHON_JSONSCHEMA_VERSION).tar.gz
-PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/74/69/f7185de793a29082a9f3c7728268ffb31cb5095131a9c139a74078e27336
+PYTHON_JSONSCHEMA_SITE = https://files.pythonhosted.org/packages/b3/fc/e067678238fa451312d4c62bf6e6cf5ec56375422aee02f9cb5f909b3047
 PYTHON_JSONSCHEMA_SETUP_TYPE = hatch
 PYTHON_JSONSCHEMA_LICENSE = MIT
 PYTHON_JSONSCHEMA_LICENSE_FILES = COPYING json/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
