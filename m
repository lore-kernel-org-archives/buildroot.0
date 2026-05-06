Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E9DCD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 12:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E03EF822FF;
	Wed,  6 May 2026 12:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBSRhAbSCyRn; Wed,  6 May 2026 12:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1298182236
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778069013;
	bh=P7ZzALw7eF18K33ff4t8crdV64U/M32esCxnjEYi4BQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FsGI2tHoqgGjK+UMc23Q/GJlRcNhMalGjLUsQiw95nhBFxnuNYV3USvy4ISbg1AGn
	 qtldASoaDODmi4iNTNajpKYh7CKrVqsKSUIRf1zUuTHqHWA34ARqJTKCVagpV02TFe
	 jFuh2LOtToJvmj5Wg+7MAo9115inlaSh+3vXRlRq95+amylIrm7Su54+OAZqwILNHJ
	 tz1XSj31whd0u9hHlOIPyjxXT/TtNmEs6Wtg65LeNcvHE/3RG6Bx79gU9QKCAg36wD
	 pVZ/eGX5prTJidRqT6SKeIy5Wk+C7Puip39Q6KpYCYlZfHd1FguCh8Pxbd5dvYLADe
	 0bctM+jb0ujgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1298182236;
	Wed,  6 May 2026 12:03:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E491911B
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5E5E40DEB
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:03:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8bXm9b98Lfn for <buildroot@buildroot.org>;
 Wed,  6 May 2026 12:03:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B34D940DD3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B34D940DD3
 for <buildroot@buildroot.org>; Wed,  6 May 2026 12:03:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73FB2847A6; Wed,  6 May 2026 12:03:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 May 2026 13:59:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6cd936b8e72cf26a6024a8ecfa23345bbb22a608
X-Git-Newrev: 5af981a6727bb4a5e984c86556ec674e525db218
X-Patchwork-Hint: ignore
Message-Id: <20260506120329.73FB2847A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: install systemd service files
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4685727361452196081=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4685727361452196081==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5af981a6727bb4a5e984c86556ec674e525db218
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The FRR package currently only installs systemv services files. The
upstream package also provides a systemd service file and a service
template file. Install those when systemd is selected as an init
manager.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/frr/frr.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 61a34de4d3..c5a12f6992 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -131,5 +131,12 @@ define FRR_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50frr
 endef
 
+define FRR_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 $(@D)/tools/frr.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/frr.service
+	$(INSTALL) -D -m 644 $(@D)/tools/frr@.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/frr@.service
+endef
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))

--===============4685727361452196081==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4685727361452196081==--
