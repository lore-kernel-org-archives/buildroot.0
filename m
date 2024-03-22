Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B91C54E71
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 20:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EA566102E;
	Fri, 22 Mar 2024 20:58:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7c30jxFeo12k; Fri, 22 Mar 2024 20:58:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DAE36060A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DAE36060A;
	Fri, 22 Mar 2024 20:58:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 83A2B1BF20F
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 20:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F8D9405DE
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 20:58:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0AePA1J2wl_g for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 20:58:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=friedtj@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0A913405A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A913405A1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A913405A1
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 20:58:36 +0000 (UTC)
Received: from zimbra-e1-03.priv.proxad.net (unknown [172.20.243.151])
 by smtp3-g21.free.fr (Postfix) with ESMTP id 277CB13F899
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 21:58:33 +0100 (CET)
Date: Fri, 22 Mar 2024 21:58:32 +0100 (CET)
From: friedtj@free.fr
To: buildroot <buildroot@buildroot.org>
Message-ID: <1322751925.1056008247.1711141112983.JavaMail.zimbra@free.fr>
In-Reply-To: <1392555888.1047670733.1711087389627.JavaMail.zimbra@free.fr>
References: <1392555888.1047670733.1711087389627.JavaMail.zimbra@free.fr>
MIME-Version: 1.0
X-Originating-IP: [194.12.185.168]
X-Mailer: Zimbra 9.0.0_GA_1337 (ZimbraWebClient - FF124 (Linux)/9.0.0_GA_1337)
Thread-Topic: package/gnuradio: activate gr-iio
Thread-Index: YVi8kiDSGROpJ0jDrcxIyDi0h5yyg+SQ7ue5
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711141113;
 bh=6POdd8Fi7Q72j4h9UBcrgaEOwnH0spiSP+zYW/HZWWA=;
 h=Date:From:To:In-Reply-To:References:Subject:From;
 b=NW9qRmpz3rXOvBl0XofI2fYC7g1aMOMLbRwmBlsJ81vDo1q42tmyUFMG3/UwbudWr
 9NErYTnqV6KBWlFZo1M6sCIsLzlT6nv1nAjazVahIYZQNwW4zk84pKSG4UUhOdwQ8T
 ZHGfcZLsRKnCFlHdiJNvmgBlsBGpQmN5tYKVqPRaonKkleGxur7FosjbiUMXSEE3eY
 MYGVLGcH4Xe9b8qEUN3uPefeRDhVnBlK3hUORibmNQUZV1XmCEezOy5HlgqPRmL7CR
 hoPUuPmB3ITcMgsQ5XaIs/18//OmT8auQ0Qpjgd63icPT/qkU1w29s8psrn0dK2bA7
 qCMmeIsToXHIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NW9qRmpz
Subject: Re: [Buildroot] package/gnuradio: activate gr-iio
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

From e26989cc30d4476d7384e62064cfa6486706bf8b Mon Sep 17 00:00:00 2001
From: JM Friedt <jmfriedt@femto-st.fr>
Date: Fri, 22 Mar 2024 20:55:44 +0000
Subject: [PATCH 1/1] package/gnuradio: add IIO as optional feature of GNU Radio

---
 package/gnuradio/Config.in   | 7 +++++++
 package/gnuradio/gnuradio.mk | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
index be997e91e2..d9ad650672 100644
--- a/package/gnuradio/Config.in
+++ b/package/gnuradio/Config.in
@@ -136,6 +136,13 @@ config BR2_PACKAGE_GNURADIO_FILTER
        help
          Filter signal processing blocks
 
+config BR2_PACKAGE_GNURADIO_IIO
+       bool "gr-iio support"
+       select BR2_PACKAGE_LIBIIO
+       select BR2_PACKAGE_GNURADIO_BLOCKS
+       help
+         IIO support
+
 config BR2_PACKAGE_GNURADIO_NETWORK
        bool "gr-network support"
        select BR2_PACKAGE_GNURADIO_BLOCKS
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 4e82c9e129..2267e7561a 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -112,6 +112,12 @@ else
 GNURADIO_CONF_OPTS += -DENABLE_GR_NETWORK=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_GNURADIO_IIO),y)
+GNURADIO_CONF_OPTS += -DENABLE_GR_IIO=ON
+else
+GNURADIO_CONF_OPTS += -DENABLE_GR_IIO=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
 GNURADIO_DEPENDENCIES += python3 python-pybind \
        host-python-numpy host-python-packaging
-- 
2.43.0

Signed-off-by: Jean-Michel Friedt <jmfriedt@femto-st.fr>

Optional activation of the gr-iio option rather than forced activation of the option.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
