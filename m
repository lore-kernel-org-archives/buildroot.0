Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED468CD6E55
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 08:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8814442A18;
	Sun, 31 May 2026 08:29:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t9Q_XYOsoP_k; Sun, 31 May 2026 08:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3B3642A1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780216173;
	bh=NFAaGEZ5rAMkW0sb5ksCstmYZORQGax5FFOJKkKhDVg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j6bW7HLzjmUMG0AUEvwzIbuNR8+DqnvDBrz6BFdzJ/L0yXuAnMCl84GnWvWATWI4u
	 jH3EO+n84zc8exLE/w7srT8lRWquY8H+rMfZN0esb1SlbRVSbd5bNBLn6vvHYSNHFe
	 LSkTIpoaUJXTxLGcrNUfMJuVcl0yC4MXOYXP/0CHIrOfbSBx5YsJ1GllFmtvPuYwt/
	 TJlQKahUGA/ZJSU7ZFKzy0ijhs/X7ZacJp2iVHtH+OcHk+udcta9oGUfBTOXa+ZrUr
	 uNPpgzjPixkjXbyYnpsm8ESoLpn5zQaL9ZMm4SydHmix+zPh3NU+LWXaWyDqKutv/9
	 VOXgo2WMAlegQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3B3642A1B;
	Sun, 31 May 2026 08:29:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62785257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 08:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46E948122B
 for <buildroot@buildroot.org>; Sun, 31 May 2026 08:29:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1vHuBJYgmjro for <buildroot@buildroot.org>;
 Sun, 31 May 2026 08:29:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B18C81227
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B18C81227
 for <buildroot@buildroot.org>; Sun, 31 May 2026 08:29:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E097F876AB; Sun, 31 May 2026 08:29:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 10:15:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e136494e918090296284214ca06736e2dafb83fe
X-Git-Newrev: 45789c73b138c3a3b2212d1a1da314630d42b8a6
X-Patchwork-Hint: ignore
Message-Id: <20260531082914.E097F876AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: use regular $(RM) to
 remove directory
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/45789c73b138c3a3b2212d1a1da314630d42b8a6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Using '$(Q)rm -rf' is not the typical thing we do in Buildroot, we
more commonly use '$(RM) -rf'.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qt6/qt6base/qt6base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 3bf4a1221b..5c939568ae 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -427,7 +427,7 @@ QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
 endif
 
 define QT6BASE_RM_USR_MKSPECS
-	$(Q)rm -rf $(TARGET_DIR)/usr/mkspecs
+	$(RM) -rf $(TARGET_DIR)/usr/mkspecs
 endef
 QT6BASE_TARGET_FINALIZE_HOOKS += QT6BASE_RM_USR_MKSPECS
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
