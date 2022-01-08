Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1190FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73DAC8146E;
	Sat,  8 Jan 2022 22:36:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ASWI1QNhrOEw; Sat,  8 Jan 2022 22:36:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D86F68148A;
	Sat,  8 Jan 2022 22:36:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39ADB1BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21E2960AAC
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id al23nni9C91k for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C4A860A9B
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4FB2583466; Sat,  8 Jan 2022 22:29:49 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 23:35:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 24ac316ff58e2c1deca8dc329705b0810414c8db
X-Git-Newrev: ad034892d8b8748eea52b45aa05dbeb271645dbb
X-Patchwork-Hint: ignore
Message-Id: <20220108222949.4FB2583466@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/adding-packages-golang.txt:
 add some details about vendoring
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad034892d8b8748eea52b45aa05dbeb271645dbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-golang.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/manual/adding-packages-golang.txt b/docs/manual/adding-packages-golang.txt
index 3b34579200..c952cde577 100644
--- a/docs/manual/adding-packages-golang.txt
+++ b/docs/manual/adding-packages-golang.txt
@@ -120,3 +120,14 @@ possible to customize what is done in any particular step:
   +FOO_BUILD_CMDS+ variable, it will be used instead of the default Go
   one. However, using this method should be restricted to very
   specific cases. Do not use it in the general case.
+
+A Go package can depend on other Go modules, listed in its +go.mod+
+file. Buildroot automatically takes care of downloading such
+dependencies as part of the download step of packages that use the
++golang-package+ infrastructure. Such dependencies are then kept
+together with the package source code in the tarball cached in
+Buildroot's +DL_DIR+, and therefore the hash of the package's tarball
+includes such dependencies.
+
+This mechanism ensures that any change in the dependencies will be
+detected, and allows the build to be performed completely offline.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
