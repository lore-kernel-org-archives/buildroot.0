Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BAF606A320
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Htw58ICI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=VPGDQR9+
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 982F940845;
	Wed, 28 Oct 2026 22:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dM---Pe4nGR; Wed, 28 Oct 2026 22:35:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AC4E740808
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226911;
	b=Tp0hSjcFh3tIz5cNDN5MOFoZhSpL3psibrPqpiOAv+1a+GzR3E4alIvNKiQLGGHJsait
	 SbgFdn0uGsEEm8H/wQ1I7MWtzFuhhKME+y/wQMO3VgvwCcyzULxW9rd0FJuAcO8kBVPuP
	 i/3VeDYOCtRni3rKnNAJ0SqaqnBdhqIXDlxKPd9KHNslvp5LzUPUPcj6XRNmlMykYoHN+
	 ZgTgcaSC6ghlkzXb3y99OYqtric2UeuobL1TsYXRU3HE8Y+fLga7Y3WrJA3PL+eEGf1Oy
	 MdJYjvDMhdTmRdUaYIgQnGHlqa5HocAgcnFXkiGWhomlAhRzDkMG9rnDfvMr9OEV+2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226911;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RTlECLW31fqCmlUg12gMs/9LwmdZBIpRx7f4Arui+3E=;
	b=sFz+1l7SDUCAeAfkqg4ADSD6epfeT8InPgp1EJ2MI9yOT9a5LcCdsASpspQ7mj5WqOxC
	 0rEuSwSdWEa0MTfdOHP0wYPkzH4bmlhf/T0g9L38J26gRessorM/6+unDAkduj5SwPVCt
	 0LYjK6OO1KaG51tm6WFlJUpuFS0Tom7uv8c71oUeMtz5pWW2Ez655lBbrnw31wWn0Nh8i
	 DAayVo2rAHBL0aQL6Xo1c7SHr1SBNXF34KY0YfFVhu3uehDi0EMBy1Hsy+ZSJvvBSRwz3
	 6owPCnxrR0qS3i1v6W4oym4EHXreoX4z8bFihUPaq+ACmjYIX7ZlaCCLaQE4F00/VXA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226911;
	bh=RTlECLW31fqCmlUg12gMs/9LwmdZBIpRx7f4Arui+3E=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Htw58ICItluqoGyja3ogzdKdUUa+sYWwF/U4JV6tsC4/4V0WYCpFQ+8FE7PY7Pwi5
	 sRQe8bmdu/HnHythGhbKVfVYtpeQwQLV65POS+caGrRV9tAJPlZNeGd1mtCgwEREYR
	 pRh7RaJJ87R6zwpcZKO2Aga0ZCreOOhCthvGLyYdujS/ho1+62egAjI9/pgxGUZdZ/
	 8YLrTGyRLbCwLlR/M1/Dq9KCr+fQXnZ9/w58PkcrvIPdyiouEEwk7YhMVXM2OQOyzk
	 XF4v3ngjgAjYitrK3hqEX461RYK/H/S+qeWGC1sXleF1PTnm1AwVKaW9NQ6MCL0BED
	 juCXFOswkXbiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC4E740808;
	Wed, 28 Oct 2026 22:35:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 404302A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32215400B5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o1Y4BwstQeOS for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:35:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5434F4004A
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226909;
 b=o9Fl8EJFhGuNdrmUQKWukOVxe1xOHAjKL7ku137tYtXiCiI69i3rQCKMLP4IWLn1BpxL
 CRMuzexgYd32VB0caBX2mGkH+ULeORWWWhp8ZFWKmWiXAG4G5C9E08yvdsTutAcEk2n+w
 mzUYLWOk18VABdw704pIMQ8lv26FrK9u3Oago2B3OdITFC3oNzYuJ4ebCMqVdxUCOiE6r
 ryduiLpJ4Djg7XtdblsJTTSpOCS3kzUDXtBavyKVq5EfKHyNQufEd9chCR/8hmBebnZv0
 a/jC659ix2gjC6KC9R3QtLwI0SDc7zylZQRFtkyBJlaLRNEiTVygg9zGgwvZpkz1WdQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226909;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Vkd4nDKd3sF5RhskMQPoJjbwcBjABnbO/ITv9cx8Bu8=;
 b=GcsY1p35rV6t2Z+346U+eH/ypqaRrwAbWxKs3xck5hLKAetjqEl0xgJXX4dh8j5/Gx3Y
 ysnJsp7c0KJZF7e7ChqBQYpxN99BJ1dteJSqP0snklsg0/CYhJiixHFdArKU76UiEIZuP
 iS5BUWdGad8hKsJcB/oKbxaueHPqprgxtI/Rhd5HaQVow5aq71QTiusWhHJ+czoGMi/L6
 40mZP5qMEaKG/zWSEAYLBBn56WqNmQyX4bCI8mYnxm2NpjDRB0LKGi3uNJv5rs8rt3tOx
 d2kuCCO4M/xfQuQqeXn/0hK1Ht6Pbka5K3fycHuO83P06/yXmtDW8S2FdZhOqfqmv8A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=VPGDQR9+; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=VPGDQR9+
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5434F4004A
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226602;
 bh=Vkd4nDKd3sF5RhskMQPoJjbwcBjABnbO/ITv9cx8Bu8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=VPGDQR9+cBKqgOpG56UnxlbKyq3CEKD9ZDeVYE34TUe6+Th0QQak3zFLzRm34gCdX
 O7BALEyswv/UnoclcDUYPVgcuyZhEt/sI17MAgDiZxxp3+L9wI4JLQWkOx76uCVWcC
 DOr2ZzRTVm8HaXzjuISYeM8iIk7yUejJp826EaAglYrxJzPc9790ed/nLnBKFHbXvY
 NU0gqD053rhZyBk+bG2ME/drstulikRbmAq2amgr8Z2XeTGnfB0E351uOabD3lRDDB
 PRT96Eve5Ri/HYIh47p6X6UlFqTbr/vlMKiGALuVBuHKVix2Wt2YC02OMKjWWR3dXW
 8XErsUEypYRAg==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 6B4r+k7s8hXSi/HV8SmiO5AZ5J42neDhYEqqPRD92/ck2LPp+73Nm7Ht3Yp2vjK2jACDt4IxKWM
 zjomu61BhgnvbRsqYhym0JKIkb/ageaV+6cI80cinHGH/ABFfEXWauDzDt+1GHcwluMqHalqcUQ
 qfdPiQLk9CJ9JbFhLDiW7lpXiHFxNGL+c9Au+QWRUSlWV1tY/kUHO4Rwrnnz5rZMOdu6wycsEoy
 /Jj0Fc0YbviZhGPYeqiqa4yBeAOu7HSw8XO7ZM7gEjHvHqNW1cSZlq7HK70bHmWWXbr2khgFkYK
 s5XSrMuSv/FPEVOUoqmL4WQ/gwyUYSEdVlWWoeoOikEBX82QJNuRivHZ6PMqG6PgJjIcR09gXCH
 pGJCCH21jZHjkjXfQ07UBo444J26bryW5/mTq4e0E45/6EATaAsDiaQD6yPJBHDnL7UOTk1Aj7C
 TXqkXjqI9WXceUaF92TIarYEI9SK1dvYKKko7zkE2hXKu40qrcwYsTYJHuFmFnDX8F9nLvH2UV7
 xUlxGNpu1S/cZrzErm5+t5uBpzwm8W825L3OHZGi6ALPsWYwZaP1B10xypAj0ObtxbH1rOmh2iF
 NBv8SA==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1CCDFA4C6FEB
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:30:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42186)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC9K-000000001i7-0uGN
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:29:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:29:28 +0100
Message-ID: <20261028222936.514451-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222936.514451-1-bernd@kuhls.net>
References: <20261028222936.514451-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 11/18] package/kodi-pvr-waipu: bump version to
 22.10.2-Piers
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replaced dependency rapidjson with nlohmann-json:
https://github.com/flubshi/pvr.waipu/commit/5d74289b7501625ab2d9098ac16af0f66b8b4b98

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-waipu/Config.in           | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.hash | 2 +-
 package/kodi-pvr-waipu/kodi-pvr-waipu.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-pvr-waipu/Config.in b/package/kodi-pvr-waipu/Config.in
index ee0cc2bdad..855e4ddc5f 100644
--- a/package/kodi-pvr-waipu/Config.in
+++ b/package/kodi-pvr-waipu/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_WAIPU
 	bool "kodi-pvr-waipu"
-	select BR2_PACKAGE_RAPIDJSON
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	help
 	  Waipu.tv PVR Plugin for Kodi
 
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
index 96cfeb940b..08a15e9f84 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  80e4723a228b27447fe6e83c9e2aa4e9ebfc0d2a3618fbe0491b6d2440124b64  kodi-pvr-waipu-21.12.6-Omega.tar.gz
+sha256  dad83d50c2cc4584139a1e3b6def77c23ef800f69e5b4ccff70c54376e14476a  kodi-pvr-waipu-22.10.2-Piers.tar.gz
 sha256  4202d4fb329f58c83ba921b56d7071e37f7df3f15b3820a3a04ef8eee49f54d2  pvr.waipu/LICENSE.txt
diff --git a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
index 177c1236b1..5f86322f65 100644
--- a/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
+++ b/package/kodi-pvr-waipu/kodi-pvr-waipu.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-KODI_PVR_WAIPU_VERSION = 21.12.6-Omega
+KODI_PVR_WAIPU_VERSION = 22.10.2-Piers
 KODI_PVR_WAIPU_SITE = $(call github,flubshi,pvr.waipu,$(KODI_PVR_WAIPU_VERSION))
 KODI_PVR_WAIPU_LICENSE = GPL-2.0+
 KODI_PVR_WAIPU_LICENSE_FILES = pvr.waipu/LICENSE.txt
-KODI_PVR_WAIPU_DEPENDENCIES = kodi rapidjson
+KODI_PVR_WAIPU_DEPENDENCIES = json-for-modern-cpp kodi
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
