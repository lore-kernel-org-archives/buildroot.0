Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B754CC02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 17:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58EDE4148C;
	Tue,  4 Feb 2025 17:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_PVwx1s2yxc; Tue,  4 Feb 2025 17:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4B5041457
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4B5041457;
	Tue,  4 Feb 2025 17:45:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5713412A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 471246067E
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jNhrXLijCs5a for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 17:45:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A69A605BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A69A605BB
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 17:45:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BBF286E53; Tue,  4 Feb 2025 17:45:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 18:44:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 747c3ae005cf8e12eb23025db7362426f5ab595d
X-Git-Newrev: fc503c2c47a94281f007ee66284075b039fa75e6
X-Patchwork-Hint: ignore
Message-Id: <20250204174516.3BBF286E53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiomqtt: use poetry setup
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fc503c2c47a94281f007ee66284075b039fa75e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Aiomqtt uses Poetry. The only difference between poetry and generic
pep517 is the host-python-poetry-core dependency, and this got pulled in
as an indirect dependency of host-python-poetry-dynamic-versioning so
far. So the build was not actually failing, but it's better to be
correct.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-aiomqtt/python-aiomqtt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-aiomqtt/python-aiomqtt.mk b/package/python-aiomqtt/python-aiomqtt.mk
index 291547f11f..80cecea9e8 100644
--- a/package/python-aiomqtt/python-aiomqtt.mk
+++ b/package/python-aiomqtt/python-aiomqtt.mk
@@ -7,7 +7,7 @@
 PYTHON_AIOMQTT_VERSION = 2.3.0
 PYTHON_AIOMQTT_SOURCE = aiomqtt-$(PYTHON_AIOMQTT_VERSION).tar.gz
 PYTHON_AIOMQTT_SITE = https://files.pythonhosted.org/packages/db/c9/168e78bd35b21d9bdbb26178db33a8f265e4a69bb4193e72434e7cb3d1cd
-PYTHON_AIOMQTT_SETUP_TYPE = pep517
+PYTHON_AIOMQTT_SETUP_TYPE = poetry
 PYTHON_AIOMQTT_LICENSE = BSD-3-Clause
 PYTHON_AIOMQTT_LICENSE_FILES = LICENSE
 PYTHON_AIOMQTT_DEPENDENCIES = host-python-poetry-dynamic-versioning
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
