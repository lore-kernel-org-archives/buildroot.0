Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BD0606A31D
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Qd5YJTbZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=blG8MRkq
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2577E60710;
	Wed, 28 Oct 2026 22:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mi6figQNqiqr; Wed, 28 Oct 2026 22:30:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2FFB6606E7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793226625;
	b=CC2cBsxIP2Rsrc3Mv83F6pWfRNY0gALTABlz4EDC59ZsiDOWzO3FU9numryu0pLd0D+S
	 aeqyWmmJ8H4vUE7QRezTBzr8RONOF7PbJGiMTLVmanIOQdqpF9niGvmRrbGIQm0p17syC
	 00Z+KpZPr3d8QsvUR+hcZR7+XzdlmsWPSgUhx4fiYkVj5DhuxFUCMIgoJnVgf7L4QUJXs
	 GQIWl5A3hLAxldCmtQT+TfWUV9qkLMGG+ADUYJPzu2OwWD7Sb9xepaqxg7DXD/3/JA6n4
	 VjPqSKBnoAOZnurDPdsLLRkimT+48uEPVFl8wWOeI7B6opfA5N8wypCadWIiJPgjRVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793226625;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=s1fSozJ6n5qF6TrPk8CY6M0uSTmEj2NR8LVDNBGxd6g=;
	b=U5noaFMcmX81c57Zany7tt+i+s5czmQx4QdzIjQTkehbV8mXxXEklNlaWHEPyTNn6mLA
	 FlJGh1nmuEPbD+YToGqCqhFK+m1aICDy5FXLeLTBpX5ha3dgBnMz5mpKE3i3Vo7I1C6GT
	 fh5gPMGYk4ocE+h5Wu9aNV5onDO4lhyxr9BRRwaC/mQbgguPwY3Vi91k/RL5vE0AvKZfe
	 FAUA1NA+liTlCfCMdc/bPmkQ392e+V0PTzTqz6GsZ9YwO/Y8h3b/rlm8yQfT+UgL0ikUy
	 zwvaB9cpyRZa4l/dwq9KH3fR7A//ivdxy55o5fK3Ksj4PDzmcFnzbpptRsr1PcNKl9g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793226625;
	bh=s1fSozJ6n5qF6TrPk8CY6M0uSTmEj2NR8LVDNBGxd6g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qd5YJTbZiBaK6tbXd95hQ7BkpQx9WhEv6ZpUOYmYdmjO0aOPeWfmujlgoSa8Ae/AB
	 9DWaSiqOCm+3sj8GD1wvGJVPJ2/3smRoTZiMhpwQM8LSqWm33+9jYu3Ujeyxu5/TV5
	 mk3NGpGFlJX/oQhNHGgSUWsuysGhrtG5m8cTEvpoXaA475y13Wa8+8MszV45TQ/Hmz
	 5Nfj2/O0CvGlRQFAYtj3BVzmkiqQbNOVVi7jRYER58RhnAl0n5SCU6vqJO+m3rGfj4
	 fen9KIqRlF13uhmiaeDWMfO7WXb3ucwHDOhrst7NN4QFXw+7qyxoCUQ6LTWJtnBuHQ
	 86mitfiKSb5uQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FFB6606E7;
	Wed, 28 Oct 2026 22:30:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D53512E5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C76D7810A1
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJbNC15gZ4jE for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:30:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1723E80F80
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793226623;
 b=Nsgb0MjUmjnqPXpLBQyawqEd6UfHBSenujNjxccX0mDKEegDKLtnAPtuIiUBgG4uV5R+
 iQto9TEmy4xpj0inaFLMCtv4AXSXl59siwQFQJqe+OvNXQQ9gg0dcP9JWcpGhNn1QFuLe
 33J3Ju4gThFwseVlsxv/G6FmeS4vtq5w3GSLrVoRBKxjvo0tuC9YPqm2Y1IzXaxPIuYZO
 6+UAAZmLwPE0+9pXToNlkGZq+qMJyuQGCLJbsWZp2klFoayWysBHKbkN+fPC57/pUuk7/
 VAjMwLO8Usun1yVePJkNn3CfhiAlHHdzNxPcDecKxfuxOO1H+QOYdQB4Ozq6IjJCziA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793226623;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=KYbYlnckuKmsKSEQo9BBg6b8mss4qkIiiM/LgkYX6mI=;
 b=o2gZDXzdjEbaP8nkSZmUa7D3GG8C7iZqSzy/pQLcpJWfFWDBPx01qT6HZIWxZhyNp5Ee
 16NwznEV1OMTzmcBlHar+VUUAdGIizUosAjZ8+GOnCAoFWjHrpaOFFCJupmd3A9UgsX7b
 OC1shMxiuII8BJ9sPUB77Wyh7JKRaOJjUrOninccuCyT4K8v3mZezXIH98FAZKUEa0fXr
 4XBUWiWcaA0wmDdRIGcvm2nR7uNJPuBCColJA4+5gOxzopdpqQcYde1wKG80eZtZ6iViL
 +rifitNwnVmFO+utqWxpnkBgFfoMGmiz8sLqeNV6/Gk6qIX8gzWpORrP+3xaj2qbfHw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=blG8MRkq; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=blG8MRkq
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1723E80F80
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226542;
 bh=KYbYlnckuKmsKSEQo9BBg6b8mss4qkIiiM/LgkYX6mI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=blG8MRkqo1/a+B0l/VdknJLMVnrRjpozPsZVm+XLRpZemSyaXCjfFb4XkBfv7Qlbt
 QN/GehYNKfkEdDTQpKIzDKMjtfJfJLw8BEUMcGDnVGXyAPiAKBdR3WFlPyPaGz3vBi
 /X/JrIgBZ6n9FXTWrEy6RXetN0r/KfqGCkIlnc9JS7BWWDHqfhhKKZBDs8j4M45hfp
 y/UJGDVg2j1ZdmzKovL333AnhJ4gFOr4TVrkdPv+lQbdr0emXjArgkIw5YfQOZjUkn
 kim5+3kyOYThTLiGEjbr/ixteWKIm3jgqHnRnp5xPa8mUWeoBsRdPt2a/dY/Gcc8wj
 U5i5PlTE4pN3A==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 vht/WSFISrf4ggGOUmsKZrvlLrZtEJ+8w8FrjAlJ/6Jzmce/+Fj9zVSD+/0aGRMjUwX3CwCbtKs
 ITHv329Zs+CVsdOWTuPNW41TZNCDP+j8xFbR0E3LbofiajHc9IbQB+xInkIKj33qfs5sm+p2IHP
 fMFmP7jj3/LQtpvW8hVQUaDv9xbkGnY8hi4tvdUDmjQ/6tIXXBCd52hNXbk3rnmj4vmUKtILf0O
 dzwlawlRCVdoawDjA39AZRuCewtxsoFGFkd+/A6LR8HWEfsmiRR6owo9Qm0qRA8IlFiOjTPU7Pg
 iZurbWc3WoUw0CWWrt/74xv1zpLlU1eQrMFBqbgsiGW43GEA/DkTDblGs4DTWZKjFnmqsDpHvc9
 RFcPCo3+Tpnr47ystHDmFA9ot6B+XJ42E/WVmtG+hq5MdzCC7paiKj3qxeMJT6cdQ/XtoJjP4pc
 fDr8FCTcrvmXlAc15TlmwmfPrH4+tmWK7zlBujaM8h+yQhnmu0SPTDhH3zJvHjzF4uyDSkBUBm9
 cwBLi716E+pc2L0p2LyQW1NOqqEs0UVEUcib98kdrII4IVSxIub2Xb/x75lfONDoka33a2oVBm4
 7PkN
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A7259A4C6FD0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:29:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54844)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC88-000000001Tt-440H
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:28:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:28:09 +0100
Message-ID: <20261028222822.490779-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222822.490779-1-bernd@kuhls.net>
References: <20261028222822.490779-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 08/20] package/kodi-peripheral-*: mass version
 bump to Piers
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash | 2 +-
 package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk   | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash   | 2 +-
 package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
index 3be4eef39b..e57e020ca0 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7392c30a9e49b0cd219cdca14f5b20ffce9f4a52c349c2cdf37cb603dd21f516  kodi-peripheral-joystick-21.1.23-Omega.tar.gz
+sha256  cf79e4bb8d413d930fc0821200144a22fb3c0e38a58c04119e4e4134a848b0cf  kodi-peripheral-joystick-22.0.12-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
index 698b918266..73c8a675e8 100644
--- a/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
+++ b/package/kodi-peripheral-joystick/kodi-peripheral-joystick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_JOYSTICK_VERSION = 21.1.23-Omega
+KODI_PERIPHERAL_JOYSTICK_VERSION = 22.0.12-Piers
 KODI_PERIPHERAL_JOYSTICK_SITE = $(call github,xbmc,peripheral.joystick,$(KODI_PERIPHERAL_JOYSTICK_VERSION))
 KODI_PERIPHERAL_JOYSTICK_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_JOYSTICK_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
index 833905b9a3..2791ce3074 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5f74b0493e0f17e297f271b0befd01406dcaae121305bc7cb9d0ece6200cc675  kodi-peripheral-xarcade-21.0.2-Omega.tar.gz
+sha256  ca391349b0184083ee76918ae37359f2df541597812476c4a18b0c5e0b3d62d1  kodi-peripheral-xarcade-22.0.3-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
index a46c616323..0fda4dbdfa 100644
--- a/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
+++ b/package/kodi-peripheral-xarcade/kodi-peripheral-xarcade.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PERIPHERAL_XARCADE_VERSION = 21.0.2-Omega
+KODI_PERIPHERAL_XARCADE_VERSION = 22.0.3-Piers
 KODI_PERIPHERAL_XARCADE_SITE = $(call github,kodi-game,peripheral.xarcade,$(KODI_PERIPHERAL_XARCADE_VERSION))
 KODI_PERIPHERAL_XARCADE_LICENSE = GPL-2.0+
 KODI_PERIPHERAL_XARCADE_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
