Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16272D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5C7541570;
	Wed,  7 Jan 2026 18:03:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSVH_OBDHWsf; Wed,  7 Jan 2026 18:03:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14718415D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808994;
	bh=OH6WY9FGtryVXtQxG1NVhopSAUNA0Lv6883IGAbEYVY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hknuWq2KktmyzTMgJCAziGk0qMpZvIiMEyes1ES8jHoooUjlSDVcfHxDDN3mzo+IR
	 pOMXeGpOIeYY6ONACVoL0huOko0sQi7nQ4par3BTvZARbLDSfX6jr3VQUIhFUcL+Gl
	 MWBt6JZJ6gwytZDnQ7dELuklu8Fih3B7JG6Fx4g9XHphi14W5XEvLWZunb1oxpkmjn
	 /g1JGHWTzRndliNQrVt47sLl3453buzDmm/Dxcsd7DD4wT3t3vYTOGps7UpjK4fYKJ
	 MvFDwRzKmPR/UNnUjwlWl+vqRmyYoqEovyRrQOSu6uZmVFzv1YxNiWjmrw9bO/pZsd
	 R6oFNjPONXaiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14718415D2;
	Wed,  7 Jan 2026 18:03:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1118AA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EB8C40A00
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbZhoGdbr5U2 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D1AB40A38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D1AB40A38
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BD8A811C5; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:01:46 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: aa066a537f8a8f72aeb49da4cdd71091d84f3213
X-Git-Newrev: dc36ea2088e7034f4e7aed54532bd5a3f26778d7
X-Patchwork-Hint: ignore
Message-Id: <20260107180115.1BD8A811C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] DEVELOPERS: add Bernd
 Kuhls for libid3tag
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc36ea2088e7034f4e7aed54532bd5a3f26778d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 023c735f428e1836587b9370e4c039a70543a9dc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e3896c6278..622f1009b4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -420,6 +420,7 @@ F:	package/libglew/
 F:	package/libglu/
 F:	package/libhdhomerun/
 F:	package/libheif/
+F:	package/libid3tag/
 F:	package/libilbc/
 F:	package/libldns/
 F:	package/libmicrohttpd/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
