Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720AFCE7A89
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 05:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E4ED81F20;
	Mon, 25 Sep 2023 05:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E4ED81F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aGNIKP6e5W_j; Mon, 25 Sep 2023 05:42:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67B5D81F28;
	Mon, 25 Sep 2023 05:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67B5D81F28
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B72CA1BF95D
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 05:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8ED3741828
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 05:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8ED3741828
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dlrh6_y5oUw7 for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 05:42:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACBEF416D0
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 05:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACBEF416D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99A9C876D6; Mon, 25 Sep 2023 05:42:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 07:27:42 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: e7213929ba3c349a748d7523d2b6e477197486d7
X-Git-Newrev: a0aad25941796a88fc0d5d98b2294c0c4e98a80b
X-Patchwork-Hint: ignore
Message-Id: <20230925054203.99A9C876D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/petitboot: fix
 HOST_PROG_SHUTDOWN value
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0aad25941796a88fc0d5d98b2294c0c4e98a80b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

HOST_PROG_SHUTDOWN currently references a file that doesn't exist. Fix
by setting it to /usr/libexec/petitboot/bb-kexec-reboot, which this
package already installs but doesn't use.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit ab91ddd8a8ebdc10fa26a6d9541cf5e50e297973)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/petitboot/petitboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 8b4c14207e..8d220f88f4 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -21,7 +21,7 @@ PETITBOOT_CONF_OPTS = \
 	--without-twin-x11 \
 	$(if $(BR2_PACKAGE_BUSYBOX),--enable-busybox,--disable-busybox) \
 	HOST_PROG_KEXEC=/usr/sbin/kexec \
-	HOST_PROG_SHUTDOWN=/usr/sbin/kexec-restart
+	HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot
 
 # HPA and Busybox tftp are supported. HPA tftp is part of Buildroot's tftpd
 # package.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
