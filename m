Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58DFC44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F37440A28;
	Fri, 10 Jul 2026 13:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbXZB2xlJb8X; Fri, 10 Jul 2026 13:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04D9640AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691096;
	bh=MMi6HnYCC5Z3bZy8bKsR33/poDGNNSMHGCAa6XpA5b4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O7cK71jcqo2nujOx2wFhpU6EQ50fjSXSx9pjFqtwybAZAF5Ecs/i7JcQne42aGasa
	 LUb+Vi/lNBqB+qbWMHWSgzX8nZNgxfzL059pZ/jWiN95hidb/n1B8K8HJSDGDqU5GR
	 Oc2FN1bUPTCN6wbJ0dGrBnWbG+wQ2BXh5f9RKpXPDX2Q+q2wCg8c2Vr7P910MrsHiY
	 wGVk8DA7YmmTc0SWtc3R9HzgZaANgC2+ew19Rw85vDr9QQsMGJh3vADXACU1KcLd5Y
	 zRQ98BllbuJF5UcyUUfgC1V2+kidRz3DMe/iKejd05i1gQ2dowChAtUFcfFF2YRDrL
	 rg4h4vUAMjXKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04D9640AD8;
	Fri, 10 Jul 2026 13:44:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 010892FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB498400D1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DsOh6w-jgOGI for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:44:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 353774022E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 353774022E
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:44:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6942488674; Fri, 10 Jul 2026 13:44:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 13:50:19 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 6a04d44b078512270f6dad04e3cb0623a87bfd2d
X-Git-Newrev: c833ebb3e816ce5b2e63939d1ca272becc200c44
X-Patchwork-Hint: ignore
Message-Id: <20260710134410.6942488674@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/shadow: needs
 host-pkgconf
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c833ebb3e816ce5b2e63939d1ca272becc200c44
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Since version 4.14.0 and upstream commit 2a5b8810bb17, shadow has
required pkgconfig to find libbsd.

Add a dependency on host-pkgconf.

Fixes: https://autobuild.buildroot.org/results/90f/90ff13ff4c519b0606888eaa90acbd8cd0c0f73a/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
[Fiona: fix typo in commit message]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 9030c9a81dc8763b89a4fb9df220dd1aa013cdbc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/shadow/shadow.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index cf05fc1bdc..5f9b69ef88 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -10,9 +10,12 @@ SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
 SHADOW_LICENSE = BSD-3-Clause
 SHADOW_LICENSE_FILES = COPYING
 SHADOW_CPE_ID_VENDOR = debian
-SHADOW_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 SHADOW_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
+SHADOW_DEPENDENCIES = \
+	host-pkgconf \
+	$(TARGET_NLS_DEPENDENCIES)
+
 SHADOW_CONF_OPTS = \
 	--disable-man \
 	--without-btrfs \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
