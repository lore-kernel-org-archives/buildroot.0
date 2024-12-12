Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30FCE7717F
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 21:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3C51616BB;
	Thu, 12 Dec 2024 21:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WuCoOvwT2MGM; Thu, 12 Dec 2024 21:32:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1C846179B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1C846179B;
	Thu, 12 Dec 2024 21:32:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 36F4C75
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1923680C38
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b91ukJBF4Rzk for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 21:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4499380C4A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4499380C4A
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:32:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 414848110D; Thu, 12 Dec 2024 21:32:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 22:29:26 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 27a1f1efc9e9f895da33ff086b8c5d1ed2845305
X-Git-Newrev: 3cb033f7fd9e70009a028c78c3123c0894a5ffd8
X-Patchwork-Hint: ignore
Message-Id: <20241212213225.414848110D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/pkg-utils: fix
 'necessary' and 'dictionary' typos
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3cb033f7fd9e70009a028c78c3123c0894a5ffd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit ba08a37af572397aef2b38de8f45381d12f7f441)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index e8e508e334..a0dbeac18e 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -75,7 +75,7 @@ extractor-pkg-dependency = $(EXTRACTOR_PKG_DEPENDENCY$(suffix $(1)))
 
 # extractor-system-dependency(filename): returns the name of the tool
 # needed to extract 'filename', and is meant to be used with
-# DL_TOOLS_DEPENDENCIES, in order to check that the necesary tool is
+# DL_TOOLS_DEPENDENCIES, in order to check that the necessary tool is
 # provided by the system Buildroot runs on.
 #
 # $(firstword) is used here because the extractor can have arguments,
@@ -99,7 +99,7 @@ define yesno-to-bool
 endef
 
 # json-info -- return package or filesystem metadata formatted as an entry
-#              of a JSON dictionnary
+#              of a JSON dictionary
 # $(1): upper-case package or filesystem name
 define json-info
 	"$($(1)_NAME)": {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
