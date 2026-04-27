Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE67FF8861
	for <buildroot@archiver.kernel.org>; Mon, 27 Apr 2026 10:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 508E742FDC;
	Mon, 27 Apr 2026 10:17:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1UMhLGHBf0xY; Mon, 27 Apr 2026 10:17:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 746C242FDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777285066;
	bh=1lQ3CxQJhtHa7g29FrSDJVMQ+v5u5u/i4EQOAreyshs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VmclB55hbbQSoTebByFT3kYmv11nDJLF6a9cQ0td5yC6CQOpZFrkUGETSUH75csY1
	 8isn+05wyg+QkO4zB0FdVz2ipazm/oap7Q+wxzp121dx6Q8lnsJ9MQWyCjjz29VaZk
	 WStmjjIcPxakl7IEdsprGZ1tdE0XAM4Kp+CQOclA217o6t/yJ3mmQqA4ZAQ9XbWfqj
	 TbwCgBEo/SqkH/PLBctZ04jzz3zvjqPdO4lQXq5iGHI62MvpgIJfaTORfZNLW7sTH2
	 QGhij9DEzq0rYMDEgHr9f8IXS3+MudZOyzDSauxiBnIerDV1c6sWeq2nGkF5ty4O54
	 sCTrhWw221IMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 746C242FDD;
	Mon, 27 Apr 2026 10:17:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 836A61B8
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 10:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74D7E42616
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 10:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iI87n59NQO_q for <buildroot@buildroot.org>;
 Mon, 27 Apr 2026 10:17:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB0A640137
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB0A640137
 for <buildroot@buildroot.org>; Mon, 27 Apr 2026 10:17:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68CE68349D; Mon, 27 Apr 2026 10:17:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 27 Apr 2026 12:16:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 201d6f4937d3b428a7ec858d0cb1cdb7483469f0
X-Git-Newrev: c393060c7e44fab3339d88286d0e407b0bc9b187
X-Patchwork-Hint: ignore
Message-Id: <20260427101743.68CE68349D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: drop obsolete
 dependency on host-intltool
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c393060c7e44fab3339d88286d0e407b0bc9b187
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

NetworkManager stopped requiring intltool with 1.40:
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/56b51b98fbb8627c4c09a483702e18fd8aee7ce1/NEWS#L434

Fixes: e7c20ad548818fad6924f19e31ef2defdc418875

host-gettext is already an indirect dependency via package/libglib2.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
[Marcus: add reference to commit that updated NM to 1.40]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/network-manager/network-manager.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 76f4b09fbe..763caa6754 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -16,7 +16,6 @@ NETWORK_MANAGER_CPE_ID_PRODUCT = networkmanager
 NETWORK_MANAGER_SELINUX_MODULES = networkmanager
 
 NETWORK_MANAGER_DEPENDENCIES = \
-	host-intltool \
 	host-libxslt \
 	host-pkgconf \
 	dbus \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
