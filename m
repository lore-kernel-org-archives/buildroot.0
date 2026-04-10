Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AC7F9D0D5
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0B2E42AF5;
	Tue, 14 Apr 2026 15:42:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nRv8NXftNk-w; Tue, 14 Apr 2026 15:42:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2F1542AF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181360;
	bh=I0mj2uZbPji3h7YYUX+2vYB3bthoN6GslKW5meGPceo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=owglkqjXqXHNW5WAuxfizlMCQ73JGCGz+OrS3WUT9spkfRMaYtpPkQbDPkyLNfjQx
	 PKac19zdPJ6zvwjYHi6CljtCnmdjjCSBgR2e+BX4waM5aEhG4RevWyHRIXmyjZ/d6t
	 SwuscZ2dSO/5bhsY7JMtpYf7mReLdwWGoCKM6zLzg3+JwMOieWI7WA/y9DvtzbzT1I
	 Yhw6QLq+GuTrR5B/Hnw/UhxaUWCBWP9NaN7OTcVB5yTvx7fSHhqnjlp2xkvEWCVJsS
	 vBp6e9eaPYEB9QzV4FiJOhB6Ei1GMqE/xN7GbHCvQgcq8vleIviC+jts8xD0GbSG7E
	 guX0p9yu4N08g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2F1542AF2;
	Tue, 14 Apr 2026 15:42:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B23E5283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A723584D49
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4rRp1y8BDi0G for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9E3284D45
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9E3284D45
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C357814AA; Tue, 14 Apr 2026 15:42:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 14:09:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ab82eabbaff37dc7d109420762bc4e3e47895558
X-Git-Newrev: d8f459d4c2d01763f75ee7ca684d7904f58827d4
X-Patchwork-Hint: ignore
Message-Id: <20260414154237.5C357814AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/freeradius-server: remove redundant pcre dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d8f459d4c2d01763f75ee7ca684d7904f58827d4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Buildroot commit 736c4c1655d93652a9a7e79235bbe726b3d46176 added the
package with two identical code blocks dealing with the dependency to
pcre:

https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/package/freeradius-server/freeradius-server.mk#L161
https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/package/freeradius-server/freeradius-server.mk#L218

Remove one of these code blocks.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6c3a015a5e12f8027c926d81d506f0d63012d104)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freeradius-server/freeradius-server.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 9bb5c3606a..bb3aaa1177 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -215,13 +215,6 @@ FREERADIUS_SERVER_CONF_OPTS += \
 	--without-rlm_eap_pwd
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
-FREERADIUS_SERVER_CONF_OPTS += --with-pcre
-FREERADIUS_SERVER_DEPENDENCIES += pcre
-else
-FREERADIUS_SERVER_CONF_OPTS += --without-pcre
-endif
-
 ifeq ($(BR2_PACKAGE_RUBY),y)
 FREERADIUS_SERVER_CONF_OPTS += --with-rlm_ruby
 FREERADIUS_SERVER_DEPENDENCIES += ruby
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
