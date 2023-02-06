Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E46C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E272E4EF83;
	Tue, 21 Feb 2023 00:12:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E272E4EF83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hQlyDbLJJLnK; Tue, 21 Feb 2023 00:12:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDA944F103;
	Tue, 21 Feb 2023 00:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDA944F103
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C9BEA1BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8B40417BD
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8B40417BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3lCZ7Lt4T45D for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E77E941788
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E77E941788
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5CED8648F; Mon, 20 Feb 2023 20:52:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 12:36:56 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6ddc29708d3c82f2f6055b596e484a6d963a6eae
X-Git-Newrev: d3cab8f29eb9c7e573099a4a0e45f251e4f15f97
X-Patchwork-Hint: ignore
Message-Id: <20230220205248.D5CED8648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/Config.in.host: fix
 missing double-quote
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

commit: https://git.buildroot.net/buildroot/commit/?id=d3cab8f29eb9c7e573099a4a0e45f251e4f15f97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit c96b2b21f7ae (package/python-iniparse: add host-python-iniparse)
missed that.

Reported-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Config.in.host b/package/Config.in.host
index 8d28f426d1..dcadbfdfc1 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -78,7 +78,7 @@ menu "Host utilities"
 	source "package/pwgen/Config.in.host"
 	source "package/python-cython/Config.in.host"
 	source "package/python-greenlet/Config.in.host"
-	source "package/python-iniparse/Config.in.host
+	source "package/python-iniparse/Config.in.host"
 	source "package/python-kflash/Config.in.host"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-pyyaml/Config.in.host"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
