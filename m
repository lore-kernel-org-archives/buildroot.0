Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D37EC5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D54C98130D;
	Fri, 31 Jul 2026 11:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_RtF31W_Dwm; Fri, 31 Jul 2026 11:58:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D89FD812CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499113;
	bh=qk5If2jxmienu4PXCRLusjnd4+nY4J1aEom8F26EwXg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RsMI7rfiVAPrQy01pHbxY2Hj7/A8PoaAmX+tnP5TLzosKdNXhy2fbWT6YE/Kz95we
	 Ph+PW6/+JH5wTm7bAcpQ5FK8bTHMB+Tcus54QxitTn0re3YXBv6TxFGszKihfHrUAw
	 PiwoRKPXPFzoFcvrRbSbWGE7mVTRTqEAbDUSGRdhwgayogty9xDVPIRJll0qW6vfF7
	 a4+s+FUnOakczYA1e1y1cW7zxOnyI1PlSP8Rw6s/ekYvhPTf3nNbh/RtzvQ5Tl3wja
	 Ylh294IzARPFs182g1+yobAYV7fwontgjyui+KBziu6kpeT23kgN5xOqDPqSqqkZpk
	 M6DpdYQJVotLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D89FD812CE;
	Fri, 31 Jul 2026 11:58:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 343B4197
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B1B640F87
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-gVngo5Vhaw for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DFC040FAB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DFC040FAB
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F38D68B743; Fri, 31 Jul 2026 11:57:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 12:19:07 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1048f55fa04a024ec5d00b3242a728ff97cb9244
X-Git-Newrev: bef982da4a9d9c6845abfb0af71ddb167998d4bf
X-Patchwork-Hint: ignore
Message-Id: <20260731115729.F38D68B743@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/ifupdown-scripts:
 add license info
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bef982da4a9d9c6845abfb0af71ddb167998d4bf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The package is part of Buildroot and thus under GPL-2.0-or-later
unless stated otherwise, as described in COPYING.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9b8a2d86336d8755730da741c59de72708c52653)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/ifupdown-scripts/ifupdown-scripts.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
index 5ef032142c..d7d5244ffc 100644
--- a/package/ifupdown-scripts/ifupdown-scripts.mk
+++ b/package/ifupdown-scripts/ifupdown-scripts.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+IFUPDOWN_SCRIPTS_LICENSE = GPL-2.0-or-later
+
 define IFUPDOWN_SCRIPTS_PREAMBLE
 	echo "# interface file auto-generated by buildroot" \
 		> $(TARGET_DIR)/etc/network/interfaces
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
