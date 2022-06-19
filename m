Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA16CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6AC1E408E9;
	Sun, 19 Jun 2022 16:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AC1E408E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdR-PQn6Nj6o; Sun, 19 Jun 2022 16:00:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85148408EF;
	Sun, 19 Jun 2022 16:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85148408EF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D54CF1BF32D
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29F16813C7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 15:57:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29F16813C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BTXWLW7DaKYb for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 15:57:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F29F813CD
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 15:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F29F813CD
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0866D873C0; Sun, 19 Jun 2022 15:45:30 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 17:22:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 613ed4a6cce8b54be94aa7763955545475e3f335
X-Git-Newrev: b77ee6ce55455f5895502ada254909a00ff47944
X-Patchwork-Hint: ignore
Message-Id: <20220619154530.0866D873C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sofia-sip: add
 SOFIA_SIP_CPE_ID_VENDOR
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b77ee6ce55455f5895502ada254909a00ff47944
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:signalwire:sofia-sip is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asignalwire%3Asofia-sip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sofia-sip/sofia-sip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 2bac480542..c7698c9a11 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -10,6 +10,7 @@ SOFIA_SIP_INSTALL_STAGING = YES
 SOFIA_SIP_DEPENDENCIES = host-pkgconf
 SOFIA_SIP_LICENSE = LGPL-2.1+
 SOFIA_SIP_LICENSE_FILES = COPYING COPYRIGHTS
+SOFIA_SIP_CPE_ID_VENDOR = signalwire
 SOFIA_SIP_CONF_OPTS = --with-doxygen=no
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
