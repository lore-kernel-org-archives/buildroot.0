Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB303CAC59A
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 17:33:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D38641345;
	Wed, 17 Sep 2025 17:33:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwGUEBFyEPGO; Wed, 17 Sep 2025 17:33:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C5EA41228
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C5EA41228;
	Wed, 17 Sep 2025 17:33:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8993C199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8401C41000
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ahbEKqnZCbVf for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 17:33:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 995AF4102C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 995AF4102C
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:33:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9548B856C2; Wed, 17 Sep 2025 17:33:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Sep 2025 19:32:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ac3c1de5643f6b2f3d6f118313517d50d746ff3
X-Git-Newrev: 843707ba1e4b51043cf4e068e52a36c54e510fe0
X-Patchwork-Hint: ignore
Message-Id: <20250917173332.9548B856C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/modsecurity2: fix deprecated CPE
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

commit: https://git.buildroot.net/buildroot/commit/?id=843707ba1e4b51043cf4e068e52a36c54e510fe0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CPE 'trustwave:modsecurity' has been deprecated in favour of
'owasp:modsecurity'.

See the following:
  - https://nvd.nist.gov/products/cpe/detail/B305D665-44EC-44A6-8C46-C68BFDAD7C38
  - https://nvd.nist.gov/vuln/detail/CVE-2025-48866

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/modsecurity2/modsecurity2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/modsecurity2/modsecurity2.mk b/package/modsecurity2/modsecurity2.mk
index b644fe7407..402ba6317b 100644
--- a/package/modsecurity2/modsecurity2.mk
+++ b/package/modsecurity2/modsecurity2.mk
@@ -9,7 +9,7 @@ MODSECURITY2_SOURCE = modsecurity-v$(MODSECURITY2_VERSION).tar.gz
 MODSECURITY2_SITE = https://github.com/owasp-modsecurity/ModSecurity/releases/download/v$(MODSECURITY2_VERSION)
 MODSECURITY2_LICENSE = Apache-2.0
 MODSECURITY2_LICENSE_FILES = LICENSE
-MODSECURITY2_CPE_ID_VENDOR = trustwave
+MODSECURITY2_CPE_ID_VENDOR = owasp
 MODSECURITY2_CPE_ID_PRODUCT = modsecurity
 MODSECURITY2_INSTALL_STAGING = YES
 MODSECURITY2_DEPENDENCIES = host-pkgconf apache libxml2 pcre2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
