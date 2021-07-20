Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CA6C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:54:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D40E76105A
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D40E76105A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B009860ADB;
	Tue,  3 Aug 2021 23:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jw1nccpJhCef; Tue,  3 Aug 2021 23:54:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1116F60AC5;
	Tue,  3 Aug 2021 23:54:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 797C81BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5F6440F70
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fa1fMffef3BU for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 808B440EE9
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C99C78393C; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 21:25:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 360d1aad84449c6a1993d8c7e469dc0cd35339a2
X-Git-Newrev: db6e5bf7d6774e52f93a3a8bed536200539f07dc
X-Patchwork-Hint: ignore
Message-Id: <20210803211010.C99C78393C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lua-lunix: fix build
 with musl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=db6e5bf7d6774e52f93a3a8bed536200539f07dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

see http://autobuild.buildroot.net/results/7d192a0a1d58d258b77906cf936949b2f47373cd/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../lua-lunix/0002-remove-link-with-librt.patch    | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/lua-lunix/0002-remove-link-with-librt.patch b/package/lua-lunix/0002-remove-link-with-librt.patch
new file mode 100644
index 0000000000..7b1c8ddd57
--- /dev/null
+++ b/package/lua-lunix/0002-remove-link-with-librt.patch
@@ -0,0 +1,36 @@
+From aeaff83b9ae42547b8728edac000f3d41d5e44aa Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sat, 17 Jul 2021 13:21:38 +0200
+Subject: [PATCH] remove link with librt
+
+librt is not available with musl
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ lunix-rel-20170920/lunix-20170920-1.rockspec | 10 ----------
+ 1 file changed, 10 deletions(-)
+
+diff --git a/lunix-rel-20170920/lunix-20170920-1.rockspec b/lunix-rel-20170920/lunix-20170920-1.rockspec
+index 741179d..76cafeb 100644
+--- a/lunix-rel-20170920/lunix-20170920-1.rockspec
++++ b/lunix-rel-20170920/lunix-20170920-1.rockspec
+@@ -26,16 +26,6 @@ build = {
+ 		};
+ 	};
+ 	platforms = {
+-		linux = {
+-			modules = {
+-				["unix"] = {
+-					libraries = {
+-						-- glibc <= 2.17 needs to link with librt
+-						"rt";
+-					};
+-				};
+-			};
+-		};
+ 		osx = {
+ 			modules = {
+ 				["unix"] = {
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
