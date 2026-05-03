Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18256FF886F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 17:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E60CE61056;
	Sun,  3 May 2026 17:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWC15S4dZFKJ; Sun,  3 May 2026 17:50:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAA5F60E5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777830617;
	bh=gAE2oo/WXpLm1cy4nlW1DRPXuZ+5deiKXVGK/ITJd+o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UZXuyXCZkX6jBr8a2nOJdn65GEZMdzMtHq2BKpfh7zg05gUIfMeni2B2w3+q9hRRO
	 aZ90BzWq+Adfi1lME8ypdYM85ACmjFSDhq80hMOf/Wb3fvcRnI4XmYyUc4MZKfQ54Q
	 6IHXKzr7snumR0pcBC+0P+fj66Nk3L2qY3PqUtosOXFsFMmuSF0seEtmI357fQW9by
	 oQQcehygIKu0qQ2BPM6r7LyvB8jTBx82lFqWHctwfNT20ZcaVn+9DbLFhKhfqaJ81R
	 QH7WmCm7QV88iR/WAxH1RJ1JA0VbnRCByV/rmQhD6xdmp3OU1XwBJO6K56xrSyg2cp
	 9c7IenL5pUP+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAA5F60E5E;
	Sun,  3 May 2026 17:50:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 164B925D
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E885B407C6
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMqXoId5DQIO for <buildroot@buildroot.org>;
 Sun,  3 May 2026 17:50:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C7FA4073B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C7FA4073B
 for <buildroot@buildroot.org>; Sun,  3 May 2026 17:50:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC0CB840B7; Sun,  3 May 2026 17:50:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 19:48:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2239b9dc466f0594acec4bcfa381cb7ccc943771
X-Git-Newrev: ae4c2baab90101216f52362eba7740353923f2e4
X-Patchwork-Hint: ignore
Message-Id: <20260503175015.CC0CB840B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netsnmp: enable parallel build
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ae4c2baab90101216f52362eba7740353923f2e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 7643670052a7adc1c2a5f275664774c6d50e6a3d disabled
parallel builds in 2012.

Upstream fixed the problem in 2021:
https://github.com/net-snmp/net-snmp/commit/855e1c28dad53d6263c6c0c302438d2dc3128cc5
https://github.com/net-snmp/net-snmp/commit/9ea3d8b93c9bb7da7fea13ee6c92356a6b82a5fb
with version 5.9.1 which was added to buildroot with commit
83b4337354014a5425a0ee081b94d4d0991f8d47.

Tested with -j100.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/netsnmp/netsnmp.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 4d3367e12c..0ec4cfaa76 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -38,7 +38,6 @@ NETSNMP_CONF_OPTS = \
 	--disable-manuals
 NETSNMP_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIB_LDCONFIG_CMD=true install
 NETSNMP_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIB_LDCONFIG_CMD=true install
-NETSNMP_MAKE = $(MAKE1)
 NETSNMP_CONFIG_SCRIPTS = net-snmp-config
 
 define NETSNMP_USERS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
