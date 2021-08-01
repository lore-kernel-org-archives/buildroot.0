Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EAFC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 13:58:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 000C2610A7
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 13:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 000C2610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7377832A9;
	Sun,  1 Aug 2021 13:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3_LSypOupb-Q; Sun,  1 Aug 2021 13:58:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAECE831C1;
	Sun,  1 Aug 2021 13:58:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E42581BF333
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 13:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAFC66074A
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 13:58:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TBHflppQJX5b for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 13:58:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0390606DF
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 13:58:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 99FAE8A46B; Sun,  1 Aug 2021 13:58:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 15:03:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2fea137f587761941ad5251c1ee09202bece25a
X-Git-Newrev: 21755a2a83759302f0a8e29426099032216ee524
X-Patchwork-Hint: ignore
Message-Id: <20210801135805.99FAE8A46B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: add SELinux module
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

commit: https://git.buildroot.net/buildroot/commit/?id=21755a2a83759302f0a8e29426099032216ee524
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Support for postgresql is added by the services/postgresql module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/postgresql/postgresql.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index cab5553805..143bcd895a 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -10,6 +10,7 @@ POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
 POSTGRESQL_LICENSE_FILES = COPYRIGHT
 POSTGRESQL_CPE_ID_VENDOR = postgresql
+POSTGRESQL_SELINUX_MODULES = postgresql
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 POSTGRESQL_CONF_ENV = \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
