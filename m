Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0B0C0015E
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 07:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0063C61293;
	Thu, 13 Jul 2023 07:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0063C61293
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aK3oHBSt3nMN; Thu, 13 Jul 2023 07:40:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C2C461320;
	Thu, 13 Jul 2023 07:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C2C461320
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0DDA91BF397
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B794740C5A
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B794740C5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kM1H3tAyQ9v2 for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 07:39:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8477040A85
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8477040A85
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 07:39:03 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.134]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MZTqg-1qVSJo2tF8-00WW5S; Thu, 13 Jul 2023 09:38:58 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 09:38:54 +0200
Message-ID: <20230713073854.19510-9-ps.report@gmx.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713073854.19510-1-ps.report@gmx.net>
References: <20230713073854.19510-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:+xmPIooQ4KOI0P4loWYNQVbh8aSb8NDHEGn89Vv1gIte/5qzLvx
 EoUfCaQOICz/lIQFBKnglPFqCy1XLwZGZwyqvL4Vh8LGFN5K9pbCjcQ2k0rEtHo4GbE/q7X
 zlMlwn5XqTevo1/p9mTSpEtl0iL3Mkb4kM6DM8NPu+AbkDb7vWGG7Cy7XwtZepxX7mfV5my
 aIciOu9/65iuuSMu2RvGw==
UI-OutboundReport: notjunk:1;M01:P0:0OeQABC3VkM=;xx6+vPm8Mc1hjRLUriRcLhwfRBU
 yIApUu4ZosebYNI9bTohA6O6n7t8z7xJV3SDtPppMeNAB++ngpprMAHPLfvZeCeOHS4EcPar9
 6c1MnxWZp35QptF3mVvcB76fa88CwP5i5PO5WCGxpsgenewr/eygtTuRfdu20CyOt29jmbo4x
 3/RNlby0LNe6Q78d3hs2hXjT6fKVxQoegj4rfTLw8Qgf4gzmSMOPDOamwiuk7K8bTgpwCQfHy
 1qeg1BVQwTMz3lpSGFV7zoedJftCcQ+niAv8rJaWiHU+uzgoZspQHZuFO7R+WjSmuMmKVcRkQ
 p1u5dS2JGtZI5HQR1pnH6ZnjulAgkx5C0w0EVMRAu1EkYW+b77srsSyJxGekyJJT+M99gC0zP
 /8Y4twON0XI8jqaaIZ2o+rebHg+TmeuLDTM8QTFdfnfpkdBDWBsCfC1VURTrV9dvDc+j0vmmP
 aQ/bazEIS0IYSRcLApk8Z9vaPuWOYAFdxD16epX8L+3i+Z+h8eb9/aCdjshdbwp6qvX7LIKP7
 s2bACGmtzjzyJxAoWklrVSI0bCuPWBq0l5nFWbuclWhe9cL/ZO3lCyeS4U03r+hp/PZjFfAH9
 C1gfsz5Za16bwa38lpLRCdAhZk8v1laLNOmn3JYXMmlTQVP7UlMQA5fMFtuv0WwZe/2/YuZd5
 HUr0oNx964vO8bipyHp3ECJNozXU4nwHCFf5DtaJOeu3cst5AAEwMQcxPJG277zj2ymBUek7h
 SOYaR72GNTF6Pg2CN0PB5MQQKE5AQoaw0rOk2ADOMJnR68JH86WUJJC40p4Gm633Pj8sII+VX
 RKeVaGuP0hVu0um9b94zrlwVdrvzDzweg6CuZz6tE+VfGl/ZS9Hp+MEP9GxQEyTR0Lva32OyT
 1zOh/JtrgSGsqD6MvGL7W5bjMJ57qkrAKj0CIWrJXMH10dnqurGe0ruPMqPbgXfdR98QblIt/
 X3SCag==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1689233938; x=1689838738; i=ps.report@gmx.net;
 bh=M3yh8gVsbDQhwR/Q3g0E0GaoMoaAxDoMncnsfaVvg3k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XDl3ygRC/V7AURDKwWYvfjj+uFpRTnzJsM5RLUz0WO5yU22D+cLGj71RaocV2uvbmsNr7bv
 CiOSZWDZJF6F2YmVeTullX9ElA69CtpQLj6RFloYbbrVVNdhodSzeLEi39c1laxRam7IU73A9
 Y7b2QNdiLY8kpgpTkIgu+alZ/uTYZqrz12yQqCpdXvA3GdhGVdovn6TKggnVbU899FVxnzFND
 OipuJYfM9KA/676R/IfjNRil4m2ZefXGhpgZ1i8xG2BWG/rgoeZvSnotoJlqt0hs//LCh8yUC
 DL99YVYS+hVXJ+AZenp5eDDgc8MXPFlt/o0849rt7iRZANS5Qcrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=XDl3ygRC
Subject: [Buildroot] [PATCH v1 9/9] package/python-jinja2: update project URL
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
Cc: Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- update project URL (where the old one re-directs to)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/python-jinja2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-jinja2/Config.in b/package/python-jinja2/Config.in
index 84a46bd264..5623d4723c 100644
--- a/package/python-jinja2/Config.in
+++ b/package/python-jinja2/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_PYTHON_JINJA2
 	  provides a Django inspired non-XML syntax but supports
 	  inline expressions and an optional sandboxed environment.
 
-	  http://jinja.pocoo.org/
+	  https://jinja.palletsprojects.com
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
