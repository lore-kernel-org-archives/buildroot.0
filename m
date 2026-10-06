Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA74CA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED8CA607F6;
	Tue,  6 Oct 2026 16:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8kkQiTI-6FlJ; Tue,  6 Oct 2026 16:30:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 17D7A60816
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304243;
	b=JbYh+oeK1rBXSrxmTGDUR1l+zpeId4u8rEyR1FPgMnZzkIihge93CJID6GXV4/qBmwbQ
	 4O7JtB5cnFezoTA6PKA0hPMdIhm49vB+koO09qj4lGCEuMYiU99Ef8+WzUKZpXRuw5gcs
	 xQJZA09FdYOXTmhQSCIP2L6WFtX/fZC9Vo4nifJdEEu0GOpW0x+9Km/BjC1GECbqNUnON
	 JoZ9nFeZ8XL1t8MnlDPDaolFMNSfm1v0d6zAxFJgd0gVNVkky+KPLjs4v8LVssS6G9YZu
	 6gc71udOIwGBgk0LMlJ92PMk7PHk7v/8AWnbef15MqjkCeNo6JfeAaPDyJwPrZHgJSw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304243;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tw31wVszLp9vaZdLesfL4tQX4gHrqkYVuPU52Hwxcc4=;
	b=WsOp/sqqLkmz0Ber7NLb4X1NeydfciBed+vvmNy7Z5GwDMIyq+n2G/mxvQCUKRfWGP07
	 NrlMKnEZZzfY5dyDQTBcJmrCtb5C0501L4i8F+jHndfCQWVKPj1p78GEFEwHVoPkWzV2i
	 ZzRYTya2sBynXSXgy37a9tPp3SdW3wt8RIGdTM2qO7ZcNP03lg5tK3aYIdhXgnfcebcmK
	 j834mT8Y7V+6OG1IYdbJoeuhlReONo4x1V6QhSjePzOvFiTUzWCLSUj7WrdKulgyqVdi3
	 Bv+UsiEFOqBJGplqqfWKcUzNo0uANnuP0H9iDjuORIGn2MuLN+qpc8oEZzLEFBJU3Qw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304243;
	bh=Tw31wVszLp9vaZdLesfL4tQX4gHrqkYVuPU52Hwxcc4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UbowzGNZzQWwHDCcL9J+D0Apu0olxPprMQu21CMgYDMLX4IDGZaFj0OwObFcuaaBB
	 rrzaxjmMXut88Qa1QsQ7GbGvEGjTEC/s0J6cFW3MUbZtSF+CJrcygxa0oYpgukxIC1
	 s2K0+IzsDv2lXMdnhB8H4OU0gQh2vNUuVilqCOrkZpFOI4Fzsmm7MjVBJaU+ME45o/
	 zOKaMoqyG52ixKvVgNF3QLQy34n6wtH4qQyvdtWtCuP/EREKFpxTt66VoGzN2S9Ra4
	 fCFikS6t/dWGChdW8CO5qQM9MPaQ9CQeG0DhKq37D90GbV2HC7XIKEb5KwxYZALB+e
	 0r9aKNDe8D71g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17D7A60816;
	Tue,  6 Oct 2026 16:30:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AEFC341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C66440274
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0O-AH3rbwXQ6 for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:27:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 66DC74009F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304034;
 b=H37jTdSo2yMeUlokhEirzQw4L1KnXroQewHlewsrvVBDBgBDElTO+9yPvTpS5pJh/fPi
 5qRZtSUGwyKK7acc2fAsoAQzXG7+T+rBK7ut1lBvJ2gRwJ8gKK1L9NR0Wo75xpvZcBZNm
 RX7QMfTGyfgXV+WHxZdi7g0ouzcVRpCtI7spf6wT6MNTI8J+Q2zoJrCR0w4v/i6iZhPsr
 RshtSniVRVYihRFfwrIj138uq44n71I+3VFExwvs6w9WadmQZnvPGomp+VRrgJyTrbT2G
 av0Ld4d6aeUnkpGaqGtz+f+iI7OySOibsaV0lFFrAUndqyoZaFUfxNsgnmQumynunmA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304034;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dgWJrDiIZQxJh6n3dAFVh1uoX0stUG5fOV6WQwgQWnI=;
 b=tgBkxsSBcG+c7i/81X1E/hpKu5zNUFG80qLVQd1BmBj72rzzeo00ej3Nvwy/7Zu0mNw+
 pilThtPo6izagBpltpF6AZvh3kzu4SxAimVYdV+TiNvX4gflWB6p3HSuiR2yQDkvn19Km
 fx3++Z5ITTSkvBvs0LFfh/fremLjqfQnp4osHavgvu5S7JmS5mDAY3w6u6T8RF5IzGtOt
 kY2KE82OjZHpvTmjHwpA8NKk7YMCfGDWmTudcMDwvpqpAV0/JJUck2dAELily50bHRewF
 6gHtw7YSuyqHL+l6QRHkzY0Clc9Y8DFn7IeSMvRE1vMOD9ZPPvrmBq17oAcXnFL3+6A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BM9lxgHS; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=BM9lxgHS
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 66DC74009F
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303705;
 bh=dgWJrDiIZQxJh6n3dAFVh1uoX0stUG5fOV6WQwgQWnI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=BM9lxgHSbwb2PO8Sm6L4aL4hrBq4nTLp7sq4EYXz9ZBwbwn6cjdBd45tylt/9nnH4
 i5qB0A0JOq/YdiBxltxtoM4QfzkBdWtXRBbxot6yrenPqM7X7rD8saJZwG0+84ci25
 0dPYWimLxKz3rL8cbZ8mSteps3FqGay+d9gDZSerD3tjx95gS1ECqnUXzHfOFx9U7z
 tZFGgzKRFdUYoDuXSkR2cOUXlLyWNGhieaJgevEG4+EbTtFnyuA/pdeiLDC5SmalVF
 1ZOiKijKaMG9SQvo7qkg1+jHRVIRLquaDH64E2eWFYIDBKFulG3W6Mo82cwa1KQWnL
 hN+sdZLiPmCLQ==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 SaQyyALsw2XfHTJy1f7r5hWDKOSP+ctcod6C6kE0ckHerPN/8a23bNaWfOWgXWtZLounfpHE1rh
 BBXmW8UXslQ0Sdjwv8TGHVzbytFLdoHGRM+yz4I5Pi+2HA0iQ4S30nPG97VG5jtH5ysAlgqt+rU
 dHLjzSFN4tdV0bWX7MHZA9bwP8ZGc0bSvDW/l4Bwf8lavXpR9ZfCvbok9i1tleYvCR0rQsDzQiG
 X0pz0FUqiPEsI9wD2Tb+2FKu0WxuWjHOBswplQAzarRVL+39phksTEWNK6trvENSW/NiGGeU7gN
 NIHPt6HApjeVkFGdMYuT6iz5M/Cdue7ML+QWX16JrqEPSWU745JHNbkl5swr03Nm2FIe+Kkb1nM
 A1vqIAeDlOZdMsIXDi07Dh1L/ercahunDNSpW86kdPux6MEheB8FadIIjsIluzZE6rEd60I925v
 d790ShQG2piraEScVbwi4IobggpTpoGcBLHFJ7wLGNCg2xKES9NfDoKA4dEmPN1MUILry7unqvd
 On7VoQMIeXK+NCrmWkf/wUitnbE/ED18RjxLUPN8dFwZ+6HjcNV10kRl4oeUldql4WbkhDs+Jw=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C7405A4C52DF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7us-000000000ir-3B1M
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:59 +0200
Message-ID: <20261006162106.3439373-79-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v8 78/84] package/kodi-pvr-zattoo: bump version
 to 22.2.3-Piers
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
https://github.com/rbuehlma/pvr.zattoo/commit/3a5b4bb46b7c89f1f6c5f5a6ebf30fc0728a5671

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-zattoo/Config.in            | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-pvr-zattoo/Config.in b/package/kodi-pvr-zattoo/Config.in
index 9a6eb3fec5..7596e7e7f7 100644
--- a/package/kodi-pvr-zattoo/Config.in
+++ b/package/kodi-pvr-zattoo/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_ZATTOO
 	bool "kodi-pvr-zattoo"
-	select BR2_PACKAGE_RAPIDJSON
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	select BR2_PACKAGE_TINYXML2
 	help
 	  Kodi PVR-Addon for Zattoo
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index 8b5509d947..57e847e230 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d57efceff2f451cc8864d429abed6c7d808ea5092fddf3ece3f598d4a5e26b1f  kodi-pvr-zattoo-21.0.7-Omega.tar.gz
+sha256  0fb9f133124efa1e19b38fb7748e371295ed2d74c38b1b0ba907321a927a0a60  kodi-pvr-zattoo-22.2.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 12d2d5ff09..413b783d3a 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 21.0.7-Omega
+KODI_PVR_ZATTOO_VERSION = 22.2.3-Piers
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
-KODI_PVR_ZATTOO_DEPENDENCIES = kodi rapidjson tinyxml2
+KODI_PVR_ZATTOO_DEPENDENCIES = json-for-modern-cpp kodi tinyxml2
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
