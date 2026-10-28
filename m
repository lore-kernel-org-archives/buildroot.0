Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3BC606A31C
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e7Ek0u1d;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=tnweN368
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B03840743;
	Wed, 28 Oct 2026 22:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FHkKpN8PrVS7; Wed, 28 Oct 2026 22:31:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 510CB40786
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226675;
	b=PMU+PXKgSeEqulpKaB7/SgsGuKh/NA1UwSOaLOwBC2kr5uYdb4v84d7EeDv42uzWGJRS
	 E7Z++70uCMHv+UB09DdRLWt0dOAGygm3HGAYYJETQTANIIeZW+KvVyMb58QYMdwJDi9z8
	 VA+xmJPlKL6FU0i4efMWQKadqnVSTcQ8INmmm5vYpV2FUv6PspIzEtXkGAFBPltQsgfJD
	 p7AB69leCd7+T5XlID4mDon04JlEEx/MILWXFbfx+2Nn6QA12OwdAnve3djS2DKHKDwEE
	 TLc3tZbQ069PCiV5OGNRTo85TJvurCGe4F8kVH1H+Kn+DDQSSWYw17T0C+gpo35T9ew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226675;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Tw31wVszLp9vaZdLesfL4tQX4gHrqkYVuPU52Hwxcc4=;
	b=r59dXRp/6Rm7qp3/VTos0qJMgkxNvyxbDspY+3wfbUCWSSBcht20ZyUOrxsEVZGnX0AL
	 uXR+YMuWmfL6QDvgMAGpfDkf4msfHZcjg9mENH/QaGbOnv4ai5HvSDg/FfoKYfaEksxJ/
	 HqRlKmtH++AjEI9cvqWcvQUPzev3wInt1Co3gqdFhGMzRrYf7WrRnxysYg08XiTVi0XDC
	 nMVtuhgE4rJtKgEWZ51t+Uwy4zS3li9PiNNOA8b+pA6UY+SYI5phHjC69cbFWrQLPrPEo
	 tMSNoXci11ymi1EeDjiIEQvkYM27SSWCmt3KoNXEtSVF0vBeePYCsW5syqSoy0rSw2g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=tnweN368;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226675;
	bh=Tw31wVszLp9vaZdLesfL4tQX4gHrqkYVuPU52Hwxcc4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e7Ek0u1d6rJY8KhjPQqXDrcnuaMXBAcOHBG2Zt+3RA9AahppMbNJm+sJCE0qqzeug
	 5DNYkQUFlnlFqqru4CSRZQ71svZQNGai9wV7EbclAMaNhloWhYcYbu3yorHOdbL+d8
	 /m+0Tya6sbxXVekENzNGLZFr6zjwatHD9aRK9sCmGqCY1Xn4dUsmXjEdcHga1DP45U
	 +AwOkK0wntiFISg5m7yF8NgzbP0E+ldhIQCyKkXFgLAKIErAVQW1vJaktJ2UdtU0O5
	 pRNwRFwAZeScUvQQPaRAqb7u4PQdlNC9pyUGei+ym1wNj14vXYggd34bjZOdH1esMw
	 IfzZ+gDQNXVEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 510CB40786;
	Wed, 28 Oct 2026 22:31:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E10EF2A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C718240786
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L_qVSmB7aDA8 for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:31:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CBD4740743
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226673;
 b=TMJT/gJQjvs7pnzijwLxhSxQuu2FG7KBYEh6S+E4U6naESXqO7svlP84tytzEwdAbdxO
 4iPg6AGYw1osvAUfbdpFPgfEgudTkgFGJirdGaLfJp7IaLhKhjbI7/ULNAYZ0puWMRojK
 6p3+Ul6QWSOlppZ637OJQFc59tEeWW5j1aG5BBCGFUgBqBI0OyKHwOnmGjbJUYWg6Ouoe
 dhmpQ4DbxialZbaLKSamiCgGXjC/gEXM+ScylcNwFTvptNS1a6gH5Sxko0oA9XGHzc46I
 imBaoooFvKq4B13J9xMN7JN6/0yqTb6a+GWrJm+/HQHNG+FEGo5qFOEsnvfindXrpng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226673;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dgWJrDiIZQxJh6n3dAFVh1uoX0stUG5fOV6WQwgQWnI=;
 b=UPr0RwZ70s9zB97FTD96oM1xITjRNSxICRy9auUUMr3dJjkHdDFzyqaCVIRznu/JcqLg
 xxndzCbh7DXSXfYcin8be1ZoEKe5EuripGYQg9OH42R5pDUaoV3ePh4GS7nMF1YUNOJC9
 a6d0l1NSIRWPJvYj/cxOnhmjIvIMx51e/0mrRil+t66B9gNFZz7BkfJm9W0z+lRq3fL8T
 aoLv2R+h1Le2Rp95VtNhdXULUvkIZBckftgN7bO5b35eyX7bbzURJ/zBtEQ7GfTNFvBz5
 imLkqDt8aACBhXiUnfhqSPUV7edyTpZ2/LOCdQrW8rmEhdPvrAzKMn7pdfrOndt9Edw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=tnweN368; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=tnweN368
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBD4740743
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226543;
 bh=dgWJrDiIZQxJh6n3dAFVh1uoX0stUG5fOV6WQwgQWnI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=tnweN368uB21SAqQugeA86N35bHkCd5ZlgSEYQZUPXarx9BAvn9WX93NTpIzAxH5T
 nXs6Y0UAab7bb2cJK1X37vvHjWy/JfBQtMddWVYOqG2eGbQKCgnL95kD74Yf4i3Eb3
 WMyTbkafFRvkcIZE+AWAaUj7XuFNgw4tvx/6WpyLJv7c9W71h/j18nK8gL9i5Jl+WT
 7DPhzhD4VtZHZleyqaZ2zeabEQaG7qDDAaIRxgyA9N71g27E08cfR8cRRiW0g6gVQ/
 RYHDOBX846ZmJ8GfVdyMBT6NZq9diL4XXvEHNQaEhTVYfuHEPj/bicopcUPKdziAhG
 HtvsYYXGYbWRA==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 g+KQ9tyDd94ZNu8dhY8Ug2NPG9nwq7t3lRzu4K5n8TC+BvWawTphgKtayiq+mDmCnzHhHYx/n+a
 ID0bIbhfk5WU3sbbtI6DGyJGtkElTfKc8MHUN6KUeDEIaPRjiM2oEFnYqMKSh7d+vBzLYmWLG3o
 86O2NipCbfgSfT7dB8vf0k96zypd7nQrt/siDhUQsmaUhzqEjXUzj9hQ8HcJw58ASVCVtqyolRN
 P6XN4rArgtyArUwl0nAADv+/rOhG0eOnceOKHbppgcOsHR4XJLp8lWzEveZWNnmssfzDoZnnKXE
 TGUQ7LXS3uFLxZPYMA4ZEJLHg4vuYnIe3zWObT3xdm3h83tjEQJejMts1jN1kLbsWfTDEotDous
 75N9IvR+csuEVC3iGWZlww8JzAarleK1GIdJ+izidjpymFc1nSgAppCry358AA9w//MR5+jIYYT
 0etAfk/GunrfL5hsBPHYOWih8rV94bTZD6y3nbnHYy3QpHuAjVJ07MHaDHu9nbQWE9WIVHicq0Q
 ZJf4WtX+sQegNkKshRfOfqnHMFieBv4VX+lh0k/Cs62Rb7mkfvY5g3bp8dz8i/UuVyS3YFR+DuO
 2nWHYQ==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 778DBA4C6FD5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54844)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC89-000000001Tt-1FWD
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:28:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:28:13 +0100
Message-ID: <20261028222822.490779-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222822.490779-1-bernd@kuhls.net>
References: <20261028222822.490779-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 12/20] package/kodi-pvr-zattoo: bump version to
 22.2.3-Piers
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
