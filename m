Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC33FCCA476
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 20:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6027660BC5;
	Sat, 11 Oct 2025 20:59:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wn2y7XtjSDKr; Sat, 11 Oct 2025 20:59:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63C4A60BC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63C4A60BC1;
	Sat, 11 Oct 2025 20:59:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A642F119
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 20:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9702540D20
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 20:59:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wS2iDq7F1GXW for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 20:59:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B07074089A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B07074089A
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 20:59:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 977AF86B55; Sat, 11 Oct 2025 20:59:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 Oct 2025 22:39:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a843be3451a07c5ebbaae8f5ec605f6d0162e24d
X-Git-Newrev: b52b3fd59dc6c86ef51b6cad5b76017f90c83beb
X-Patchwork-Hint: ignore
Message-Id: <20251011205952.977AF86B55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: bump to version 10.2p1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b52b3fd59dc6c86ef51b6cad5b76017f90c83beb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes since 10.0p1:
https://www.openssh.com/txt/release-10.1
https://www.openssh.com/txt/release-10.2

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
[Julien: add link to 10.1p1 release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 62c3bcad99..154464d68a 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-10.0
-sha256  021a2e709a0edf4250b1256bd5a9e500411a90dddabea830ed59cef90eb9d85c  openssh-10.0p1.tar.gz
+# From https://www.openssh.com/txt/release-10.2
+sha256  ccc42c0419937959263fa1dbd16dafc18c56b984c03562d2937ce56a60f798b2  openssh-10.2p1.tar.gz
 # Locally calculated
 sha256  5bb5b160726ef5756e4f32fe95b35249c294962419650f48d05134b486d27ccb  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index f1b8c0920b..bcbfc39755 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 10.0
+OPENSSH_VERSION_MAJOR = 10.2
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
