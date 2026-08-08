Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC51C55174
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 13:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 471E860672;
	Sat,  8 Aug 2026 13:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Me_29ZZ88wSy; Sat,  8 Aug 2026 13:48:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62F6C6067D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786196896;
	bh=dsUgYVRyOgEuc+QCUFbF0gUtveoVWNOZZm1kEyQci5A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BOd4vINHmBGMzVzZMJY0vAEfjerG4CORfoxpYlp4X59bzOk5QMgCyVUAO3l74dpxX
	 9o07y2CGA3SmwhBdZyv4vs6vu6RfArKv5EoaT5sNNTyAY3oZsK2VMD4kT1AcyNMpgy
	 R3Ej88k4H6gbRFV8RSm8BMgo7w0cv5mWANSOvyfRZieFdrWWQlY01gXJ5/nFrtpvsx
	 TKhOqLN8tTYUB3lqY10mOOcPrXEBUtg6cEOz6adQkA++0/imEPVWklS7NNWYWA/oh7
	 UQX205iZ9+QQVkZm9c08zOwhpWehLlpvoG5d845WublVBdec0cCVftZBLTlU31yDxx
	 Kaot3xmHIJl6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62F6C6067D;
	Sat,  8 Aug 2026 13:48:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CBAC1AF
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42EA9405A9
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQPMauqRsOCU for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 13:48:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 649BA405A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 649BA405A3
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 13:48:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51F7F8CA06; Sat,  8 Aug 2026 13:47:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Aug 2026 15:46:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 187d329d1d0dc9deabca7b4e55f78e6fe6984057
X-Git-Newrev: ef655b53dd5c3fa52b133e09b7d5b7ec1aea12e6
X-Patchwork-Hint: ignore
Message-Id: <20260808134727.51F7F8CA06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/contribute.adoc: mention
 license file changes in commit message
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef655b53dd5c3fa52b133e09b7d5b7ec1aea12e6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

It has been good practice for a while to describe the kind of change
in the commit message of any patch that changes license file
hashes. This is important so any substantial changes don't go
unnoticed. However it wasn't explicitly stated in the manual, fix
that.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/manual/contribute.adoc | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index f22164991f..310fe80585 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -283,16 +283,18 @@ the commit message body.
 When you bump a package to a new version, you should also submit a
 separate patch for each package. Don't forget to update the +.hash+
 file, or add it if it doesn't exist yet. Also don't forget to check if
-the +_LICENSE+ and +_LICENSE_FILES+ are still valid. The summary line
-should be something like +<packagename>: bump to version <new
-version>+. If the new version only contains security updates compared
-to the existing one, the summary should be +<packagename>: security
-bump to version <new version>+ and the commit message body should show
-the CVE numbers that are fixed. If some package patches can be removed
-in the new version, it should be explained explicitly why they can be
-removed, preferably with the upstream commit ID. Also any other
-required changes should be explained explicitly, like configure
-options that no longer exist or are no longer needed.
+the +_LICENSE+ and +_LICENSE_FILES+ are still valid. If the hash of a
+license file changed, please include a note in the commit message
+about what changed, ideally with a link to the upstream commit. The
+summary line should be something like +<packagename>: bump to version
+<new version>+. If the new version only contains security updates
+compared to the existing one, the summary should be +<packagename>:
+security bump to version <new version>+ and the commit message body
+should show the CVE numbers that are fixed. If some package patches
+can be removed in the new version, it should be explained explicitly
+why they can be removed, preferably with the upstream commit ID. Also
+any other required changes should be explained explicitly, like
+configure options that no longer exist or are no longer needed.
 
 If you are interested in getting notified of build failures and of
 further changes in the packages you added or modified, please add
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
