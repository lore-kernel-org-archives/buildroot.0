Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36D6C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 20:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BBF8401A2;
	Mon, 27 Dec 2021 20:20:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jTiKghCbPwsW; Mon, 27 Dec 2021 20:20:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59497401A0;
	Mon, 27 Dec 2021 20:20:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65BC01BF3C6
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6118B401A0
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 20:20:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ShlY8PngSn3F for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 20:20:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99AD24018A
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 20:20:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CA88A82BA3; Mon, 27 Dec 2021 20:14:55 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 21:20:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2979ff04bd7d3a9d38e4150aa158a4486cfb013c
X-Git-Newrev: f647a71c4a7371d83b740f03e498ef31a28a1957
X-Patchwork-Hint: ignore
Message-Id: <20211227201455.CA88A82BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: enable selinux ssh module
 for refpolicy
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f647a71c4a7371d83b740f03e498ef31a28a1957
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is needed for ssh to work with SELinux.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openssh/openssh.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 75c4a0128b..4145bfd8dc 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -27,6 +27,8 @@ OPENSSH_CONF_OPTS = \
 	--disable-wtmpx \
 	--disable-strip
 
+OPENSSH_SELINUX_MODULES = ssh
+
 define OPENSSH_PERMISSIONS
 	/var/empty d 755 root root - - - - -
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
