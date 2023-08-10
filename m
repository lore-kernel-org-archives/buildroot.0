Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15168C04A6A
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 05:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1B0C4158E;
	Thu, 10 Aug 2023 05:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1B0C4158E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cc40MpJ8kqTx; Thu, 10 Aug 2023 05:49:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4E2D41589;
	Thu, 10 Aug 2023 05:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4E2D41589
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED2C01BF3F6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 05:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6F1482314
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 05:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6F1482314
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 55T8v9EdVjWe for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 05:49:52 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A222482212
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 05:49:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A222482212
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.223.222]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MWASY-1qJOXT1IXy-00Xbpm; Thu, 10 Aug 2023 07:49:45 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 07:48:46 +0200
Message-ID: <20230810054856.100816-2-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230810054856.100816-1-dalang@gmx.at>
References: <20230810054856.100816-1-dalang@gmx.at>
MIME-Version: 1.0
X-Provags-ID: V03:K1:R2WQEDv3GPEKrWygmh13qELXc7+uRh0IjkKVKmkFBq40ozTvHEg
 ot1IEFGVpOjDQ0HYO/bnY9sl+f4PvySSWhWflbrEzXp58fI5H7FFlAZe5Mqmf0TyOymej0w
 KoH7DLONTNkyryImgP3m5pWOf2V7Md/0nNxrHVfBUZKIvFpE2WuYahFkqAeXKnd/SKELQBo
 u75ry0uAwvIEf/EhZwdlQ==
UI-OutboundReport: notjunk:1;M01:P0:+3qh/H3/6yY=;9Q6doE1n62Oi4TWxm1adLFvi3zg
 MGCo7tpG3nQuTfOL5SgnVncPoQAdsEbxSR7xUAw8uNHqxPHfXC9H5BkoqQFgOQokRU3u8FGYf
 07f0QEVNiqSlTg1VPhDJYuPWBFk+jxN2xc0NR4YahasD3jIt3tf6IL0jPscvI/3vS8UE8cGCq
 pLM43YP2ruVy1lwf/r4tmf4G23ok8SuBbPTMz7JRMPuJgCj7MtNbzxliZY54M1vpxWq69jmv6
 GkRE5KFUO/DsBbvsT+tHdfG7bO1nF/W1XBx8tghBZaO9KX64fNGBX+k4NavUhqTozhamCNSqX
 7r4LAcJXzXJI79xcXkbtRGzxlhXGgOF8+A4PcndpozRhi/N7tomweyqTBke0oLPiZkJZRX5Gi
 Ic95KTR3uzjNEG8hodtDo7sh3Cp5xUv5RWrVp/2vvO5Y2MGPbR/bmCxqLwGsFWsb8AN3jlE99
 Q5354kl62p6qhGnw008xIzcJjgw2C6iy2ZDZZkoepMIpD63YWoBl3xDmEWkse+p/imPnNVgKL
 Qxe1txRwR97zrOAclNdwUeCH51pBa1Yr8Y5F8fElmgULk0Erdzp+rmjGXonlJKhp5C/OMIeDZ
 KgOXOTsEcOsH+ofz9iafsE0c6yZS4vtA+scFZB7v9HesTwWqs55UdEUkH5+T/+tfiQd/QrwwM
 QmGdNF45bclw3DoXv3uJJIa2CVrvkcgIIAzUp7IHnWA3lBTKs864i3M0QK5Zl4tNiBc3uCdOn
 TcahBlAjD7T0mwWgmajPQzwBN9QVx5g7ir2xZwU7O+cDa068UjAYsU392dL2FAVFafWqG8fL7
 3MiYKVY94YQO49yq4GeOzEvan18VEmih1BCh6tjtMgWjxbc3oB1bFRrOC9YegFDpTg1asWtKi
 C8P2jiTb/mzOhJf/Ml32xzhAzWBQUAIZ79l80v9FHbqr+w0BycZzHbS9iUASHDjk4CYIlY+hi
 7hBeH0ZihPK+9AxvEpbnWCn2jqA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691646585; x=1692251385; i=dalang@gmx.at;
 bh=gaefaDU5/bDqQGC3wMDyv+t4aXDubkAp3CvkXUCRBFc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XMVwZpx5sSIYoYRxh4fti6G96Smi3mKY4Xp4K3DPjoF9WhsHh3yu0yaaeLtM5Xkj3XFZZKe
 qpj/kZKYSyW8SlZNsXdwFS/+51IZHGZvM1WUOCcvxj0dRsihXM4oErN4jF/BM+7DE6PvJiGwm
 cAeJTOHoondYrLACy4qLYYMW6MM6RZ5r+VT/PX2n/uwndP60Sc9PzxTJXKPRAWlkhswpCF28n
 oAKMOgqQQzyHbViUqoZOv/rHaO7qgToudINQFr/UunaYVcVkeApMN3rXhD2x0bQWVWwOEfkae
 H2IPhVjDDy1Mrhkyflx+gAC6kEawJCFi6U4hszG116tKYf2gvopw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=XMVwZpx5
Subject: [Buildroot] [PATCH v2 2/7] support/scripts/pkg-stats: ignore
 llvm-project.mk
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
f6eaf60 ("package/llvm-project: new group for llvm packages")

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 support/scripts/pkg-stats | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index eea900124c..1ac538f5f9 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -345,6 +345,7 @@ def get_pkglist(npackages, package_list):
                      "package/gstreamer/gstreamer.mk",
                      "package/gstreamer1/gstreamer1.mk",
                      "package/gtk2-themes/gtk2-themes.mk",
+                     "package/llvm-project/llvm-project.mk",
                      "package/matchbox/matchbox.mk",
                      "package/opengl/opengl.mk",
                      "package/qt5/qt5.mk",
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
