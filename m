Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4C6C64ED9
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 21:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C02341746;
	Mon, 27 Feb 2023 21:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C02341746
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MFajgj8RKPEB; Mon, 27 Feb 2023 21:42:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CEBE417CC;
	Mon, 27 Feb 2023 21:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CEBE417CC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0AE581BF28C
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 21:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D982B60FDB
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 21:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D982B60FDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bCYLpc1Zo8GX for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 21:42:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A100161073
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A100161073
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 21:42:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.73]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mj8mb-1orwj21L5J-00f84C
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 22:42:21 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 22:42:19 +0100
Message-Id: <20230227214220.12101-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:OKsU9DMv6Kp3BPtL6pwqj0KZyQaNJo3z6X9a003b4xXL9YGfmPZ
 QONS9+W8GOd2AOG/Lm9ODBTUEoO0tR7k0tSVa7fS7RpwREwdxW+0Wm9hjB1oVtSzNYjHBu5
 pZwkjv8pKEbngT/RzM6ME3dJYXLCC0HQ8opJWy7OY31r1tqo1BiYXy0vTMr8u3+qn27d6B4
 SUcE0/RRD02iWJeV/ZnVg==
UI-OutboundReport: notjunk:1;M01:P0:ISLVF6Y8l+Y=;6yXkPO4ACN9NJwEM7numoMB/zEr
 tl+6xK5g7UanrlB/EsRB40VuK0eBvXofGqbneMq/9IMKsSSx7WeSYrf1CFAb5HieR5gAnmZeg
 vhjU0D9Pn37AZIZKDEWyrqSlXHlntfht3NiewOwoIDo1WNPxOb7cKO3SeJMg7jVJbfmf3iHZF
 ClsGe0JTQnO8lMBcHfE1yoqZEMPX/yymLhDzhHxEVgr6/SVGvN2bSXVOigzZKEeRtbeJ8fpTy
 2sc0mwLb0f1rGxIfhuPLoagwmIc9NedsLiZDK6nxKgiePrg02PV1F/xueo8NwLzNj+LyZpV7/
 yEFm2gQixZ5s7ourQiaqG2XitLFtEENP73gX3rmNdhZnOhI2Xrk65lr32OtO388iCYuVlIEG7
 e8Vu8Gnx+pO6g3aACBAg2j2/aaAZmGadDwCE5WC4kzaP7lJWp+H+Y9zyFCXdOZGtz7UoXkHvZ
 E1UQx40+4eyvL55yCLx4K5XO9EAw9iHn9LV5Q3cR3JLzf9XV5ROsNnCg6usd+YojfRoeyNq93
 yhcDRVrnWS05Mojue7rM0r9LxmrFWy4oZpVFoPsUuaW70RjCNq+qTnlI8MUC4HD0m0kL7CTKp
 2fcBCt2agQ06EHWI1WofOCpwof7yQ2EyNqQg4NXA0nCytvcVvlZo164USSwSCaNpgvRzA2WL9
 /6+34BZonSR3CJK8HONrOs4IMpGmvpG1lbE7H3KOCMCPwR5WffrUtvvBKLwrY7gZRmWyYwYkM
 qnLDRr2APGnj8cqmFQ7MFpjMp/kvy8DYZKK/YXLtZHMhywWmHJoNP8lCW8KpNlIpxT/IFl7mx
 9YPRzSKdsSQ1CXZt3NaD0DQxFjG98wqMTpAqu4gsEM6mwCtwi9tSCwVDagV0ORwcREKWEig1r
 /zYHQOcSvH7e3E9OHdlX5o1wdivbw+U6W7o9oDaUM5EDjjHLQKDggfdf+qR6GSiFL2WkC4HLc
 4oGQtlYiYYVHj5+eKFmbRqXIDeE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1677534141; i=ps.report@gmx.net;
 bh=wUULxX4+Hk5/TQlzIDmkglzOEgC015loBwkIBcQWFbE=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=QPA7/BtlWsFl6tBDgijTL6WoodDMOT9Qr3qfP/OrsaFp1tBooELp1N3+SpS3NGK3K
 pL45jBIIRtVWuD3V8DGeQ7evy/U1cHqD6mUKf87prZJ8xAPQHw28CzJhmUHYSgwN3x
 QKBsgpw7LR51dd3pCsjjVt9u7t5O4WzAwdnU5li1jnNfuxElf60XznTfENeRiqQSPF
 3ehHWnQ0oXFxEvY42Pj/iBWwQG0XR8O+lGseeZ+N7Uf8wReu7UKVrjuymt1r1JPrio
 T1eqWknvz2TRZGd7AfP++0km/Hh13U/2zbqH/G83Jwi38c8QnrkFFp4R+9WEyINACO
 LSMhQ/BT8E2xQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=QPA7/Btl
Subject: [Buildroot] [PATCH v1 1/2] package/speechd: fix libltdl
 enable/disable configure option
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

- libltdl usage is configured by --disable/enable-ltdl (see configure.ac
  'AC_ARG_ENABLE([ltdl], [...])')

Fixes:

  configure: WARNING: unrecognized options: [...] --with-libltdl

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/speechd/speechd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index ec62980986..b545863035 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -24,9 +24,9 @@ SPEECHD_PRE_CONFIGURE_HOOKS += SPEECHD_TOUCH_CONFIG_RPATH
 
 ifeq ($(BR2_PACKAGE_LIBTOOL),y)
 SPEECHD_DEPENDENCIES += libtool
-SPEECHD_CONF_OPTS += --with-libltdl
+SPEECHD_CONF_OPTS += --enable-ltdl
 else
-SPEECHD_CONF_OPTS += --without-libltdl
+SPEECHD_CONF_OPTS += --disable-ltdl
 endif
 
 define SPEECHD_INSTALL_INIT_SYSTEMD
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
