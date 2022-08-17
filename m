Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D343C25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 06:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA6BA4198F;
	Wed, 17 Aug 2022 06:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA6BA4198F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8nupnwASMu19; Wed, 17 Aug 2022 06:51:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C371741936;
	Wed, 17 Aug 2022 06:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C371741936
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C7DE1BF9C6
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15FFB61064
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15FFB61064
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fgQqokdGmIXU for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 06:50:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3351161059
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 06:50:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3351161059
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DC06F8795D; Wed, 17 Aug 2022 06:36:25 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 17 Aug 2022 08:49:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ad5e6cede2bade70ede6c18080c2afc43be96ec
X-Git-Newrev: dbfc9f9f67dc410d3b8a331f1b17e403884513f4
X-Patchwork-Hint: ignore
Message-Id: <20220817063625.DC06F8795D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xenomai: fix indentation (tabs
 instead of spaces)
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbfc9f9f67dc410d3b8a331f1b17e403884513f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check-package warns:
package/xenomai/Config.in:86: continuation line should be indented using tabs

Fixes: e4040d0d8 "package/xenomai: rework custom handling".

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/xenomai/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 269b85b5ce..d4983b084d 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -83,7 +83,7 @@ config BR2_PACKAGE_XENOMAI_VERSION
 	string
 	default "3.0.10" if BR2_PACKAGE_XENOMAI_LATEST_VERSION
 	default BR2_PACKAGE_XENOMAI_CUSTOM_VERSION_VALUE \
-                if BR2_PACKAGE_XENOMAI_CUSTOM_VERSION
+		if BR2_PACKAGE_XENOMAI_CUSTOM_VERSION
 	default "custom" if BR2_PACKAGE_XENOMAI_CUSTOM_TARBALL
 	default BR2_PACKAGE_XENOMAI_REPOSITORY_VERSION \
 		if BR2_PACKAGE_XENOMAI_CUSTOM_GIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
