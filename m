Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1016C606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 10:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sVIojHUh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=mMMz4fVb
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF66380BBC;
	Sun,  1 Nov 2026 10:49:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AE8wlV8CCoSs; Sun,  1 Nov 2026 10:49:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F17D180C1E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793530155;
	b=reItiW7v+4chnYgj/NQB9lMkp/1e3k7vOGul6pexLYWHs0qhrgZpiFSbqynGKpbqcH94
	 VPi+xj5SPDWpw0ZCreAvI0uNUF2mR+XbqG3I1SAh3T7rQCb2scGX2uUfdI01UDQgC3Q/Q
	 DZEOgb14F6OTcOrIB+eyTQxnjp99VpbXKrmh9CiV5oTjqk4tFQfA19cOjLsYQ3+UV6mQ+
	 IfIMmOFV+indZrVoPNVvWbJme4E9wDQvz6IcrH1Q8tqhvcf7Xs8PLwffbbcnkdgZcR3RZ
	 oXylaL+JJweDEJGB/exDuHKhDS/VFYmpHIKlNZYn2DqmD+YEvHTysV4RDR6SBlg71ug==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793530155;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=L9CiE+WpaHOemTm7oI2xq/sxpDc5rA+bNPezvrIcrco=;
	b=jDuKMQEFTpei+OtbB7SDeyvVyu58ufEBBTmzKktNmWPEjcIkAvR7MMDxKYfb0nMpIwxx
	 LDLU23tk9u6yE1rK0JdABiSmkkl5xjGFTOvqtgkt86vCqof1owocEK4Vg5piEW7pSiBf1
	 isaPLAhcEcBu9/2y98iG95iU9WSZSgrbL/ZVFfhJKOXg7Nnw0PDM8z03RFtCoZs5RCp3S
	 QjRBFXJKEn8lb5M2rQVOvjSZTkZXZzvc/WaGYohv1jty3WFELRuHorldKeEPzC3Ew6qQ/
	 CvmQoWetwO/dbTOi5SKzI9NgGhKk7wPJkBQHNarQsNzjpV8A3RQKvz494G87pE29QJw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793530155;
	bh=L9CiE+WpaHOemTm7oI2xq/sxpDc5rA+bNPezvrIcrco=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sVIojHUhjqGuWd3WiX7W0WvGRL+OPhoeTzAJckLfLcy/0cInPYjfH+eIln6Eqd8g4
	 xHyHJjprkWaLg2FlZlHtjuLWgRTLnb3NPIBrvzEVRXXm51xQUpneNfc4af88eoSahG
	 nb+T9PGtb41mMrQ4dp4gyizs9wXotcP2vfgImEFUWkgBVVNZLEqazaHBCGYuOwSr6K
	 bKCLL+B/T+2qhnfzrlo5you2RUXhU1F++LxSUZJLPET8Z46nF6HuMh3L3/25VlvceF
	 I1A7AlFPbN3sbvCBMZVYzwwqdt8hQuMVkecIQmWetMkSC/rssJh5Dnop8tY4Xl72ie
	 gg7rFX9O0+cPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F17D180C1E;
	Sun,  1 Nov 2026 10:49:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D2A62AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A58D40557
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:49:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STys8C17t7Bp for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 10:49:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B2A8240533
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793530152;
 b=JYjgi1MBRhg713U05ssLp2GyFN1KrI1UF2d1Q4BwKyqAVBYJOlj6DDMRwaFTopbCL7TV
 cHG2L5abgwjaeMjQ5wD0WJwHg5EeV43OnfY9WVkL9eAIOub49z2hZDAEyOCR6deSzGdQW
 T4/4zY4lSTt15LLbcfsPRkhz7KPMaHGMGePt80O8Va/tL8pQglh1E2U6r9V5plXFrEw9H
 A1Glk/7LFBEFTsrTDD+jV6dosJX1hoAnU9FNrwEYkiSfjhqgFASe4sqqTzh6CnFJ8L3UC
 Hfe/2e/Aj5Fh6QeIO8mIu9QpyjQP2SXeUXMDfMIr6QuahRGeshZwYbbhAJ3oc3dfniQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793530152;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=peB/4Ca6zPMieb2ytE7ZZVHp5iOjRoT8owk1cQw601E=;
 b=dGbpxiN5fYQdJxu4rizrBhaMqgohWhGTQG/rNSmuOnhBop61u/4rWPDJIZU6+y6iUnop
 Rm7/yu6WUxr2fEE31rfPvn+0F8GplHWgrVOSuHvtob+6/1NLbUhR9lVuVcYmW7eS8zHuY
 imdWuPCncMuCYY97oAZs2qVzqbbV4lAnuLHRC1Qfn9jMtA6E/Eu5KG7E0i14aw0jF7eRY
 faHfVEU74tCkDaZOkVbhD7nENL3XaC+VUaF8eKNVNBBXYGDTOCgNYe1PByBY+9FkMWuZ6
 i3YVxwH4Es1V9cwBfLUlT4p5WoN6PABKSDa1OJ0WSE/SuWh6nqial56ZYR3HFm7Ghpg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=mMMz4fVb; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=mMMz4fVb
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2A8240533
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 10:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793530150;
 bh=peB/4Ca6zPMieb2ytE7ZZVHp5iOjRoT8owk1cQw601E=;
 h=From:To:Subject:Date:From;
 b=mMMz4fVbXJ1BOnh1qd8KlghJYX21Uqw7XsjMpMws26pPU28KC9VkxVirr8sIx4lJj
 8dubRUzvuScjD1qzUAbkCoFyljk+SZVsSmUaqwFZPBJ2vr4Y1L6lldUO5YX2dtNAxI
 wpgxnyXSJ68ep2P7KsAF+fJmj+nkKvKJ76RpbJZvBZRRMkrBI47s1IPiRyhFlH+bjz
 kcDuvhWvIb9LWN+E7gSQ6fh+KPI0M/4WDe93rdsTLpf6nidh8N2lVE5O0s/IMAyZZc
 6U/ff+9Hv2BMsDAZszsj4Kxgu6UD+llMXtmvFR/wwsIhjl3dfliTaozaUvznelpW0k
 ml9K3CeSGimGQ==
X-KAS-Sym: v3:f51bdf72230551df:ucr7yDXRooWdslSDRqcvcYDSgJhetnl3KDrZuVM6Kywq4
 vP2bL/whU08maPRhLd+FSCef9vnSZC35lHpFL2dy21u4T2gVVboWp98rCs80jHag6st+EioXS7x
 fp1tdFDXbDtnJ8UXvra5BJnUbhuXqz+tTX11gLYv3vjqRDHfVO4gddIYzgUm5doC+RyhT4S553c
 gX7leJ6pvw5lR1uI23sElMEqtBgPRpmIqDE3uej1DHjNW/WV+lJfjXj1EqVcMS5k4/qyOz8UK3z
 idTcP8d8stTEAOnneIvM6kNfsA3Jvuz1xX9hDulWnvZzK+fxs2O8TfNboe1TVIItYWk7tWDA==:
 fPJs8N0nM6zb4beFG1Ft8vKYdPg7CqLLILbEqCdOuBoP7iJFvSv4wxOBdmtGUqzllISYIRLeYlk
 Se1kTpQEAn5QNQz1iU9LhgVvSbJPqLEFHNHIO8tpNkMlL6ijC4kUK/wkuQwNGp+mytngFY6aZY0
 fYiCDh14eRS06/qgRrOxkI9DhYo9tjcAvEVcIn+9ULaOOUmduRLB055wRzm5qtODvfEcRaZigXa
 WzEAnuAnPCOzJWTC4Y8ZxuD80ifkEAK7fqSsWB8bcPTTQ/JoGMKAKHILM8fGWyI11/+rjqHuoKa
 WLLaILmMzkwybyJQU9gW2LAdf5sC2AcSRVPFM3hURzEcYSAOFfQ4uyj6eRhGr4ga3oOOclx4ti/
 eZEbkdOr++yFIk96+VuNo9shx9b1NZ/6ZNu8UWvvLQbroA5hFA04IcDPNcWt/MMZMC2zpLyht5r
 uojvL35oYeEzMMMiexwRCaxBaAJjszu6WgPTUhEWsKONuO2GpqwFpHs9a0oSw6WJcmClNY1k/yq
 ul3IpqnrsnxrUMvz6gDVDtCULDez8qewSZTpnZXpgLiU0DHdApMIwa+Xjyl60sEZJgtADjBzY6k
 mr6gZg==
Received: from fli4l.lan.fli4l (p54a1b880.dip0.t-ipconnect.de [84.161.184.128])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8F4CCA4C1A3E
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 11:49:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46434)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xNT7e-000000004tm-2183
 for buildroot@buildroot.org; Sun, 01 Nov 2026 10:49:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  1 Nov 2026 11:49:09 +0100
Message-ID: <20261101104910.1700974-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/2] package/kodi-inputstream-adaptive: bump
 version to 22.3.24-Piers
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/xbmc/inputstream.adaptive/releases/tag/22.3.24-Piers

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 146457ef55..26352262e0 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  4aa567ce2de1eafcac02e341a726ecd0fb91be81c8c06f9e503cb6d36f818eec  kodi-inputstream-adaptive-22.3.23-Piers.tar.gz
+sha256  374403df391a6a6053667653dc9e032622da4ccdebc908c8ec1a3853b51e17c1  kodi-inputstream-adaptive-22.3.24-Piers.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 08db94c031..59fc228e4b 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 22.3.23-Piers
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 22.3.24-Piers
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
