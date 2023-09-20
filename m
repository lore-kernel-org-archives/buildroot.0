Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F90CCE79AC
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 04:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31E48404E0;
	Wed, 20 Sep 2023 04:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31E48404E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h57II_bsJsgm; Wed, 20 Sep 2023 04:32:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6363340347;
	Wed, 20 Sep 2023 04:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6363340347
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 312731BF419
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 04:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14DD440347
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 04:31:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14DD440347
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id krvRmtVl-CsT for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 04:31:56 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5ACAC4013D
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 04:31:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5ACAC4013D
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.97]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MAONd-1qp7Sb0Het-00BxT9 for <buildroot@buildroot.org>; Wed, 20 Sep 2023
 06:31:54 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Wed, 20 Sep 2023 06:31:12 +0200
Message-ID: <20230920043113.36674-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:8Og7cwmk6kiuXyiWRRoGO0zyieOBJ7Z108lee1SDXMWjudKCHE8
 zXno1eK6vahQI4OSYwy8e1osn497LA8Wt9j48sNL4/l5832YieE0LKfemAU+W1NUoHvYrjP
 iy5k2sgdHS7hat1j6nEt/yqeXE89OMiKIO8rj6a3+tDDn0zYzhsI5RnaTGJRZ5El6p8UFuh
 1KHhM/UnK3Ra+vudX2N2Q==
UI-OutboundReport: notjunk:1;M01:P0:M+tuvibl4hI=;mM9xmHs2iuRYJAdGhj0AkMn808r
 6p1uz8TY8AtmaNluX3631nA4J9d0ugF/cgTJN2Ymet6HfLDA4zuGfkMTOacy3iVhqi2YsqjYL
 aT3Vhc5qoLQtdzDBjQQGfww7SUGkQ4fw06bdzlXXKngGWZVejYvbaplRy6pfBPrreXc0sD3U3
 OmdgktMzcapFjmcYzMmJ1LzIjPm7WNc4jyl0XddrCf7tLDDB1m5b8i1/qYOGF9MZpfBEbH1zX
 6rKFW7nSaxWVSliSnsZNEBtvMAUVAvk+nGkqVB/ElqWzuUamTnRX2iXAUzDgo0Ur6YkO6sDFo
 Hu06+bzZ+6LlK2/PZ9P4e8P1BbxJrq2rO7zaoj0hGh+TOSyarRA2ZFOG2BjI0+KZZCQtAPyAL
 L+voLbCHCc3CtpCJCrt1UmQhPLhzl/ZcuQ6T75IV9J36i4xUe89XfihDC5li3Kev5nm2fttUV
 Hk5AM7YIOz/r/7vVDr3J2Z6pB0wEzxNq/MSSzHtLtesmYdoDACC48bN3XdbGOPTGJyc4wpJnt
 EMbUT760OfncUH+vrOThpQhAL4z9so6x6WIHpC0BbhwkUigOhwMpfe7cvCoYlcdDKAQRWbIYF
 nNvb9Cz89Tf/gTIXK4GHvY+okQdTW2FY+LZmV09jvJ5VvI/QMcWYMUSZ8XNxar63QBk8PEJ88
 mkkSD/pOJ31syCZ4NcDWCBrh2aVYcwe/7+gCBSZvcH98e5/lDbrMa8dghgMa126ZXkRzzT4Db
 5PguufTrnvtbdkKPL2sUX5QoUHueS17h0JdaGSq1zh2GMCdqq7k7mhYKtz6sf9XnLoytxdDbT
 bixxFE/IXINgHFTYFHJn9qzxghDQZ8JJ62+YWnOXQe/VMXeCN3Fu4YtPlpOx+KdoFRyVES063
 fjXI8GTY3iD4LzjR41BHegox8XmwoXuzrMlsxbKnHjL54ls+krrqWjbVv+FqdRdQF0zrkflH6
 3HK6GjzqmcAg4w07TWqiEuB788Y=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1695184314; x=1695789114; i=dalang@gmx.at;
 bh=bud2oEVkXBp1CMgq8c9c0VArvgFkeuVJFftq98YBJ7E=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=QJAO5WENUs2rohOcvlZPmDcyAatoCUozX+fIbSP+aeKv5j7e9alQ9J9+XoeAjguxFKE1e5iPgQD
 yjurqH/WZ4Fqg+Lsajw4yVWRo2StzmOt6XoRGDiXDA80PHxFPdsEvKg02K5MoMTi8VIOyv9AHy7hx
 jlGfH7hF6tdgAuQt7NISaXL5+EIP166GKwhcZ/IpSQ9bcakiqOFR0fmRTszyD+XhT/YS8KTUHG/Eh
 5aoZ/nMAZvdtUATlpXfqQDlTNnARFeIs+acZQnc/74L7Tvb6NZTQGZYx/cTgklTm+hwM+skF3uuTQ
 Hb0Ah07C07gox9UY1h50muB3aNt6g53FNoPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=QJAO5WEN
Subject: [Buildroot] [PATCH v2] package/bind: drop CVE-2017-3139 from
 IGNORE_CVES
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As of 2021-05-14 CVE-2017-3139 is no longer listed as affecting bind, only RHEL.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
v1 -> v2:
add Signed-off-by
---
 package/bind/bind.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index b934ab3190..618b5b9278 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -14,8 +14,6 @@ BIND_LICENSE = MPL-2.0
 BIND_LICENSE_FILES = COPYRIGHT
 BIND_CPE_ID_VENDOR = isc
 BIND_SELINUX_MODULES = bind
-# Only applies to RHEL6.x with DNSSEC validation on
-BIND_IGNORE_CVES = CVE-2017-3139
 # Library CVE and not used by bind but used by ISC DHCP
 BIND_IGNORE_CVES += CVE-2019-6470
 BIND_TARGET_SERVER_SBIN = arpaname ddns-confgen dnssec-checkds dnssec-coverage
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
