Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A25C61DA4
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 18:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A583441624;
	Mon, 13 Mar 2023 18:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A583441624
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ST12fxr-srl5; Mon, 13 Mar 2023 18:23:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3A0540351;
	Mon, 13 Mar 2023 18:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3A0540351
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E56BA1BF365
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 18:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE98840351
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 18:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE98840351
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eWx8uPbUws2T for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 18:23:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0876402B8
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0876402B8
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 18:23:40 +0000 (UTC)
Received: from localhost.localdomain ([84.33.142.131])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bmpcpzyqM5klVbmpcpvT0f; Mon, 13 Mar 2023 19:23:36 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 13 Mar 2023 19:23:34 +0100
Message-Id: <20230313182334.1070733-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFav74005xrU6saWjZdBA8qNe8v7fi6yF7DL6FPJPPa6eybCt7vyUIrdl1SRn1RjmuVHMDUuq38Hk33AluL2JMjpVhNV2WQlk+XNnmBiwZu3STQ/IKN2
 eBYPGlyKcqfwo2uheTti/2QKcN8irJSVnEvKmNxMjtfO+zUiI756XdpoiDY1jBx+jOGxqmCBwNqFsQ8akTYkSub7EjwsZ/b8S+vCDQbk6jNTMF1OnDMqqDmp
 jFVKKDlLA7eFGV2mHUP5GRdJ9h8HcgC6L97pVYtIiJBugoC8DhDKM9X4YotQtb/GZbOUP/PbPCHBp/omveTVOg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1678731816; bh=ySg5UCneG9UoA8h9R1xoe4ZnBbvnzw6kfbuPz2JhmSs=;
 h=From:To:Subject:Date:MIME-Version;
 b=Z0IEgbzuqTvv7UTro2hjb+5nigow7Kn8eapYLHfoJmnoy+6nP/nti0BrLVTipCz1C
 ieCbD5MmVz50kacNWGAmwK6yLaPSG4G/ZBBxS1Vjew7d3MZVozF0ohEhcDo08oCrCB
 SiiJ1aG14fLwIVJRpYcHJ820rIsCuyneWsSlj7Mgz2EAw25GTi8g2SpKuUra1EwvYH
 j6QKxJ20YevxAMEFOeZWwchGtbj21svFK3cZg1XXpRs07QZk7Nd+BUaeKtrHHwPFpX
 DemVVKlFy3xOzS25D9xZG/Lo0cJKyC5oQdyLpO3BgJKRXWk7KER5DBsgwGYPEMG2W3
 3W/IDzW8YbG3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Z0IEgbzu
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.89
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index ec3fe0d777..483320d95c 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_88_1_RTM/src/SHA256SUMS
-sha256  27d243edf87d1cf1bb9c861f03d387e0e9230ce5017f4308c941f558b54b3496  nss-3.88.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_89_RTM/src/SHA256SUMS
+sha256  55c37a3f4da010d0574fb8b39264cb1e7b4ce9e6c2954c1c7ecf9f41ee00bed5  nss-3.89.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 3782d239a5..cc5dd8bdca 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.88.1
+LIBNSS_VERSION = 3.89
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
