Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F681C6FA83
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 09:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A92CC418D5;
	Mon, 12 Sep 2022 09:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A92CC418D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1yFVLE70Wk_d; Mon, 12 Sep 2022 09:57:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F9DD40390;
	Mon, 12 Sep 2022 09:57:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F9DD40390
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 114771BF476
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 09:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0719844A1
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 09:57:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0719844A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id moqsnkgWkr24 for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 09:57:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3323C8449D
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3323C8449D
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 09:57:44 +0000 (UTC)
Received: from opfedar06.francetelecom.fr (unknown [xx.xx.xx.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar24.francetelecom.fr (ESMTP service) with ESMTPS id 4MR28P6hb6z5vVp; 
 Mon, 12 Sep 2022 11:57:41 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Mon, 12 Sep 2022 11:57:39 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 12 Sep 2022 11:57:39 +0200
Message-ID: <24827_1662976661_631F0295_24827_299_14_6f9b848a35cb9647b133c662924b4d82cf759b19.1662976659.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1662976661;
 bh=6GhMyogrYH46pe5UPbi49CbzKsllKu0RzH3a1hCvSB8=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=b8jRd91rTlFSe8I8LjpvHuwrE/RsRq5kmg8ix7KTUJBdju3S5eE6c7kL6pN3+JMMW
 l6YAbuycbYpoyi08oCcNQ7WHXy1hk0nEAs25h9DGbXDJ/eq0+ECKLUgNND/o9ETcMb
 QIvkQA9H8gpUnzFjWrce5xt2Rtfz0zIFkvrpNcZYepudsJTrlBIfiD3tRVHb1BVAP6
 He1rEEOlv+3a2IGlY5JPQI0BWUh0AeeqqU45bQIYjlAaGwKuEe+WRMQPWE+FUapy0j
 XabbSMNjZD7/FntdNXy3xjOOu92xrarhNFfVDJqrKd7u/i0RryyF9gVxjuU+d0xcJ0
 JoVP/LP15caNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=b8jRd91r
Subject: [Buildroot] [PATCH] package/mosquitto: add mosquitto group
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>,
 "Yann E. MORIN" <yann.morin@orange.com>, Francois Perrad <fperrad@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Since version 2.0.15, and upstream commit 71a90177d7b2 (Systemd: Add
mosquitto group ownership), mosquitto uses its own group rather than
the generic nobody group.

This means that mosauitto can now no longer start ona  systemd-based
system.

Change our mosquitto user definition to specify a mosquitto group.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouanchristophe@gmail.com>
Cc: Francois Perrad <fperrad@gmail.com>
---
 package/mosquitto/mosquitto.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index c47e61850b..12de2946b7 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -124,7 +124,7 @@ define MOSQUITTO_INSTALL_INIT_SYSTEMD
 endef
 
 define MOSQUITTO_USERS
-	mosquitto -1 nobody -1 * - - - Mosquitto user
+	mosquitto -1 mosquitto -1 * - - - Mosquitto user
 endef
 endif
 
-- 
2.25.1


_________________________________________________________________________________________________________________________

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
