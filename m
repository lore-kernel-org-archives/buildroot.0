Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E51606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 22:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AtbX49mu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=RhH1dlb8
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EFB760710;
	Wed, 28 Oct 2026 22:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwQkhdHKSxk1; Wed, 28 Oct 2026 22:50:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4FC7960716
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793227853;
	b=cHlUycKHVoAAQLbUozxGYbsTTUrTV6/aGmu3+OJyypsrZ5RlgfxPdFhVb0vMuenjPtIj
	 DAHp8t+hoDqSDxjiMtBD76hdB6aFijBoSWHpQj+utDvc6vAR/FntqPOerCPKZP2hqqK2R
	 L8SGdox1UGwgr2N3FwPgWu1uYtmYiUG+Kfmsv/JORcD6A/U10YkoLYOqgOo9SCFgy0wbu
	 n+I3UkpvMq8yk/52PAWyuL4cysS6uFwBnQuuiGS4zXml7aG1QkvhFvD2tCkVp6TLnpszi
	 NkIxf9aAorIycVf3jJfdS75BOPHaLk20XlUzt1WW4oYaCzk+YedE7ZCMEwFjTXKP+9g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793227853;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Kas-Delay:X-Spamd-Bar:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=+d6Dm8aKLGLy73tkNK1TcqqMU4dfYOVo+0lM9zA1foA=;
	b=ahJs6rO3Ha3P7XqOVW92NhCf0M21ABmn4zzsHtWZVODsRoQnLtmWpptcCKC0GFgfi2zW
	 IdVVzIFlLchtUefvHR5znGxE6/Ylhkn+FhZaGeiPeEArTp/NPAoqbKL7Q13ihzCz4v4Fb
	 bYc6iyfrc7lTssIhzfV3iVh0qFj7HZWPSTltUSWplc2fG3i1QnGcxSA+5PIutnSPVydsC
	 qF8g2ZdL2vXpUKoLj9MFFWYQNc1v0Z6aYLRg17jTexduQFeCYGmQr1R2VuWA+8NZcDSUX
	 +ILIuc5rkJfZtuC22Cud9yuUPuKTnzNjeWigc2cE0Zu3qJwotYGvWJzqP5gQTLWGtmA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793227853;
	bh=+d6Dm8aKLGLy73tkNK1TcqqMU4dfYOVo+0lM9zA1foA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AtbX49muBbirgbCqxlX2KJxRfOkuIH3luFv2Z75KaYKSh6+CFNqufY424nkVsf9Xm
	 nHaGUiDEZuWK4Xz647SMbRAEamors5ezGsRfLTa67y9ESM3f77yO7VZzMiJIO4vGSV
	 iwi7VhNRBpC+x/Ile/NSP+LHH/BgbkhdIF1gc0kvR/AHGyObqGExw4HkFetpxFsAEa
	 gCViRRhxS9yKzs1SVpW/oQ1VWlk7B9Hj6UIw6nC2pylbKKpfjKjZ0DlXaqfOPHKMmV
	 c/hZCKrAQBBlVvmybqppyvxROs8b1XVNf+5gFzlQeZLi9VW1byR5JAho+sz/7UV2Np
	 1yWRWUHF/B22A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FC7960716;
	Wed, 28 Oct 2026 22:50:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 429DD2A8
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28E56400B5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qAkbW4vOnfT for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 22:50:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1E9F54004A
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793227851;
 b=YIRb2SjGpkiVzKRvwPdatFroRVrKpdmONywuIFUGiNKrps97OOhmLC3gJEgxeD4aNjaR
 1Cmy3M/aQ2ZEELP/vJ7df/ifIvQTuHf3KgiRTwbKU2CYeKxtImgOIN2dkFZnGfjtCbpHw
 WI0rvTtkCP06ms0zaNXGLnnwZJUdn9EGBuStp2TBjLMvKMyI42V7ZRDIT281jplu+Fkn7
 k4y3+qbeu+zqHafa33y/BpQDFnCjRw2UICbh5TNEkDA3HjRcXmIwcV31whNb/UCbJk+tG
 aJF9NAXBl7zha9SFOdVMpOvGjJsZuCsRpk+ciLAl27rQbOAKaUVryQbt8ZshEdJTPaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793227851;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Kas-Delay:X-Spamd-Bar;
 bh=lqxQ1isYPHla7/ze6dNNsQ03dGsGHoVK2Q1mf0V6kxQ=;
 b=ECaIpe1WdHDRJ2wMHYbjPR7aJkr3yxWl8RlkkpotgwaDPtiyg83uM+EhBiGurdE7FFVU
 UUQkC46VGrNTz7I3KQDJejH9O7go8xs9LxAc8WdtreqiZEJKVWj5JR755c4DGhX5i4b89
 B9mAMalQdLxVpBbL1Iv1MdgH5nFsO1e4NSVe1Sytkqgc6d9Lj2E5UXqtDuFZJ6v+Dthn/
 mFmwioYTngloG9MtKGUZxp8eHu46I639UDuCwQweDfFov5FRN1ERQatFkago+vtfeb7Ve
 H3nuy1/nUxeDPId1XICTW92IudWAUUsKNtR1IHQqMwv28Ch6OOQ3b2l5TsVC0hzJNaw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RhH1dlb8; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=RhH1dlb8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E9F54004A
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 22:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793226603;
 bh=lqxQ1isYPHla7/ze6dNNsQ03dGsGHoVK2Q1mf0V6kxQ=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=RhH1dlb8ar6v+tCmppO9CrjTrLVXPQgxqa4K+92l3/BEjNV1SR4xLfUGp4WTc/1T+
 DjGTPoZRdDi2d6mMqvS6q7LaAywzyRfyO9RRhvJZ4rsU009H/s43QQLq0d5t7WcqbY
 Yiin9LbRzp4gcH1kGE3qz8kgMjhBh0cxprCd3mRp84OXrcqOjux3tr8Ugic55YmSyk
 cxCYcVLKpC78nTRT7Pl7MSUR/l8xOIDYJllRdfyEPZr0WbBoKFiJyeWKF8bdk1fz23
 ECw64VdaX3dAj0ds8/Mqiseom7H467YNlTdL26z0a7yDgB1R6noQovfXMAD3b0AnaC
 f7syjyN1WPi9Q==
X-KAS-Sym: v3:f51bdf72230551df:cTk2JoECzpqnGl/pf59mWisqZvMBXDYOA9XGs/chIxhpk
 tWelRTKRF/MM6j9c4LMiUUsl/7xnaot9wRDU7JV+E5sPbFnIbsth4GYwBy7SrVgIsDvKE6NeUR+
 ReiZDpU6m3mZXStAFKEkbGIqcXld4qyCPlISONxA0p1D1as1hnCqo5M4qV8BIt74q0d1pg+NXGo
 CwGP+VWPAHVhjYBPw8iTxRbcTiq8shEZiNVUGw3kIcW1sXWD66Pvc+KeoOHSLByVq85hA4A2C5a
 FlDr856MT8HS5m6OicpSpgJslOHnDDlK2Gcbl3hwTV3RSbZZMhMk/o6OaxvGf+5L7aVdVFXQ==:
 vlHWNcgrfBJY4fgjoxT3gH/PyZBzWONOfBqqHNruk+9e6sZyirzZllwI42AUbzznfjomaz4cbRx
 0mo5yR796Y6M/XivV1o6gEhPths/W4aFUFyPx/7WDeKP7f0ITp5k7hZYA5ZoJnkefA7CxrVltKz
 VN/FRQFEdJA7q3B3OSoW9Z99dPeo3SYssS88NWneghIzw3gj/NPzz6OhtDui4PkLZgFJ5+StEzR
 7mkggmsfhR4cJIh4TB029spjherN0shc9kPzsbft19cHAABfyhteidDZLjrfrA6AoyKeR3QeANX
 1s607Ac9M0XG/yuFN0eYGaKDzMLlYeB9bhabQRUvhOwxqBYXKGGugnVJ3BcYdcm403X+GZT16CL
 R/5U2Xx9a0SjqDYXSgQdUgjX8STaYd4an87SUHl4x810i/ls0JtlAxzqzQWvW39wlZQ3sSOwzE2
 lzppSH2FfvW1plaLzaURICY9t9QGbByDkPOSJlWeRWEnc43ILMQu7BFTkXqJrHV9LEO+ZPY4a22
 X/njjOtwKO3qapLibj4tZy+8H6MdOSeoOAUVWXHT0pFBTtNkcJMpuUZuYl3GVJcLKf3IFp2th9W
 wkoKcA==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E8E93A4C6FEE
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 23:30:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42186)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xMC9L-000000001i7-1Tdd
 for buildroot@buildroot.org; Wed, 28 Oct 2026 22:29:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 23:29:35 +0100
Message-ID: <20261028222936.514451-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028222936.514451-1-bernd@kuhls.net>
References: <20261028222936.514451-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Kas-Delay: 1793227803
X-Spamd-Bar: +++++++
Subject: [Buildroot] [PATCH 18/18] package/kodi-visualisation-*: mass
 version bump to Piers
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
 .../kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash  | 2 +-
 .../kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk    | 2 +-
 package/kodi-visualisation-goom/kodi-visualisation-goom.hash    | 2 +-
 package/kodi-visualisation-goom/kodi-visualisation-goom.mk      | 2 +-
 .../kodi-visualisation-matrix/kodi-visualisation-matrix.hash    | 2 +-
 package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk  | 2 +-
 .../kodi-visualisation-shadertoy.hash                           | 2 +-
 .../kodi-visualisation-shadertoy.mk                             | 2 +-
 .../kodi-visualisation-spectrum.hash                            | 2 +-
 .../kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk  | 2 +-
 .../kodi-visualisation-starburst.hash                           | 2 +-
 .../kodi-visualisation-starburst.mk                             | 2 +-
 .../kodi-visualisation-waveform.hash                            | 2 +-
 .../kodi-visualisation-waveform/kodi-visualisation-waveform.mk  | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
index 3f5f761968..7224b062aa 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d7433e4e88e29f1dd3524d2d0b660ce529852561f14f479f4b83a9c5ac436ffc  kodi-visualisation-fishbmc-21.0.2-Omega.tar.gz
+sha256  e0ec1dd6832cd916a0ec8a2baa8be55c65670bb618c9be8747c7cadaf22c1535  kodi-visualisation-fishbmc-22.1.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
index b1eb305620..393cf19700 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_FISHBMC_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_FISHBMC_VERSION = 22.1.2-Piers
 KODI_VISUALISATION_FISHBMC_SITE = $(call github,xbmc,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
 KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
 KODI_VISUALISATION_FISHBMC_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
index 71ce1c657e..72fd7ed709 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f87356122f91ea40d096d559d1180571e701e39867448768d14d6c2ba3b2e264  kodi-visualisation-goom-21.0.2-Omega.tar.gz
+sha256  3bb77b47d26aaf1e6cca451bbb9c22f162101f3a43b014a1bfa3583329e08f44  kodi-visualisation-goom-22.1.2-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
index 6b35c64a87..a4b7285589 100644
--- a/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
+++ b/package/kodi-visualisation-goom/kodi-visualisation-goom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_GOOM_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_GOOM_VERSION = 22.1.2-Piers
 KODI_VISUALISATION_GOOM_SITE = $(call github,xbmc,visualization.goom,$(KODI_VISUALISATION_GOOM_VERSION))
 KODI_VISUALISATION_GOOM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_GOOM_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
index a924eaa6f8..aad763fadb 100644
--- a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b1d1f3da5470d657e70c4b914a77445fe1d0a0ba35007fc402982a8b1b4cf9b0  kodi-visualisation-matrix-21.0.2-Omega.tar.gz
+sha256  a0060d82a8a9e9cdf2fb30451116271d5ab1dd9196c27cda1f6ae7eb1f787b02  kodi-visualisation-matrix-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
index fd885712ad..05e4889c84 100644
--- a/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
+++ b/package/kodi-visualisation-matrix/kodi-visualisation-matrix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_MATRIX_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_MATRIX_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_MATRIX_SITE = $(call github,xbmc,visualization.matrix,$(KODI_VISUALISATION_MATRIX_VERSION))
 KODI_VISUALISATION_MATRIX_LICENSE = GPL-2.0+
 KODI_VISUALISATION_MATRIX_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
index 508820876d..6de80abd30 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  30a5081365cea1dbdf49ccbb059076d4c7abc28604a58749fcd0d025e2faa760  kodi-visualisation-shadertoy-21.0.2-Omega.tar.gz
+sha256  ec4881e0a71ef4a01ff33a0704bb0e53acb573d49cdeb5bd67a4948b85659e1a  kodi-visualisation-shadertoy-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
index 32d6d6f056..d095247c2a 100644
--- a/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
+++ b/package/kodi-visualisation-shadertoy/kodi-visualisation-shadertoy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SHADERTOY_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_SHADERTOY_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_SHADERTOY_SITE = $(call github,xbmc,visualization.shadertoy,$(KODI_VISUALISATION_SHADERTOY_VERSION))
 KODI_VISUALISATION_SHADERTOY_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SHADERTOY_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
index 6bbd7b8c9a..244d7f9881 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7b6635789d226ee4cd4e17d54d57e880731d0762835802835d0d5ac4f0084b99  kodi-visualisation-spectrum-21.0.2-Omega.tar.gz
+sha256  dac63ce17984d48c8e20be136a840d2543cda184d12cf31c7839c8e810bcc537  kodi-visualisation-spectrum-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
index 1946cf598a..646917697a 100644
--- a/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
+++ b/package/kodi-visualisation-spectrum/kodi-visualisation-spectrum.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_SPECTRUM_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_SPECTRUM_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_SPECTRUM_SITE = $(call github,xbmc,visualization.spectrum,$(KODI_VISUALISATION_SPECTRUM_VERSION))
 KODI_VISUALISATION_SPECTRUM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_SPECTRUM_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
index a362fbd23d..591c3883b5 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a3f70985fee6b1014e7e7599431e646f36bd3870ead78bbc8936151b805e4241  kodi-visualisation-starburst-21.0.2-Omega.tar.gz
+sha256  35456e13ab3d82177dde6568b0ab6c09dd09a31acf851f4e141ab4062d787e94  kodi-visualisation-starburst-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
index 6adb21687e..ec922016f0 100644
--- a/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
+++ b/package/kodi-visualisation-starburst/kodi-visualisation-starburst.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_STARBURST_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_STARBURST_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_STARBURST_SITE = $(call github,xbmc,visualization.starburst,$(KODI_VISUALISATION_STARBURST_VERSION))
 KODI_VISUALISATION_STARBURST_LICENSE = GPL-2.0+
 KODI_VISUALISATION_STARBURST_LICENSE_FILES = LICENSE.md
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
index 1041fd5287..683f468cc3 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fe6d2f3990ea5f2ea2d4a0a905f451b1c2c7f1300529d8957b5d93a97421f415  kodi-visualisation-waveform-21.0.2-Omega.tar.gz
+sha256  050a184a37c1cef8f87fcf05d5dd90c6d11f33008164bc5a86e370aac1d866fb  kodi-visualisation-waveform-22.1.1-Piers.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
index 819b064789..9a61a4d159 100644
--- a/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
+++ b/package/kodi-visualisation-waveform/kodi-visualisation-waveform.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_VISUALISATION_WAVEFORM_VERSION = 21.0.2-Omega
+KODI_VISUALISATION_WAVEFORM_VERSION = 22.1.1-Piers
 KODI_VISUALISATION_WAVEFORM_SITE = $(call github,xbmc,visualization.waveform,$(KODI_VISUALISATION_WAVEFORM_VERSION))
 KODI_VISUALISATION_WAVEFORM_LICENSE = GPL-2.0+
 KODI_VISUALISATION_WAVEFORM_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
