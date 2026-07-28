Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B28BAC54F4C
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 14:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E436608F8;
	Tue, 28 Jul 2026 14:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZClS6wwWC8N; Tue, 28 Jul 2026 14:01:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B236608DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785247261;
	bh=sX4AwwBfAk+GLRq7bDMKjWOoI6sjdeFW2ujk+5VO/Fw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K2QFamR0KgjBrhPKKZa61nEOVCtCW0MBWP8c9H6T2ZrWxrxwzOB862s3EtPeYfqSt
	 ozA4Yz4eIRQhWtQ0VoPvaFa8nxwGhghJDlIsnLEE486YW3IPDT1nzT0TIqkMDec1Rq
	 OpOi01rLYpb5ZbdI+XTTuNIdBu3OEt6r70HnlNuhvHHPZv7X/LLJM+7ZovoAsw9h7T
	 pnHLW4TEtAobt0GDD0eBnwqkAZimtFJGlhNMPX2GtEbYk4gAmF3aojrbJjnHgboLOB
	 AXDRQ6FMwJ2yTTLaHTc/3PV6LuUDAEc+xoCGJShYYwf5wi9o7TvXeu+FAKD0DjK/pU
	 9Y+upMNmivscQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B236608DD;
	Tue, 28 Jul 2026 14:01:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BFCB2E5
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 14:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E1BE81259
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 14:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLWPScoAL4P3 for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 14:00:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 981F5813A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 981F5813A6
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 14:00:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E671D8B410; Tue, 28 Jul 2026 14:00:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 15:59:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 766d3a6e87003bda9ae7ff3f92e17b7fdced82aa
X-Git-Newrev: a0cadb45523f02cf987ef3a2b73343b601e59d22
X-Patchwork-Hint: ignore
Message-Id: <20260728140016.E671D8B410@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/p11-kit: explicitly enable or
 disable systemd units
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
Content-Type: multipart/mixed; boundary="===============8907602587181254552=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8907602587181254552==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a0cadb45523f02cf987ef3a2b73343b601e59d22
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The --with-systemd option controls only if systemd units are
installed, so there is no build time dependency. Disable systemd
unconditionally for the host package because Buildroot cannot and
should not install systemd units on the host.

Fixes host-p11-kit install error:

install: reguläre Datei '/usr/lib/systemd/user/p11-kit-server.socket' kann nicht angelegt werden: Keine Berechtigung
install: reguläre Datei '/usr/lib/systemd/user/p11-kit-server.service' kann nicht angelegt werden: Keine Berechtigung

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/p11-kit/p11-kit.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 4f4b76d543..60133223ce 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -44,13 +44,20 @@ P11_KIT_CONF_OPTS += \
 	--without-libtasn1
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+P11_KIT_CONF_OPTS += --with-systemd
+else
+P11_KIT_CONF_OPTS += --without-systemd
+endif
+
 HOST_P11_KIT_DEPENDENCIES = host-pkgconf
 
 HOST_P11_KIT_CONF_OPTS = \
 	--without-libffi \
 	--without-trust-paths \
 	--disable-trust-module \
-	--without-libtasn1
+	--without-libtasn1 \
+	--without-systemd
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))

--===============8907602587181254552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8907602587181254552==--
