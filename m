Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6119AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 17:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC00941DDF;
	Sun, 12 Dec 2021 17:49:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KvLVTfCQd0TP; Sun, 12 Dec 2021 17:49:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18C68400CD;
	Sun, 12 Dec 2021 17:49:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 291151BF40E
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:49:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 157CC85150
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 17:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hKTlNXxnjIbN for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 17:49:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 200888514E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 17:49:34 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 133so10478782wme.0
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 09:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kzP8efAdcBBo45eiDw9ah8jRlJEhrMckJhUm6ls0C0s=;
 b=IKNS48Vht+kbaJRSrcLhqwJzPfV8B5h5wZDVZ7gGXywPyQ6tOv/AlbLpVIZY6gfNb2
 8+/ON1u0yMhtqlkv+G13xCAdWMxANakT2+RvKoCO8BmC7KJUAAgCje8ZlzRnEY9jvrTS
 2aJ5P99pol7Cqh43nJ+iqm8NLqRqWmBIlwUX2V1XzD2nZePrqKRlOylEB9Z4dzjd53Lc
 Bu9rwdrAZSTYgAB3Dvif7481+DFnS8YI/w6pNEeP3FDurORwf9qpgpssTB3F3bS/Njdy
 GUHmgi5l9fXF5zgReKrkfnQMmiGrm2BP92uhb+kb/pJdyAfaALlG126/yzYjXFlCKhWZ
 1I2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kzP8efAdcBBo45eiDw9ah8jRlJEhrMckJhUm6ls0C0s=;
 b=3ufF1UixBa+rp5fhdaASOqdR0OCdpnk4i+EzuiwBn/u2gr7AdGocSmMc5yQD6MUIw2
 y7fKTfFx45LbmCO2YKgUfKzHXR1QVoV4k3F2CqyuYfsLCKVzeKKBap728WOHhx/WFZYv
 v5nWcpn6rCOuB+r7b0IFrBILMTBjYz1Xk7BtXUNNybToJvv0EVK0eD1dFpYrjt4kSErO
 0pHTho7APE/bN4d9nlA73bFShHA/Kk7r/V2P+dZZfmMnEPlJrb9gONkVUNi3/zSARbnE
 VOW65lsXMGyXdCAbvB1wabQXFWqMBl5PDRxhe1rzvOOEK9Zvl+pS/ctbmSs7Wh2LtwoT
 kR6Q==
X-Gm-Message-State: AOAM532UjQTNGygMMIB5OblzmImWPjrnElHM8BZr2ajImreyMZMTEvRV
 D/v62qUvMajcQVYTN8v4CSM7SLIWVOHejg==
X-Google-Smtp-Source: ABdhPJzAcHZpqARjDc6v7NTPNqx88tET1ZgBmAZUBFvAeJYxSmtxStjby9jwcIiJFz6HZV7rUzu++A==
X-Received: by 2002:a1c:a5c3:: with SMTP id o186mr32258686wme.63.1639331373130; 
 Sun, 12 Dec 2021 09:49:33 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id g13sm4541188wmk.37.2021.12.12.09.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 09:49:32 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 18:49:22 +0100
Message-Id: <20211212174922.668065-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mutt: bump to version 2.1.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Mutt 2.1.4 was released on December 11, 2021. This is a bug-fix release,
fixing a performance issue when used with DavMail.

Mutt 2.1.3 was released on September 10, 2021. This is a bug-fix
release, fixing some of the fixes in the last release. IMAP and
QRESYNC users are advised to upgrade.

Mutt 2.1.2 was released on August 24, 2021. This is an important bug-fix
release, fixing a potential data-loss IMAP bug, a couple QRESYNC bugs,
and a few other issues. IMAP users are strongly advised to upgrade.

http://www.mutt.org
https://gitlab.com/muttmua/mutt/-/blob/mutt-2-1-4-rel/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 1b58c50065..dceae57b65 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4ae6d60f7f19854c375cc1c27b5768b71e9f450c2adc10c22e45de8a27de524a  mutt-2.1.1.tar.gz
+sha256  3361b682ea23df88961fa9835196698aefd2ebf0aba494599b29d1c4b1b4db79  mutt-2.1.4.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 66616f032c..44d7864eb6 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.1.1
+MUTT_VERSION = 2.1.4
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
