Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADB7606A31E
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QzMYsen1;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=nv/q1tDd
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 990C680A53;
	Wed, 28 Oct 2026 22:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGXxTWLJXCec; Wed, 28 Oct 2026 22:31:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B3AB480F90
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226687;
	b=dyeMncBCHt6Xe4L614zr0kzutKag+Zj9d4fC4Hdhyk4/zQTB0aeKbAIHzpb1W04z/E8D
	 PzKsPvs2Go9k9gXtKVR3o58RRMxMeRn/ahMPNnZWo6YrpnoJrYpAmEVlGS06pKWOGm2NI
	 9IyiI+8gSU7dD5Y6BJCEm71IsDXShY7pgRiexhsNk32Oa6nwO9NqujCVPewRS3QJu4bUu
	 MzoMpY5prnVWdWLQ0leTfdOfxDh9t3XY7wWss42C8+9Be+VpF3sEcbmJx5NVCYAmZg74L
	 IP1IQypPgfVDnu3Q38DH8eG4zbAHz0AqfEUniN75ZPH0QPTjnxS5YWNh41y0GUSdeOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226687;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hREni2JAM+XG+iHTJZOWYcxDztc5XS1Pu+MmSo3lt/M=;
	b=mhr7Q5obryZVuGknzxJfEfUo+GoM+j6rXAPH8picfAL6FhPNOS//57jRxwIWngjWGNfX
	 J1gxU3QgNkurN0Dt+O5tKQt9iSxJDxqoZ/arRSGdR3hpXo3R16kts/y7q3Ji1Y09NwgEA
	 L/3dnunUIOWLTkhMjQnAKaoyi8ubVRqywZCW6zHZsk/o72H+EMav5teWkGXyHoNzUAFII
	 u91hYsFImTuRzoO3BFG3mqByO7x4kIdePKNebK2fFie4imwdXuBEKEcA8zlCZnHRim858
	 Pb3+9EoAwSkAWZSPMNQ2at6YtqB73CSiEHB0ERy/yr7gwYMqrCJq/jpVgMVxBZJuVdg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="nv/q1tDd";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226687;
	bh=hREni2JAM+XG+iHTJZOWYcxDztc5XS1Pu+MmSo3lt/M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QzMYsen19CW7e5lkv1eqWRmsTokupXFnZ3n/1DHJZN2LY7uaCeNJtbij2jinKDMUz
	 lAwjjCk+mtyGZCJVlU6qaImmVL1cygaVidD1qKt2wbV6oXf+W7RoD5jECeJBH2jFlD
	 W4RMiHAmL9adWCKNt7b/kVkfPXil1m4s4M+XVGc7Dg6BylF8iZBe8WLJkjwkligSuy
	 ghEldnoQRYPrX5RH9fII7iaRqTXAOuQZtU4+KyNDzRDPZLK3lhjhG8EBlO0I2zF7Ld
	 8EkkSMHhRpsLve6czgdc9L3/VR2hUNZtXfOg4MKnMMIh8d0RY6e6rb3Xce0UGDjgAy
	 XlqIHaAAsN7qw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3AB480F90;
	Wed, 28 Oct 2026 22:31:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4A7A2E5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D54BF80F90
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4KNOd0oR4i6A for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:31:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 34F7580A53
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226685;
 b=RXevIQ2sKKMSej63Z79VPXmLY9RHW3q4INw7HI/3p5kUW2AZGlQCTfbQyUi/XKIDNj7w
 n8xlgSMxMp/QzB7P+Vo9wzDwBlcY3mw2Ctb5cERxIsXtOymU7p8Jk1/Du/W9VIvPO9GxY
 0Kdhgh4baCzi1VYrU8HfOa6LHaSxRnTj1nIEo1rzj08gxDo4RFbF2/fiUtUGT98ci1Ju3
 G+5awY+T2MXBAiCkykVS9Rp9z2DI0gqzYZuceO4XCFFmYcbD6DN/HCa4VnyHVtMQO0+NG
 hi9V+AumhCbAT8WelRL2xp3ViSwIIflkKlI+tDR3uAZ27QxWEA7I9ds5v+9mOIlFFiw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226685;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=SmlS0BxVwJFLBeh12kyobDoULuQU7sbD43vRqZghdKw=;
 b=fz4h9HvDoLIziRBng/NM39DUQNnqem97Vmp1BxLRxleKiQdKKfaWKv0R109KaS/5KCMx
 UXThDqDvMG4TmbpEdfImILU59Tr+IXS9t8dUmMGQ8uAD8QcyWwubWW4NFHYuG3nBV8zIi
 ddrbIKg7f2L/5Gaamnd0rIzd6raEue9b9sfWiIeNsdDu9JYFgwRv8BdaYle2sSOcyvg2d
 tp4v6xX641eFEp6rA+Mry8XAPEuUltWHM1Hwk3EeHPAG3k5SvZ1zOdDy4kZPU41lH3OPs
 HAK2BV+2caPwEhEeCSfdOc3dKlqEcYF6gKf2fbARu9vxrF3l6RBbVluqoLb9uzbhuoA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="nv/q1tDd"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=nv/q1tDd
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34F7580A53
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226543;
 bh=SmlS0BxVwJFLBeh12kyobDoULuQU7sbD43vRqZghdKw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=nv/q1tDd2Bw3o35is5znzzFyJpPGHy6q2WTdNln3KifTcFus7HxqfoNLY4Uia8e2a
 9reovPXoJTNHw/aoQz5ZGtaHHvweSlX5jPCt0yALL4QIxl+YZXTHnqW0Nt7T6Q+8Tb
 2VhGrTNvsNZ2RPKDeOjq5B6y9mteVd/jaQlONHCbP7975h6FjxHhFygogWcH7TL8UN
 Kr0JvxsTT5ydHKcXfSU3OLJs5YxJnJYilJpbDr3sXEwx4PkAJnOLPfK/EIRt0tmiKW
 +GcD7E5TAWvFkAd/caYySAkzPI1cwu9+1JUqXzchzeYlv2RespBLZvzWldQtRi7Xbe
 pkMEiTqV1Sipg==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 y9OzVqo5A9tSx6Hrvjxl35/0AMW6+UmFwSOrGJJEcVL3ifdwmbHgc4f/dMdLP6fQZoOghJpUNu4
 Yrxo7m9EuGWbCraPl7jy5oMBySq422a+j1AS59Ckx5yDa4OHdXKLOGQmf2Y/JUH9IdaJ/Q1ZGbk
 0jmd863XBG1espDHnXbRPid9xIMyx9UtN1TCjc1LZ805RufAWxTnr0eeLjzV3FI8CfIOLNBjqbY
 ABPIf0wlaF7MGejN6v0Qrjda9HEn6GA/G7SzCI62ybFGk3Frp3Auqx7Y0SFYCZx/qlpeDexzRyW
 iMp7PN6Kx9tbVfaXuvvcAwvhZEJFRsQGuh5w5jsgNWIKrTnX6SfC2CK73mtS0BkDOzTje0fR6A5
 jXpcX1S8i1Y8jeZO2V6TCH11bM8bE+HUZylVVea2XtVhI+rZPhxd8hXTd/VhFVn7Fh4D5DVWcXW
 g/zrz6gqPh+C62xwE+aAZblgD2MQWaVlvIyo/21hByZQnXpY+6UMjXIxQTpkjeXPNA/QHz28MBI
 6t31Kjf6UHiKlgiHS7zxu1eG0vk17vCmSqJLqQURqFM7Wbqu7ZfR8q1Bf9wozL1Jc+R3Do6USdH
 OmZSpQ==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AAF57A4C6FD8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54844)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC89-000000001Tt-1aQH
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:28:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:28:14 +0100
Message-ID: <20261028222822.490779-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222822.490779-1-bernd@kuhls.net>
References: <20261028222822.490779-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 13/20] package/kodi-pvr-*: mass version bump to
 Piers
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-argustv/kodi-pvr-argustv.hash                  | 2 +-
 package/kodi-pvr-argustv/kodi-pvr-argustv.mk                    | 2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash                  | 2 +-
 package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk                    | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash              | 2 +-
 package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk                | 2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash                    | 2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk                      | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash            | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk              | 2 +-
 .../kodi-pvr-mediaportal-tvserver.hash                          | 2 +-
 .../kodi-pvr-mediaportal-tvserver.mk                            | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash                    | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk                      | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash                  | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk                    | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.hash                        | 2 +-
 package/kodi-pvr-njoy/kodi-pvr-njoy.mk                          | 2 +-
 package/kodi-pvr-octonet/kodi-pvr-octonet.hash                  | 2 +-
 package/kodi-pvr-octonet/kodi-pvr-octonet.mk                    | 2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.hash                        | 2 +-
 package/kodi-pvr-pctv/kodi-pvr-pctv.mk                          | 2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.hash                  | 2 +-
 package/kodi-pvr-stalker/kodi-pvr-stalker.mk                    | 2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.hash                        | 2 +-
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk                          | 2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash                | 2 +-
 package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk                  | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash                    | 2 +-
 package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk                      | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.hash                          | 2 +-
 package/kodi-pvr-wmc/kodi-pvr-wmc.mk                            | 2 +-
 32 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
index a778272054..5e6a5af8cf 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8ec41a956a4348ded0ee650aaa20eb5ec746102b77da46515dcdfd5fa724c157  kodi-pvr-argustv-21.1.1-Omega.tar.gz
+sha256  0bb56d70b866f205f382345f3c959bf9868b666e894975594e922bb1ed3e9277  kodi-pvr-argustv-22.3.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
index 71830f4413..f2deb2ca2f 100644
--- a/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
+++ b/package/kodi-pvr-argustv/kodi-pvr-argustv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ARGUSTV_VERSION = 21.1.1-Omega
+KODI_PVR_ARGUSTV_VERSION = 22.3.5-Piers
 KODI_PVR_ARGUSTV_SITE = $(call github,kodi-pvr,pvr.argustv,$(KODI_PVR_ARGUSTV_VERSION))
 KODI_PVR_ARGUSTV_LICENSE = GPL-2.0+
 KODI_PVR_ARGUSTV_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
index 8ff9d652a3..ac5679b1b5 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7c436b7a9a4e991f99c01e1fbe69761a1792e4aa703ec95e29ecdb9b7f251ae6  kodi-pvr-dvblink-21.1.3-Omega.tar.gz
+sha256  0ad2dea8f8932a2510f3fd9b0c41dc4bc4de5c6f621ce475c2bc14c45b8d7228  kodi-pvr-dvblink-22.3.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
index 8f1b4c71b2..b2924a193e 100644
--- a/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
+++ b/package/kodi-pvr-dvblink/kodi-pvr-dvblink.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_DVBLINK_VERSION = 21.1.3-Omega
+KODI_PVR_DVBLINK_VERSION = 22.3.2-Piers
 KODI_PVR_DVBLINK_SITE = $(call github,kodi-pvr,pvr.dvblink,$(KODI_PVR_DVBLINK_VERSION))
 KODI_PVR_DVBLINK_LICENSE = GPL-2.0+
 KODI_PVR_DVBLINK_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
index 18107198f8..73bd0e1c49 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9e567eb074b885621266d2eb1e67e79a19f47ef503aad110d9bf92ba2bd75084  kodi-pvr-dvbviewer-21.1.3-Omega.tar.gz
+sha256  962c47a949377bf22f45b8af4c271fef409971ff06e24db1bfc379ada84cf7b2  kodi-pvr-dvbviewer-22.3.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
index ec3cae5303..03fbac7f31 100644
--- a/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
+++ b/package/kodi-pvr-dvbviewer/kodi-pvr-dvbviewer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_DVBVIEWER_VERSION = 21.1.3-Omega
+KODI_PVR_DVBVIEWER_VERSION = 22.3.2-Piers
 KODI_PVR_DVBVIEWER_SITE = $(call github,kodi-pvr,pvr.dvbviewer,$(KODI_PVR_DVBVIEWER_VERSION))
 KODI_PVR_DVBVIEWER_LICENSE = GPL-2.0+
 KODI_PVR_DVBVIEWER_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
index ed2de1e5e0..99943aebc9 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  323702037d65d2820dbe7c589f395d1d1321a4fec61738745dd104ae569088df  kodi-pvr-filmon-21.0.3-Omega.tar.gz
+sha256  4003e6c76c0e3b08becfdfa66606d2c8d56c6e89a713c32226c5216ed69e407b  kodi-pvr-filmon-22.2.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index 7cb602a658..3abb8d11a0 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_FILMON_VERSION = 21.0.3-Omega
+KODI_PVR_FILMON_VERSION = 22.2.5-Piers
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPL-2.0+
 KODI_PVR_FILMON_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index 56598d88f7..8a390cb5a1 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  377fb3c69d39866c0b3b8a3a7d4c790241b15997b140f45443209c4e44e62418  kodi-pvr-iptvsimple-21.11.0-Omega.tar.gz
+sha256  7efb36a0c48ae1a16fec14d1e705003c22abf13d2a318448ffb122fc0afcfa70  kodi-pvr-iptvsimple-22.6.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 0a4d9f5f1a..2d35a806a0 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 21.11.0-Omega
+KODI_PVR_IPTVSIMPLE_VERSION = 22.6.5-Piers
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
index 6fb3ce9b0e..20f1bcb277 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  38727f8ea1ac350ced769b21919eb4b1409479f82ceeadf5140dbbdb7d5af415  kodi-pvr-mediaportal-tvserver-21.0.5-Omega.tar.gz
+sha256  e2b6101e1bc2a11da2c91f5f0640590898ec27f7c87466cf3c1d74b89a5f8973  kodi-pvr-mediaportal-tvserver-22.2.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
index bdad9ec36a..68bbdd2c3b 100644
--- a/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
+++ b/package/kodi-pvr-mediaportal-tvserver/kodi-pvr-mediaportal-tvserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 21.0.5-Omega
+KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION = 22.2.5-Piers
 KODI_PVR_MEDIAPORTAL_TVSERVER_SITE = $(call github,kodi-pvr,pvr.mediaportal.tvserver,$(KODI_PVR_MEDIAPORTAL_TVSERVER_VERSION))
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE = GPL-2.0+
 KODI_PVR_MEDIAPORTAL_TVSERVER_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index 9ce2f1bdd0..cf0b8d523f 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fff61cba963647e81ae273a974b31c2aab054e1a8c0e20278bb52623cd244921  kodi-pvr-mythtv-21.3.20-Omega.tar.gz
+sha256  053b7206efe1c2fcaebd83176ac818f74c61c57417bf2fc9bc3837a7a08ea3fe  kodi-pvr-mythtv-22.3.18-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index 1270fa5871..b18bca3447 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 21.3.20-Omega
+KODI_PVR_MYTHTV_VERSION = 22.3.18-Piers
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index 95d487bdab..9e0af270d8 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6315a7bfe038b02c80efe4fe3ee33f92ee2454af8668ce3847e9bcaca38d2147  kodi-pvr-nextpvr-21.3.2-Omega.tar.gz
+sha256  5d5c9764a15242fd28bb81e88369f3ec61378c6bb90fab734046a15a727f4bae  kodi-pvr-nextpvr-22.6.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index 56c8830606..5e7dfcd525 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NEXTPVR_VERSION = 21.3.2-Omega
+KODI_PVR_NEXTPVR_VERSION = 22.6.2-Piers
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
index b5933657c4..78abef0666 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  62d856e14b76aa6900c28d4679b13d79d891dc040c4ea87331b0eee373542644  kodi-pvr-njoy-21.0.2-Omega.tar.gz
+sha256  3ec3c7d931eeafae79c0de45e3aa0bbcc8f3c7c5c5ea1ca9a521ea4996a83066  kodi-pvr-njoy-22.2.4-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
index da74a31de0..8f7db51ad0 100644
--- a/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
+++ b/package/kodi-pvr-njoy/kodi-pvr-njoy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NJOY_VERSION = 21.0.2-Omega
+KODI_PVR_NJOY_VERSION = 22.2.4-Piers
 KODI_PVR_NJOY_SITE = $(call github,kodi-pvr,pvr.njoy,$(KODI_PVR_NJOY_VERSION))
 KODI_PVR_NJOY_LICENSE = GPL-2.0+
 KODI_PVR_NJOY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-octonet/kodi-pvr-octonet.hash b/package/kodi-pvr-octonet/kodi-pvr-octonet.hash
index f62f31cecd..130745417c 100644
--- a/package/kodi-pvr-octonet/kodi-pvr-octonet.hash
+++ b/package/kodi-pvr-octonet/kodi-pvr-octonet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4fd97ff7f0fa021a45958dcd1f922e39dbf5e7366732a74caf782621b97aaa07  kodi-pvr-octonet-21.0.1-Omega.tar.gz
+sha256  f2ba368d6066198691ca1b5d53bf94ba2288dadc2051ecb5be9013e9ca9a9012  kodi-pvr-octonet-22.2.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
index bbcd78f4c5..5317ace82c 100644
--- a/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
+++ b/package/kodi-pvr-octonet/kodi-pvr-octonet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_OCTONET_VERSION = 21.0.1-Omega
+KODI_PVR_OCTONET_VERSION = 22.2.1-Piers
 KODI_PVR_OCTONET_SITE = $(call github,DigitalDevices,pvr.octonet,$(KODI_PVR_OCTONET_VERSION))
 KODI_PVR_OCTONET_LICENSE = GPL-2.0+
 KODI_PVR_OCTONET_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
index 2d9f739ad9..e66af0cccb 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d3527b88d3956fecf8dda40928bc01bd340a22c25a6c38f758af8d6d85153354  kodi-pvr-pctv-21.0.2-Omega.tar.gz
+sha256  4f13cdb0092f3e1b979058d6a5594ef14138c906a539881f025242165c54e601  kodi-pvr-pctv-22.2.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
index 52465471a4..232cbb56c6 100644
--- a/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
+++ b/package/kodi-pvr-pctv/kodi-pvr-pctv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_PCTV_VERSION = 21.0.2-Omega
+KODI_PVR_PCTV_VERSION = 22.2.5-Piers
 KODI_PVR_PCTV_SITE = $(call github,kodi-pvr,pvr.pctv,$(KODI_PVR_PCTV_VERSION))
 KODI_PVR_PCTV_LICENSE = GPL-2.0+
 KODI_PVR_PCTV_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
index 0cf4b7d9b1..63b4da5140 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  567b0d8bc7d79a166a65e3c47ecb3f73e3aa57db840465ea2e6c70c74421c162  kodi-pvr-stalker-21.1.3-Omega.tar.gz
+sha256  98f5151e4b29c99b6723061bb7cc5514c6307853d8d050c784a5ce93d51142e9  kodi-pvr-stalker-22.2.7-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
index cd910857a8..3fdb9dd1ed 100644
--- a/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
+++ b/package/kodi-pvr-stalker/kodi-pvr-stalker.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_STALKER_VERSION = 21.1.3-Omega
+KODI_PVR_STALKER_VERSION = 22.2.7-Piers
 KODI_PVR_STALKER_SITE = $(call github,kodi-pvr,pvr.stalker,$(KODI_PVR_STALKER_VERSION))
 KODI_PVR_STALKER_LICENSE = GPL-2.0+
 KODI_PVR_STALKER_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
index fb7ba291fd..d4bbc7002e 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6550fa41f1d7312619dd9f4620a4b5b6c47240d71273df34a4300e580f617635  kodi-pvr-vbox-21.1.5-Omega.tar.gz
+sha256  ee82a2dd9e01b91c0c095555aa0e257fc2754349060250d636715452b7ca9e4a  kodi-pvr-vbox-22.2.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index f4e069933f..db0b1016e9 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VBOX_VERSION = 21.1.5-Omega
+KODI_PVR_VBOX_VERSION = 22.2.5-Piers
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPL-2.0+
 KODI_PVR_VBOX_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
index 5b139bedb2..c187dd3e6f 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4608cfd2339cfc52470575f7caf153a97502cb360b44fcef2921c0623a931ef8  kodi-pvr-vdr-vnsi-21.1.3-Omega.tar.gz
+sha256  7eda51eba53402e44f1702d6dc13c29ab41ccaefe8ab3e7d6cfec5ab58849bb1  kodi-pvr-vdr-vnsi-22.3.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
index 9ab5c9de03..f1c815ef83 100644
--- a/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
+++ b/package/kodi-pvr-vdr-vnsi/kodi-pvr-vdr-vnsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VDR_VNSI_VERSION = 21.1.3-Omega
+KODI_PVR_VDR_VNSI_VERSION = 22.3.3-Piers
 KODI_PVR_VDR_VNSI_SITE = $(call github,kodi-pvr,pvr.vdr.vnsi,$(KODI_PVR_VDR_VNSI_VERSION))
 KODI_PVR_VDR_VNSI_LICENSE = GPL-2.0+
 KODI_PVR_VDR_VNSI_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
index abbffd0f17..6cd687574d 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5d83bb04fdf6f41f3ebb63df19d9f5e21631de4726475df731fc665af789072c  kodi-pvr-vuplus-21.3.2-Omega.tar.gz
+sha256  2c677b914be2262fe3114a01066efabb3d3450d4bbc76eeaf942b77f31cdc3c7  kodi-pvr-vuplus-22.3.7-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
index 57798af420..32e74a4f0e 100644
--- a/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
+++ b/package/kodi-pvr-vuplus/kodi-pvr-vuplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_VUPLUS_VERSION = 21.3.2-Omega
+KODI_PVR_VUPLUS_VERSION = 22.3.7-Piers
 KODI_PVR_VUPLUS_SITE = $(call github,kodi-pvr,pvr.vuplus,$(KODI_PVR_VUPLUS_VERSION))
 KODI_PVR_VUPLUS_LICENSE = GPL-2.0+
 KODI_PVR_VUPLUS_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
index ae4de33649..50ceaec5af 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bee42bd2a55d00ab589db9ebcddfa75d9211571fda63d641ba484f5582934364  kodi-pvr-wmc-21.0.3-Omega.tar.gz
+sha256  f5905bee24f0ed43aa18c4a9b20a88af6dcf352d95fc3ee80371c5b8ffa6f911  kodi-pvr-wmc-22.2.5-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
index f0284ab8a5..45404286b1 100644
--- a/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
+++ b/package/kodi-pvr-wmc/kodi-pvr-wmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_WMC_VERSION = 21.0.3-Omega
+KODI_PVR_WMC_VERSION = 22.2.5-Piers
 KODI_PVR_WMC_SITE = $(call github,kodi-pvr,pvr.wmc,$(KODI_PVR_WMC_VERSION))
 KODI_PVR_WMC_LICENSE = GPL-2.0+
 KODI_PVR_WMC_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
