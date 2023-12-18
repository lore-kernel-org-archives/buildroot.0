Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A8FC35274
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 08:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BDD4405B2;
	Mon, 18 Dec 2023 08:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BDD4405B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NSF9-U4eLAhE; Mon, 18 Dec 2023 08:26:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69FD2405B5;
	Mon, 18 Dec 2023 08:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69FD2405B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 237511BF86B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08B9D60E27
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 08:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08B9D60E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AxBV9jvVnm4X for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 08:26:19 +0000 (UTC)
X-Greylist: delayed 430 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 18 Dec 2023 08:26:19 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52EF060D7B
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52EF060D7B
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 08:26:19 +0000 (UTC)
Received: from unknown (HELO opfedv3rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2023 09:19:06 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Dec 2023 09:19:05 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Dec 2023 09:19:04 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Mon, 18 Dec 2023 09:19:03 +0100
X-IronPort-AV: E=Sophos;i="6.04,284,1695679200"; d="scan'208";a="81565093"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 18 Dec 2023 09:19:03 +0100
Message-ID: <01cce88291ac132ca8c881eaaaf3b02a4efa68a9.1702887543.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.50]
X-ClientProxiedBy: OPE16NORMBX401.corporate.adroot.infra.ftgroup
 (10.115.26.14) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1702887979; x=1734423979;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hgOOb5taxZPB0Kp5Z/k9q/wYFwyU/qynbk1do994c4s=;
 b=Zk7ge8O7jE3JygYPW1anfEf+w19s2eVKr6SDQO9KkwP/gFTI34Bi6ouA
 Ex6KFtxSnJENRc8W9boJQmmFvgvqDF7Iw3Cyh5r0tqvp+/CErrf10NjtE
 BUuuStTjTrnM5qXpAazOLTLMjmoijzABeijYXvY3OM9UP+RINAvnJmNkF
 Bgat5YCf+gswMELay5Qi+Qi4B16GzcpBGgqybWwpjeDQYKh1dKf8iOqwm
 8CiRmwOuhI4ScET5bi4+BM0PrGHTHM59mtfepjQl854zNVG05f6JQwvfA
 AdLs6biX6+ICFtO4ZgrG37sObfdQs5Kg80DOq7KGFNS43ZOKkTdas69A1
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=Zk7ge8O7
Subject: [Buildroot] [PATCH] editorconfig: fix wildcard expansion
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

It turns out that wildcard expansion, * and ?, is not performed in
matching lists {...}, at least in the vim plugin. The spec is not clear
about that, but refer to "pattern matching through Unix shell-style
wildcards" [0].

So, let's consider that this is not supported. Expand the patterns into
one section each, rather than use a list.

[0] https://spec.editorconfig.org/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 .editorconfig | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/.editorconfig b/.editorconfig
index 4acaf3486b..af6cf4b449 100644
--- a/.editorconfig
+++ b/.editorconfig
@@ -13,11 +13,19 @@ insert_final_newline = true
 indent_style = tab
 indent_size = tab
 
-[{Config*.in*,linux/Config.ext.in}]
+[Config*.in*]
 indent_style = tab
 indent_size = tab
 
-[{Makefile*,*.mk}]
+[linux/Config.ext.in]
+indent_style = tab
+indent_size = tab
+
+[Makefile*]
+indent_style = tab
+indent_size = tab
+
+[*.mk]
 indent_style = tab
 indent_size = tab
 
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
