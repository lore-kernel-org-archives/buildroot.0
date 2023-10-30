Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07702C4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 09:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A66054F549;
	Mon, 30 Oct 2023 09:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A66054F549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KQb7mErzDv6j; Mon, 30 Oct 2023 09:23:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A049E4F54B;
	Mon, 30 Oct 2023 09:23:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A049E4F54B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98F7B1BF37A
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 09:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70D154F531
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 09:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70D154F531
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dHqd2f0d-9ph for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 09:22:55 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EF9E4F52A
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 09:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EF9E4F52A
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 10:22:52 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Oct 2023 10:22:52 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 10:22:50 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Mon, 30 Oct 2023 10:22:50 +0100
X-IronPort-AV: E=Sophos;i="6.03,263,1694728800"; d="scan'208";a="59335040"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 30 Oct 2023 10:22:49 +0100
Message-ID: <d8f84ccfa3285d30e3b4195b7ea0ddffb18c6512.1698657764.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698657764.git.yann.morin@orange.com>
References: <cover.1698657764.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX403.corporate.adroot.infra.ftgroup
 (10.115.26.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1698657775; x=1730193775;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NoUqHZMcm16tlSTz7W6D+Qg17RJx6sGxI6KZxYJIHxU=;
 b=Dda/YA1CA+/NFgRmpt9FFjrDJ3avy1/7ubUTlVBj5z5Irh3hQSIps+cy
 oQNwswUm98PWaSI+dOBTVMnRukUGXxpJ2qnQpWfEeEJ1PYzbQAPXqkos8
 w4VSEoSa1TFb627cxZUnV+nzgq6nWhJQU7RoImiJGkvczYZNsxbBLkeGo
 i6ddBA85Kzb32RXQaSUGC9nZF/eKui+mL4d89PxE0gxl+zb5vVrUbNmTm
 QoyHA+wD/0BCFt8HLn4RAYPI91lXCR4ASYDVhZY30Rx1HpwXXLvvqzR8d
 l55WazqSFZsIN081AF6F/AhpzY0tqEuPXV1VuXh5TL4W0r4Ti+38mH73t
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=Dda/YA1C
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
Cc: yann.morin@orange.com
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
index 7ba82284f3..ba49ce153e 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -101,10 +101,14 @@ ifndef $(2)_BUILD_CMDS
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
