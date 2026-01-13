Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB98D30CC2
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0562C40C33;
	Tue, 13 Jan 2026 20:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2qEt3VSNN1h; Tue, 13 Jan 2026 20:59:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DC9340C6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337995;
	bh=e51qqmHm9hloZIemXb0VWIJCP7KrK46/E1T2Ch2IfN4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aO42Io7ZRLJviq7NIUkibnOE2AtbojfY0RtSBY4bkZMZEA9VID5Uwu2vFlejnlf3S
	 YeOsHVdKXgIaWtRVuanLY8K259Kz97hKrnIZbTWv/ySh/AGcq3aRaHnW5RpwK8EGPX
	 GsN5BzI3xIvjaGef1zfKXi3Vva2H+wTeOepVX74vt2eOuN80vF7inJdrwgxp7g4bxj
	 T46bw4MDe0ivNoxyCbC/BhgbQXRbhIvJEUM0dif5R7bwGSXEKqvQ7HzxBxOrC0RmB3
	 KISVxmM4MtLe+lJMmT1UN0eGEq1qFCHWY/dn4fHym2jRzdCm8Rx2WYzFu2HfwXIuFr
	 zYAY5HDBFjNNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DC9340C6A;
	Tue, 13 Jan 2026 20:59:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0E11231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CE5040730
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqkrz-Dhx5Pm for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE495407B3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE495407B3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCC6181382; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ddff52556103046cfcae4eb5dcb8eb99f8bddd84
X-Git-Newrev: c476184155d6729df579b8ae081a737a9b489a87
X-Patchwork-Hint: ignore
Message-Id: <20260113205848.CCC6181382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xinput-calibrator: use
 tarball hashes provided by upstream
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c476184155d6729df579b8ae081a737a9b489a87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
index a55b9b8c6e..0ad13a4c45 100644
--- a/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
+++ b/package/x11r7/xapp_xinput-calibrator/xapp_xinput-calibrator.hash
@@ -1,3 +1,5 @@
-# locally computed
+# From https://lists.x.org/archives/xorg-announce/2024-July/003522.html
 sha256  0508bf9705c0945f746b8c81bfc8d583a347dd067b58fa76b1aed4225e4b8b40  xinput_calibrator-0.8.0.tar.xz
+sha512  38a06c1c181fb4e7c2a9fe6c9df47536065213bb177e74fb864b2aa62f7851c7bbc825771fc53725b6705d2c7b42ca01ae3c084b3229961aeee1c76bb86c6754  xinput_calibrator-0.8.0.tar.xz
+# locally computed
 sha256  ba6f260bba7d9640cfedfde3a6ae1790583ab8b9ee7c547233ecc0a214d1a6d3  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
