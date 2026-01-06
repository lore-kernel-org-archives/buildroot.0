Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CE9D0D145
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 610904092E;
	Wed,  7 Jan 2026 17:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEe5zzJ3CinR; Wed,  7 Jan 2026 17:47:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93BB1409CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808026;
	bh=dwxIALRjZSBJmB0Ti+VTX5i60TE64MxaJOW/9uHxR3Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gQo4QA3UcYJv5aQetPp/Kw2aIDBH96ALXbCWz1VNylJwefro/AoNyyqxjbAVYA4sd
	 juoobH/55nmL94ep6VyeFQwMQi2YWfeuK9iRc0RSJIbZQTY5cKJV8tR5+ZEVYeaIM4
	 gpq8osMX8zoXOy0/rSXB6Pf0rsnxaQYDIWtSCEhBtfXCRQr/rUQSL40uw1LOarCx7H
	 LmlZtobYCzmuZqeBMkwCA/Px2zrikJrI4Z4/VHW4p91TihjrxKeHxntXYV0+Yz8i6J
	 k4P11NeI17AUIlLaqavscWn9rFPGtC2UxLtl0Tdf2xvp0XcIOjOCAPwmdUevkA9gbo
	 DHZwE/LPsRR0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93BB1409CE;
	Wed,  7 Jan 2026 17:47:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E64E25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 260EE80B10
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 47sdSw8bbQgh for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D81780ABB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D81780ABB
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C6F588367; Wed,  7 Jan 2026 17:46:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:17:08 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0955700ceb031bafb223e813b85d4ebeaebfb999
X-Git-Newrev: 50fafbfadebec7d6ba7e7c1edf4792d975fee459
X-Patchwork-Hint: ignore
Message-Id: <20260107174641.0C6F588367@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: add Giulio
 Benetti to libtirpc and rpcbind
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

commit: https://git.buildroot.net/buildroot/commit/?id=50fafbfadebec7d6ba7e7c1edf4792d975fee459
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e9786cbb7b50302ae071a83ffaa18958c092290f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 303280ed69..14d051e45d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1278,6 +1278,7 @@ F:	package/liblo/
 F:	package/libnspr/
 F:	package/libnss/
 F:	package/libnvme/
+F:	package/libtirpc/
 F:	package/libtraceevent/
 F:	package/libtracefs
 F:	package/linux-tools/linux-tool-rtla.mk.in
@@ -1290,6 +1291,7 @@ F:	package/python-libconf/
 F:	package/python-uvloop/
 F:	package/qt5/
 F:	package/rockchip-mali/
+F:	package/rpcbind/
 F:	package/rtl8188eu/
 F:	package/rtl8189es/
 F:	package/rtl8192eu/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
