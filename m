Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09344C5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD6C281204;
	Fri,  7 Aug 2026 09:35:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tIRJi1PyPJQY; Fri,  7 Aug 2026 09:35:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB6D181205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095350;
	bh=/7vlUZAgh1crupYxaz+nQf5wy2lcjOUcUoZiZXQJbuw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PlKg3r8HNHSjQZesirsWH07MxP+GBpwIA1N2S8QRWXqf3dee+i3bFA9y03xSNb7ft
	 13szX8ts11c7NRPlfB70eEYEzTajXZSJeci/WdJQ3c/ue0idrQD1xNb3geY76QDTBc
	 LgH2XvNklK63HVQmwm4lebB0Qt1Qq8psSZGQ71G1MJKHetViqcJauV0Qht8rRfbdan
	 MfegoV6MfaE2J+7k4+LwAx+rPGY3WG3WiOdvj010kj7Gfap72QMrvwwkj8AhJazZfI
	 PlQUwHVW4qaOyjjPSpFjKYcO7uqpiQdlm1BMbxAOrnCsdTZ6L7Rj4zerE277QMw9wj
	 WNDMaAnwZd82A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB6D181205;
	Fri,  7 Aug 2026 09:35:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AC7E282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CF53409FB
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYmTtAB6SnVI for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77CD8409FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77CD8409FC
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00C908CA40; Fri,  7 Aug 2026 09:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:12:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 65d1b94830b1448b93c7c71d2a9556800000a886
X-Git-Newrev: fd9dea7f80d57e842649d42a9cd61cfa0ea98a46
X-Patchwork-Hint: ignore
Message-Id: <20260807093442.00C908CA40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/p11-kit:
 explicitly enable or disable systemd units
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
Content-Type: multipart/mixed; boundary="===============6893631968579585420=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6893631968579585420==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fd9dea7f80d57e842649d42a9cd61cfa0ea98a46
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

The --with-systemd option controls only if systemd units are
installed, so there is no build time dependency. Disable systemd
unconditionally for the host package because Buildroot cannot and
should not install systemd units on the host.

Fixes host-p11-kit install error:

install: reguläre Datei '/usr/lib/systemd/user/p11-kit-server.socket' kann nicht angelegt werden: Keine Berechtigung
install: reguläre Datei '/usr/lib/systemd/user/p11-kit-server.service' kann nicht angelegt werden: Keine Berechtigung

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a0cadb45523f02cf987ef3a2b73343b601e59d22)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/p11-kit/p11-kit.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 68b1894183..9292b2f038 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -44,4 +44,10 @@ P11_KIT_CONF_OPTS += \
 	--without-libtasn1
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+P11_KIT_CONF_OPTS += --with-systemd
+else
+P11_KIT_CONF_OPTS += --without-systemd
+endif
+
 $(eval $(autotools-package))

--===============6893631968579585420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6893631968579585420==--
