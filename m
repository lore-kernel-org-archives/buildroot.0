Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AD4C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 22:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA333405BB;
	Sun,  7 Aug 2022 22:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA333405BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qNWwPEZhDv4y; Sun,  7 Aug 2022 22:25:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02279405A8;
	Sun,  7 Aug 2022 22:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02279405A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3CD41BF96B
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 22:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BDDD60BEB
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 22:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BDDD60BEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dWkmUBiHdB0m for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 22:25:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28DCD60B89
Received: from smtpcmd0766.aruba.it (smtpcmd0766.aruba.it [62.149.156.66])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28DCD60B89
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 22:25:32 +0000 (UTC)
Received: from localhost.localdomain ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id KoiAoWIrgHDAJKoiAomAK6; Mon, 08 Aug 2022 00:25:30 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  8 Aug 2022 00:25:27 +0200
Message-Id: <20220807222529.1501004-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFwsnT6dwJ6gF7/xh+Hhv1Lz1tcKugKSgmXct9HCatLOEDktDB50H5ENNUHHN+TIb+a9fR1yiChODqP2ZSsAHXKhcmYUGljkYedi8JXvna0uBXQq7q7R
 zMR+vlJH/8IKwlbg9e/54d/lO9UEBa1Zfo8ixtpGDBRMXGfY7EenkECDxYs/AmvOM20Hehk6wAa2DPB0+xxrcnLRdVjeylXd0z8i/ZGdXVKUoA3UdahUiRlV
 aD1zBqLbFH0L2Hwtolm6YAMal99p4D+jbMFH79OMfmpHMAdpdTo/p9wHD60fUz24q8sjhXc2A3GQH28Vt0UqyK2SoMaSEePxRLLdXDLsjqFlA1BF0CAXPJBi
 wSYmn7Nu
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659911131; bh=1DMdptV9z7NBwmQ3ZnRmNFQdGwkM93u7O6vTdSNBxzI=;
 h=From:To:Subject:Date:MIME-Version;
 b=NeOBnMvwTaT9rqiwXMmxDjzfiB017ciNU5BrfHpsldoOqU6c/bYpMxKxKX9JBv8gS
 CaYOwvIy17M9PtyCDEP9VDqxC3SK16nza+qA+fTy5SWaNgkpnNkbRS7xf/2bIY6ek9
 4f9nHMQzS+HzHJ5KNOts2tIXZXgmZQ5V2uNuM15o8YnTCKtbh8I6okS1Rk6nIBehz7
 lcOzko4JqiUQ7onj35XVSsJsq+otwIqyFMEqoNliaR/vCzqhAOoQocT0VPxZaGLkeH
 MF8Ucp7Znctk9QPxWwhalJGFijs6bj2nG45jxTYenqzPMHalvh92UcltynBkvq4vEt
 P1FlUVu/uRY1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=NeOBnMvw
Subject: [Buildroot] [PATCH 0/2] Fix Opencv4 bug found by a user in Mailing
 list
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
Cc: Stefano Cottafavi <stefano.cottafavi@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These patches fixes a bug Stefano Cottafavi found and asked help for in
Mailing List:
https://lists.buildroot.org/pipermail/buildroot/2022-August/648616.html

It turns out that opencv4 library objdetect requires library dnn and that
also dnn library requires protobuf. So this patchset select both options
accordingly.

@Stefano, if you can, please give a try to these 2 patches without
enabling the 2 options I've pointed you in Mailing List by hand and report
the result.

Thank you!

Giulio Benetti (2):
  package/opencv4: BR2_PACKAGE_OPENCV4_LIB_DNN requires protobuf
  package/opencv4: BR2_PACKAGE_OPENCV4_LIB_OBJDETECT requires
    BR2_PACKAGE_OPENCV4_LIB_DNN

 package/opencv4/Config.in | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
