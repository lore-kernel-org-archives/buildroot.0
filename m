Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3835CC761A6
	for <buildroot@archiver.kernel.org>; Thu, 30 Mar 2023 12:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A74AF41E78;
	Thu, 30 Mar 2023 12:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A74AF41E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vjJLY83oXRb8; Thu, 30 Mar 2023 12:35:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95BD541F91;
	Thu, 30 Mar 2023 12:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95BD541F91
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FCF61BF4DA
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 12:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD98F8414E
 for <buildroot@lists.busybox.net>; Thu, 30 Mar 2023 12:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD98F8414E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bY_tS7DRWgbM for <buildroot@lists.busybox.net>;
 Thu, 30 Mar 2023 12:35:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86E2E84116
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86E2E84116
 for <buildroot@buildroot.org>; Thu, 30 Mar 2023 12:35:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.135]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MwQXN-1qXDWi2ewf-00sR4y; Thu, 30 Mar 2023 14:35:09 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 30 Mar 2023 14:35:08 +0200
Message-Id: <20230330123509.23696-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:IWbOZkO5PYIBVyxwMWQ5ZrcYe1MEQKj4TcQlOE8GOpSZ86Vs8YF
 4STChTdF6YSkxIAp81T1pBoT+P/2UkpqXBjPgwOjwoTQ9bwWeC28F/twsBT8ZpK2K7t3T8I
 lJBROKgxIN647Br1G8r7YudohVFNvhK9BPy2ZTDsCRnCKH16vXA13P/0HE1W96Dd2FrS7Rg
 rsobpBcuBtREMc5/zstnQ==
UI-OutboundReport: notjunk:1;M01:P0:y0VREwxwZl8=;9FvYIZr20ZVW2mY3soIaoeJA0jp
 AW6SRF4fTIzQhCLdB9aX+WVTWA3EhFcOj5FcAq00R9PV20KavRaRfOonOKnWQ20Z618ZTCIBx
 x5Fpn5wpLIkmiPHE9LsCBtbHLZkY4KQAcOkulWEtRtAvQpdAZKsRX4Z90L673an7SVkxHoepw
 eDsxvVKImv3DxWrUck0x1GofwnMzvluKeI564cV55POiQv+BHZrNuYNpdAUxamkG9pZmw2Nki
 8NECsoo0vl6AnWLuXn289Dj5lpeQ7EHgTbwWclvHi56eIUy3EIJnpVDBkm+UyUGA+A2rWsA0T
 EUmaN8waSCJqH1jE0R47lYdAyLawnUCnIslVN5QvYSYq1fx7kzP2j/z2seeKU1hOmQ3cWGMcd
 RflIadzzwOwCDCn/N14AutCyp1tzL1bR/DZ17F1IPy1uk6e/RwIMG53GesOMhwgYHfnM+tFgk
 TxxQeARIH/wLWxE97lCI66WwTTv7iypAYqYEH6Y48srDQKRMrnIwxer3ENdljDGAXTFTpvDo+
 5n6hvdeKhcufQ1EiwhMAonhTDNohHTTlsf7/7g+8mCFJYS3Ru5ieploE+6KRa5iFxEZk+MYmT
 lQSHURTvHAoPe141q6x7YGKgc9uuzLk8qC537MA3dOidh7lYhSQVxLXlUeUnn3hZLrKMbNUrK
 usHSGyswJExvai3bjDT9eUFhzT/1Jt+z2rA7Cb2ro+9my44BGiczVpKY7d2u9l/Us8dnmDOcJ
 RiLOqDB9qQiJI5sGATgc+SvRW8rgF/WDwONMJZzADxfIrdlOEgWNA/drmijl+u4s+Ix57OFuG
 Fv0Mo5DmiolvPbdoPIu9ItPDnSmDiCaTaEdA639WAeEI8sA5r9Vgk3AbH2T60On6fkkIIJWpt
 F1UJCEC+ZS2lVUlq11Uhzw/EUhm2qxxZwlQiYr5ow4Q8TSJUetyVI3Ad84V4juQYGAGO15+G1
 nzFdKmNQ41LRZUu0SneHaMrIGBM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1680179709; i=ps.report@gmx.net;
 bh=7AnEhlQyfomPZnrG8FgGnkZq1uX8SdECYfmwdZPYcVQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=t4r42STUfftUHLPLD5o3qmhSWHcxmC3bBHeAUr9m9/8ssUX3grzCCnsFl9zJfhBrM
 Awfkxfv+A/U5x7PJ9c7fyyAX8huX6dUP3Pcm/k8XnpdLQ6MJJSiTiXqSGDDk26JyX7
 Sb+ePYQr9d3vI0ZqB/mEzymnCQJ/RaP7B83Fb0WxrKRMnAuBRS5gT1RdoOjaSd3vhx
 cT6UdZK53yu34/qViXQFRuvvoGU7f1Yflo3hqSNHszKqSYbq/TGHQ/5O9LmVyEo9Ms
 mM0/XiqGkt+TeeNJUqydvxwSVUl1KGY38VZPcKJyqJHx0rRbtDMTgPUubJd9lht3mT
 fGfu/ewKjVa5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=t4r42STU
Subject: [Buildroot] [PATCH v2 1/2] package/libv4l: bump version to 1.24.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- disable new v4l2-tracer option (fails to compile with rpi4_64 configuration)

For details see [1].

[1] https://git.linuxtv.org/v4l-utils.git/tree/ChangeLog?h=stable-1.24

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - fix --disable-v4l-tracer vs. --disable-v4l2-tracer typo
---
 package/libv4l/libv4l.hash | 2 +-
 package/libv4l/libv4l.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libv4l/libv4l.hash b/package/libv4l/libv4l.hash
index d99d5e0992..4f694de34b 100644
--- a/package/libv4l/libv4l.hash
+++ b/package/libv4l/libv4l.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
 # https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.20.0.tar.bz2.asc
 # with key 05D0169C26E41593418129DF199A64FADFB500FF
-sha256  65c6fbe830a44ca105c443b027182c1b2c9053a91d1e72ad849dfab388b94e31  v4l-utils-1.22.1.tar.bz2
+sha256  cbb7fe8a6307f5ce533a05cded70bb93c3ba06395ab9b6d007eb53b75d805f5b  v4l-utils-1.24.1.tar.bz2
 
 # Locally calculated
 sha256  391e4da1c54a422a78d83be7bf84b2dfb8bacdd8ad256fa4374e128655584a8a  COPYING
diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index fd69b7ac7a..1142a7442f 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBV4L_VERSION = 1.22.1
+LIBV4L_VERSION = 1.24.1
 LIBV4L_SOURCE = v4l-utils-$(LIBV4L_VERSION).tar.bz2
 LIBV4L_SITE = https://linuxtv.org/downloads/v4l-utils
 LIBV4L_INSTALL_STAGING = YES
 LIBV4L_DEPENDENCIES = host-pkgconf
-LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap
+LIBV4L_CONF_OPTS = --disable-doxygen-doc --disable-qvidcap --disable-v4l2-tracer
 # needed to get utils/qv4l link flags right
 LIBV4L_AUTORECONF = YES
 # add host-gettext for AM_ICONV macro
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
