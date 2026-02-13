Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C6FCEF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B31441F05;
	Fri, 13 Feb 2026 19:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0X8KksKzZqif; Fri, 13 Feb 2026 19:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D53A41E55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011404;
	bh=zvMKE37QqsHFboWNFOlnL6nn7loREkgCRIOyi8PGkbk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I3BHHOVtDFov/c5V0PogiL2yPaLjZamG1uDvGyBs89F8VtRIGRpIj630qf2RHWklP
	 PYWFZtUfPM4iSjlqJ2ThItGDUfkW+7jLFFzABWwz7Whk4CNfvr/ZlZT8zlFMGos/Z8
	 Demu2UX2Hfnww/Z5g5LsF0T0cp1e4vRpvGtwoOk6fHz8BEzuEeTXrYaPVWYnPa5Prg
	 URKbJFBTbpuDf2uFyAMQBASqw01Oa+bXFI76VWQ5kMW/ny5BztWRzRCewo20JYifeR
	 cGpW1JAppCyeQdJA9li33EGvV/QarXoGGbLJ54jzXRI5KOtDpcaHI6QRzqvlVwUY3E
	 tPQxERmpJn9Zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D53A41E55;
	Fri, 13 Feb 2026 19:36:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10605283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0444C41E3D
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vn9b4KbnfvGc for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19B2A41E22
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19B2A41E22
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E63883545; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:32:16 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 86d877427929c3f9837f3d4155627ce794c8dc88
X-Git-Newrev: 360dd126f6c9fd0a2a403f01f7ca735119397eca
X-Patchwork-Hint: ignore
Message-Id: <20260213193530.0E63883545@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/strongswan: add
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/360dd126f6c9fd0a2a403f01f7ca735119397eca
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 1c1ce67350..4185e13288 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -96,4 +96,16 @@ STRONGSWAN_CONF_OPTS += \
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
