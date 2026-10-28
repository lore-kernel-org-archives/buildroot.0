Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7046606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HRwQRQ5+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=eqrdtp6z
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6B518101C;
	Wed, 28 Oct 2026 22:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TB3GSyuv0DHf; Wed, 28 Oct 2026 22:30:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B337580F90
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226650;
	b=mi6QtWHbJt1J8I7ZlzlGrMqJwOHFCpAT2Vg/00orbZKS87IqyiG+AoVWqL1Z2LydxBT6
	 MENtuKJ8T8H4T3evSuXSvxVqNfOqjLdz5lBfRyomK+8q8AtrLRImhQlX+JV3QLtZB13Qz
	 edTny/hTPXXDJYN1+jai0zriADPZ7lEuyDeD3WvhXcy6+vJ+dCIHu/RLdMUmMdOGohGkx
	 A/Qu2ZNGG044H5GZRJbKSGoc0wu8iCUxvFwuBviZus4uqd1CKEWnUlSFnHL5Spfw+82wb
	 QXyNeQZ5Owllftltt1s2THXuCuj8JlvhJhTW8yYi54ET+XeT9UGI5L+AcQp/oP2+Z+w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226650;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9trwtsarQCzk0FAAldKVNNCAOjZ1PRG735S+DD+FxXU=;
	b=e/VxK8Qk60woVwpxFXFOKKJwpycgZ5lZGDcN7pmDeMLk3ZcupsO3YVWFDPvGSzd/FeVv
	 XSuDkRWP6eZh79eJaNKzREmo1RjEiFEU64eSJDDQnbOe6uYY+JIWlktwIsGNpV4SCC6WI
	 znwozt0zSeww8U1w6AYnnOw7Apg+kh3KPWICru53O01Pm2DQ8vj1d5pKOJUnsOZqyM/aR
	 wWOzZf5pm5ogDeNIFksBOPSeV1F5WWNNwbUeEarHiSQWXRYSCrE9OWw2aVpUQMgwCQcKt
	 f0isBcym2VLWkM+6iiF3EGRQBbqd2CL4ClvJuF/ncK1AfLRfTwHtFW1Cnr9OhJ8DLow==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226650;
	bh=9trwtsarQCzk0FAAldKVNNCAOjZ1PRG735S+DD+FxXU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HRwQRQ5+MYRtaWFWOOJ2g+82nkc91WkVD9Zkjzij5d1qYVr8LlkcuSzffWt9aj7nz
	 01wF0kBldtyjS3XbiBNo6RSEgwvQkCaOAdi5wI92OVyMbNbxcxUrBg8ZqMFBIcjmIg
	 TYJuy6susaEcvcXBAKJ0gJl0bQ/xyWwUtodVZNKT7GNuwt+w6sl6ccRSoyMoMvpagq
	 lVSe3MydKitWGyfHp2X//xbCvfSOlcnWtQRlFr4VAar+VnQ0mwJMWLMlyTRPplf3wd
	 +Ic8zf8TJfEVz7es7+17e8NK6pLuna4X9hyH0OyO4miWqFIzulgve7LUOUbMar8MnD
	 OBF/Mbvy+j+/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B337580F90;
	Wed, 28 Oct 2026 22:30:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EB5812A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD69D400B5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CdG8Z0Xl2faX for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:30:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EA5A64004A
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226648;
 b=UqCN3P1LU31Gu/wPRyL0E6yxWFX95HVOP6mx+7f3gQ7Crkvty97dc1WKY+oDUrW/FMww
 tG+WL1nT/MknSnaOrJhBC4xVoYsq9LqmYsLzgsJQwXgCzoQEQfBzZs8zIaTcLVr2SkN7v
 q3wLB1Sn5uTZahO7Frd+iejx4D9YSNtwcQkKyVjSC/E06pQV0MI8iQ7tHBV6rhD5zVE3w
 5E34i+B20wnqkARjeQRB1t+rNpcFzeSa5eQNpdtbIJ4TaeSwoJgImWf8G6x+mw9rWxivd
 LqH3WA1HQ6pEEwvXqO6Ea7M0auQSHUa/LkK2AtOhzFrBOxrZCRtr5hrwNG5wJxGVMZw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226648;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=tv4fTsumW2i7Hx7FVBtnvjg7WZmh/dAHLmZMEtyfA4U=;
 b=aX8wzsiP/aecjt/K5BLWxN11f3AOoII6iM+culq7Ul9+QqOToaaXJkXviMRrcJyNWWAH
 dZb14AM0pQT5YMXMcDvv7fecJPjfF6wXuAZSX1AmEgGFQnuz6qCTV2dzM87+sjS96wieK
 6TzsvzbEMhj9EEgl3XFhuhSj0iOqk6TlKYe/L9OOxIvuTgfgKHim3cyYiS5xx74/IJRiI
 Xfx1KBXi8k4DmAmDb+lsnAeufd7TstO4wyZucrF0zgmW/MAtLaEBzt/pkzbaXL6TYtj1B
 6OL8x7YRn2kENlu3fRczXNGfBQpIZRS8+zX5mbJVEO2cShZA9qD8Dmp0Oz4K8LB0Xnw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=eqrdtp6z; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=eqrdtp6z
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA5A64004A
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226543;
 bh=tv4fTsumW2i7Hx7FVBtnvjg7WZmh/dAHLmZMEtyfA4U=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=eqrdtp6zrdrFRp/fVkJMRDuhCKU/60faKo0BoTSzWWV8oM7e6Oth7B/aWJH1acM//
 4qyeNdwifzJS0CkqjiRb3aI1ZxEclD9Vn7t71PuPH5HK2Yu1ZI43buKN1HFd4qO6sU
 VMEVzLk507zr+cUr9Er+4ZiQaMofa/1Im0/0+ggyeIpipJZSBdPweE4HU1kRlhmVpP
 Hj4mRNmFHH6zaRQ54RqIVg0XAmAbl10nWIkrizm8twwusP+rf9Nhi+nCwpHHvCVtY5
 tgt8+bhbGhoAiBMai9FWnbMcfhKPiZ7uXlNhx+/O2m04/phSlPx+Lkoj2FeuR2Rh3a
 Mc1gq9q80NP2A==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 bIpi4iLB5kgJlPFFFfLh875B/2MlgU62BAQ7wnXpfRUaUvefeN6QV8yozXIX80VSAopx2GWAB87
 J0TAyemvGqhDZ9+5iL4apnfwXe7j3QgMlqVQgFjrjbEaMZDQSA8P9/WT1PMLMrfQNIzzXE3Ijn1
 2YRtHDjL+/t+ihKGIHpeERf/gJTNJYcJSI78V+Wj3gy3gx0z6mo/+wSRLu8wCAihpy1GeJgWxfv
 a/EootTX+hCIPU2s9EWJfkuOsNyJnAJ4vtmIop316dIygv/G1KRxmgb/ylFFn6C0Pmaa4mO+iNo
 Im6/Chb6SNT7CzS/qYumdK3RrSh/wgtkjX+bhBd/NnTb2MA+ssdbMboA+zi3MReTMxNy9ZxG+BA
 h+eSFVuGffZUFq7RtGH0tvsBAkyPWVg+wjE+Uh6g6ixoQDqrHYoQWpsy9xezzF1yQIFCFaeHTvV
 FHBEiUsrw7T9J9CcPNL3i7+AjuZAt0KuiQTNEzuCxu5RHkORThj4yHpjsQBzqKETSEVEjDwMCb0
 zROerubeLCM/gfNaRp61inMwlshHNhAE4fWQ8k0TNQggxh+A0ED0DcyjWZwbff/f2kFl4ydhh4F
 t5JTHA==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20BBFA4C6FD3
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54844)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC89-000000001Tt-0atn
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:28:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:28:11 +0100
Message-ID: <20261028222822.490779-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222822.490779-1-bernd@kuhls.net>
References: <20261028222822.490779-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 10/20] package/kodi-pvr-plutotv: bump version to
 22.3.1-Piers
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
