Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84DEC433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 16:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30E0C408FA;
	Tue,  8 Mar 2022 16:53:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YcSDsZ3BQjru; Tue,  8 Mar 2022 16:53:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EFE87402B1;
	Tue,  8 Mar 2022 16:53:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6912B1BF344
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 16:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64B34402B1
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 16:53:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zx_xQ-Ivpns for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 16:53:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.39])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B50E400D7
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 16:53:15 +0000 (UTC)
Received: from opfedar07.francetelecom.fr (unknown [xx.xx.xx.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar26.francetelecom.fr (ESMTP service) with ESMTPS id 4KChGc6DZqzFpyk
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 17:53:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1646758392;
 bh=eBXvvILg6wxs6VklKmIHlSHcrHq11NDlotNfNzLnK6E=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=alQf2b0F04BpbcUEGEOX0hufXrxj2jlh9ZF3jEWFqrH3T8oWFGt2o8LFFss2tgOb6
 h38Gq+K/eHnIN1S9wz1yvttwfxLrZxroyWYKe6UaSX8QIHBLU7mhfSgrR7gOfcEHwi
 woyaz7OaTV41fGhVYxHxR+jawFaNQTPLScu6zGSJMsIeAICDzD3Flg3PHu5BQSYr3U
 cxlVfwcwkfTppnaE0PzClY2xcQ92fv/sxpFU0jna0whATbO+a/VxNU6ftftCPS0svr
 dmAyRJTQVQlzjPTdAucc0CNusTA3qKUU5pjcrWw55RImlXJ/DHn31s9N1VpOaXK+W+
 hxzhhiwuLAGxQ==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 08 Mar 2022 17:53:10 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 8 Mar 2022 17:53:10 +0100
Message-ID: <19532_1646758392_622789F8_19532_102_1_b2db850ee51822a3272be0f6984d2e53d73e790c.1646758134.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX301.corporate.adroot.infra.ftgroup
 (10.115.26.10) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH] package/pkg-golang: default to rawname to
 install binaries
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

The default currently is to rely on the package name to decide what to
build and install if not specified by tje caller. This works nice for
target packages, where a 'foo' package will by default build and
install a 'foo' executable.

However, for host packages, that will build and install a 'host-foo'
exzcutable, which is not really, even really not, what would be
expected.

We fix that by using the package raw name, i.e. the package name with
the host- prefix yanked away.

It is very improbable that there already have many host-golang packages
in the wild (in br2-external trees), but if there are, they would
forcibly define those variables to a sane value. This change is not
incompatible, as the values provided by packages take precendence; it's
just that those packages now carry superfluous, if innocuous, variable
assignments.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/pkg-golang.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 0cb2ed73cc..0b3dc3d32f 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -59,10 +59,10 @@ $(2)_BUILD_TARGETS ?= .
 # been specified, we assume that the binaries to be produced are named
 # after each build target building them (below in <pkg>_BUILD_CMDS).
 ifeq ($$($(2)_BUILD_TARGETS),.)
-$(2)_BIN_NAME ?= $(1)
+$(2)_BIN_NAME ?= $$($(2)_RAWNAME)
 endif
 
-$(2)_INSTALL_BINS ?= $(1)
+$(2)_INSTALL_BINS ?= $$($(2)_RAWNAME)
 
 # Source files in Go usually use an import path resolved around
 # domain/vendor/software. We infer domain/vendor/software from the upstream URL
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
