Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4636C0015E
	for <buildroot@archiver.kernel.org>; Wed,  9 Aug 2023 17:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65AE04076E;
	Wed,  9 Aug 2023 17:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65AE04076E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvFY3NXJkD_o; Wed,  9 Aug 2023 17:15:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CE4E4086B;
	Wed,  9 Aug 2023 17:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CE4E4086B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8DEB1BF3B9
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EDDE60EA5
 for <buildroot@lists.busybox.net>; Wed,  9 Aug 2023 17:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EDDE60EA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 22LS9O6z84Ni for <buildroot@lists.busybox.net>;
 Wed,  9 Aug 2023 17:15:13 +0000 (UTC)
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.154])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 83B6460DB7
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 17:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83B6460DB7
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 4402AE8D
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 19:15:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ebWtL6Jqgdel for <buildroot@buildroot.org>;
 Wed,  9 Aug 2023 19:15:08 +0200 (CEST)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
 by mx.kolabnow.com (Postfix) with ESMTPS id 85E0DB15
 for <buildroot@buildroot.org>; Wed,  9 Aug 2023 19:15:08 +0200 (CEST)
Received: from ext-subm003.mykolab.com (unknown [10.9.6.3])
 by int-mx002.mykolab.com (Postfix) with ESMTPS id 25B74369A;
 Wed,  9 Aug 2023 19:15:08 +0200 (CEST)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Date: Wed,  9 Aug 2023 19:14:59 +0200
Message-Id: <20230809171501.1329182-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received:received:received; s=
 dkim20160331; t=1691601308; x=1693415709; bh=yZJ1K+/bybm8+IIIb6z
 OIJonvf6qhN8OmeGwWeu9VGI=; b=2ww0btCP+p2rqnySUWzwrGHDJwSGuGC1c3n
 t1V34vG68LM4tumqiPMT8tHXoAwsGkHE8O8Qb7bLqUYtJ3H9StnQLYBCY0qoeUeV
 rIY7J1McCCvSUArtkLwTircF7Y8qvpFk4Qe/CgHSi6sS9o5W0NVJM10u80gw9iU3
 9OVnj6tvUq+dIVEEKqmkSnex7na6vszmfIhTfIOuJh5vMz6htJLxLF/NG/NqEtKS
 Vkl1d0STPcTELeNLTdLBHPEda7mCMtoqGnS0Y/sMFHwR2hN6Hqy9glnuPOJ3BrjE
 H/z9potQvtF4gV6Mjs4Xt23VB+hn/agzGHxJh5gSb9cPrC1nnlMmxzp0KV9hXLW1
 jzw1YJOL/AtO0T9W3j8PIK7KBfLrolGNgMAR1zBPgEfSxcoSADkIJaFt19GGWGQz
 B0t1bfH+lqpjD1QaciJ+lYDOWK7cFsV1XD6gIrT5YWDcRiQxcxTJQLgkPxohuv12
 minRL5gNCUzoOVBjmktDQ2BGPxkzRt/PbdOLdLQ+JNCdKNuiOx1qfwgfcMnDn2BW
 KKU4XbwQiT3I4mAZWGl81vFcHLLX0Z2LNjsHcBjkbarBtPn96Q/GjRx+Xsm+LzQ1
 sCHcZQ5rD3O+nezAW4wxhFnssOp2XVzjAfg27J/IZ3AFPuotI5t9ty6AobdnDV99
 BVAKdohw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com
 header.a=rsa-sha256 header.s=dkim20160331 header.b=2ww0btCP
X-Mailman-Original-Authentication-Results: ext-mx-out001.mykolab.com
 (amavisd-new); 
 dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [PATCH v1 0/2] RFC Building packages both qt5/6
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an attempt to enable quazip also for qt6. I couldn't find 
an example package for this, so i would like to get some feedback
whether this is the way we want implement this. Any comments
are welcome. For quazip we also need the qt6core5compat package 
as well, so that one is also added in this series, but i'm ok with 
applying only that patch first.

Zoltan Gyarmati (2):
  package/qt6/qt6core5compat: add new package
  package/quazip: also enable for qt6

 package/Config.in                             |  4 ++
 package/qt6/Config.in                         |  1 +
 package/qt6/qt6core5compat/Config.in          | 12 ++++++
 .../qt6/qt6core5compat/qt6core5compat.hash    | 10 +++++
 package/qt6/qt6core5compat/qt6core5compat.mk  | 39 +++++++++++++++++++
 package/quazip/Config.in                      |  3 +-
 package/quazip/quazip.mk                      | 12 ++++--
 7 files changed, 77 insertions(+), 4 deletions(-)
 create mode 100644 package/qt6/qt6core5compat/Config.in
 create mode 100644 package/qt6/qt6core5compat/qt6core5compat.hash
 create mode 100644 package/qt6/qt6core5compat/qt6core5compat.mk

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
