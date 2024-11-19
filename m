Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F387C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1340E42ED7;
	Fri, 28 Feb 2025 16:30:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6mrh0kXcfcX; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADB72426A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADB72426A8;
	Fri, 28 Feb 2025 16:29:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 117311DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C54080510
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mY-IDbwPXarh for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B54A1811E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B54A1811E9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B287687A71; Fri, 28 Feb 2025 16:29:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 19 Nov 2024 22:05:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a359514630165fe03c7bd159af10b7d20d08334a
X-Git-Newrev: f3b82925a9a4ce71024f78663547c78ab665d840
X-Patchwork-Hint: ignore
Message-Id: <20250228162929.B287687A71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/skopeo: select
 BR2_PACKAGE_HOST_GO
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3b82925a9a4ce71024f78663547c78ab665d840
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

host-skopeo fail to build, using the commands:

    echo BR2_PACKAGE_HOST_SKOPEO=y >.config
    make olddefconfig
    make host-skopeo

This commit fixes the issue by selecting BR2_PACKAGE_HOST_GO
in the Config.in file.

Fixes:

    make: *** No rule to make target 'host-', needed by '/buildroot/output/build/host-go-1.23.2/.stamp_configured'.  Stop.

Reviewed-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/skopeo/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/skopeo/Config.in.host b/package/skopeo/Config.in.host
index 334a12b6fc..1c1c8f3ebe 100644
--- a/package/skopeo/Config.in.host
+++ b/package/skopeo/Config.in.host
@@ -2,6 +2,7 @@ config BR2_PACKAGE_HOST_SKOPEO
 	bool "host skopeo"
 	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  skopeo is a command line utility that performs various
 	  operations on container images and image repositories.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
