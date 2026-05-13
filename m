Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901E2CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54D306155D;
	Fri, 15 May 2026 13:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qKeWUWyGmQq6; Fri, 15 May 2026 13:30:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CB02615E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851812;
	bh=AFGlSzxdm6cH6S8q7o0dz9eSAqwF2tRruQuTzJLpsxo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e6+2hjPtvdEa2dnyjIpSGhbM/8D4AT4fA/MJVuIp1qAVViaXvK2iwIYZF2y2nRbWu
	 vkox3unMaMUWvD+wHo8j0LeDkKb4cjMPIW1afOMawK/Y3I9uHplFUnWYJwTR0yU/0p
	 FjKMl4Re3vNk10EzEWl+Bu2G9ZpsY3Evz1yLs/rXbK05nbjb/cgEPEpgYGQezWiVZD
	 dbGdSS0judKKEtG3Wj637MKjXBgTrUGgXsOduDiQb5q2/ScwyG1cxF3i+GL6d9cpSi
	 kyH83WP3L7NSYyWeXahA2EAsoJGsZK4CiPuKHziTieAzKzVO+zA4YtPQXmrk2ZVL3s
	 Of6Yq0HCwn3/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CB02615E2;
	Fri, 15 May 2026 13:30:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1013F36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1F5241AB9
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tSMD8mQFlMI for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8676640A78
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8676640A78
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA86986352; Fri, 15 May 2026 13:29:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 13:57:51 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 465f1dced9a19b543a64f7d7da5a376c430cde77
X-Git-Newrev: fc08d9c32c813247d3018778ac457dd16e35d928
X-Patchwork-Hint: ignore
Message-Id: <20260515132948.DA86986352@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] DEVELOPERS: add Giulio
 Benetti to wireshark
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fc08d9c32c813247d3018778ac457dd16e35d928
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d230af8bba84bbff2615fbfe402a30e710c8f535)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 76fbbe04ff..91768e68b1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1328,6 +1328,7 @@ F:	package/udisks/
 F:	package/util-linux/
 F:	package/vim/
 F:	package/wilc-driver/
+F:	package/wireshark/
 F:	package/zlib-ng/
 F:	toolchain/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
