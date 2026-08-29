Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFCBC61DD6
	for <buildroot@archiver.kernel.org>; Sat, 29 Aug 2026 21:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B151D605E9;
	Sat, 29 Aug 2026 21:20:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WtMZ-lgvIBT3; Sat, 29 Aug 2026 21:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788038427;
	bh=OtU3crNffrYtO97egVTlMQyplg/NjKVlAd8n/GEaKBU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n5h+7i6Ijve3W37SfYET+311DcaKCHqDTVnW6Ylut9FQy4ZVYnY5kXnyYXgrrC260
	 XRBaSIawfdG75lfml0ROW/9s9rKMc7J4h2plQIG8JUHKUAyP+LMqVIs9BqiU+A8CsC
	 6aGVDtnMQzlCRqg8R1QuLXrMBq6TQE4WtLpcWDotp4czwbhJ5E8lt99NUb03lQrbBe
	 ym7ZwSW+kFB8Z2Ps17MQaehuUXas9r7fjNZrWdILD6b+Z+46G9wHgEJqEtAQ6x2GPL
	 S4fWT2T0/W4C1hfztC7wYUCobscZgoJHne0mf1WRtfzS/YrwIXVcIghVbl0BG9Gcjf
	 EST++3ETQVKkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA888605EE;
	Sat, 29 Aug 2026 21:20:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 93D2D9D4
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85F8F4008C
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zYYM265YQYVh for <buildroot@buildroot.org>;
 Sat, 29 Aug 2026 21:20:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F166840057
 for <buildroot@buildroot.org>; Sat, 29 Aug 2026 21:20:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 418E18150E; Sat, 29 Aug 2026 21:19:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Aug 2026 23:20:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd5b267b1de0f9e00083ad862cdd5b11f16f402d
X-Git-Newrev: 59efb9037f6ca57740d7736b4963c0bdabf57703
X-Patchwork-Hint: ignore
Message-Id: <20260829211927.418E18150E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: update intro,
 make gender-neutral
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/59efb9037f6ca57740d7736b4963c0bdabf57703
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Besides just updating a little terminology, remove the awkward
reference to "his" when referring to developers.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/introduction.adoc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/introduction.adoc b/docs/manual/introduction.adoc
index 476aa81edc..1a8cc6d13e 100644
--- a/docs/manual/introduction.adoc
+++ b/docs/manual/introduction.adoc
@@ -16,11 +16,11 @@ filesystem with Buildroot).
 
 Buildroot is useful mainly for people working with embedded systems.
 Embedded systems often use processors that are not the regular x86
-processors everyone is used to having in his PC. They can be PowerPC
-processors, MIPS processors, ARM processors, etc.
+processors developers are used to having in their PCs, including
+ARM (both 32- and 64-bit), MIPS, PowerPC, RISC-V and more.
 
 Buildroot supports numerous processors and their variants; it also
-comes with default configurations for several boards available
+comes with default configurations for hundreds of boards available
 off-the-shelf. Besides this, a number of third-party projects are based on,
 or develop their BSP footnote:[BSP: Board Support Package] or
 SDK footnote:[SDK: Software Development Kit] on top of Buildroot.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
