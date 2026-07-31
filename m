Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AA7C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6259F60B35;
	Fri, 31 Jul 2026 12:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vXax1IIGqP8c; Fri, 31 Jul 2026 12:20:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10C7960AFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500448;
	bh=PpT+rKAOnj0bh32/LlKyBu4FP9B0zphDvOGLfrhFJG8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Rt7i7vnwW0b/xUVZspbuOqyvT2ixcpds+YnCOT47i+ywIVRZm7Y6mQMod775+WPzH
	 fNBiHZ3AszlV9J4ThH2EuwJ+jk9WfTUqtT1pxo7+kcE/PMUHxhOnkPqng7NPfU+vV4
	 bN5fc+03SpInzhP5IAoT+0eO1E2xVG7WBGhPPb7TcH13vjL0362ncuXAh5XlVasHU5
	 Gw5MmXZzhHg8oGs5AASZ5qVwTrdoO+/CcZ4TSvnne327lbj8HKHBszy7j8eI2qxh0Z
	 d66Lr+auvDFGnlQBOiifaaFLZi6Jn7JCgIeKIK3ZaMhRbdyS6nGyC9T85/mrbeyL7M
	 vWaBWlFMnL/eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10C7960AFF;
	Fri, 31 Jul 2026 12:20:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1160236E
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0286E40467
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XpmZOSrhkznc for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:20:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1DD6400DA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1DD6400DA
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:20:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A09BB8B742; Fri, 31 Jul 2026 12:20:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:11:19 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: df6a62e1692f9e27e7a1002fd05543da38d00978
X-Git-Newrev: 8b5c95e5a245e49bbdb47fc1423d5a50024e3e83
X-Patchwork-Hint: ignore
Message-Id: <20260731122002.A09BB8B742@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] DEVELOPERS: add Yann E.
 MORIN (Orange) for docker credential helpers
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b5c95e5a245e49bbdb47fc1423d5a50024e3e83
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1b9fd8fd9b2984aebd0a51c39d2071c247d79d07)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c9df146712..db9e16c444 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3472,6 +3472,9 @@ F:	package/tpm2-pkcs11/
 
 N:	Yann E. MORIN <yann.morin@orange.com>
 F:	.editorconfig
+F:	package/amazon-ecr-credential-helper/
+F:	package/docker-credential-acr-env/
+F:	package/docker-credential-gcr/
 F:	package/gpsd/
 F:	package/mosquitto/
 F:	package/python-humanfriendly/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
