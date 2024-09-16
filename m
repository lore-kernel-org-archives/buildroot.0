Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ED7C3ABCE
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 11:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC99240B2A;
	Mon, 16 Sep 2024 11:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nyMbZSsPHcJE; Mon, 16 Sep 2024 11:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4A7740488
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4A7740488;
	Mon, 16 Sep 2024 11:34:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19FC31BF3AD
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0894D60A6E
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:34:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hIzFNfZ1AuGw for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 11:34:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47E65606E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47E65606E0
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 11:34:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31426838E3; Mon, 16 Sep 2024 11:34:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 13:32:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2223d81bd8f80e814c97623b9d5a2e851367244f
X-Git-Newrev: 095cdb5fcd947592a726dc0a82efd4bd2fb2004f
X-Patchwork-Hint: ignore
Message-Id: <20240916113434.31426838E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sdbus-networkmanager: fix
 help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=095cdb5fcd947592a726dc0a82efd4bd2fb2004f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixing the wording was missed when applying; fix it now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-sdbus-networkmanager/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-sdbus-networkmanager/Config.in b/package/python-sdbus-networkmanager/Config.in
index a1e0133c94..5529dcb578 100644
--- a/package/python-sdbus-networkmanager/Config.in
+++ b/package/python-sdbus-networkmanager/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PYTHON_SDBUS_NETWORKMANAGER
 	depends on BR2_PACKAGE_NETWORK_MANAGER # runtime
 	select BR2_PACKAGE_PYTHON_SDBUS # runtime
 	help
-	  NetworkManager binds for sdbus.
+	  NetworkManager bindings for sdbus.
 
 	  https://github.com/igo95862/python-sdbus
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
