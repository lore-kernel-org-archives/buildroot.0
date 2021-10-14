Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AF3C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:46:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9131861166
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 20:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9131861166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 679F960BCB;
	Thu, 14 Oct 2021 20:46:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OSXN1JX1V8UW; Thu, 14 Oct 2021 20:46:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D336D60BCC;
	Thu, 14 Oct 2021 20:46:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 734E71BF343
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62DA8407B4
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 20:46:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nQUYDchQN3-K for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 20:46:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D302407A6
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 20:46:29 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id b7cRm22pdumo4b7cRmqaz2; Thu, 14 Oct 2021 22:46:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1634244388; bh=kjOzYR1IFbgZiihgh6GLlIeBVs9n5r4LQsBMU0p3Qvc=;
 h=From:To:Subject:Date:MIME-Version;
 b=eHuKRVyVIeFnJbPvDzCzDOOhvHl2kV3xjU5nCN9JzD7u2ZtJz3ffE6O/Ay9fownem
 IM9ikUu+O1IBPdlhUT+3Q3RXweLMNtZ5CeFUJHotX8Qbef6QJEe7hHkhuCZa+Nog4b
 3HhnobHRB5YJfnal/1M4BwxQ86hd++m18CIs4HhM5LCUgE1BR7Ba1gk8L1SgqVSCgG
 3eGxjI6pUTXS56Mf41iGweo1elxVEJ5HXBlrheecQZRz3iJVavggALsizXZumI+ru5
 a/LoVR6t1vYO8WUX1tkIO766+YPzfmFQac+H4D/A6HjKnUt++a46GzNyxbF9lzjylk
 2Kbgecra/WOBw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 22:46:27 +0200
Message-Id: <20211014204627.2433655-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAcU47Vpw3ElcnWSBE4vhDeMmMQ816Iw+n1hj089jgstcVVWQIzUtKsiluVN+R5uqD3xRXr1//QMqZejL3Nh54KiXi4wPyjRPfS2jXQC/1uKega8HFIr
 qOVaFdhryWZCnlO5XZISaKKtBHRQDliTHLs6ke1lzBS0cMpLFFx4mzWqZwPTs1L1i2bSfDLYxiZfs4wnvIeBGgpkZRKh/4HcuV3z4CQUynviJHvs0zfC/MeL
 mDY28q1jxyt1G6P8p/y1q/hhhOpFMc7ZV37yk2Yp6nY=
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to erlang-jiffy
 package
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add Giulio Benetti to erlang-jiffy package.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b1439391ca..9950dd5d8c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1056,6 +1056,7 @@ F:	package/xapian/
 N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
 F:	package/at/
 F:	package/binutils/
+F:	package/erlang-jiffy/
 F:	package/gcc/
 F:	package/harfbuzz/
 F:	package/libfuse3/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
