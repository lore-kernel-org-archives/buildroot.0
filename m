Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140D9D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF0F481E3C;
	Wed,  7 Jan 2026 17:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cgYfVPwQUeKr; Wed,  7 Jan 2026 17:47:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AD3981E42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808065;
	bh=v4H7rpTK5Di68u3lcvnCWUB90p/pB6MxhtGecS//9ek=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C9lxUnWaKYaShviKgZlleWa0Qv6aigFY9b7XQRcnQcB5pYLAaXg+nLHY0/IESoBxE
	 3otOTiXM0/EMe+cfFmbkRO3KhtMRVjvq2hXCEtMYCmckMn/134NSkoFq0qzzXI8rTl
	 SEHp2ju+HRI1ADvndrrX+iKnu/a5u7uUGPn3B6a8b5jbOQUs64CvrwXBgcz7ZP2fUr
	 BpBWgy4w9HznKC4bZ2u7GTNL8VoHGxZaXFvVVfGdDOlef/wke4LgW94H9AjcCBSnE7
	 Nn1MT0ltMU9Cs9hE3zHX0NAk8jRfbInJVVgbc6wjtYT6P432TqrDEWaeLIDY1wuOTi
	 M1/eLWOIoFgGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AD3981E42;
	Wed,  7 Jan 2026 17:47:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BAAD9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D62976087C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OI7O9apabWns for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D40F96087B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D40F96087B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2AA786FC2; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:18:23 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 88198aaecee2ec00e6a08525e6bf6ccf1d5a1971
X-Git-Newrev: c930cb7f0d806b1400251256754f29e1f3618328
X-Patchwork-Hint: ignore
Message-Id: <20260107174642.D2AA786FC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/tio: Config.in:
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

commit: https://git.buildroot.net/buildroot/commit/?id=c930cb7f0d806b1400251256754f29e1f3618328
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
