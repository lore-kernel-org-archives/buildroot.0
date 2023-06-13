Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D62C7EE2E
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 12:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 415A9416EE;
	Tue, 13 Jun 2023 12:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 415A9416EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KzNxRPLgLQ7W; Tue, 13 Jun 2023 12:42:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F24E416D0;
	Tue, 13 Jun 2023 12:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F24E416D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C60E31BF352
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 12:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99722416D0
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 12:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99722416D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o8JTR8JbCtn8 for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 12:42:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D665440BA3
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 12:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D665440BA3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C247C828C5; Tue, 13 Jun 2023 12:42:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 13:53:04 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 7494a4c331569336e1a3e9ca34d97ac31916b127
X-Git-Newrev: 54b9f2e4a39a8dc89a1a9390a86aa3f8f864a057
X-Patchwork-Hint: ignore
Message-Id: <20230613124201.C247C828C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/qemu: do not
 build the guest agent for the host
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

commit: https://git.buildroot.net/buildroot/commit/?id=54b9f2e4a39a8dc89a1a9390a86aa3f8f864a057
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

It does not make sense to build it for the host.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 97064a5eaa5b235ae754dd0abe639d11a8bff0f6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 82858ca6a8..72a0160f86 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -474,6 +474,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-vnc-sasl \
 		--enable-slirp \
 		--enable-tools \
+		--disable-guest-agent \
 		$(HOST_QEMU_OPTS)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
