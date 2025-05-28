Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75F0C5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 19:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A072540BCD;
	Wed, 28 May 2025 19:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEgQOH9wYL2t; Wed, 28 May 2025 19:53:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A4D040BE0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A4D040BE0;
	Wed, 28 May 2025 19:53:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74580B66
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 662FE60EED
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4mP-mjDLhlu3 for <buildroot@buildroot.org>;
 Wed, 28 May 2025 19:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02B1160EE5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02B1160EE5
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:52:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E525C85D1A; Wed, 28 May 2025 19:52:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 May 2025 21:52:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d93448fe25c622380494b1645f655795bda3279c
X-Git-Newrev: f7d11b87d40057ddd298ee9ac84f7f57fc83107b
X-Patchwork-Hint: ignore
Message-Id: <20250528195251.E525C85D1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-restx: add missing
 depends on
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f7d11b87d40057ddd298ee9ac84f7f57fc83107b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the package was introduced in commit
02de34989560b40a963fa13dddfb4714470fec25, it selects
BR2_PACKAGE_PYTHON_JSONSCHEMA without taking care of its dependencies,
causing the following warning:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_JSONSCHEMA
  Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_FLASK_RESTX [=y] && BR2_PACKAGE_PYTHON3 [=y]

Fix this by adding the missing depends on.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-flask-restx/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-flask-restx/Config.in b/package/python-flask-restx/Config.in
index 4906869a38..ec5b3283bd 100644
--- a/package/python-flask-restx/Config.in
+++ b/package/python-flask-restx/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_RESTX
 	bool "python-flask-restx"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-jsonschema
 	select BR2_PACKAGE_PYTHON_ANISO8601 # runtime
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
