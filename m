Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE58C32771
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 20:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 725B161079;
	Wed, 21 Sep 2022 20:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 725B161079
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GjFxk5x9qjwI; Wed, 21 Sep 2022 20:58:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DA9760864;
	Wed, 21 Sep 2022 20:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DA9760864
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8413B1BF34B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B83E402B5
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 20:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B83E402B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z-sBxBly-flD for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 20:58:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4759E4028D
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4759E4028D
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 20:58:18 +0000 (UTC)
Received: from localhost.localdomain ([146.241.95.233])
 by Aruba Outgoing Smtp  with ESMTPSA
 id b6nQoDUqZlHojb6nRoG7ZT; Wed, 21 Sep 2022 22:58:17 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 22:58:14 +0200
Message-Id: <20220921205815.1082192-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJ95Nxsv6sQlLUb8ENs8Z2//04zdpoSFh6wRjyrJvM9hO765id02ZMYjny5U3mAZz61Aj89h6rpm6Sh9RermpME2jHV3h2tAPdaViTluenNn1KygfMIV
 0WZOG7MohjPeKum/zvBs4sRQF0pNZTVlgsmcAX1rfUP+RxPWuvXQvBKe19Q633rQhyft+kFESwYHtn3y4hLHDanoAyMiVqmUjb9xFZdqyqrsMsHWGs3eFM4P
 mLQIQ4SpHaF19iK+H4RnMEeNhWkLx1jNsGN+EDifSq3t/WGo6dHotRb9WnVFOcxL+T3i/QRqbLeVaPOlJ+7eCw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663793897; bh=CZ2qYtPQA16H1XyaHATM6IDd0R0qoeC/5aj0K/Q/zj0=;
 h=From:To:Subject:Date:MIME-Version;
 b=bXq0jG44SUHbPn0dCMY7BC92CSwedofiushEQK+E5PDU514xZQ5mMYcmfwUUZLbr5
 MyD1k6AA3SyR1Mi3QmGGsyePByy7OolEmk5x2pHwlhZ8HdtXGTJ1zkEm1CX2XogiDq
 sMjhqEtPbW3xtvjSb5o0vopieL2kNEuePY8MKppFM/2wOu/Srh5CtR0Gsl514ccyR+
 UIU3qNgAt1o8CmguXyx/CXcKS7/R5yLUVS6Mgi6fo6v8199d6AY1HXwIsvU8l9tzJt
 fZuSNUdlbJqFbmMnkEyYAT0M7x7epnih7AaeHgDSvivs4qwLgdel97lhR2+HuYpMlZ
 tWDoAwzWl3fzQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=bXq0jG44
Subject: [Buildroot] [PATCH 0/1] Move rtl8821au upstream
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

The following patch switches the upstream and all details are explained in
the patch itself. It builds fine but at the moment I don't have access to
a rtl8812au device. I hope this patch can be tested by someone or please
wait for me to buy a device with this wi-fi controller and test it.

Giulio Benetti (1):
  package/rtl8821au: move upstream and fix missing linux options

 DEVELOPERS                                    |   1 +
 ...-fallthrough-comments-for-kernel-5.3.patch |  29 --
 ...river-crashes-from-aircrack-ng-rtl88.patch | 169 ---------
 ...f-for-extending-string-which-causes-.patch | 339 ------------------
 ...ate-to-rtl_sha256_state-to-avoid-nam.patch |  79 ----
 ..._mgmt_frame_register-on-kernel-5.8.0.patch |  47 ---
 ...-file_operations-to-proc_ops-for-5.6.patch | 110 ------
 package/rtl8821au/rtl8821au.hash              |   2 +-
 package/rtl8821au/rtl8821au.mk                |  12 +-
 9 files changed, 12 insertions(+), 776 deletions(-)
 delete mode 100644 package/rtl8821au/0001-Fix-implicit-fallthrough-comments-for-kernel-5.3.patch
 delete mode 100644 package/rtl8821au/0002-Fix-kernel-5.3-driver-crashes-from-aircrack-ng-rtl88.patch
 delete mode 100644 package/rtl8821au/0003-Fix-using-sprintf-for-extending-string-which-causes-.patch
 delete mode 100644 package/rtl8821au/0004-rename-sha256_state-to-rtl_sha256_state-to-avoid-nam.patch
 delete mode 100644 package/rtl8821au/0005-disable-rtw_mgmt_frame_register-on-kernel-5.8.0.patch
 delete mode 100644 package/rtl8821au/0006-rtw_proc-convert-file_operations-to-proc_ops-for-5.6.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
