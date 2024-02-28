Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74079C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41821416C5;
	Wed, 28 Feb 2024 21:27:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dZUke0_QeTKQ; Wed, 28 Feb 2024 21:27:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD8004184D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD8004184D;
	Wed, 28 Feb 2024 21:27:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B94961BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DD4981951
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vuWGvkrS0C1N for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BBE581973
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BBE581973
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86E7387CDC; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:14:02 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 783f8284705770e082b1094a2f1413c6b2b486c5
X-Git-Newrev: 8a307edcfcc0f40c37ae21be6d54e1ee0e0f2491
X-Patchwork-Hint: ignore
Message-Id: <20240228212552.86E7387CDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/minizip: fix CPE
 variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a307edcfcc0f40c37ae21be6d54e1ee0e0f2491
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

cpe:2.3:a:minizip_project:minizip added by commit
425339dcdfb2d4fa16ee11231752a5cc8250e78f is not a valid CPE identifier
for this package, cpe:2.3:a:zlib-ng:minizip-ng is the correct one:

  https://nvd.nist.gov/products/cpe/detail/64E392F1-65DD-42E5-B618-AD893BA37FB3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f1e05a8199514310443777bc4dce1e2a6d2b69c0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minizip/minizip.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 5a4d920369..819b33b701 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -14,7 +14,8 @@ MINIZIP_CONF_OPTS = \
 	-DMZ_FETCH_LIBS=OFF
 MINIZIP_LICENSE = Zlib
 MINIZIP_LICENSE_FILES = LICENSE
-MINIZIP_CPE_ID_VENDOR = minizip_project
+MINIZIP_CPE_ID_VENDOR = zlib-ng
+MINIZIP_CPE_ID_PRODUCT = minizip-ng
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 MINIZIP_DEPENDENCIES += bzip2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
