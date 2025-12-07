Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0F2D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62F2560D80;
	Sun,  7 Dec 2025 17:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b87fU8iCErFW; Sun,  7 Dec 2025 17:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A3E2607A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765128948;
	bh=VlkjcTTNf/tvPf4G5JDsYDdFhk8CJ+un4FRcT2SCisE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Tq8+4QnDM1omObKGBpvkNCpU9Tr3xFUfBlodptrnNfJv6tZnsxL+I+g45jKhQ37cZ
	 xqDpc0sF4NcLw0xpWgU8Tv7D3LMP2J63z/22rSCxJgdZhz6FMZe1W/EWotqvRc0lLB
	 xsBB7Y3+cjn81KSd9UTq5UJmlixHEeBgwS+wvrvkQrLGNChD1azhwxn7xetfMnjYS2
	 1BIjFv67TIaJ+QgHa+/PrLotMBb3q0mBDaIh90Sm2pg/0bGi1lpV2KeDWn8EBseXHc
	 CJjLwpQg/uFFejhe/14yCHQNUNhJLNjbpr7IcpZ4IMwuQEavxVqTBjv8Fg0MxDx5M0
	 JiQUCx++Eh+oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A3E2607A2;
	Sun,  7 Dec 2025 17:35:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57395E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E342406F9
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ViQ4R62nI6D for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:35:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A37F406CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A37F406CD
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:35:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 835508680A; Sun,  7 Dec 2025 17:35:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 18:32:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b04688e7f7283d0f8c88987ff0819c1a0bb1650
X-Git-Newrev: 4d016a1d98f7cf850ee83d5c2003a2b66c72675b
X-Patchwork-Hint: ignore
Message-Id: <20251207173546.835508680A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdbi: fix small typo in Config.in
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0901790675680106628=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0901790675680106628==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4d016a1d98f7cf850ee83d5c2003a2b66c72675b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When browsing the available Database packages, libdbi appears in the
menuconfig as "lidbi".

Fix the menuconfig entry by updating the relevant boolean name.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdbi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdbi/Config.in b/package/libdbi/Config.in
index 13ac344f82..d9a1316311 100644
--- a/package/libdbi/Config.in
+++ b/package/libdbi/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_LIBDBI
-	bool "lidbi"
+	bool "libdbi"
 	depends on !BR2_STATIC_LIBS
 	help
 	  libdbi implements a database-independent abstraction layer

--===============0901790675680106628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0901790675680106628==--
