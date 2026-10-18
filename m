Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D53CCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 672AA407A3;
	Sun, 18 Oct 2026 14:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fW6i_ipkCLaw; Sun, 18 Oct 2026 14:38:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7EB9B4078C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792334313;
	b=CF8eJPn+CjQCSTa1KmZf2OfaHJU/3lFuiU6UkQ5EuRpmcpiWbmb9FRstw8s0ByPu7Edy
	 U8TfusKVeEj/jtDsfqGf3YpwisL/08B0G69JwwwZ1L2wvKE/Dr2eX+4alyrgkadcLbboh
	 ZbCuhQucYCucygvi2+V3OHe0P+R0Bg4M+l17RQFsSbbaf05jc/XYTTY1JxPNj1m7GCLwf
	 qtVLH1HohSTwNslEAU8sMBkUbe5d7tK5Xx9LhTY1dj3hssROSF1OPAKDQz/rOhYB2MixK
	 Dpn24P2j5rQlKuHe+kX6VfP1X9VlLAmXBTL3/Z5ErsiueA9vUgQWhj//IcyGJIC7OGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792334313;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lh8F0ozz3HZGh8JXktR5i9Nm0Ok4rtigEtC6Ka2SVj0=;
	b=UerxhEOj+9UQvBQQc4sax9oD9jF/C6GSf+avAx1yFS8YHldyl04jSJlqS2H5UvsaM1Th
	 Sn9BcSS9xcgfroBhTsbHyavSfRHtrOQoT+rje6a1JZABLN1Z9aI2A3CazXTCwLPtFwEls
	 0nO7vUqUoU+Q+lZPT56fiYo1dPZlGM3I8pZgD1fkq6xgLpdu3MTfFOKJPfd4CFLo877dr
	 6G9F3DV/4r+8YKdvgo+tSxr3axwS8gPA0oVp8KO+T0O4NO/WpAIDOQrtWRWAVpwKuklXb
	 wlz3n30PXZMa1IZVBdzC4flLyukUA/kEU37y/mcp3bOvviZOTLSi1ZdQQPYX3RzEVng==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792334313;
	bh=lh8F0ozz3HZGh8JXktR5i9Nm0Ok4rtigEtC6Ka2SVj0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M9xSIr8s7NSzl0/dcXDkwiMG4l+sTTm10S+MeHDu7okf9aQOhgkk1xBrSrtQkRWJG
	 /Amr+72tiRy792dWmnH/t+jbVHtKrc6zmG2+JKxB/92VgjJ2fagkyTmOmlhDtDL3Yo
	 CQNx1g8fcWevbIfHHRSeI9X6sGtKfZtMVem47//00uvdQ7ubhjDEeim9aVnzecEHUt
	 mZuPTbK468LLEC+CajoCQHTlMpD8MxIimvyzpRtYtG7vWOAZUUqLERM2pEViUvUdqJ
	 FMN0eaQ6fI9Xe11deAafZhYIBw9ZD0nE+SUQ9J67JO9hJF6aByc+Jq1r/yFT3eYkU4
	 gF7qOJjbWQ5pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EB9B4078C;
	Sun, 18 Oct 2026 14:38:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DEB21AB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 001DD4007C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:38:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Si1XiSMlF5xE for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:38:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4610C4005C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792334311;
 b=QhxWdQUoOBRFD5zwEmKSebzyWjTZnzKHUQ9pMykO9JXtLDQD62WmKtAugHgr53w3HDXH
 c3/W1sQ99yXBhNMzNr1pfHhe122yz92kLBJoufZNC69fRqWTs/MKP92C14ToPVrNmxUTq
 wVTgiVpSyRYbWnqtuXToS8vhlPKpSql+DZEdCo1wkZXRylu4m1h+7mA9/ZDrz066Mi+Ts
 aVVojzH4S7CBQKEeNwYfytjoRDXfk+ALkraylEI/vegN6uCXRN2CCvTgh+GYE+OeeQsjL
 LdaCKMgBJ/Vkmr3Aiou2GYswlKf95jpPboc7ltMJJv3MBCnvMONer/7yTIHrMkHmkgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792334311;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=u8DEqlfrFRNWJoPYEszvlbtvRlzjCnorZpEAEhq0nT8=;
 b=p/iiGflm0zOdRqYt32ifUF7wN1zbjsfycB2SoDS1LSWm7w6+O0dBuKmaIRsJ5halBDHU
 +3/s8ShLZdxlarjzO44cBatsXuuTFL/5pTvbxGFK5O61ChWwJJfgVe+alq1KhY4e5STRP
 xirxHkebiPJfMu2Wz624Y2QXA8N4fgMQxPaKrsNB3U9SwC5rAGIuSRye5ZA6LF9HHBg9t
 r3t8s6NP8uW5eRGSpY3ROzWjtcfeK9VjeVRrYJ3D7LDU4vz5gpE/T7a6K82ds9yF2h7Qj
 JR2z8cJ6LwmXBWN8OzRYEms17G8FXmU7ST5EpPiIyeKV6pKmxk9ruziF64wBvBb/j7Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=AGsa3gH4; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4610C4005C
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:38:29 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwQT9-1wQcr820SD-0104nE; Sun, 18
 Oct 2026 16:38:27 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Sun, 18 Oct 2026 16:38:15 +0200
Message-ID: <20261018143816.1780525-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261018143816.1780525-1-fiona.klute@gmx.de>
References: <20261018143816.1780525-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Y5fG8zrF9zW3Q0ykRs5ZSpC1JTV3HmVkuPHVaXQnr6wf2uomt64
 ShCnwnXm0d6pFBlyHqb6EOen6xPlKFFB7WEgjVs9bqz5A/oZ6TXv3ZojqFjALgLz5Hh7JIK
 e87Mer013PVzvkdfDmaMl8KA8G6Ltt6GbPWKYc0CZxVUcONUm3NZcaK0kuAARSAi819es+f
 +NWluconCq92tPBWGfhOg==
UI-OutboundReport: notjunk:1;M01:P0:ks4+W314eyQ=;hzQN8uG1FWm/rVnbGNo0h7/pmk9
 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
Subject: [Buildroot] [PATCH 2/2]
 support/testing/tests/toolchain/test_external.py: use HTTPS for downloads
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The servers already redirect from HTTP to HTTPS. Use HTTPS directly to
prevent manipulation along the way.

Also switch from the autobuild.buildroot.net alias to
autobuild.buildroot.org, like all other toolchain downloads from the
Buildroot autobuilder.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 support/testing/tests/toolchain/test_external.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
index b3bb961aac..038b072d1b 100644
--- a/support/testing/tests/toolchain/test_external.py
+++ b/support/testing/tests/toolchain/test_external.py
@@ -80,7 +80,7 @@ class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
         BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.05-1078-g95b1dae.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.05-1078-g95b1dae.tar.bz2"
         BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_12=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
@@ -109,7 +109,7 @@ class TestExternalToolchainCtngMusl(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
         BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/arm-ctng-linux-musleabihf.tar.xz"
+        BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/arm-ctng-linux-musleabihf.tar.xz"
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-ctng-linux-musleabihf"
         BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
@@ -137,7 +137,7 @@ class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
         BR2_TOOLCHAIN_EXTERNAL=y
         BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
         BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
+        BR2_TOOLCHAIN_EXTERNAL_URL="https://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
         BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
         BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
         BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
