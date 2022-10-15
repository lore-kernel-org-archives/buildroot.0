Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632EDC4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 13:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2787823E0;
	Sat, 15 Oct 2022 13:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2787823E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vr-odjxIniGH; Sat, 15 Oct 2022 13:06:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3750D81CEF;
	Sat, 15 Oct 2022 13:06:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3750D81CEF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 012B21BF5F5
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 13:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1CF9607EC
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 13:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1CF9607EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id juNii1cnkflJ for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 13:06:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2339060784
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 13:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2339060784
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11BD5866F7; Sat, 15 Oct 2022 13:06:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 15:04:27 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: c7531673a0f8026574e797cd6d43251bca48dfa8
X-Git-Newrev: a9c214f41cc34276e1eac35153be539614d0b938
X-Patchwork-Hint: ignore
Message-Id: <20221015130603.11BD5866F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/gitlab-runner:
 fix forcing openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=a9c214f41cc34276e1eac35153be539614d0b938
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

We can't use BR2_PACKAGE_LIBOPENSSL to force selecting libopenssl, as
it is part of a choice. Instead, we have a symbol explicitly to force
libopenssl: BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL.

Use that.

Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 60f97ad95ad2ec93effed8a41e7d2e6101cd6917)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gitlab-runner/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gitlab-runner/Config.in b/package/gitlab-runner/Config.in
index 72c2742562..89e3e87b5c 100644
--- a/package/gitlab-runner/Config.in
+++ b/package/gitlab-runner/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_GITLAB_RUNNER
 	select BR2_PACKAGE_LIBCURL_CURL # runtime
 	select BR2_PACKAGE_LIBCURL_OPENSSL # runtime, for ca-certificates.
 	select BR2_PACKAGE_OPENSSL # runtime
-	select BR2_PACKAGE_LIBOPENSSL # runtime
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # runtime
 	select BR2_PACKAGE_LIBOPENSSL_BIN # runtime
 	select BR2_PACKAGE_TAR # runtime
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
