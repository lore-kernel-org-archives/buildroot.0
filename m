Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21799EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD33F84592;
	Fri, 13 Feb 2026 19:40:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbXKpHbDMdf6; Fri, 13 Feb 2026 19:40:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8F9784923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011605;
	bh=Do2gB3n+9N69ntSWN/R5Q+pHRax5wYrKvIBBbYSZapM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L/d4HzXpMsW4aVbeZOxBhXpClVFvn453nshrUwpMC7nn8VyrPVufkyZ36GKhDN0AR
	 Up7RYxg+9D6Y1qhSznL0ZFY+ymkQNzaYR3ooVFvTH+6CibGpxBmrp/1nr6I5rItKAN
	 nMM7whPq8n+1RkoGPFNa9rrpMbf/sTQ8WYtIhEo8iv+Gp89CYpnr5gz4KBc4wedtEd
	 qQCBs+too+v1B69nOdnES4JTKd9bk0mxkhoP43tmeimfjW4/MXb3kJbl8GnJUGMHjm
	 sYG2JHxslFaSldXQ/I8q9Kf0ndIijjQrW+JFsgwVZKT26b656DVquH9xoB6uNIsXK3
	 LFRW+xe6a+rJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8F9784923;
	Fri, 13 Feb 2026 19:40:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3414B69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 639AB403B1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lN_izKMEF6Cj for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7120413EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7120413EF
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC19883DBC; Fri, 13 Feb 2026 19:37:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:33:45 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: f73755663d5a9a7b63bb0c0b42fb472eb01bf07a
X-Git-Newrev: 87b16484faeabbf693e7d66b154bc15f4f4b1369
X-Patchwork-Hint: ignore
Message-Id: <20260213193705.AC19883DBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/strongswan: add
 Linux kernel options
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/87b16484faeabbf693e7d66b154bc15f4f4b1369
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

See here for options required by Strongswan to work properly:
https://docs.strongswan.org/docs/latest/install/kernelModules.html

We only enable a subset, which is the bare minimum to start
charon IKEv2 daemon. For advanced users this might be not enough.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 8090d0eb9e252eb6a589d2b4fddee8b6ec83764d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
