Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D339CA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5766880D8C;
	Tue,  6 Oct 2026 16:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CbyenTkJ6uBD; Tue,  6 Oct 2026 16:30:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6A70380D8F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304240;
	b=ffQxunW3ji+EJieUHYxRxPlJS4fdknr64sqme+0z2O2hVNpUG9lmmHIx5nOF8rY4ZCK5
	 wgbIrRGwWDF9H/wuoaX1ifo45oMyDdrNl5y80Yr+Zbobbr0+GXiF12FJcnlGR4n7utFyv
	 b8qBij/URjepVgGDvn9pT9dS9MJcJPxEb8zddrsFz1jFrQPvB8eyXa8loVclGeNY3+3Pr
	 xNOxdM9VrP6OA5M+J2P/5/4N2ATBjpGjwyd0x8sV+1t9xwWshGDekbhRPpd/RPCwwFJAa
	 YK/fa6sufgOmC/s1WdS9d2/2KaNGgE8OuzEj/EUNalEwbQ+YhKx5Qgq+8aAFcnxdMLw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304240;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9trwtsarQCzk0FAAldKVNNCAOjZ1PRG735S+DD+FxXU=;
	b=sJeAlWy8p63b90SpnjpdqEwCe+pFzFFkjmlUVN0dzsObY/sgsVD3qX6gzf4uPCq0Od8s
	 vN1TrBN0LYZJZcUOVtn//xpNKzWTPcwZBXgnlxETlMKhOCwRalfh2G836ZgoIfRJop3KF
	 P5kCC59s9lrmr5J1yMWcqNiqGUAWzo8l56/dQoW55n8TEoqDZ4mSWdP6cCYlAktL9eXp9
	 3htU309tUBoQADjoV/vAiuwPaTRqPDdzfX3FZ+k9hbLCUeWLldSjaz8CmW4g/3foyfmrQ
	 3mtim1q6GnvI85B7DklnxHilfmCDuKC4AJrCvj7Ngti5yhUOzMYob8LjADuW6r0+veQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304240;
	bh=9trwtsarQCzk0FAAldKVNNCAOjZ1PRG735S+DD+FxXU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ti3KQhdxu/MOpo0y3g4M5KkpAQL0ItBrjqR+RFr9flN9VWkV6pxQQEirbx+SBTQav
	 A//TSZCTjnzcVKdpOmIvtCP8hnPuQ/BwipfQU76b+u7cgvzeRWxwa4XbKhqcKdzXqt
	 XDNCqF9392kC4P6DKNTHNgXE8nJz6USqzRNwoT21uxptG43S0FISulaHcDPM2TbuR7
	 bD1q7TupKDjBqUoElDL7sXzZ5zczRcR6CktC+3DhVBov9Zr1oGEAIH+qMcVYaOgfMA
	 f1DJpCrcDNkaVAXdsA6SB4Gfb1fpHg/22gZPPHXvqLOBppHNj6njmm8BO0KoR1Y14f
	 R/GRuxMuyxCVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A70380D8F;
	Tue,  6 Oct 2026 16:30:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0399C317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD72C402AF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_QqgBqW5l9Z for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:26:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org DAB1840274
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304010;
 b=aP6zDAFcmFlB/GrbI+OwFQp5I+dJVmS8fcdaOV6BP+ocK7pktIZ37wbR4ooQiPrmvlPc
 e+mBE58bwjevkHDSs4t3fKQo8SucZB3xKnuH0kpJ3uvOBgVgBzrFGKTshdVdF5vzDaS38
 49/uj9lWuhyq3cCmI6HHV8fdtaQTlzBa2RmQ0sCrHUJhspqms+8z8X5CNXCla/z8q7iOZ
 v1s7hL03nkrhWqP7sR9WJrqnsYGR9qw6g/luEWQmCA1OzdZnkCzJVK9FlLhCigVeBxl0n
 x2PJjMYfkexkAY9EOPdkN7+C+TX9oz9Ydx/Uhi4IKKyl3H7N3OHyngGQgGBO5/M2FWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304010;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=tv4fTsumW2i7Hx7FVBtnvjg7WZmh/dAHLmZMEtyfA4U=;
 b=p/Adc0sPPDqEn9hX5Htr9hnBHWqs43sM3SSYW3NysML4dyEQKzEbm7RIy0fn5Fm54btK
 TuPCQG58XhIpXxonzmmRFFivt6f3ht7y7D0pq2ercGtI8w+iFVM5hKNlCM+NM2aMdjqJo
 iiFHPQoywZbw/RbGtZFJKFeHHiItPJPOIXaETmX9e61kUY81y/xLPNr39SfL5VDChYjhG
 M6vbiS4mC8nlePOVTHR5Nf8t8JLrT/hae8xps4zX8JWihrX8ZtKzbdBHtSKOc8vJcr6wt
 ENfgU82yQ5vweW53iom0LghAR6L2NAyDor8LlbBClRTCqwNq63BcnZGITnugV48zxhQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=PJwZIIma; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=PJwZIIma
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DAB1840274
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303705;
 bh=tv4fTsumW2i7Hx7FVBtnvjg7WZmh/dAHLmZMEtyfA4U=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=PJwZIImah3V5+iwIbpFjLJHzA1ww44FFLkIQPOXPtRExQeK5SemDFVupCJl3NUW/3
 cvbO0+geKWHT9/QcHDEMq6vycyQFRgPu+c7q81Kenu/2IP1byD7yepGnAt3e9WQscI
 4+iU9hVLvOzRKSLt9URmemHf2HiMXtBJkca+0O9AbwWJsZpKMkwVUgKSswEPal9gD1
 c6lrxwYNrCyhY2PlsCNf0fPN7iO1Aj9WzYpb1/R+9QK4sS/Dz0Q02mnhKEc/sVtx1o
 HB+VLJ67qrcZuLkWip4MyFx2DxKqdkMlxCsk2wZtiH5ysBJoJNtXhLc/X8+6HGLgMk
 N8gKrIbRl6WDA==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 DomFX0L8g2BJuXEIVP+V/IGSpfOg9elEKxd1Y1b+zMMS0v4CZ05JcFZeNUxml5+LxHQ3EJT9EqU
 68QChiIG9oqY4oPrDGwgdYQvQQoJatMh5VNbR0e5ePDrpwwTOt3F1gzsMLRJZuzxlL7tAp6Zquo
 GA8cfVPz+r3Tg9SSE0UmHPRTGrdXMffWJC+Y0VeX44688PNj6pia3CrevLurVlfi5UBCBZfxQrD
 mZcwSrs08u+quoyNb8sjdnWst+hKKOOS1AhG7eANBFt3Xj4sQGArObLb5KWeTq5ErKGSW28KD0+
 lP6L1YRoq1uSSM9raIzvGKH3tguaaskuu1UuD2f+lE3NiuBTY6UH1IN/f2//WIqkODvGOrXGUUR
 CFcUdaQ9PzZCesJK6zafCHsvOSZkAcfu9RrDZmoNMQYb/6iJv+C3eisQYe1JJT8Jfv3EGYT0QYp
 2DgauMBEkZkt5QZIPs9u87azFcIr2xuBx2h9DQCijQ1135waI0JkgxmWg/AaRQiK1Ibk6VXW2zP
 HFExVb3xp6nmycRamZVQxRoZo9O92PubnqZ2c0RPwCiFEpucl1vjIzNn0PA2JkDz700Y/d/mLlT
 0UUJ5+w=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8347AA4C52C8
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7us-000000000ir-2U34
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:57 +0200
Message-ID: <20261006162106.3439373-77-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v8 76/84] package/kodi-pvr-plutotv: bump version
 to 22.3.1-Piers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replaced dependency rapidjson with nlohmann-json:
https://github.com/kodi-pvr/pvr.plutotv/commit/c6d0c6800421d2245922a497c3ff2994136ab374

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-plutotv/Config.in             | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash | 2 +-
 package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-pvr-plutotv/Config.in b/package/kodi-pvr-plutotv/Config.in
index 37441283ce..29e6d8c485 100644
--- a/package/kodi-pvr-plutotv/Config.in
+++ b/package/kodi-pvr-plutotv/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_PLUTOTV
 	bool "kodi-pvr-plutotv"
-	select BR2_PACKAGE_RAPIDJSON
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	help
 	  Pluto.tv PVR Client for Kodi
 
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
index 7381749ea2..f3d4e6f985 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9b65a30f4a5c0cfbf1ab669f06a3afb0cc7b2732ed6d6d4e768d16fd10a0da02  kodi-pvr-plutotv-21.3.3-Omega.tar.gz
+sha256  a56bbd15ea5eca3143feba281fa6f0f6dfc42ebed37e886d7ddd18013cae4f8e  kodi-pvr-plutotv-22.3.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
index 898b0aad0c..3bab7ddb1a 100644
--- a/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
+++ b/package/kodi-pvr-plutotv/kodi-pvr-plutotv.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_PLUTOTV_VERSION = 21.3.3-Omega
+KODI_PVR_PLUTOTV_VERSION = 22.3.2-Piers
 KODI_PVR_PLUTOTV_SITE = $(call github,kodi-pvr,pvr.plutotv,$(KODI_PVR_PLUTOTV_VERSION))
 KODI_PVR_PLUTOTV_LICENSE = GPL-2.0+
 KODI_PVR_PLUTOTV_LICENSE_FILES = LICENSE.md
-KODI_PVR_PLUTOTV_DEPENDENCIES = kodi rapidjson
+KODI_PVR_PLUTOTV_DEPENDENCIES = json-for-modern-cpp kodi
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
