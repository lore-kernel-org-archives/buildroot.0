Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9F9C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 09:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22BD260B6A;
	Sun,  6 Feb 2022 09:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id upGFOdzzJZFS; Sun,  6 Feb 2022 09:54:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CF3560759;
	Sun,  6 Feb 2022 09:54:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 715791BF83C
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 09:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F763402E9
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 09:54:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEcfo6uFWsBN for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 09:54:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0873E402E2
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 09:54:06 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GeFAnq3zyXmFAGeFAnU84K; Sun, 06 Feb 2022 10:54:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644141245; bh=9tIZ6mdyQKjAtrVbVR9gqqfu2+hrdcrvgzp/+PT5ZVw=;
 h=From:To:Subject:Date:MIME-Version;
 b=kUVZazV3Szv2akQJkBkNQ3V+dQLwQVnlIJeQCjv6b/HnKcSKL7OjfM9gkw13oRBuV
 9kJPP2APZo+lwa/B8xkJ6BNomPGjcB8GrdM93JmOUHXhJ6n8i7KDV5PqB514CT/YvA
 PZcqzZ8qYTzhqkUnVWw7/40puKlwiTE9OH4c6S5GyNPJLV7sFnR5gYtRZ6MxHCKH/I
 RmaINls0EWWbp46eauNMpCu/whxn3mOUXmJ9n7P/BnPXIHQr8U0H1rattXShbxZqQw
 yeyLmiMOVu90Aqi0XtYMkJMZS6LmmiEj7o+RBZNyrEHTjq7eOruh1UoAxfngI0pbvc
 Kkh2xe2UFh1eg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 10:54:03 +0100
Message-Id: <20220206095403.1563814-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfORF6QHqaEnt0dYUqBtHRBWB+yWrn0mEXCM1vtjm+wT+1Kx2gglwjNb1ELhBngJyrxtEm5LYlcf0/B07aXDtg4KhRc73wtTVVjl6YEa+rq2U2Yma7SzQ
 KVyqCCINEU6aeFZkKms42KmO3o0BkWtNmzv3uMVvIuDRD21On6l8XMyuVtYamCOEKch+KITopxARlmwNiYqQqYHnODCW/gLz00H32+E9qt3L0yTYPdWQ8fhc
 /FDVrlpEcN9x1mBV7DdaNZB3WbBueszbiOy9uEskhTEjU2mndANAgKYG4NbX+XTsuptcdrceKfhYf6DoZAknOA==
Subject: [Buildroot] [PATCH] docs/manual: fix "+size = +" latex formatting
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
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 docs/manual/writing-rules.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 3eec095d0e..06f87556ed 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -184,7 +184,7 @@ image sdimage.img {
 * Every node(+section+, +partition+, +file+, +subnode+) must have an open
   curly bracket on the same line of the node's name, while the closing one
   must be on a newline and after it a newline must be added except for the
-  last one node. Same goes for its option, for example option +size = +.
+  last one node. Same goes for its option, for example option +size+ +=+.
 
 * Every +option+(i.e. +image+, +offset+, +size+) must have the +=+
   assignment one space from it and one space from the value specified.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
