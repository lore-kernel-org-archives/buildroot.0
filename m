Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCF5D2E9F0
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 13:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14B48606AF;
	Mon, 11 Nov 2024 13:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RSzKUTklPFdF; Mon, 11 Nov 2024 13:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21A63606BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21A63606BA;
	Mon, 11 Nov 2024 13:36:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 334ABD8F
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20BB440370
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8jfiB3-dUqRy for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 13:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BAA2400F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BAA2400F8
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:36:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13B248601A; Mon, 11 Nov 2024 13:36:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 11:13:28 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 538354038337edde9b6540117b967fe9f865c360
X-Git-Newrev: c5faf339e2ed1b5b5b18e3577b031d9b2dae7bf7
X-Patchwork-Hint: ignore
Message-Id: <20241111133629.13B248601A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x]
 docs/manual/adding-packages-tips: mention check-package requirements
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5faf339e2ed1b5b5b18e3577b031d9b2dae7bf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Call out the requirements to run check-package and mention that Docker
can be used to run check-package without installing dependencies.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 68de69c4d7f61ab5da4dd9cad221fb82e9e1abce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-tips.adoc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/docs/manual/adding-packages-tips.adoc b/docs/manual/adding-packages-tips.adoc
index b04b42b51f..85400c0f31 100644
--- a/docs/manual/adding-packages-tips.adoc
+++ b/docs/manual/adding-packages-tips.adoc
@@ -64,6 +64,19 @@ The tool can also be used for packages in a br2-external:
 $ check-package -b /path/to/br2-ext-tree/package/my-package/*
 ----
 
+The +check-package+ script requires you install +shellcheck+ and the
+Python PyPi packages +flake8+ and +python-magic+. The Buildroot code
+base is currently tested against version 0.7.1 of ShellCheck. If you
+use a different version of ShellCheck, you may see additional,
+unfixed, warnings.
+
+If you have Docker or Podman you can run +check-package+ without
+installing dependencies:
+
+----
+$ ./utils/docker-run ./utils/check-package
+----
+
 [[testing-package]]
 ==== How to test your package
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
