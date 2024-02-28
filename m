Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59677C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEC7741816;
	Wed, 28 Feb 2024 21:27:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lAQ8_IwjjxkW; Wed, 28 Feb 2024 21:27:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84E204180D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84E204180D;
	Wed, 28 Feb 2024 21:27:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F319F1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5553E41691
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A71t4ayZ4ZOQ for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6667A41753
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6667A41753
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1171A87CE2; Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:13:57 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 5e5a8f73837e66bb1a234791eebd225812d79517
X-Git-Newrev: c3203317ec6c751d51fe48ad69456316a3f6f7ea
X-Patchwork-Hint: ignore
Message-Id: <20240228212549.1171A87CE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/minizip: fix CPE
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3203317ec6c751d51fe48ad69456316a3f6f7ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
index c74c0df8d1..8587508752 100644
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
