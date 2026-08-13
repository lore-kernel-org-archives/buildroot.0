Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E78C5DF69
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F240560A39;
	Fri, 14 Aug 2026 13:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z2V4bNjYAXMx; Fri, 14 Aug 2026 13:20:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1481060AB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713616;
	bh=PAhPbtumjI8Z8f1wTlFyXKtOtppxo5gGtXea3AR9kZ0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ga2ALlYT8JkiH7Tt5DdkSPgxynIqup/hjlZQz+685RU/BiL3Eu0vftnnZh4hwOOhV
	 j7Axyo3hqwTgrf47Ejx0xdFUiV777Vs4yTaKMRo1kCBSwLGm16mq5vBlQfH/rRgZ0P
	 LlERA2JTxw7HBkUatIodOD90g2E07TVqOIA/8VY+v76H16d5cXo/elCX1KHEZz5Bbl
	 B5VJr5WO3bOSBMDzE7kA5EbKE7Vwcwt/XRlLeAh8ZCmPpZeo/kRUcpeXVkxuI4habV
	 +QXhPaBs+1brfOv2r3IqInBwFObnkcLk4xPU7ltKXuX9JFO4LZvemtsnBIZcdTjPzS
	 mqA0Q/LPkLJoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1481060AB9;
	Fri, 14 Aug 2026 13:20:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A14C33B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4DE4400E3
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XAekwTLsIdrw for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 740C34030E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 740C34030E
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A47A8D66B; Fri, 14 Aug 2026 13:18:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 09:27:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d3bbffae21792da2ea7daa0785c151e16501a42c
X-Git-Newrev: cc822da5c5a0c9a87abce3bfa9ec4afa9c65b228
X-Patchwork-Hint: ignore
Message-Id: <20260814131855.6A47A8D66B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libglib2: disable
 sysprof for the host build
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cc822da5c5a0c9a87abce3bfa9ec4afa9c65b228
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Whether the host libglib2 picks up sysprof support depends on whether
libsysprof-capture happens to be installed on the build machine, which
makes the host build depend on the host environment. Disable sysprof
explicitly for the host build so the result is deterministic.

Keep sysprof enabled for the target build: it is useful to profile and
measure the performance of applications running on the target.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
[Fiona: also apply to package/libglib2/libglib2-bootstrap]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit c92dc611e51b9fea493998676f99c0d55e39967e)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk | 3 ++-
 package/libglib2/libglib2.mk                              | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
index 665f320684..1e512fd7ed 100644
--- a/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
+++ b/package/libglib2/libglib2-bootstrap/libglib2-bootstrap.mk
@@ -72,7 +72,8 @@ HOST_LIBGLIB2_BOOTSTRAP_CONF_OPTS = \
 	-Dsystemtap=false \
 	-Dxattr=false \
 	-Dtests=false \
-	-Doss_fuzz=disabled
+	-Doss_fuzz=disabled \
+	-Dsysprof=disabled
 
 $(eval $(meson-package))
 $(eval $(host-meson-package))
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index c18c626ef8..aa578c56bc 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -41,7 +41,8 @@ HOST_LIBGLIB2_CONF_OPTS = \
 	-Dsystemtap=false \
 	-Dxattr=false \
 	-Dtests=false \
-	-Doss_fuzz=disabled
+	-Doss_fuzz=disabled \
+	-Dsysprof=disabled
 
 LIBGLIB2_DEPENDENCIES = \
 	host-pkgconf host-libglib2 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
