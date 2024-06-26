Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31904C27C4F
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 09:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF0A9606F1;
	Wed, 26 Jun 2024 09:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rj_DNxhVvQxQ; Wed, 26 Jun 2024 09:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F2E760AD3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F2E760AD3;
	Wed, 26 Jun 2024 09:00:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5D901BF41B
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 09:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D17AF80C41
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 09:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IAsE5jscxx_z for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 09:00:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8419180BCC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8419180BCC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8419180BCC
 for <buildroot@busybox.net>; Wed, 26 Jun 2024 09:00:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.75]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1po0-1sKBaV1Gv2-0012bd
 for <buildroot@busybox.net>; Wed, 26 Jun 2024 11:00:27 +0200
To: buildroot@busybox.net
Date: Wed, 26 Jun 2024 11:00:26 +0200
Message-ID: <20240626090026.31083-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:IkrMz3wEDrOFcFnr4QBJ0N3BTs/+Is3fu1kZ0g7phbbHYMmpAu6
 sBfUTB5M4ii4Yw5Ax4j/WtI1b4zt0zRR47Mww1JEeYJhMUGNf5UULqN9cbNpPMwW/qEW4yT
 dKd+BzcmgzXUa3FExO2UjAvhrT+m7ddj9Jtq4lbE6aYW3h4dfFkZtmQG4wF18WN2V0yxoca
 TCBpc1P5gDDfXCATfEVrQ==
UI-OutboundReport: notjunk:1;M01:P0:2/C940a73UE=;zik3tkeIACzHN4aSwodIZUayLdW
 PZHHOX7KrxSned8cLoP2PbnrfDlXY9tLr793BjuDi169SFIg8AMuIsZvwt5+MgTJFiCD6xUAa
 QChjGsgvwm/hT47PFItqT8Ah90YRsmYjN0CpfMpPVdQtgkR7xqo3PHoCu4wG8p0f9CnpFN6lW
 zDwX0MMQYYCCMxclcKI+zyR6COVreDvkEaOTLupWxEo5Q8z6H8a2inoST7sEFiY3A2oxgUH+Q
 W66IBTL5CrygVp/wu3W4ggDciSH8q+5R03bZSKJCDdXRn9pNULHZAQxJq5lsYT4d6ngJLYOeq
 mNT5DjHkX4SvOg19QOgtRzqo2XuaAjyhgciODRCO3ps/wx2oums5oDuvzMaMTG+PYGgsdNIjL
 iqNakDphDtom1JeFxFIzqjV1VOdZqIf5O4UgmK9SIGTSWkaUmBHoPRqf24sIYG4FOgqNjuBWk
 29RcUjCPQvqub6NqeCOiOT299DHBRx/gC5qMGRGhXb/pEqcZ1I0QFXG2KKv2kLrzzXvlUFTd8
 nfxhHmpMwzuFoqm4u2cUmaPwPk5OMyDQZVUkGN8Odt5zqz1EKrD+YGrj+/jnqNFP5MAhR4Cl8
 PsOX93S4wSzM3Z8NYIopoXr5XVjguMRSAaQUtGQi0S0hnUm09T6raPzZlnRbMOwfvqoczkhx1
 u8MImBOujFEi1jbP8ztU/zBlhdK6yfKwQFluuoLHF4i6mB20BwdIZ0y+IM5SiDfseVJ+Bv/Q2
 bgZEpphOySDoNEzqvBO4VOqEWSR0ZIkiyowDtcfmzyWRPm4eRkCWsQErkSIpCwUFV3unaTvB8
 G0mdxPylrfTT+Nq4mbPeE/q8FNRu2FIRypsefdqDnTOIw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719392427; x=1719997227; i=ps.report@gmx.net;
 bh=28Bz22QKzUMb2ADJgzqty6BRdtgzTwCvVFRJAhi2Os4=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=NbPzwlQE582EVLw3Bhd/zozfb9WDTDK6D/ZEvzj7EfqIG6uCtS/aECT4bqp8Zuwd
 17SoF/bQ1gSAzfBAOhRgsUhVs9mmjITjC6xQ8FRMcyMDJYdIvEV6FL6995dJe4sC2
 oDN8/sicG9Rygqob0leKLc8s2tc0eQF1EW0ilbNKHKE/BtrjDspd7mUcMz/OJz2uQ
 WyD4sWY4TdroJYFcU5t0Iia5QhAwYdfX7skAMtyR2K6nqV2PuofuWhtYAm1QdF6k3
 IZif/uGK7LrUbPS1j2M/PxnZr7PeEeBe8YVsCvYpLrHduU6fD1q3PcsHcw0FOmtvG
 TR/RpiIQ/vOEEGTNdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=NbPzwlQE
Subject: [Buildroot] [PATCH v1] package/pcre2: bump version to 10.44
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- enable PCRE2_AUTORECONF to fix the following buildi/relink failure:

    x86_64-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used
    in cross-compilation: '-L/usr/lib'

For details see [1].

[1] https://github.com/PCRE2Project/pcre2/blob/master/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/pcre2/pcre2.hash | 4 ++--
 package/pcre2/pcre2.mk   | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index f2e17df753..8b22040ba7 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature:
-# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.43/pcre2-10.43.tar.bz2.sig
-sha256  e2a53984ff0b07dfdb5ae4486bbb9b21cca8e7df2434096cc9bf1b728c350bcb  pcre2-10.43.tar.bz2
+# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.44/pcre2-10.44.tar.bz2.sig
+sha256  d34f02e113cf7193a1ebf2770d3ac527088d485d4e047ed10e5d217c6ef5de96  pcre2-10.44.tar.bz2
 # Locally computed
 sha256  030087e2e8dd7c1bdd26057d25d4ded8f45bbf01ad458d68665ad04b8b0fbedf  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 9641f22e81..191596181a 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.43
+PCRE2_VERSION = 10.44
 PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
@@ -12,6 +12,9 @@ PCRE2_LICENSE_FILES = LICENCE
 PCRE2_CPE_ID_VENDOR = pcre
 PCRE2_INSTALL_STAGING = YES
 PCRE2_CONFIG_SCRIPTS = pcre2-config
+# Fixes build/relink failure ("ERROR: unsafe header/library path used in
+# cross-compilation: '-L/usr/lib'")
+PCRE2_AUTORECONF = YES
 
 PCRE2_CONF_OPTS += --enable-pcre2-8
 PCRE2_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE2_16),--enable-pcre2-16,--disable-pcre2-16)
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
