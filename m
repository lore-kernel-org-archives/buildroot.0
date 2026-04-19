Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C24EA71A1
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 22:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40E0841042;
	Sun, 19 Apr 2026 22:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36dSWwxzhHwS; Sun, 19 Apr 2026 22:03:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B13BF41031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776636185;
	bh=1lfEgcm4z2N2DEOhOvR4kYZzqnj32VoyBAnQMQTd28I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XS9DKQm/pOKuzNRJ3VzKKNw01K7Ek3bWWPL7qCTAUcGfv3XKqBHD4ghq1bDce7+Hr
	 HG+ODoNf5+9BkboGstUx8oJh7ejc9DQiwnLxy/f+QXxACzJsEDHnnV6E3H9KshVOIn
	 iELczTw4uuhYbxSkpNjhD+nKjQ0QAMX1Pzp5IF9DJ5L3Q92bfiymVKVPq9bvgK5kjM
	 +RssKc75EjIVXYbQ+8Nq5X7psKk48MfPpbNJCmYvtql1K/54z4/XbEySnwU0Mxfaa4
	 E7/zSSuRAZc7ao7t604HT5iKWgPq+gkk4MXrys/5cSELpNCXj6vIqOf6KVIZ3Eg7/G
	 2Fhd+DyvraItQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B13BF41031;
	Sun, 19 Apr 2026 22:03:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 941D1259
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 22:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 827CA41031
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 22:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rcf5cSaGmxqt for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 22:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D231E4102F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D231E4102F
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 22:03:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8451C81F98; Sun, 19 Apr 2026 22:03:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Apr 2026 00:02:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a37d904419b1ab56c722c629184072709f54b499
X-Git-Newrev: 367f1c2ea2084aa3be415537c3c281753d491a5f
X-Patchwork-Hint: ignore
Message-Id: <20260419220302.8451C81F98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnl: enable host package variant
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/367f1c2ea2084aa3be415537c3c281753d491a5f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

host-libnl is needed for host-nfs-utils.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libnl/libnl.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index a0441b7835..b1254d2ba0 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -13,6 +13,8 @@ LIBNL_CPE_ID_VALID = YES
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf
 
+HOST_LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf
+
 ifeq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
 LIBNL_CONF_OPTS += --enable-cli
 else
@@ -27,3 +29,4 @@ LIBNL_CONF_OPTS += --disable-unit-tests
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
