Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21E2EE6B60
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 21:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88B74611B1;
	Fri,  6 Feb 2026 21:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKWWniPHWI2c; Fri,  6 Feb 2026 21:39:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CA9760A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770413944;
	bh=VwIMroUrryY6zM0mKmNjyDTq6xbi4OGCXxjqeXwXbEA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=cjbGyIkoqw95yRqsrMdJ1+AqHW3DQKT41gfFCuwjOYq89VsruSSwhH0Fa/GsbS+ul
	 n0rBc4JRZsD7moWta91cM5L8qpsCqvlUQWNyutcZUKvp10lQnzacPPJO8HqkHOr8jD
	 r4feIb7GPaM0hiu55RTRc+wPQqr31M0znhbIMMd6Mh6oboWviRW/Bd4PqMuttcjn3f
	 DY0kUz+fdWS+LJv5N++X3okBB7q7jbwuCtWRnbDQZYj0NonDfMXKpwYnMXr/4iUK9g
	 R0iTE2WvYDwh0xeUP7WfsSnA7OvHM155Q1sRq/R/KHAaEfmXrZA+gwOCnPM2XlCv1w
	 7Jjl4pB6B/77g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CA9760A4A;
	Fri,  6 Feb 2026 21:39:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 79A952C5
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B6384010C
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:39:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IdaFqJThe8uM for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 21:39:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C48AC40105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C48AC40105
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C48AC40105
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:39:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.117.98]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MOA3F-1wCqwi0ud7-00WOcf; Fri, 06
 Feb 2026 22:38:57 +0100
To: buildroot@buildroot.org
Date: Fri,  6 Feb 2026 22:38:43 +0100
Message-ID: <20260206213843.1031752-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:+2HZ/YEn3TDV0AAJvbod0kwI2VxsMAEN2YBMx/mBThoU85xLOJf
 qge/wKzPZZg1LnlIum2PlpkrjvlQ0lrvFEru7x5pBUJXnYtlzYSV+p6p7WCeYG35xk8E5jR
 rruL6+aJ1FPbe42XQqMrjvioi+Qwc5eYFx3UMQPagQ1VZyBhSvWPVOFD/yrXUjrg3iE3Mm3
 YqvdF+8x5mthMrXfHMXSg==
UI-OutboundReport: notjunk:1;M01:P0:6DMvzlHG/g4=;piC2WQQXKUFAw09CCbC5ormFnpq
 pvz0dnWvNJdH0gD3MFGRBi6hUdkjww+QgY4UWwhIzM7o3R/Vky1jsghF3MtQxmsIn6qn7M+yi
 2SAa4013W7RKHoJQJJw5ZM8Vv8g/0zN2pbfosInlF3Xic1kveJC1PehUUfQOufkt3VDZfuwNX
 9bXhEcJ0rJoIZEbZgzACsb/6rUVZ/IEl9D57QAd8PyyQ/DGGI2CglrK83NamYcX8+L+kXj9Pb
 +scMAxgdWXpB70EfCoLxJ2B/2zWC3FUvMObs7RK3mPfgvh2R7kaJikQW/7DEj1rJo4pfKjlYR
 tLgTVdeAUgBOfy1ebeKGAcRqNIdQiYd60ECIAfdGXb2CXxTWycW/xzLu2jYIDpaVCYRDp/Xvn
 QGCUJTlm1WD4F1/JDUL0sdLIpDexysHOgRb07e50jUifoTpRxB3MbSK025RNsIOgpHrOMyyfT
 cDp03xo8d51tezmj/7KXgiZFHOUc1XFz+omMm5DJnJimHU18Cv+Xb6dOVT8x34TwasB6cb4Oo
 s7gHLflLDngsXrAFjrTUYDFS2SwmDjXr+W7aIlm5pernxVEzYaNTqK++ednc8twDcvW3wJ3YI
 s+z9dD9v7DuFTmLGmGekSGdhQs/lwpQjaLc0T79J8llCPSHUo41Zy/ThBurrR03ZXjy8ti6H1
 w3+3OXQYol/SHCe7Rs3gwv8KHueOreocVGocapS52WDHU/eRrfZyJbmyJz8rGcP6/C08E2hAg
 fXELt0aWY0zqDGbZQ9NZ+rOY9JBcqP3XaRhvsB7a97RYjXd3wO0eJSqRTcRns8VUMYKJ6YLju
 9dUeRaz1gvRH322VKKW/rbFxyaSyJkLAz/l7RJFysaj0hzKc8dXmC4OFxPUOzJ0Z3UTMdEslo
 di5g7+u+NCoVbGyn5jIaclSKXO4nL/iK8HM2NGFxL7G270uQQEGwsB+55oaChYH0vW4fpL6yZ
 wdlxe9xYpMowzc0QhdOBRLWnzoPIVzsLZRWygNK6wiCS2zl8FOGQJEIEy/1MsyzgK0RqMNujG
 WrxNmOptsoyCt6ZSulbga5WiF1oTFR/2klvn8NgbRmVyv/gq3KUROKb40ygPht2yd6/ovF5rQ
 cIsfTMdy9fXXdn1HSDHKHxUMCT8dyM5uADzLZMQHgmXOHaSWUFQhl4r4aHywxZJtsw1OpCMX9
 ZISbHNePXDevna056LK9THJ8T//jdghID2bxjSpLX0H3TWcKtrMFZjuH8JyxJ+Tnm8tBWIy/R
 gMalc8uyCzyUnZPjjEeVn354xxPA5uwWBnAT46uK7O9Ac1tGf0YdpnFO4Fq/5uvs4/vzIp1X2
 iqPSZZGy7hYhSfpxNJpyuqtYHQuCt/VFVKsoxlh8SpCmPd3+Ou3G2uBKu3UoLlhsc9D2PrBKD
 gw+O/1N3eMaXcoVHZpbed7F6RC29N1DvKPxpbdMd4PELLuMzEJZSNcUjeV5YczFyUxS4MnldP
 yNNte3dpK7tLJBEnVogfLFtdyUmEhYlawdTYrDCkQmLHTbUG/FayCIeWMeMaQlGZWgldaaKgm
 lXvkonUuZ4irzX869QRRPejsMgoo/fWC3pIoTAzxjc1l0VUk9GrNE7uOAD4IIinR85KEAcV6q
 LfJsd+QYDxr6Kcl7xR6a6egqnDk9nDQvDOq2C6MfgID2BtFZZCGllCOLGycvNyY9l3/4xm8M8
 EexEdBjDVApoIvtn/B2b7VESxYHlpOoD7DJtJqWBA1xa1uciNM7i6pltGHnLUUBxGZSCRwjYk
 LbdhGZR28ldmSF701HbIwG3xh1fbY7S1/f5bYGQ1GYoQzA3E950+ITrswdlohso8s+AdKYcGF
 a9xjs1bwMhUICNz0DFLi6VKwYRKHnuRoYkCkOvOycVbHkE+JM7e1ebySjl0ucLoCGz/T/hLhB
 YdlI01Mh3+QvfgzN0bXSFUGvCAOqJ79O4WDVKs05VE3QU0GBYZs7nQkBxzOfptTwC6qFNXtjO
 itXTeScCDbNgZsjbd0yg2vKrvPFPXXPBc2ljy6Zg4tAjcRyU5XMW0ZfxjfBsifM69g/aKX7Xt
 nIEbWaXQCSzvQppgcDCwigyC1qkr3Z2Vtc+Gv9SdL39be/cnXNsciY1Y9putk7QdPcVnF6ml8
 Dr4Wx9NVWaZtV9Z7mPk9Os6Uxc9+nPekG7oI4QJwcuYFeBOoTi4xIr4juceTwbARpVuuTeKbJ
 /Ln2aTzRj7vm3sTN3CECM0okQQhUFeoQ25q7UKE2kQkwv6VyXPao0R63cpwSmsb+ZIUIOMPRX
 Ozauixycj7Zfywbk/+vRAFYhOpwYPL2WIMCiZOUCTAKBwyauUIdQJbDp/jv8VhQv2lNK/q5JX
 hzJI98s7y+9YW0zkjvMc5qmMxRzmF4A2Zst2KO03vn9X3VOwqkLLsJy3PaE4FyXBAfxabMJ4p
 eBLY/jBboIfrsyTehZal7Hd4vcP/7uwgo4MbMD2o1KT8vID4DL0Lyl02sSnE8o+vA10jNkqB/
 CtlzsmX3Xcbv6D1wAHKy/gU1fOyiX6G0RhUbKk9f4yqpczMfCW13gLW3bOXE9LK2SUvN9MCOo
 i7gUhX0nLWYR7s9wDvCaFaTfunnc+4YtInAzyc4KeAxJtv7Jt5OOiMehQ52iCfdaEU2Igoev8
 xpWESfnYET6VJzEK7XgMU5FruRHk3Xftbm5D/N4d+ButaLDXAJYPk2rMEefp6YxHJG8XMPvkX
 LxFeyM4Ny8ywTT4UW5QNwI+9OaL0z/0S2V11CUpgHCyn1Y2mdYQ2Wf5aAYFaA8ewyIWoDrYyN
 rqMqqEcxSa98qpRKefuMk1cTuncycVPgATuNIiIfRITNdHYpCEOAQPjmOn1pU655u9JpodCAt
 dhULOz1Yt4k5+KbLVG7+mxTztfLIkYVvJ+7CKqn+DcHRzq0exgzonsyppSJY8PaBIXRBebcFe
 IUrqQ5tw1NY8Gd1BmjrtbFFUiVxW88rfem0wom2f0ZkYff6aL33Y5kh3Itd3EqVNPrvil2XB+
 +ivPcA8X0WsWRtkieet5pGke0SBTU7OcSVM2bJRgxvEWuAIDgx6RRuIHn+K6hvo8gJNJwvRQR
 dLFdWRxuf/r9ZPDQNnQBGQfF0KZ3ewP0fGEzLGSbkB625f0z/G8JdXBRQxgwkZ6TCWUy74sZS
 s/C2Bq7qgRVKDXYU6gTljye3tk9Wgbc35T/VJeURpiTgFb3oDJPvsNEQin8PJYkHdObVWZAMI
 kAXU3+e5O6hVmUtpHtCYmCRVMxU4K55tdphDSKl5ATH4zJsvEiYp3EX5l0KCJibsms1F7hNdg
 dWpCwnkJmGmf8HeqMpQfc/2JhCgpMqTN28dRL9K1zgFe4gn+bA5ItrYfSB08ax8e2uPRo2AMH
 lR45SothjOA2fht/Q8S81D9uLdED3BMMCsy0SQXsOIujsvuunLc7bodqQXPuzdBjsAWDD5I14
 DlV5IMRmo/KsphFP2tO9peBd8EEOvnnUYhepV40E2j4eMmTxEVG9WoU6CbfCgLALES3UcxvD/
 dRsfrL4lkM2LA8rDelfaoVfpbSl2lZKhoTiajvky0Y5mZPZjxrFt8MLzpWsJoFieJGqD1oJaq
 ElAJbbVV70L9m3r07DOsOoMrnqVzCiZkqoaDCkmFTZns828pewoNo0NFvFa54SGykxCdt620e
 fmew0v6lZtAxr7zq7bvWlFpjtPUD8466VLTgUESjDa+hWGbe/gREg5FvpNzGSJ8pcCYZzZRRp
 p+AWTkkqPiPjn8JQzEaFrm+ZSgplxB5JeVJIqBBxBkhMCTK/9sAxty8xaOJ15jiKWw+IZcixP
 hmdS5MaGqDGgt0bRq4zRWjUZiFaBeqrZUtoTDB3YN34jwbkRPyOsrCuD7mOkWgRscFy+TMYNX
 vgGRgjwT80ZJJ+yK11xF/WnViQnZkICZ02BVeCJuOqnOkyTkxALqzJWZNSTD61nIjL8msKVJe
 7NLWoT9hYe8YVZ/LUu9b3teICghhb3XPpy/4594KOY2eIYFHJC7a61HQxKing1zTuV+QFnFNB
 7B/gkoaE1jjsXrddY6V3zvEQCpyPrcADf2Agr7i7I6FAiO4KVLbAOBx0BN7AzS3gycUdJM7TX
 Wg2r0mkkGvNfiADs3UsNudWZGMBYSLDwHy4BBN91PP1bNUjoDZSV0KrmNLT3WccyL1O4psHlY
 +zeEx3ivHPEWOaKXL8DXHyfEGBagthxnt/yN+iISzZceMhSNvNN9KqGkxIx+jGbOTXadkzZi1
 Fz+kToYJN8vDMhJpcTRKZSv8QrNtbNhf8wEjv2sC/F5AlfURyDz94VoUL/PNtYIie+P79nQx2
 DS8VgnLyxEIwF81RUvjy0LpkxDSjCoDt1VvdfLN+AaVYJ+mscibaFGNp84rLByotjakI13VWH
 6CFdQB1U0AVThydX7rGSAIEyL3BmSZIHiQtwwHLSrS+wQowRwMnDVK1waw6RC84wrN4Xo1Ek0
 wWdn31zPHrEwaaqoufCMu3VLalVTUnSLZdP4tbsut0l91leAzJ8qLjcukdg32eb7GhXNrvvHs
 /JClKchzRGl//zN8zBufppdqbrWEoXHx8vnsrozrRU1YfXOOqn1aTuvagowFbxU41M3FoGYc9
 Mg9GGfB3qsHKrzG/6nVGVCTjvOJvyK6pqkntAUl5QE6K3Kdo2mTUFs/ZFvRtydEPL3x4Mh2dj
 Wl72sIZJOFhhZyKcgwffYQ7aPHbF43OhrhnnGCKeAWKBlJNOvrLD/NP/Sf5rfggyOBmT6jss0
 TDhSkGjlQGOyf26Ua4L1bOyZoYC+RtV/lP5z0a68nYw07L+HshP3g4xnHCtivWKFviAmQxaAj
 vqcbxNYblda8Ykfnw6sIpZ4lBG0DEr+f7sKEkIpK+NNMBtA7DlyBR6GL0AGbL27uzkpnSyMRD
 CVHE4k8kBPaWIm5O2NgHWdnwVIhq3Oc7WwGv6jpI/ikFc3ghokmmC4J+ajlzgGaw2eewqUf5x
 Ukdijmyy0Avd6R2CiSwaUtWNmIRMcTLTSr773pSOLMo1CUdVJ91M2sDpjiDU//2ohOtpoqEvS
 3bVlcSGadp/K+pLk2EuamyffvxCj8uhBJ3VoTTERnmKZGdzSaZnhXB6e0yUustUO8kN4fLpV/
 nTZ9OQ5M0HNZRLYqdNwoxGky/PKjnnnJloemVEuCYhjtkHNREQo85INJFoN9t02odPBzoy2Uk
 +1WMeXHItgNB+kUWNlh4VEM08G46ngnf9MEcwpo7Qta6p6ODZORt6LRLIywgK4kqgiRQXjD7G
 cSHgfRCEgRpygGJ3npf3hdxR7XX9qcqViocgkRAa61ps+61SmHuEq4mJlCXiLqBGy76koAY0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1770413937; x=1771018737; i=fiona.klute@gmx.de;
 bh=afPXp1XxtWfIfEFa5ODi4dfv48/O5uNr9zjd4mMj5Jc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=btGmgFsjWLTXwU+DbmYgeRBY4W5buc6ay0b2S/CwsQuUla12zixrVaoIX5YRsQd2
 zRsZyyBQeJVQVB3cU4XbILlfWkTSOgABClSyLZOoXXfb/Lv7Sew8GOsw4uHASwB4U
 ph3OhNh1urYXsZKEIfovXSybZwDiBdNYRH9mOQ63dg6bPcRQ1McmWHJB7TrcVDvDq
 ytJdovsGr0j1unjY9uisQKomN/VXJAR8PYJ/kmRSdpJJaJrp7vkTkkEHJpXpdAVw4
 a5FCgSU9NZOVpcuCTMVJiphZXb3WW3W8bSAt5lfp5xXmDxntkh6Y68UYVXaDmr5LI
 yD+iAYAan+vYCu2+vw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=btGmgFsj
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: fix hash dir links
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Bernd Kuhls <bernd@kuhls.net>, Julien Olivain <ju.o@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since commit 0e3ddc9dc85e29cd00338cc79ea4be1d634a75ba "{linux,
linux-headers}: split hash file in before and from 6.17" there are two
hash file variants, and symlinks for the individual versions. These
were not updated in 48186093fd355ede91151b2342e222cef303a6ca "bump
5.{10, 15}.x / 6.{1, 6, 12, 18}.x series".

Fixes: 48186093fd355ede91151b2342e222cef303a6ca

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
I've noticed the issue with 6.18.9 and tested the fix there, the other
symlinks are simply updated to match what's in the hash files. I am a
bit confused my for most kernel versions there's no symlink in linux/ at
all, but that's a separate matter.

 linux/{6.18.8 => 6.18.9}                     | 0
 package/linux-headers/{5.10.248 => 5.10.249} | 0
 package/linux-headers/{5.15.198 => 5.15.199} | 0
 package/linux-headers/{6.1.161 => 6.1.162}   | 0
 package/linux-headers/{6.12.68 => 6.12.69}   | 0
 package/linux-headers/{6.18.8 => 6.18.9}     | 0
 package/linux-headers/{6.6.112 => 6.6.123}   | 0
 7 files changed, 0 insertions(+), 0 deletions(-)
 rename linux/{6.18.8 => 6.18.9} (100%)
 rename package/linux-headers/{5.10.248 => 5.10.249} (100%)
 rename package/linux-headers/{5.15.198 => 5.15.199} (100%)
 rename package/linux-headers/{6.1.161 => 6.1.162} (100%)
 rename package/linux-headers/{6.12.68 => 6.12.69} (100%)
 rename package/linux-headers/{6.18.8 => 6.18.9} (100%)
 rename package/linux-headers/{6.6.112 => 6.6.123} (100%)

diff --git a/linux/6.18.8 b/linux/6.18.9
similarity index 100%
rename from linux/6.18.8
rename to linux/6.18.9
diff --git a/package/linux-headers/5.10.248 b/package/linux-headers/5.10.249
similarity index 100%
rename from package/linux-headers/5.10.248
rename to package/linux-headers/5.10.249
diff --git a/package/linux-headers/5.15.198 b/package/linux-headers/5.15.199
similarity index 100%
rename from package/linux-headers/5.15.198
rename to package/linux-headers/5.15.199
diff --git a/package/linux-headers/6.1.161 b/package/linux-headers/6.1.162
similarity index 100%
rename from package/linux-headers/6.1.161
rename to package/linux-headers/6.1.162
diff --git a/package/linux-headers/6.12.68 b/package/linux-headers/6.12.69
similarity index 100%
rename from package/linux-headers/6.12.68
rename to package/linux-headers/6.12.69
diff --git a/package/linux-headers/6.18.8 b/package/linux-headers/6.18.9
similarity index 100%
rename from package/linux-headers/6.18.8
rename to package/linux-headers/6.18.9
diff --git a/package/linux-headers/6.6.112 b/package/linux-headers/6.6.123
similarity index 100%
rename from package/linux-headers/6.6.112
rename to package/linux-headers/6.6.123
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
