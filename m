Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCA6C07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 18:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3ECF240FC2;
	Fri, 23 Sep 2022 18:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ECF240FC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R17yI-rzyKkc; Fri, 23 Sep 2022 18:51:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA22741023;
	Fri, 23 Sep 2022 18:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA22741023
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 232C61BF38E
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 18:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2F6A60E50
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 18:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2F6A60E50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Prw3SU_mfacP for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 18:51:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E718060E51
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp3.osuosl.org (Postfix) with ESMTP id E718060E51
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 18:51:00 +0000 (UTC)
Received: from localhost.localdomain ([146.241.20.153])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bnlKouI8O5z8NbnlKo2nVC; Fri, 23 Sep 2022 20:50:58 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 23 Sep 2022 20:50:57 +0200
Message-Id: <20220923185057.1627414-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfG+0wkBkJk4F3yA7OavFYec8LPUdVTm5ptxNV4tqJ7m41Nb3lDsdI/GLTQBi4jW2Wb3PfhPYioeLpE8QKb9TEIvf51cshEg39+VjDKsDGTuBh5wroqUu
 G/hurhay0eogz9vymz/U/H30LTj+a6bfYDSavMtyIiq11AQac7S/AQH9RWMjtzk/ZD7dPtL5sg+k1ZRL7CqajoI7G76DsOdDA36EV3q4uWmo5oBNwYJssAhC
 6vR5e42BxhneOEPmEtZtqMqb2E5cKXzw/HRR47fIDtNmXbnNYEWJQExi54cjHVKO
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663959058; bh=wBIsE8yRCoekEffe4rfbuGf9jl39Ad8ZdPIQ3YFQyts=;
 h=From:To:Subject:Date:MIME-Version;
 b=IQggxTdNXdM1+3G+u0PY+UGCzHgeHrG83GHBfI0mPLAX40aLCPHMVkzPDa8k1vTXA
 YSe1ltfhAmKFoF5tIoT5tDORXNdPnuP89KwRaa0oAqIQukL/Zf4lnH4a/kLWockBzB
 eCOO8dT+m1Po2gvG8lIVxubUqigvvaiDh6WQw9Z3+1+cSKjX4plBussCn858SG22Ep
 +QsKtKjqcSYc9oa4ImlKrVT5rOP6T59Gsvb98svxHTejNgHTw8dstv7Slir+htwonN
 4Ejt0AsvKoiV/Qp9BORDpi/uErxGdEpcbxZfiz5mCXKEBLspp93OIBDwuQ/lZXAV5r
 1ospw8Gj2b6/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=IQggxTdN
Subject: [Buildroot] [PATCH] DEVELOPERS: add Giulio Benetti to package qt5
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0d67e8a643..64cda37ce2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1149,6 +1149,7 @@ F:	package/minicom/
 F:	package/mmc-utils/
 F:	package/nfs-utils/
 F:	package/python-uvloop/
+F:	package/qt5/
 F:	package/rockchip-mali/
 F:	package/rtl8189es/
 F:	package/rtl8723bu/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
