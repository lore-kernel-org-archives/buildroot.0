Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1625DC83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 16:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD7A541170;
	Fri,  4 Jul 2025 16:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsc9Y44EaMvv; Fri,  4 Jul 2025 16:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1327E4116B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1327E4116B;
	Fri,  4 Jul 2025 16:55:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C71287AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C45C583EA5
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcVdHcfE9oI0 for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 16:55:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E32883EA1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E32883EA1
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:55:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFB8885E7F; Fri,  4 Jul 2025 16:55:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 4 Jul 2025 18:51:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4cbf1403f191f40b82dd969d9066cefe3e1c395
X-Git-Newrev: 9d6a4312c8937b9e297a7b0ca4a30a6d886c9e76
X-Patchwork-Hint: ignore
Message-Id: <20250704165523.EFB8885E7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsoup: fix missing upstream tag
 in patch 0001
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d6a4312c8937b9e297a7b0ca4a30a6d886c9e76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the patch message so that it includes the "Upstream:" tag expected by
check-package, and remove this file from the check-package ignore list.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                       | 1 -
 package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index dbe0963ca2..f5b158c450 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -694,7 +694,6 @@ package/libsigrok/0001-Support-glibmm-2.68.patch lib_patch.Upstream
 package/libsigrokdecode/0001-configure-ac-Add-support-for-Python-3-9.patch lib_patch.Upstream
 package/libsigrokdecode/0002-configure-Add-python-3-10-support.patch lib_patch.Upstream
 package/libsigrokdecode/0003-configure-ac-Use-python3-embed-pc-as-a-fallback.patch lib_patch.Upstream
-package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch lib_patch.Upstream
 package/libsoxr/0001-Add-Libs.private-for-static-linking.patch lib_patch.Upstream
 package/libspatialindex/0001-allow-building-static-libs.patch lib_patch.Upstream
 package/libspatialindex/0002-CMakeLists.txt-fix-CMAKE_BUILD_TYPE.patch lib_patch.Upstream
diff --git a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
index a999f5964e..3fc0e833d2 100644
--- a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
+++ b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
@@ -15,9 +15,9 @@ In file included from /tmp/instance-0/output-1/host/arm-buildroot-linux-gnueabi/
 Fixes:
  - http://autobuild.buildroot.org/results/56b9cb987e25b99d6fed16c537552f47c3376f21
 
+Upstream: https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/241
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/241]
 ---
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
