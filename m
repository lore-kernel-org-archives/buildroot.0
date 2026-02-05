Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F27A1ECD9A6
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 21:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6B448428E;
	Thu,  5 Feb 2026 21:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tizQMH88nmQO; Thu,  5 Feb 2026 21:02:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1862842B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770325367;
	bh=1P94sDfOiYuhfSS9b0gLrdvMICG2kN8IDX81KoIqZqQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JyXn3/WKFHJosMmNsI0OSx6RfQvHJc0QwScYgfOqUCX4tWX0li1ctXmCuOoSSoQGI
	 5FFzzqJUSOX8lWy4gfQa/8FnPL0now4/IyGliFo8hvFQq5bbmPMkBv5muw7nJIp0N3
	 F1wc0H0umhRDZZhFX+3fPPysVXUZ3BPgAFNq40M8ErxkSQc9HlCGvcDBkhzW0cv8pD
	 kmh715IBxgINqBA3UktAqXaVXw22qJiTv+LfVqKyYOnZPeOQ0QRo7xScXwAKcFtFrW
	 pSYu3aQB76cxybUoaLYUC+3J/Fdjrsn44AW4GBZlk1vO/mTRCloMJJYtFkWfWrHAxP
	 kQbUxzUqMdQ8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1862842B9;
	Thu,  5 Feb 2026 21:02:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5B9F470
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5EB5842B9
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRc0gCfPB4ys for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 21:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C04408428E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C04408428E
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 21:02:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9EE186A39; Thu,  5 Feb 2026 21:02:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Feb 2026 22:01:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 766a6e5c0ba77fbcb7c7141cb4f66be2d20dc7e7
X-Git-Newrev: 8090d0eb9e252eb6a589d2b4fddee8b6ec83764d
X-Patchwork-Hint: ignore
Message-Id: <20260205210245.A9EE186A39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: add Linux kernel
 options
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8090d0eb9e252eb6a589d2b4fddee8b6ec83764d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See here for options required by Strongswan to work properly:
https://docs.strongswan.org/docs/latest/install/kernelModules.html

We only enable a subset, which is the bare minimum to start
charon IKEv2 daemon. For advanced users this might be not enough.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/strongswan/strongswan.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index caf214cefa..d27341a860 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -114,4 +114,16 @@ STRONGSWAN_CONF_OPTS += \
 	--disable-connmark \
 	--disable-forecast
 
+# bare minimum to start charon
+define STRONGSWAN_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETLINK)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET_AH)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET_ESP)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_XFRM)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_XFRM_USER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_XFRM_INTERFACE)
+endef
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
