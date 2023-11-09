Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8D6C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 16:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2DC60416EA;
	Thu,  9 Nov 2023 16:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DC60416EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vqVF2wgHNDiv; Thu,  9 Nov 2023 16:40:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5B7F41686;
	Thu,  9 Nov 2023 16:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5B7F41686
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A0D311BF418
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 16:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86EEB40351
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 16:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86EEB40351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XLMeowlZW-hm for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 16:40:02 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2506040321
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 16:40:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2506040321
Received: from unknown (HELO opfedv3rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 17:39:59 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Nov 2023 17:39:59 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 17:39:57 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Thu, 09 Nov 2023 17:39:57 +0100
X-IronPort-AV: E=Sophos;i="6.03,289,1694728800"; d="scan'208";a="64372297"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 9 Nov 2023 17:39:56 +0100
Message-ID: <876f3a7bb6a2375193fc8f06ab856d2449f83727.1699547993.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699547993.git.yann.morin@orange.com>
References: <cover.1699547993.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.52]
X-ClientProxiedBy: OPE16NORMBX502.corporate.adroot.infra.ftgroup
 (10.115.26.26) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1699548002; x=1731084002;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ARxe5LIWvSNjoOb/k0BqWRhOdrdA8+G2m7Idp0ME3Ro=;
 b=I6fRu9PZMIe1vjXPVtdMQ2w6qSKzRkscm3VZXXk1Tphv/DdkBizWyjwq
 2VNc0Z2pCjEraRL5/WykZy0s4vWM6Cc5c/9hNzJ8JnKkHsGZ+dDccHqJu
 yzpKd5GNr77yFHBBLjWJmc1EYFRmPKrz2ty4QTi0vw/qMk2ycQCTqecBH
 L86S91Ygz26SZCdwfyiUDzZdFDpJ01YO0ilXPYCfDGw5taaIkSsK6Rsoz
 A69S/w9hjcT1Xvp9tzU49VKIgPep+TWtHqn2tadT4NhiWQEeNxlZ50XR8
 yaqWZJqkslTt+nEy0srM/rUDHINLSZtrUS9LMlJu72nREMC3xKvNkgLdr
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=I6fRu9PZ
Subject: [Buildroot] [PATCH 1/2] package/pkg-golang: allow packages to
 provide extldflags
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
Cc: yann.morin@orange.com, Nathaniel Roach <nroach44@nroach44.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

For some packages, it may be necessary to pass extra extldflags. For
example, some packages will need to be able to specify what ld to use,
and so will need to pass -fuse-ld={bfd,gold} as extldflags.

Introduce FOO_EXTLDFLAGS, that packages can set to pass such flags.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Tested-by: Nathaniel Roach <nroach44@nroach44.id.au>
---
 docs/manual/adding-packages-golang.adoc | 6 ++++--
 package/pkg-golang.mk                   | 6 +++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/docs/manual/adding-packages-golang.adoc b/docs/manual/adding-packages-golang.adoc
index c952cde577..c238050096 100644
--- a/docs/manual/adding-packages-golang.adoc
+++ b/docs/manual/adding-packages-golang.adoc
@@ -84,8 +84,10 @@ therefore only use a few of them, or none.
   infrastructure will automatically generate a minimal +go.mod+ file
   in the package source tree if it doesn't exist.
 
-* +FOO_LDFLAGS+ and +FOO_TAGS+ can be used to pass respectively the
-  +LDFLAGS+ or the +TAGS+ to the +go+ build command.
+* +FOO_LDFLAGS+, +FOO_EXTLDFLAGS+, and +FOO_TAGS+ can be used to pass
+  respectively the go +LDFLAGS+ (via the `-ldflags` command line flag),
+  the external linker flags +EXTLDFLAGS+ (via the `-extldflags`
+  command line flag), or the +TAGS+ to the +go+ build command.
 
 * +FOO_BUILD_TARGETS+ can be used to pass the list of targets that
   should be built. If +FOO_BUILD_TARGETS+ is not specified, it
diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 8e27602d41..206688fa7b 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -114,10 +114,14 @@ ifndef $(2)_BUILD_CMDS
 ifeq ($(4),target)
 
 ifeq ($(BR2_STATIC_LIBS),y)
-$(2)_LDFLAGS += -extldflags '-static'
+$(2)_EXTLDFLAGS += -static
 $(2)_TAGS += osusergo netgo
 endif
 
+ifneq ($$($(2)_EXTLDFLAGS),)
+$(2)_LDFLAGS += -extldflags '$$($(2)_EXTLDFLAGS)'
+endif
+
 # Build package for target
 define $(2)_BUILD_CMDS
 	$$(foreach d,$$($(2)_BUILD_TARGETS),\
-- 
2.34.1

____________________________________________________________________________________________________________
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
