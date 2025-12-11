Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C83D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EB2541174;
	Thu, 11 Dec 2025 19:30:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uSFjbrTli0Nc; Thu, 11 Dec 2025 19:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 442E141167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481415;
	bh=4bu2Z1LBrt8VjLvhLxW2q8fe43ZwwAGC/v2EUKFpdJQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BUUL8ljyZEJiICuVgImTr4k+Yk47zWTBYF9R4XgEj0QVwWVqrEaLvKVZ8y0Bdfbcj
	 H2BQbKxItvRZo4Iddl2np19/A1R9C9Gr2XsjBb3il3kJX/5cUPZ2MGqPoL0QiKQHnk
	 AWv0TLnpsEpiCkjdt7gIJlhp/6RWb9ygUWdyREoSH16vscDwRykPcbw4dVscQj2+rq
	 f9xSM7aZQr20FHdQNFeIf3Nm18djp3ZsJYCEIGFCqmFcDYFVJa2L6qMLjzgEtRjPQ8
	 PyvbYt2/O9aVYJU66cUDFheAP+rpquQOfScktbDsyQUxBOFh33ZqIOs0DblqE5ha2A
	 aAVUaVOSEPwjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 442E141167;
	Thu, 11 Dec 2025 19:30:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 100722C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29B47410B2
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k2dVpQYoehcA for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B346410D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B346410D7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A6B386BE5; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:56:53 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: f3df43e746ede5688c5bbd58cdd5ba17487ebc39
X-Git-Newrev: dd4c3e26c756742fed20a6b7f10b9274b43182fa
X-Patchwork-Hint: ignore
Message-Id: <20251211192954.8A6B386BE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/libdbi: fix small
 typo in Config.in
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
Content-Type: multipart/mixed; boundary="===============6676637744885029606=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6676637744885029606==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=dd4c3e26c756742fed20a6b7f10b9274b43182fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

When browsing the available Database packages, libdbi appears in the
menuconfig as "lidbi".

Fix the menuconfig entry by updating the relevant boolean name.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4d016a1d98f7cf850ee83d5c2003a2b66c72675b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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

--===============6676637744885029606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6676637744885029606==--
