Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4B7F9D0EB
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E890384DBD;
	Tue, 14 Apr 2026 17:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQsEePqjNyYY; Tue, 14 Apr 2026 17:48:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEB2D84DC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776188938;
	bh=lIKmZx6iXu16yiCBb9F9YoOW4q0U2j4jV+22bsiRwcs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k/El9w2cDRynkgLh9wh1S5W/QTGI7NuloxePINtyj+h8EbMEXe2hYZKAlRtPPUgZi
	 sXNs3+ltxyAkKFUHx7ti6cClAkOZJZizHzotNuJoAcKKl4AI4t8tTsZ/GdIRFQ8z04
	 ptus8X62lgxXFqK0w/Mjzbnzr3jtig4S/rguY41JX45yO2U5RKe+IbLsEIqPBTFkG3
	 USZWXhfYCsGN8pUiZxRbaMOHb5W0DRkMwJsqfINIwuXShwdCirO+Hsskt+X1y9XJtl
	 fkIJfw+tIPSjvVPP6mDYtqZELkRqzuf1Y+it3FPyl4caoS+QYa3UUAJv+9lBjILooH
	 OCTjfRNemKqjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEB2D84DC0;
	Tue, 14 Apr 2026 17:48:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D663394
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D698542771
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ute8ABrd4ieM for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 495A94273C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 495A94273C
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFA117FB2D; Tue, 14 Apr 2026 17:48:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:12:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 073a8c5d27e259d74c6eb2ffab6f43c4cd0602d1
X-Git-Newrev: 59ae90f82385965c457ad31b484f8628345ec91a
X-Patchwork-Hint: ignore
Message-Id: <20260414174849.DFA117FB2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pound: remove optional support for
 pcre, keep pcre2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/59ae90f82385965c457ad31b484f8628345ec91a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pound/pound.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/pound/pound.mk b/package/pound/pound.mk
index 6ed2fc656d..6d00776752 100644
--- a/package/pound/pound.mk
+++ b/package/pound/pound.mk
@@ -19,9 +19,6 @@ POUND_CONF_OPTS += --enable-pcre=2
 POUND_CONF_ENV += \
 	ac_cv_path_PCRE2_CONFIG=$(STAGING_DIR)/usr/bin/pcre2-config
 POUND_DEPENDENCIES += pcre2
-else ifeq ($(BR2_PACKAGE_PCRE),y)
-POUND_CONF_OPTS += --enable-pcre=1
-POUND_DEPENDENCIES += pcre
 else
 POUND_CONF_OPTS += --disable-pcre
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
