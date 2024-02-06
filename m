Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B18C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 08:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AD3A41E0F;
	Tue,  6 Feb 2024 08:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AD3A41E0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lEx-Rn69EOrT; Tue,  6 Feb 2024 08:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BD8141E0D;
	Tue,  6 Feb 2024 08:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BD8141E0D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0A7461BF2BC
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 08:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3EE5408B0
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 08:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3EE5408B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LU3DWWB8yvzF for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 08:15:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD9FC403E2
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 08:15:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD9FC403E2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A810886ED7; Tue,  6 Feb 2024 08:15:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 09:13:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4adc8b3d24708f180bcbf68df1d0723dc058f68e
X-Git-Newrev: 0ccf4048e43b022feba225b976e55ed3e503d424
X-Patchwork-Hint: ignore
Message-Id: <20240206081556.A810886ED7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-http: set CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ccf4048e43b022feba225b976e55ed3e503d424
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:daurnimator:lua-http is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/F210C8BC-78BB-4D10-BAB7-AC624543764E

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lua-http/lua-http.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lua-http/lua-http.mk b/package/lua-http/lua-http.mk
index 7fbb09038e..df3e2c0059 100644
--- a/package/lua-http/lua-http.mk
+++ b/package/lua-http/lua-http.mk
@@ -10,5 +10,7 @@ LUA_HTTP_NAME_UPSTREAM = http
 LUA_HTTP_SUBDIR = lua-http-$(LUA_HTTP_VERSION_UPSTREAM)
 LUA_HTTP_LICENSE = MIT
 LUA_HTTP_LICENSE_FILES = $(LUA_HTTP_SUBDIR)/LICENSE.md
+LUA_HTTP_CPE_ID_VERSION = $(LUA_HTTP_VERSION_UPSTREAM)
+LUA_HTTP_CPE_ID_VENDOR = daurnimator
 
 $(eval $(luarocks-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
