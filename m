Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E051FA3751
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEF0040851;
	Fri,  2 Jan 2026 22:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6RrJKUel-kbG; Fri,  2 Jan 2026 22:24:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 729EB4074F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767392670;
	bh=vG3VpGxXu5kZ/JuXg6pNrbkxUt6QK4KWD4yrq2h8Q80=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XdRjPX6wsc5CdKhQUWH+e79YOzePTK9JMMWInlABOlVcQnIaGQpsGA/LRJ3PE5Anh
	 f1iHHWu3Qls6D11J12O9XSh1uBiUDd1mwzV2ujgnmjS+vAW4i30b8yRKFbfWax/z8z
	 X3CXM25fHxnjAxiAzmyMI7vAxkojTyzQ4brPwxLthcxnV+LVgpKoqD5/3YaSClG7HX
	 kpG/Zfgtgjo4r3KRhheTEEsfQw0sIoRUDkGBzt6fixuko0/7ZlqG1FGino9NdnQYZE
	 9draSDl7WAComs0E608pYU6f5krO1YaEpU60lN0rjEPzIqJu1GsRF5aSNm5//KYsVj
	 uiEk998Ai1K3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 729EB4074F;
	Fri,  2 Jan 2026 22:24:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F63619D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3562C608F2
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:24:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0UIJ3kJkeZi for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:24:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56C0F608D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56C0F608D4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:24:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49C5E87FCE; Fri,  2 Jan 2026 22:24:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 23:23:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a972212b43100dadbe9c2337264849f3b51552d
X-Git-Newrev: df13b0f38f40ea5ee1ff297b24f76399e5138b40
X-Patchwork-Hint: ignore
Message-Id: <20260102222428.49C5E87FCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-restool: fix license
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

commit: https://git.buildroot.net/buildroot/commit/?id=df13b0f38f40ea5ee1ff297b24f76399e5138b40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In Buildroot, we don't use the official SPDX code GPL-2.0-or-later,
but GPL-2.0+.

Fixes: 2a972212b43100dadbe9c2337264849f3b51552d package/qoriq-restool: new package
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qoriq-restool/qoriq-restool.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qoriq-restool/qoriq-restool.mk b/package/qoriq-restool/qoriq-restool.mk
index 4dd62a83dd..79e87ef1dd 100644
--- a/package/qoriq-restool/qoriq-restool.mk
+++ b/package/qoriq-restool/qoriq-restool.mk
@@ -6,7 +6,7 @@
 
 QORIQ_RESTOOL_VERSION = lf-6.12.20-2.0.0-3-gb44748e
 QORIQ_RESTOOL_SITE = $(call github,nxp-qoriq,restool,$(QORIQ_RESTOOL_VERSION))
-QORIQ_RESTOOL_LICENSE = BSD-3-Clause or GPL-2.0-or-later
+QORIQ_RESTOOL_LICENSE = BSD-3-Clause or GPL-2.0+
 QORIQ_RESTOOL_LICENSE_FILES = LICENSE
 
 define QORIQ_RESTOOL_BUILD_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
