Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5D1C4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 13:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 314A560B5C;
	Wed,  4 Jan 2023 13:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 314A560B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mdfklFg0tYYy; Wed,  4 Jan 2023 13:21:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7533B60692;
	Wed,  4 Jan 2023 13:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7533B60692
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 328C01BF35B
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 13:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1ABBE4091F
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 13:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1ABBE4091F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5y42P6f4eMDi for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 13:21:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3501A4091D
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 13:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3501A4091D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22D59874C4; Wed,  4 Jan 2023 13:21:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 14:19:35 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 684ffd8e2083db9b5da6549d1b4ea76dc1d4b395
X-Git-Newrev: ece92c636a8bfd316fb49850db82dc663cea79ec
X-Patchwork-Hint: ignore
Message-Id: <20230104132109.22D59874C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/tiff: explicitly
 disable webp
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

commit: https://git.buildroot.net/buildroot/commit/?id=ece92c636a8bfd316fb49850db82dc663cea79ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9db9f9b4dc7d7b728bf2ea9e6456a9fcc6d7098c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/tiff.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 90b28ff37a..35a9570ce9 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -12,10 +12,13 @@ TIFF_CPE_ID_VENDOR = libtiff
 TIFF_CPE_ID_PRODUCT = libtiff
 TIFF_INSTALL_STAGING = YES
 
+# webp has a (optional) dependency on tiff, so we can't have webp
+# support in tiff, or that would create a circular dependency.
 TIFF_CONF_OPTS = \
 	--disable-contrib \
 	--disable-cxx \
 	--disable-tests \
+	--disable-webp \
 	--without-x
 
 TIFF_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
