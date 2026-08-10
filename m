Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886A5C5AD55
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 19:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FB3C60779;
	Mon, 10 Aug 2026 19:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3-Ox3s9mMpDo; Mon, 10 Aug 2026 19:56:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE6E660765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786391785;
	bh=J7xIvhLk4ankgJ10XjNGKot9pbQzUGmRRqqI4hPBkHs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pGnoSZXDjxEuGqXWLSI6RGqOC3IqAbTZnBmDzhXNVTfq6xvNsJjADKMAm5URw5SJs
	 DsyRYjB0baLfsecfx7Njdnn3qVmJXSTVzToPbAtlEe7+5se/9rT3ynfSi+hhiOJLIy
	 3vcWZYdm0E44ns+N8umByFgeeef0Q7SJ/HCAIAhJHk2XCEn9hFtkTimE/vngUqRWXu
	 6m3GF4syudNP4m4zaEJxBoGOJ1nEDG4z58gCeWvc8FB5ubiiWjSIbRsLiyFg6x50AG
	 wjh7dIsy1mY22e9OkMaFIJAZlQ0qlr9yJlg+buI9YU3bwgHZtMQS+R2ZkqDUQ+1toq
	 HamwDysE2vBcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE6E660765;
	Mon, 10 Aug 2026 19:56:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E63B10E
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 19:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54530400EC
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 19:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfy7Qnp4gdYO for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 19:56:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A559C40094
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A559C40094
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 19:56:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 744CD8D32D; Mon, 10 Aug 2026 19:55:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Aug 2026 21:52:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4532b924aa3822d748f8977faf39605259dda9d
X-Git-Newrev: 1c8e2c527e1e83e0db3767accbb7822d1298e8fa
X-Patchwork-Hint: ignore
Message-Id: <20260810195535.744CD8D32D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jsoncpp: add host variant
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1c8e2c527e1e83e0db3767accbb7822d1298e8fa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/jsoncpp/jsoncpp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 7a47277590..99d04db01c 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -11,5 +11,7 @@ JSONCPP_LICENSE_FILES = LICENSE
 JSONCPP_CPE_ID_VALID = YES
 JSONCPP_INSTALL_STAGING = YES
 JSONCPP_CONF_OPTS = -Dtests=false
+HOST_JSONCPP_CONF_OPTS = -Dtests=false
 
 $(eval $(meson-package))
+$(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
