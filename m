Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE18CD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1EA460F30;
	Fri, 12 Jun 2026 11:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PUC4lPx7muCz; Fri, 12 Jun 2026 11:24:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63D4760F96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263451;
	bh=vkQQ8Nwov58roHZMPJdcd3t1/KXbnqn4+ZYK0U38ORE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gvBpg/JqqJVlnj9MnIh/LvfDX5iel3O3abkfri6kPiJ2CgnbYvgAzC5Qu6m9WEsFC
	 x/9vQ0l7TAAW2a07/PkGktk4B7pDpKCLDPKKZp5JWvMEc5o9YrL7v8cZodRrMyfaeb
	 ix3ISypiA9X9be23GCdqUznFoCksum6OyW38bmy0Aara0kS7mme0R5owg9GpGbIh1D
	 s5IusXSRAw1TlFs7Gw9qDlSPPfVE5++I7DR4zx8lt09jcA+HzmS0qEAVmXW+kgpjyF
	 T6GmxERDJqghAeWtZfJ/bl6ga8TyHWdbuoqI76+olWrGT9jUaKksqWeNTbn0W4wDqH
	 tz3angAZCiCMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63D4760F96;
	Fri, 12 Jun 2026 11:24:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2944A321
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C16B8329E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCHMc077DkpR for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47D8E82CC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47D8E82CC7
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1494E880E9; Fri, 12 Jun 2026 11:23:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:05:52 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 9191420db7666b898a325f8cd6d510fa0485a4ae
X-Git-Newrev: dd2469fa708256ae7a3380c0cda256fc57e892fb
X-Patchwork-Hint: ignore
Message-Id: <20260612112349.1494E880E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libmodsecurity:
 needs host-pkgconf
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dd2469fa708256ae7a3380c0cda256fc57e892fb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The configure script was regenerated for the 3.0.15 release but it now
error out if pkg-config is missing.

Add host-pkgconf in build dependency.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/14607335870 (TestNginxModsecurity)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit db75a8eea0bda678e651fe2b2ba85c3e0b2bed31)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libmodsecurity/libmodsecurity.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index c06d890979..8920cb012e 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -13,7 +13,7 @@ LIBMODSECURITY_LICENSE_FILES = LICENSE
 LIBMODSECURITY_CPE_ID_VENDOR = trustwave
 LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
 
-LIBMODSECURITY_DEPENDENCIES = pcre2
+LIBMODSECURITY_DEPENDENCIES = pcre2 host-pkgconf
 LIBMODSECURITY_CONF_OPTS = \
 	--without-pcre \
 	--with-pcre2="$(STAGING_DIR)/usr" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
