Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C72E6B257
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 22:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E80B60B5F;
	Mon, 22 Dec 2025 22:10:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TyqmfbdTP7I7; Mon, 22 Dec 2025 22:10:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 594D760B1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766441434;
	bh=gCUd+yYXXNx3dxoC16OUV6AaBz74j5QSRfeXdqgaIn8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZSPjmgwI3W1YiPsXnY5pz+6OP6mRIQJdsWZEMQNe9x+4HQw1wKxDgf2cgKODe0jhS
	 qRQRYX1u40vB7OMzYD9bnw6gg7mNAyuGc9BBxxZtYUQu0OUx4d35FfWB8B/4UhBeyn
	 eLUy1+zLaw6FOk3twNe3ZgdoFbwozafYMl00zwxRtXZh6R2PgdhIJRP7x8Rz66VjR1
	 Z/I8S4CFTOZshvpG/wU9jABmiczy2Cr6VOMmRwWfKVBY4FwPmvpItXdi4vfAV6BdYH
	 ku4cRfW/J3Y5VGxoKQkDVgt3RsWr5bFi8DUIi5VVY6GyH8a2KKUlR4z4VgeckC8mFs
	 aI0qsHn7md38A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 594D760B1B;
	Mon, 22 Dec 2025 22:10:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC21B119
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 22:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B290F4089D
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 22:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Is4I8QBfbRcc for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 22:10:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12E1C40899
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12E1C40899
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 22:10:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 037398574E; Mon, 22 Dec 2025 22:10:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Dec 2025 22:56:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 122a0904d7d2dcca8ae60a12fa2cea650cce48e1
X-Git-Newrev: e9786cbb7b50302ae071a83ffaa18958c092290f
X-Patchwork-Hint: ignore
Message-Id: <20251222221032.037398574E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Giulio Benetti to libtirpc
 and rpcbind
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

commit: https://git.buildroot.net/buildroot/commit/?id=e9786cbb7b50302ae071a83ffaa18958c092290f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b27df9beb..32f11d1e66 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1302,6 +1302,7 @@ F:	package/liblo/
 F:	package/libnspr/
 F:	package/libnss/
 F:	package/libnvme/
+F:	package/libtirpc/
 F:	package/libtraceevent/
 F:	package/libtracefs
 F:	package/linux-tools/linux-tool-rtla.mk.in
@@ -1314,6 +1315,7 @@ F:	package/python-libconf/
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
