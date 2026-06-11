Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03990CD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD20441082;
	Fri, 12 Jun 2026 11:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7lNJ5XgmBBL; Fri, 12 Jun 2026 11:22:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E450C41110
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263347;
	bh=afYYIZDR+pSmuy58ke9yZgfz2Kh9aKilXR/XJKmWAQs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FKb/5ZxPf9ffDyLCs/SS/nG/QEsM+IViXHRGDlupMuQyOBy/d3S32w7hcTJvpksMD
	 XjAc4CRJJe+sCXCGrJVosrdH3tkQesi5nDy70eVVJNxSigOuco9GR6HNFDQojqquWf
	 wwA1rONj/ePwbytbeRkhUyY39J3+O5ygzTjnNPuqRUbOpgfncLJSkvVFUv6ccQOOhD
	 b6Wtz64eY8AuLepFqRG/y72ebkSk8fx3v6ydA+9SAEzc/jP0/jg9W2TsmJnwPrcDQQ
	 g9s0hL7nhcHUE5MbhIzwIZh/ZEkhW8aIitiIucSJkIDctJy/QsAfLT/H/pJ1Lf0AgM
	 HvEsa6jd6+NLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E450C41110;
	Fri, 12 Jun 2026 11:22:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4455D321
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2854F4065E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OfZ7Rq3uCmRx for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B9FE40148
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B9FE40148
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23F8C880D5; Fri, 12 Jun 2026 11:22:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 10:05:49 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 36067ebde25a1dfd4724d278baded0ae84a3faf0
X-Git-Newrev: c6c6ec9aa2a33b4b4ce89a568bb2c6f9f40d275b
X-Patchwork-Hint: ignore
Message-Id: <20260612112203.23F8C880D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libmodsecurity:
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c6c6ec9aa2a33b4b4ce89a568bb2c6f9f40d275b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
