Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06761CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA6C683B28;
	Fri, 29 May 2026 08:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atVHgJ7W68GB; Fri, 29 May 2026 08:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2498F83B3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043317;
	bh=mUmI+P3IH6aPQ2XURsWVY6aaiFAYqiiW3u1y4Aw7k+Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fZZM9Dgy8EwPezeo0DRiGlA8384Fn5qcRsJPoMLukJE4kSLdOR15gX77O/ETNVQQQ
	 vs0RTBTEpooxSTpQ71mBPmKFUfv6UNtvgF2AQDQ6fCEArds0hbxBodF2aj7xvYfkLk
	 EvHZ90iL5440wi+CvaPzVCconrHaz9Z89L5HWODiD+WGtQtimxVm2pbPfHAxNu/TaV
	 xbCm3sVQQKSPCdF2D37Wu6C2DCVfymwTs6KyFO9LXMBu63CF8HSUd+6weZVS7hkg0O
	 VcMWCmSRKJbN6Fe5dTcdsP1oq2+q6mnI6VB4xRsyWubxJxCLZMMK3qxunoD72YrzIw
	 a+vAiZpVHo+6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2498F83B3E;
	Fri, 29 May 2026 08:28:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1049F28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D39E16145A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZt63RExncwJ for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F211605C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F211605C4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD6E5873A5; Fri, 29 May 2026 08:27:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:27:03 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 19813205946b4cc768f57baa83bdb5e731cb7bba
X-Git-Newrev: d119b1f979e5c65836388e58ef072e2816d47b19
X-Patchwork-Hint: ignore
Message-Id: <20260529082749.AD6E5873A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] DEVELOPERS: update entry
 for Viacheslav Bocharov
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d119b1f979e5c65836388e58ef072e2816d47b19
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

- Update email address to v@baodeep.com.
- Take over maintainership of package/amlogic-boot-fip.

Signed-off-by: Viacheslav Bocharov <v@baodeep.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9d4d79f9aebd7974ecab60c9c335190ef974aece)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 214b4ff749..d4ea830652 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3329,7 +3329,8 @@ F:	package/llvm-project/llvm/
 N:	Vanya Sergeev <vsergeev@gmail.com>
 F:	package/lua-periphery/
 
-N:	Viacheslav Bocharov <adeep@lexina.in>
+N:	Viacheslav Bocharov <v@baodeep.com>
+F:	package/amlogic-boot-fip/
 F:	package/rtl8822cs/
 
 N:	Victor Huesca <victor.huesca@bootlin.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
