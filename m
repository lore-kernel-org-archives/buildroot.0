Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AB5D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DF8B412AC;
	Wed,  7 Jan 2026 18:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id td2-FxRj0whu; Wed,  7 Jan 2026 18:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4C2D412C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808899;
	bh=3b3Dvk+McqxYplAV0ZJBHuc31tm2WCM5CIJwDqgNrUQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Rd2QdEwGuQQhZx9dJfzdJ21zzsYnkg2wt5zBVpO+UQq4tG67EPpVqTDV5rMsS2L/s
	 HRumK3GbjczntJuWrqFubaS7kD6FQutK5Kuv4LuNtfN8JuzveMOodjMi9FJrEHbkFI
	 pWDUxHO0RqjkTQGoOYF+g5iS5+lhn/fPxQGpU9lJGsBVVE2lVJX5QwvXVN4yPFYow0
	 BCgJPA3a7QCYJnTYLzpStgrkY9Ogaj8n0v8UvH7SPhWbh+Js/hd0CjTP8ySG+L2qkY
	 JXMmh7nMdpSXP6WdYS73BS0FjhRoRw31FFtD15h5BfHrGOJrWijlD14sfnUQ/4Fk0h
	 TE0pWk/XmAnEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4C2D412C0;
	Wed,  7 Jan 2026 18:01:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EAF325B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 584BE40A24
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fq0q5GC_ihMI for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E071408AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E071408AA
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B32F87C86; Wed,  7 Jan 2026 18:01:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:35:18 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 60d6b2a58c1100a02f1d9ee29276b3c3ba3d7864
X-Git-Newrev: 2853c71b319ad68082e2bdd4c38034faf1de0a9c
X-Patchwork-Hint: ignore
Message-Id: <20260107180111.8B32F87C86@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] DEVELOPERS: add Giulio
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

commit: https://git.buildroot.net/buildroot/commit/?id=2853c71b319ad68082e2bdd4c38034faf1de0a9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e9786cbb7b50302ae071a83ffaa18958c092290f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5c9eb94f56..d8e7f43a16 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1301,6 +1301,7 @@ F:	package/liblo/
 F:	package/libnspr/
 F:	package/libnss/
 F:	package/libnvme/
+F:	package/libtirpc/
 F:	package/libtraceevent/
 F:	package/libtracefs
 F:	package/linux-tools/linux-tool-rtla.mk.in
@@ -1313,6 +1314,7 @@ F:	package/python-libconf/
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
