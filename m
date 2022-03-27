Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3443C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A740E60E64;
	Sun, 27 Mar 2022 16:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WLOMkYXGPhNa; Sun, 27 Mar 2022 16:10:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C54B760E2B;
	Sun, 27 Mar 2022 16:10:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 786281BF9A4
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7402E4021D
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KjCftXfSeDxo for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:09:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C53C04029D
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:09:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6497485E0B; Sun, 27 Mar 2022 16:00:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 17:59:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5f82a4a5a6f14b4d178a4d662784d7bd6f7fada
X-Git-Newrev: b38d3d22718270610639c9078476ac31ceeaa34d
X-Patchwork-Hint: ignore
Message-Id: <20220327160039.6497485E0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ola: fix host build
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

commit: https://git.buildroot.net/buildroot/commit/?id=b38d3d22718270610639c9078476ac31ceeaa34d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-bison and host-flex are mandatory dependencies of host-ola since
the reintroduction of the package in commit
16ff948444c3978d63f483344a3d92d994c64312:

configure: error: bison not found, please install it

Fixes:
 - http://autobuild.buildroot.org/results/ac089629a58d55ec5d1aa83fd77bd487bc9d76de

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ola/ola.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 1b55ca440a..1fd6d6a592 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -26,7 +26,7 @@ OLA_CONF_OPTS = \
 	--disable-unittests \
 	--with-ola-protoc-plugin=$(HOST_DIR)/usr/bin/ola_protoc_plugin
 
-HOST_OLA_DEPENDENCIES = host-util-linux host-protobuf
+HOST_OLA_DEPENDENCIES = host-util-linux host-protobuf host-bison host-flex
 
 # When building the host part, disable as much as possible to speed up
 # the configure step and avoid missing host dependencies.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
