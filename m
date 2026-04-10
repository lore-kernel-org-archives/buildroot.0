Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4A2F9D0D6
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C8DE42B0E;
	Tue, 14 Apr 2026 15:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P9Gfi533ipkk; Tue, 14 Apr 2026 15:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8244942B50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181771;
	bh=/agm0UwmbpZ3xaJO+uHHqjtyAcgTDtEmDzGVQYyN4CI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WNza3lAHupzv/7B/UEBtsVwGR//7FL6Q3L16GmTnrOJfJuON89G88qHGK9yVwpMdf
	 fTlAUgclpACloNUATIcfmvB1BBKkJOK0c0Don0b443WPMkDKbEOss9bHh1wZNEcUmn
	 MrwjbnbcHCe3ZfhtJzorPezkMh2bW1rpN9EJc1alztb4BxBkzJDIbyWVANMFOcuHZH
	 4tmMizB/vGYJAhrOwGQ/t/lZob3D6G+u5OTKHezVtVpI94C8o8yHNcNFNUfTCLzCFK
	 Yj1Yw8UXmssxfqPAnoHo7mlzs6CRiNwbGc8eVwGa2XSBt/MCTGYNNCzTSmsMwbXZBg
	 K7M2pImk+KuAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8244942B50;
	Tue, 14 Apr 2026 15:49:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA9A5283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC80D84D4B
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OqVOaG-BZRj3 for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:49:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C03984D46
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C03984D46
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:49:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C298381514; Tue, 14 Apr 2026 15:49:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 14:09:43 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: cb34aef3f8e16684cfccda1a4d8aca130f5aceb8
X-Git-Newrev: 874aae2bec66276e83665eadc1c9dcae8e21f950
X-Patchwork-Hint: ignore
Message-Id: <20260414154926.C298381514@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/luvi: update help
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/874aae2bec66276e83665eadc1c9dcae8e21f950
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
