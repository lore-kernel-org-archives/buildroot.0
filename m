Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE81C4332F
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 16:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A3BD851C1;
	Thu,  2 Nov 2023 16:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A3BD851C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LB9m1GUqt6Bm; Thu,  2 Nov 2023 16:10:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50C5783906;
	Thu,  2 Nov 2023 16:10:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50C5783906
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EBBB1BF380
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 16:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC058485C2
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 16:09:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC058485C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-rzQlGi7zuC for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 16:09:42 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBE6F470D7
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 16:09:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBE6F470D7
Received: from unknown (HELO opfedv1rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 17:09:38 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Nov 2023 17:09:38 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 17:09:36 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Thu, 02 Nov 2023 17:09:34 +0100
X-IronPort-AV: E=Sophos;i="6.03,272,1694728800"; d="scan'208";a="61023273"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Thu, 2 Nov 2023 17:09:23 +0100
Message-ID: <243109e5e05b74bbf150d902a55625da4844564d.1698941362.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698941362.git.yann.morin@orange.com>
References: <cover.1698941362.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX505.corporate.adroot.infra.ftgroup
 (10.115.27.25) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1698941382; x=1730477382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YJ/TLQ9Js9rZQXlv7w5p60sLnIxG24CF5H2zpVYbttI=;
 b=lu7+Mfa9QkSX2NeJXfOJ+87q5g8K/r5MvvDDUV1xcjgZsk238RgVr1Qb
 XA2k5TgVMAmlVJVop/v76IX4DOLJIT2bdoC97M8cayv99Z95eLEClzFK9
 2/iWvvh5RA6+rgua0ScbGHb96eHMhYHWwZsb87FGFHLoA9P6NYQxAQaYr
 KEuQdZHvYVX8TMUP7sHdjlQ3iSJyzjNhS6y+cVWYr7o1fI47wbeP6AJ/B
 CaLFKn455zoA+mgBT3KG5wBLXihaOgws/2AQnjMeUUz4Ycc5MIz1WTKpp
 yWOMWNRsupIob1QAt23O59CiSVV1+DFHDeoZsxTla91OFuOSHIgrp4uA2
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=lu7+Mfa9
Subject: [Buildroot] [PATCH 4/8] package/pkg-golang: handle licensing terms
 for host-only packages
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

The licensing terms are inherited from the target variant to the host
variant: when the host _LICENSE is empty, then the value of the target
_LICENSE is used.

However, for the golang infra, we want to append a little blurb about
vendored depndencies. If the package is a host-only, then it would
inherit the target _LICENSE, i.e. the variable without the leading
HOST_. If that is defined, this is inherited in the generic-package part
of the infra, but in the golang infra, we saw an empty variable, and so
we would not add the vendoring blurb.

We can't move the condition appending that blurb, after we called into
the generic-package infra, otherwise in that case, we'd have the
opposite issue for packages that are both target and host packages,
where the blurb would be duplicated for host packages...

Instead, we workaround the issue by duplicating the heuristic to inherit
the target value, from the generic- into the golang-package infra.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/pkg-golang.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 1fa0b001e0..8e27602d41 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -91,6 +91,15 @@ $(2)_DL_ENV += \
 	GOPROXY=direct \
 	$$($(2)_GO_ENV)
 
+# Because we append vendored info, we can't rely on the values being empty
+# once we eventually get into the generic-package infra. So, we duplicate
+# the heuristics here
+ifndef $(2)_LICENSE
+  ifdef $(3)_LICENSE
+    $(2)_LICENSE = $$($(3)_LICENSE)
+  endif
+endif
+
 # Due to vendoring, it is pretty likely that not all licenses are
 # listed in <pkg>_LICENSE. If the license is unset, it is "unknown"
 # so adding unknowns to some unknown is still some other unkown,
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
