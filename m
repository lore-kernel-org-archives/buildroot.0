Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAF6C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:22:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4C3D60EFF
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4C3D60EFF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55BFB4025D;
	Tue,  3 Aug 2021 22:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o4oI6zP5rRmZ; Tue,  3 Aug 2021 22:22:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10216400D4;
	Tue,  3 Aug 2021 22:22:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ABB5A1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C71A083AE1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EEjCgKsEcVud for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39B9283ADE
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 82EBE87407; Tue,  3 Aug 2021 21:10:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 22:08:26 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9a53e2810378fb255df0b5ec1d632a906b25a97f
X-Git-Newrev: 8b5ab83eb343a409df88af19a9074f1a6de50a2f
X-Patchwork-Hint: ignore
Message-Id: <20210803211019.82EBE87407@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openldap: add SELinux
 module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=8b5ab83eb343a409df88af19a9074f1a6de50a2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Support for openldap is added by the services/ldap module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openldap/openldap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 3b35b4daa3..daa409ae1d 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -10,6 +10,7 @@ OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-rel
 OPENLDAP_LICENSE = OpenLDAP Public License
 OPENLDAP_LICENSE_FILES = LICENSE
 OPENLDAP_CPE_ID_VENDOR = openldap
+OPENLDAP_SELINUX_MODULES = ldap
 OPENLDAP_INSTALL_STAGING = YES
 OPENLDAP_DEPENDENCIES = host-pkgconf
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
