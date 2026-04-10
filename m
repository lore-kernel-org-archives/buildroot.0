Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A26F9D0DD
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D5D442B37;
	Tue, 14 Apr 2026 15:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A3NV3MHc5Zzp; Tue, 14 Apr 2026 15:42:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D8D242B2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181372;
	bh=IZiqzOn//lCDk0vFcbkT0k5mRzYsFqHI4qffTMWjIG8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qweZ+a0WFJW2G3CBKm44n1pePAMbaTR2N2qL3MugnT1bpYQSEGiGUyExuOlmQv6SU
	 mOb7A0MRTReM4d/hA7TNyzeUabCw7NrFc1Goc0HGIbBGAYqXuFyTBJcS0OwWLKMmL2
	 l/S2A3PRbSu6LXcjoNR7pzxDOvxUCQAJl4lIBdf89d4pGXwC7OZIEY9p/ryCLfd+ue
	 2FZk7RlmJssFLonUCO3LYSk5HOjUCL/X13SHM8pt9WPmgssdIygToQ3223oWduUo/n
	 s/VyP8lBoY1N1cdO/z1UPb90lRHtZE5JgnPOpLiEcpsCPcvwAXFLbHrEYacZfH9pM3
	 Plc+at8JfnhvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D8D242B2C;
	Tue, 14 Apr 2026 15:42:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 920AE237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2147840078
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h77OX1zhCqWl for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C135D40456
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C135D40456
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63A81814A5; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 14:09:40 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d8f459d4c2d01763f75ee7ca684d7904f58827d4
X-Git-Newrev: d617c1bee9e173cf2db9251c75c5b137b9746ef1
X-Patchwork-Hint: ignore
Message-Id: <20260414154237.63A81814A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/luvi: update help
 text
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d617c1bee9e173cf2db9251c75c5b137b9746ef1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Buildroot commit 00317f0aff243986983650671fd220ab040af50f switched the
package from pcre to pcre2 but forgot update the Kconfig help text.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 60a95e04d434ff31366a987df0e635fbd9400876)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/luvi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luvi/Config.in b/package/luvi/Config.in
index 19d3307f12..04163141b0 100644
--- a/package/luvi/Config.in
+++ b/package/luvi/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_LUVI
 	  The luvi core can be extended with several Lua modules by
 	  adding its bundled Lua binding libraries.
 	  To get the Lua module...
-	    * 'rex' select PCRE (BR2_PACKAGE_PCRE)
+	    * 'rex' select PCRE2 (BR2_PACKAGE_PCRE2)
 	    * 'ssl' select OpenSSL (BR2_PACKAGE_OPENSSL)
 	    * 'zlib' select zlib (BR2_PACKAGE_ZLIB)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
