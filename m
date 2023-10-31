Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1EDC4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 13:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2ECB418E6;
	Tue, 31 Oct 2023 13:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2ECB418E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GYM5EY_5rGrc; Tue, 31 Oct 2023 13:40:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC16D41802;
	Tue, 31 Oct 2023 13:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC16D41802
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1B2D1BF2C2
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 13:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A8BA61340
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 13:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A8BA61340
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pexh7qj5198x for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 13:40:43 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1EB406133F
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 13:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EB406133F
Received: from unknown (HELO opfedv3rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 14:40:40 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 31 Oct 2023 14:40:40 +0100
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 14:40:38 +0100
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 31 Oct 2023 14:40:38 +0100
X-IronPort-AV: E=Sophos;i="6.03,265,1694728800"; d="scan'208";a="60249085"
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 31 Oct 2023 14:40:38 +0100
Message-ID: <5f5d6e6dbfc89ca509f3d73154d7e31d1b6659b5.1698759638.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX207.corporate.adroot.infra.ftgroup (10.115.27.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1698759643; x=1730295643;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ghFCWMFcGa2HO143LbFi0KfbeqXjMqXHfvFPJkcH9ag=;
 b=IRVKIe+x2zwg4bQULKPxAEohfD3ykahniJgIuvV6cmtvx+otQDF4tUwf
 Z+tkaAsk++y/3F1vOH1z6diDW3gOHFkQJDqkoXU4PmzXw6yCNN617H133
 su1oNlWepgWPh8N/gFETN5nZi/cNHiPtvKkx8QBst87JL2KHnjUaxKtzy
 0uORTXacEzNQbYghgCztaWOycjVfuw2snqbOcYiZyWYes3F6A4ECAWpMj
 pRsVrylHlpSbTwJwK9+l9uNGFDAq+nlqN/dwSWf7Jh5C5ZmTclwR+k3y6
 OQFnFXuwWJCDYajefGIunMz0XFJv6rteEmdTtvNAAANf5aXPDsZ5/WCh5
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=IRVKIe+x
Subject: [Buildroot] [PATCH] .editorconfig: add editor-agnostic configuration
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

EditorConfig [0] is an editor-agnostic configuration file, to set
preferences on how to edit text: tabs vs. spaces, tab width, indentation
size, line endings...

A large number of editors support EditorConfig, either natively [1] or
with the help of plugins [2].

Add a basic .editorconfig that provides defaults for most of the files
used by Buildroot. More can be added in the future if we can find more
matching patterns.

The values are chosen a bit arbitrarily, unless we already have a
(un)written rule about it. Notably, indentation defaults to using 4
spaces, and only a set of files for which we require TABs (Makefile,
essentially) or have already settled for TABs (Kconfig files, init
scripts...) are configured so. The traditional width of TABs is 8 char,
and we pair TAB indentation with TAB size.

Trailing spaces are usually useless, except in asciidoc source where
they can be used to force a new line without a new paragraph.

One of the limitations of .editorconfig, tough, is that it matches on
filenames (e.g. *.py), not on the content (e.g. no use of mimetype, or
libmagic, or such). Still, this is enough to cover a lot of files in
Buildroot.

[0] https://editorconfig.org/
[1] https://editorconfig.org/#pre-installed
[2] https://editorconfig.org/#download

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 .editorconfig | 29 +++++++++++++++++++++++++++++
 DEVELOPERS    |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 .editorconfig

diff --git a/.editorconfig b/.editorconfig
new file mode 100644
index 0000000000..4acaf3486b
--- /dev/null
+++ b/.editorconfig
@@ -0,0 +1,29 @@
+root = true
+
+[*]
+charset = utf-8
+end_of_line = lf
+indent_style = space
+indent_size = 4
+tab_width = 8
+trim_trailing_whitespace = true
+insert_final_newline = true
+
+[DEVELOPERS]
+indent_style = tab
+indent_size = tab
+
+[{Config*.in*,linux/Config.ext.in}]
+indent_style = tab
+indent_size = tab
+
+[{Makefile*,*.mk}]
+indent_style = tab
+indent_size = tab
+
+[S{0..9}{0..9}*]
+indent_style = tab
+indent_size = tab
+
+[*.adoc]
+trim_trailing_whitespace = false
diff --git a/DEVELOPERS b/DEVELOPERS
index 57015e245e..e180755fe4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3169,6 +3169,7 @@ F:	package/zisofs-tools/
 F:	support/download/
 
 N:	Yann E. MORIN <yann.morin@orange.com>
+F:	.editorconfig
 F:	package/gpsd/
 
 N:	Yegor Yefremov <yegorslists@googlemail.com>
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
