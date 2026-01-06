Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62182D0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3032440DED;
	Wed,  7 Jan 2026 18:01:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1_m1vw0uZbE; Wed,  7 Jan 2026 18:01:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 411AE412F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808912;
	bh=9He+HcO2cliohvObipJZjS4IbjnUtjLwNY20nLpw+cQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rhpGro+HWJY+n9+Jrhii2B04KrgZbCx3nmh6NU7fu9wrXBbOgMMWqzMilAbDWbZ9O
	 cVMRsWDyENiO0sznLukG+1IMVHRQLb+ltue+lE5d3lEFe6q1hZZaVH+xCM0fvabnLR
	 MwriUT83ttcasdvagI3kU9V4yLyeAMssNGmTKQT2qPhPkU/Yf2CyEY2lGe5zP1JsWL
	 AJifSIklj5Kh0gsOW3dkGj0xcvQCJUse8K4kwKoBlBQLIlwupu0HC57thJuV9v4Rh2
	 JfO/k47qKk9LnGqP2Z5jTp+oVbq7jdZjCnT8kG6upr5aKTBMM2JwdmJQ8TqULsTMsU
	 RZuS/08OjBWyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 411AE412F5;
	Wed,  7 Jan 2026 18:01:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E49225B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA9906085F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLWC3ubZX152 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1414360643
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1414360643
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 139DE875A1; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:57:53 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: ac7842ab6bcaf0346a9e2dfead5bdcf91bc9e1f9
X-Git-Newrev: ca558fb399b10a14c1295589d6c2e85fb364a86c
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.139DE875A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/tio: Config.in:
 add missing selection of libglib2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca558fb399b10a14c1295589d6c2e85fb364a86c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Buildroot commit [1] (package/tio: bump to 3.5) added the libglib2 in
the .mk file without selecting it in Config.in.

This commit fixes that.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/3d85e9df431af790930e03d860bfa098108888a0

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5a40d54cc330e2f10b3fb7d5f7dfdf66e0083d00)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/tio/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tio/Config.in b/package/tio/Config.in
index 953b26a349..ef9a129e73 100644
--- a/package/tio/Config.in
+++ b/package/tio/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_TIO
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on !BR2_PACKAGE_LUAJIT
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  "tio" is a simple TTY terminal application which features a
 	  straightforward commandline interface to easily connect to
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
