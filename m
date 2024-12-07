Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37969E7717D
	for <buildroot@archiver.kernel.org>; Sat,  7 Dec 2024 09:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E19A7606D9;
	Sat,  7 Dec 2024 09:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6U7U5lT08bg2; Sat,  7 Dec 2024 09:53:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB58E606DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB58E606DA;
	Sat,  7 Dec 2024 09:53:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D309ECA
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 09:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C9FB400F1
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 09:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id atDIb7NNoHP5 for <buildroot@buildroot.org>;
 Sat,  7 Dec 2024 09:53:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1E6D40017
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1E6D40017
 for <buildroot@buildroot.org>; Sat,  7 Dec 2024 09:53:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 665AB7FF5E; Sat,  7 Dec 2024 09:53:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Dec 2024 10:50:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f886158b993d54b40de181f79a745fa234f12c2
X-Git-Newrev: 38c368e6f03f87314e5aba1a6b429670974b5309
X-Patchwork-Hint: ignore
Message-Id: <20241207095323.665AB7FF5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/eza: bump version to 0.18.24 to
 fix compatibility issue with rust >= 1.80
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

commit: https://git.buildroot.net/buildroot/commit/?id=38c368e6f03f87314e5aba1a6b429670974b5309
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/f41a92c22eee077183e7b7b84f8ec15f1900643b/
http://autobuild.buildroot.net/results/c660b7ac92e81d3ba203e345d37210dbdddd3994/

error[E0282]: type annotations needed for `Box<_>`
  --> /home/buildroot/instance-0/output-1/build/eza-0.18.22/VENDOR/time/src/format_description/parse/mod.rs:83:9
   |
83 |     let items = format_items
   |         ^^^^^
...
86 |     Ok(items.into())
   |              ---- type must be known at this point
   |
   = note: this is an inference error on crate `time` caused by an API change in Rust 1.80.0; update `time` to version `>=0.3.35` by calling `cargo update`

https://github.com/eza-community/eza/releases/tag/v0.18.24

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eza/eza.hash | 2 +-
 package/eza/eza.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index 18d437abd1..408099e231 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4ecb6221b28aaae309043b8403555eb6835de671c519c224a3807cea50f48001  eza-0.18.22-cargo2.tar.gz
+sha256  65a0dc76c1976d7af72a628196022de71c787092da5c6d961a3fcee21f5d1d6f  eza-0.18.24-cargo2.tar.gz
 sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
diff --git a/package/eza/eza.mk b/package/eza/eza.mk
index 79fd2d3633..4d23116504 100644
--- a/package/eza/eza.mk
+++ b/package/eza/eza.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EZA_VERSION = 0.18.22
+EZA_VERSION = 0.18.24
 EZA_SITE = $(call github,eza-community,eza,v$(EZA_VERSION))
 EZA_LICENSE = MIT
 EZA_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
