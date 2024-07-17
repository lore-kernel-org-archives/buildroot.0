Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB25C3DA42
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 07:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A8B04033A;
	Wed, 17 Jul 2024 07:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELJV0mr44ldV; Wed, 17 Jul 2024 07:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A7984035C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A7984035C;
	Wed, 17 Jul 2024 07:22:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A873B1BF39A
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 07:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 943C960817
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 07:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWO_MEVpxhES for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 07:21:59 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 344E8607F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 344E8607F6
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 344E8607F6
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 07:21:58 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id AA1FABDE258B;
 Wed, 17 Jul 2024 09:21:51 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 09:21:20 +0200
Message-ID: <20240717072120.148120-1-br015@umbiko.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.5 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1721200912; bh=3DzLjKwHMAHr4kvWEWB+/CpsgjDhp6fxt/LFOdMoxmw=;
 h=From:To:Cc:Subject:Date;
 b=iaBfpyZlMc+YoZ8YBqQa8qSzp3piv1fFUhcJef+lKSZjcTTQ8F3IEFXPhhCYZNnXZ
 wLD5auhHhu6aIc9eTnNPzueVRF0pa6qKMJs2l1MwgyVJroLDXjg0i2430sjwtRN4cr
 royxpYhHlCMadluROQ+wYYqwk4DcuOE155QiQIPE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=iaBfpyZl
Subject: [Buildroot] [PATCH] package/openssh: fix typo in init script
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
Cc: Fiona Klute <fiona.klute+wiwa@gmx.de>, Andreas Ziegler <br015@umbiko.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that the sshd init script is nice & new & shiny, fix an ancient 
typo, introduced with commit e0fc615 (add runlevel script for later use)

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 package/openssh/S50sshd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index 56db6ebff9..7e5ccf079d 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -6,7 +6,7 @@
 DAEMON="sshd"
 PIDFILE="/var/run/$DAEMON.pid"
 
-# Make sure the ssh-keygen progam exists
+# Make sure the ssh-keygen program exists
 [ -f /usr/bin/ssh-keygen ] || exit 0
 
 umask 077
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
