Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BB7C5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E96E40A12;
	Fri,  7 Aug 2026 09:34:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 722za_VaoxeZ; Fri,  7 Aug 2026 09:34:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEBD540A0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095246;
	bh=GsHAl1MnxJyjr27KOp744AWeR4DGNAIYxAbMWPhW0nk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OsOI32FeYlbx/16mWVYR43+2yEwnmBHIQedrgwXudKYYdVJukpKXsSBwkxG43Pd02
	 4z0n5axKdq4Nb0RtxuCDfNUMvHcXUr6aqnTmHQEp/yiKyxsBCJqSGhLHfUGvQXb1uR
	 wsmlv0nm5h6vk9Kh7wvJtRjha64PySQOU7lsIKLpJae9fOUusWw07cyZqM31+xD8Dv
	 DWYN6gU4hbA+mksdDwRy5OvX1jlCRZ+HT37b+Lzd/DkNH0pXo3uzTWq60UiRzpf8Gu
	 seF/01nXdu95JJ7KNOmZsnKkZ/xLsrGxVsEdv3EFmo/ar1mwmdAml2jirASLT6QMAG
	 fz6OCFJFdAmgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEBD540A0B;
	Fri,  7 Aug 2026 09:34:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3075AD3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22F5E811F0
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ILb_G3zKEDg1 for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:33:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4491811D2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4491811D2
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:33:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 585978CA3F; Fri,  7 Aug 2026 09:32:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:08:00 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1f872daa313e3a9f8d3f1b25f21f5b23585ac3c6
X-Git-Newrev: a6506ec5a39e0a7b254c3795f2e63d2f7384ef02
X-Patchwork-Hint: ignore
Message-Id: <20260807093259.585978CA3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/p11-kit:
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
Content-Type: multipart/mixed; boundary="===============3197381481237428804=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3197381481237428804==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a6506ec5a39e0a7b254c3795f2e63d2f7384ef02
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index e8a8560ff9..c5ba392594 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -38,4 +38,10 @@ P11_KIT_CONF_OPTS += \
 	--without-libtasn1
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+P11_KIT_CONF_OPTS += --with-systemd
+else
+P11_KIT_CONF_OPTS += --without-systemd
+endif
+
 $(eval $(autotools-package))

--===============3197381481237428804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3197381481237428804==--
