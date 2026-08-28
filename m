Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7D0C61DD6
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 17:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFBF580F70;
	Fri, 28 Aug 2026 17:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqrDiu1Z4Faj; Fri, 28 Aug 2026 17:20:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787937617;
	bh=T4ljCtwdHvTyBw6dXcxGXnPG/GnvK6wnjxRRHJ/dgG0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Krz7Pvx7Rga05y9F1UYxsAXySoTqMjM/RBTvPHpYIZr5Y36Z6enUGT5X2KeFGkkxt
	 uTPlc/Ka1gxRjdePcA9SeUb663fVmibWGw6IBI3NoHm0neVqLR5zBpd257mqDYzl+W
	 a2MsdHRM6CVyJ7MYd0KR3q3SaIJtnVl2bi09aRcIUy7gCqQAW9GMAGZLOWo6QmSp7I
	 RTv/VtGJiOLSwUucVsOvQ/D83vNLBfYQp3fjEJ6FzuuanZCCMN/WedKx9KlQJaIhyX
	 6IfjB6+cXxBpthA/jbVeaUMvBfkF0+g8oLbLbi29sUxzXrFyBv8C2r58BQNVoTQZ98
	 qxPxN6ILDCeGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C500880F73;
	Fri, 28 Aug 2026 17:20:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D6A4E336
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 17:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C874640158
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 17:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkW2MsP_CIIb for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 17:20:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C09A140061
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 17:20:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 151C84E41407
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 17:20:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DFF0B60537
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 17:20:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 441D711C7835F; 
 Fri, 28 Aug 2026 19:20:09 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2026 19:20:00 +0200
Message-ID: <20260828172002.2364384-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828172002.2364384-1-thomas.petazzoni@bootlin.com>
References: <20260828172002.2364384-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/2] docs/website: patchwork is now at
 patchwork.buildroot.org
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

patchwork.buildroot.org used to be a redirect to patchwork.ozlabs.org,
but we are now running our own instance, so let's adjust the links in
the website accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/website/contribute.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/contribute.html b/docs/website/contribute.html
index c05bdda62d..8da371cf01 100644
--- a/docs/website/contribute.html
+++ b/docs/website/contribute.html
@@ -18,7 +18,7 @@
 	    autobuild failures</a></li>
 	<li>Reviewing and testing patches sent by other developers. See the
 	  <a href="https://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
-	  </a> or <a href="https://patchwork.ozlabs.org/project/buildroot/list/">
+	  </a> or <a href="https://patchwork.buildroot.org/project/buildroot/list/">
 	    patchwork</a>.</li>
 	<li>Working on items from the
 	  <a href="https://www.elinux.org/Buildroot#Todo_list">TODO list</a></li>
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
