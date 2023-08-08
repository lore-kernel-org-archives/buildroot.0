Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70191C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AC5482050;
	Tue,  8 Aug 2023 18:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AC5482050
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eEBARG_iM0OL; Tue,  8 Aug 2023 18:49:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65D5481FD9;
	Tue,  8 Aug 2023 18:49:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65D5481FD9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CD471BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74E434169B
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74E434169B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DGXE1tG2lN1w for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:48:58 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBBFC41686
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBBFC41686
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.222.147]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M8hV5-1qPL9i36w5-004luj for <buildroot@buildroot.org>; Tue, 08 Aug 2023
 20:48:55 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:48:42 +0200
Message-ID: <20230808184844.4728-1-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:Y6UwKQLnNT8FZ3Cy8GszEDo5Ph266H9QJy8RH7SQLK/QKmQ4tI+
 CYB5Uk0/P3E/PJwwIQW++dzcbH4mzrlVingiRB7A7egvcoUz6YGMKrdiTXNTuD0S1+Beud+
 TjkYVeJ6byz1VP3ahmQiRJgRY5Xzre6zEivJKaeAYgdC7GOqtxwI/2ryCnSvSK670Oqu7x9
 ldGcO/1NYGsBgxDNe1Bzw==
UI-OutboundReport: notjunk:1;M01:P0:Q1Zf9c6jiAU=;jliNkuoqk1Hpru/LHZEuOy6uJC/
 OtEJtaQa5impwCGQQaLDrlrxk7ZGpwCvk5zdkdsv0Pq9gmOZFiRsp1F/e2NrZbFWeRSp78ohB
 NNvicFC2BXo+RgKXDbFGbpSX441CZDJx3F4C+dtxKzrIhjOI5r1eGEwIzuCZZuSSdOFnP/utI
 46gH4vUxKKI5C4zAcDnPjoDU46qk4xyK3zz7IgCLmVtHlzU63plU8GpIJ+MH/See0tcLuMOwv
 2M5JMc+o7SzJfRX92UsTn2VWJk3nZ9DOWQkh+vymNfP1rIUFpp9a1ggVa7iFOtc0IJdnxji1Z
 Q5cpZRyHXQQ5+iaF44spSYUl5HEkxBs3b9DMrP0JrQzQoOX1bZKpaPwGkNLE2PMURs6gPlJcx
 PGqiCEu/WhhJNWRFS7ZnVauEL6trQ7O1WZo3JmrT3jsKEw5LYn+mRQN4oiOwPP3OKlIYE/Hux
 ijuC8CtHb7A4omcej+Ty/e2DrNHmgcgcyzyYru5rjwloESttOQ8rinPnKku9JefO6v42R1ojz
 WnzhWURc+FEshN8rCqG4xxJtjm4KHAUZCMoK0yI2sfikHWerXK1MAgdhFVzcEnWpbCu+0l/Wo
 vA4PK7OQHTVB00JkOI31fSj4OWIwkhurHwuPZQ+Muk9MDZpLQcuFo9USlVIyofUtsu17I+rOU
 8jIMB4Y46bFsRC36KXghmK9JHkCjvYNr3CvWOEIbH7MeUMsw41hFYIaWOdK55X5yJBJJkEPtS
 gkKFS5ATtXi9TGoq6/zSf7WpNYLbnV8sDzm3b7lEDu48B4uOoSmDFgIuGu/7LX0stiQbtTBoS
 ty/U6/YBN36ZSVDRo3Od8bqv4g8BPqJe4yALjsqQQZrj++Q+oHq55NeKaKRPfFmwMZ4cYillh
 gqSPu0bhw6usDaoVjP9Sar4kc6cgxS07t2RbiCnTNylfEs4/jsjqMPs2Dtfv2Cj+EoZQpHKUx
 lFxDxUprDX9jVn9VfLJtrSNfN6g=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691520536; x=1692125336; i=dalang@gmx.at;
 bh=6YIhRORz2bOzxWD5vFOlxNTekx/hQAx3QMJnu14HxoM=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=T4cBZR2TQoJbxaO1UHSsWhrWMSplt5UNcEKCzFQDWBm0Hl7jv2q/hFPv7TN4B/av4uqmrWC
 tN5WdRC/iO0ZFTRBYH8AY/IfnBUMKMXAVOcSh/oJQkdHdnzfVeExV83PlwNjvZ7IowFoTVbHy
 qCVAPcaVR7IR0YLr6PjNovGeAqtvCIb9wgDTGAZHw8YukszNcJ4MTyRki5hXpTavmzdH9lrGz
 Yhh0cKweOXM7HZeqACoLXzpCJrbXb09n1YYEFxE/yMJ8Vz5qWCzFQeuq1egfKiNKEj7oh9Cp4
 cOaMhRSP/2epgrnYYYJymWWmGrwbfrONQ1jOX3N+0N6V4WW6hPJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=T4cBZR2T
Subject: [Buildroot] [PATCH] package/sngrep: add CPE ID
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

irontec:sngrep is a valid CPE ID:
https://nvd.nist.gov/products/cpe/detail/558A213D-A36B-4ED8-8671-2C38110F47FD?namingFormat=2.3&orderBy=CPEURI&keyword=sngrep&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/sngrep/sngrep.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index eedb99492f..0e344550d3 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -9,6 +9,7 @@ SNGREP_SITE = \
 	https://github.com/irontec/sngrep/releases/download/v$(SNGREP_VERSION)
 SNGREP_LICENSE = GPL-3.0+
 SNGREP_LICENSE_FILES = LICENSE
+SNGREP_CPE_ID_VENDOR = irontec
 SNGREP_AUTORECONF = YES
 SNGREP_DEPENDENCIES = libpcap ncurses host-pkgconf
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
