Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A447C433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 10:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1718240A44;
	Fri, 21 Jan 2022 10:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ereLL783C9yu; Fri, 21 Jan 2022 10:33:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C85A40999;
	Fri, 21 Jan 2022 10:33:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 492421BF2FD
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 10:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4048683E04
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 10:33:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FD0vZ5H_Xj6j for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 10:33:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2B0583E01
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 10:33:08 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ArE7nIhugz0d2ArE9nzZnm; Fri, 21 Jan 2022 11:33:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642761187; bh=2jzNsJazuqVibvxgdxsKp7JGAbtObZ10p4wv/nmYbdk=;
 h=From:To:Subject:Date:MIME-Version;
 b=OARkU2XkptRNpSocqHV9Lp2gWs2jXc4rLvmzgQKZwpxxYmWdssKoQ10jYLwUzVWvf
 v4NAenR4z/F+YvpVUQ9R50VsX5p/B0OAONftEQGv9J6bVNDS55L74rRGvFsvrZOtkj
 1sy4F7yKTPZ2mJRQZS4o9KC63SJglfNnqnbb1jevNGF557X3Zt+/UKNzIdBqdxX/Zw
 lwyy3sKegqrhG+CWWENob/A8RwtVbFCuyHwJPjznI/i4fhXwtylSYnAywjDjHgrJln
 AWgpWAeQTyVR1UulcaMNA26ZMG6M0F5UQwQHv6K66FBjwXsgbAwZQn8v9evfspbvNS
 TaZmX/pW3hk5Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jan 2022 11:33:02 +0100
Message-Id: <20220121103302.1488436-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2ba595af-2fe2-bcfd-5c3f-f3b7b77cbef9@benettiengineering.com>
References: <2ba595af-2fe2-bcfd-5c3f-f3b7b77cbef9@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfIIjDtJ1lBv0aNnWlLmxa0A/FUiB+hgWOcbQrXIZ10R9EP6wYR+UEay0vcFybz9hFidFHvusOR/yazikjZ3dRWfPpxDToj8JI1UAo7suzQgeD6sIhGOc
 bI4Sz/9foQ4t44Paw+9pDdxX41dqLBSUUmWPPstq77/xGt3j2ZVt5nfhkXnCYOAjohYvLkcOVqyNdTZZAHEq3ixkzmPCss0T8BdmmU2tVswdECy90Um/Arqg
 er/Onzx6WZzlZo3+jJ+k9gF+VMBqSmCGPZwtQcZKJTtB+zLWhd5h6l+WvqlksAbY5Hy8+AYWciRMj7RaNCkpZ/4I0VXWi/whBtJpouOZwQI=
Subject: [Buildroot] [PATCH] package/xr819-xradio: bump to latest version to
 fix Linux >= 5.13 building
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Kuzminov <kuzminov.sergey81@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pending PR is now merged[1] and it fixes Linux >= 5.13 building. So let's
bump xr819-xradio version.

[1]: https://github.com/fifteenhex/xradio/pull/15

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/xr819-xradio/xr819-xradio.hash | 4 ++--
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index efff92ab7d..4a77db0d1a 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256 5900821a777b9008d7cf9b8128e0cb75a4623ecb608b45438e17c7a056cde1bf xr819-xradio-6bf0e2e21c80456e2a3d4ad1267caecde7165871.tar.gz
+sha256  06b91b1fcf98a261125b4d599ffcce2458fb9d0c1f38a4bd432a622b446f0f51  xr819-xradio-16180b6308e3c5dc42a92a663adf669028087ff7.tar.gz
 # Locally computed
-sha256 db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73 LICENSE
+sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index c1fe3295b6..5f60be887c 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 6bf0e2e21c80456e2a3d4ad1267caecde7165871
+XR819_XRADIO_VERSION = 16180b6308e3c5dc42a92a663adf669028087ff7
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
