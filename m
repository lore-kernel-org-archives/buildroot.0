Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E79FD0062
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 18:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63BC060895;
	Sun,  1 Mar 2026 18:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pxm7xsPwANL7; Sun,  1 Mar 2026 18:02:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DD8D60C18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772388152;
	bh=UllxLUkHyfUjn3I0MahT7Cmr0Dvj/HO/tGuNWmV0+Po=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Fvo1DUSbZwtuEXyeMOAzEPApFOlwBj/uH9HqD7voB/wozArps9WX1FXuypwjOGaPf
	 G6bgH0DAZ4iXV6Hok7P/yXWt8Xi321zHSwDB3vLhtOq00Yq/VbpGylPV7ibblYelB2
	 WUEyTs3GOpyc+jN2qMATpRR9VI3THofIqctOKUnq90S7fjx4Tc4cJgRE+V1c+OYSU/
	 hQxLEyPus3gnlUGgYNETJL9BJgaVdm/UnpsDL2wNBSqodxpsYQ2Q+rOxOehY43ajc7
	 AA4uXq5hhRH2KIbfeym+Co8BfRtqEx88sYQ/Dp3Pw+wmDYxT2XhcDDghbLIEDJfGHH
	 nenZb2U3VzHGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DD8D60C18;
	Sun,  1 Mar 2026 18:02:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 25F0124E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 18:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 178F160C2E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 18:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4pLyChOP9phd for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 18:02:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F5DD60C18
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F5DD60C18
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 18:02:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42F9E85DB5; Sun,  1 Mar 2026 18:02:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Mar 2026 18:16:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e7928fef42fc190d51864c4b14df618751325167
X-Git-Newrev: 20db09684bb848582d690b3c7ddb2c20d8284245
X-Patchwork-Hint: ignore
Message-Id: <20260301180229.42F9E85DB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rust-bindgen: bump
 version to 0.72.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/20db09684bb848582d690b3c7ddb2c20d8284245
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/rust-lang/rust-bindgen/releases/tag/v0.72.1

We need to add "refs/tags/" to RUST_BINDGEN_SITE because the github
repo contains a tag and a branch with the same name:

$ wget -q https://github.com/rust-lang/rust-bindgen/archive/v0.72.1/rust-bindgen-0.72.1-cargo4.tar.gz -O -
the given path has multiple possibilities: #<Git::Ref:0x00007d64db1eed90>, #<Git::Ref:0x00007d64db1e7c70>

Fixes a build error with mesa3d 26.x and the upcoming llvm 22 bump:
https://github.com/rust-lang/rust-bindgen/issues/3264#issuecomment-3218111176

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Co-authored-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rust-bindgen/rust-bindgen.hash | 2 +-
 package/rust-bindgen/rust-bindgen.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rust-bindgen/rust-bindgen.hash b/package/rust-bindgen/rust-bindgen.hash
index dc79a62ddd..72ff0401ce 100644
--- a/package/rust-bindgen/rust-bindgen.hash
+++ b/package/rust-bindgen/rust-bindgen.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f131b9cf87ea0a5db33ff3ad711aec4dbc4d383536f5f2e37493d63cbe95428e  rust-bindgen-0.72.0-cargo4.tar.gz
+sha256  9dd2f0f7bae7c84b1d79fb848d17335b8ebc37c27cd5ecb6e0da3ec0dba87d71  rust-bindgen-0.72.1-cargo4.tar.gz
 sha256  c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  LICENSE
diff --git a/package/rust-bindgen/rust-bindgen.mk b/package/rust-bindgen/rust-bindgen.mk
index 8c02db557f..55f3b4d5b7 100644
--- a/package/rust-bindgen/rust-bindgen.mk
+++ b/package/rust-bindgen/rust-bindgen.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RUST_BINDGEN_VERSION = 0.72.0
-RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,v$(RUST_BINDGEN_VERSION))
+RUST_BINDGEN_VERSION = 0.72.1
+RUST_BINDGEN_SITE = $(call github,rust-lang,rust-bindgen,refs/tags/v$(RUST_BINDGEN_VERSION))
 RUST_BINDGEN_LICENSE = BSD-3-clause
 RUST_BINDGEN_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
