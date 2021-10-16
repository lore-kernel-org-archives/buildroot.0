Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E4CC433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 21:54:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D134608FE
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 21:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D134608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13C7E400C1;
	Sat, 16 Oct 2021 21:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AW3a0OvcVemj; Sat, 16 Oct 2021 21:54:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35FBE40111;
	Sat, 16 Oct 2021 21:54:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 545C71BF2B1
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 21:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66D7640111
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 21:54:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Slnq1jq8NfvS for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 21:54:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7967440243
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 21:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634421241;
 bh=gL7fe7rTcH1x3bUN/sx2G4yvZIXSuq1z0PV4qRBXp/k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ZrZOOP/8PUcAJQGrf0H0ROXAJ+9QCX00RZP/U6U4r2KtMSNCvReYBG59PE+s1ektg
 mOuzeeCMUAlfwmyFmNnkS/gxZiRA/cNk5A2KqPuVvdGgxznc/JrvZPIKFCeu/qB8x9
 GZpnUqZlrZtTOgJD8bYUEHHbaecT+RiqeKcKy57k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.201]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MgvrL-1nEEdw0d01-00hRh7; Sat, 16 Oct 2021 23:54:01 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 23:53:57 +0200
Message-Id: <20211016215400.31415-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211016215400.31415-1-ps.report@gmx.net>
References: <20211016215400.31415-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:7N45Qz1xS/LrNEirOELxLLp13lDl+mJ5seIKIipykCSObYRyDaG
 YtPdckmFjupxiGjwRh4pVxA5+QjjQq6dZvQr5ZwqsdMnwiCPJF18K7dPYGK+qfcsy34yCQa
 GFCrDWqsjwNSe2DmmEGzIjw4YvGmVLslfRH8uLG8ArlcEECXRZJHRLDC5UFcR9c7VXxWmGT
 Ie0eqgC+oEcJtS6UPpwiw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/kR0g8NyuGU=:kTjx5VBNoMpo1G1fpwPlb1
 w4wUi6KbwoKe/1Og1+Lw7TPDVySG9vXKh4SQtyZtmK5XgEhldXg2zuPxfCF/xaDtP9bwlDMwp
 Br3iiU1sXUt7cduaVbyPVE/OOtnxsXFZNaZNilIs7gIqOSbjGUrXw+hQ8VUD1Kn95HzhR477r
 pn0bIhny1bWomazx5M+jc2JE7tasEfZoaqDKVjtmjbt0C4Hi+PKiqJOVXfUAGXmE9fKO/q4UE
 EBZZVk0I0AJA4FfNA8DG+OJGHZljWC66BTlu0ZNuhVmYfTh7kf//yg8NutRQM9z4Q5c/XE5Rc
 JypXPo1FoPDq1gk/mAm9TWM8H+HSMk2dNY9VD55m/Z/H/fM5gzVpzG1OdOEFZjwxrYnIwsC6r
 hAPBx8EzBWW3W8T+1Oa+Ods3us6hqGSr5ncZ+GDkYHdU3KTvzin0jFvKYPERsmMQjHW97DaVM
 oBn3yC8kAEkBK6R4h/a3YefVydow+ioXtnmL+EOIivKSi4NILlw33grmzjldwunIuCvBkCadA
 QVlJYfkz/+SH6SBAtAzuFb1D6+IQXsr/C9nRLZYYURxWO4BhC4Yfk87wysnJo0kXOX/lSF6XC
 uVeeQvux26dzUYV7KHK/DEo576ASf3V+Vkohb0KhUYID8lyGwR6AEhIO/dGEKIJPw3gnDfly2
 LRwEj+yTkC68S3l9nlHtluovsGAzQ/g+WEs0dGHKrDfdDwAPmtZHvn6A09+88qm8rPHZj7A2x
 5LGQ+wOdJn0eUUX1/NpBbyEPmlfKPM5O0oDw/Nt8s7PqXCIbrNiqgYjbKC/9+/ZIhYXeSw0wQ
 2iph1cbdiqaassQdKLO0uVJaqA9QpitfnIBr3TvAKMop9ybXQ0Sg31iWwRC+Y/HKkLkvkHH25
 tzdF0rI+tuMF/JigfojmGvhmDd7DbcDnG3DVcPUH+5OQhfVe2RGXmAvji1uuQh8tQyXpySrc+
 XxpWjYhJj578HY3le0uDqgEoeDX176BBjQE0l9S4N66xe++KATslHMGVBQoxzlxxXneCRmyk+
 4W/cvSSOIWEOKZLieRh/9Hmx+M3vBx01lLAE1bItmjJ8qhnbjWU186BOqJzXSP1hS0uW3wsJc
 yIj12syKJxs7vg=
Subject: [Buildroot] [PATCH v1 2/5] package/libuci: bump version to 4b3db11
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:

  - 4b3db11 cli: add option for changing save path

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libuci/libuci.hash | 4 ++--
 package/libuci/libuci.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libuci/libuci.hash b/package/libuci/libuci.hash
index 54bdb023aa..87e539d41b 100644
--- a/package/libuci/libuci.hash
+++ b/package/libuci/libuci.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  76ef826df2961420cd7a4f1702bef06c37563d9807a2d8e84557963aab21ac80  libuci-52bbc99f69ea6f67b6fe264f424dac91bde5016c-br1.tar.gz
-sha256  53672dbbd32466fe6c7ad7cb35b54f666f3f1b41273cd3bd00a42054608aa512  cli.c
+sha256  4b4e3ef9c9f51c02a1985c63ff0e8fc1f3aafdf24491247a4dc33c993c3fa1ea  libuci-4b3db1179747b6a6779029407984bacef851325c-br1.tar.gz
+sha256  39e1cc18a36172fb80d9b37f0af77d78ae935bd8a020978a7895d9e76a24e112  cli.c
 sha256  69d4eea4de19d27014f3d6ed723081b4039700bfd73cd0a5e39e2c4f19a58c66  libuci.c
diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 4515e3f21c..81e87aa5be 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUCI_VERSION = 52bbc99f69ea6f67b6fe264f424dac91bde5016c
+LIBUCI_VERSION = 4b3db1179747b6a6779029407984bacef851325c
 LIBUCI_SITE = https://git.openwrt.org/project/uci.git
 LIBUCI_SITE_METHOD = git
 LIBUCI_LICENSE = LGPL-2.1, GPL-2.0 (tools)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
