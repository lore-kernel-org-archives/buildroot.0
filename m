Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1708ACA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF35480DBC;
	Tue,  6 Oct 2026 16:30:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwM95z69VSXz; Tue,  6 Oct 2026 16:30:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BEF3080DC5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304219;
	b=Re3mPtQBjimUEXA6MZD58abkb4QnZX2/xw7HjLrXmvtKRJ6/tJN/QY2nX9N7e8GEOn6A
	 a6ki1FeJ2dctJl04tBZXrjUHjHXwGZyOnXKlUroGUkNuGju7JzKxsyk+2+3sSlC7sCXwc
	 M9VWUaJkkK3Fj9jffriNJ4WqgXG5+RMnr02Kc/sW+0J16fAc/B8GNUlq8QkjYrNe2Lxw3
	 dSAwV+VL2r1ah6pbYLH8dUzs3TdcF1mYjS3pDogSrhOgmq51SH/pKtlAZSY/REFivlEUY
	 Cq2XVkOiMD+4q2x8VKIwkbYwqZ2xjwIpsVLlEW9t54lzmIbqVTBkcfg1kkqTiWQVg1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304219;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bSzdAfD9XbQmJYzeG/5eEAIrD8Mde1jGHjfQrKCA2u0=;
	b=HMmPDzZMdtSjmrg7BPUgoJtR8w/sFUYYsNamhz24xJG+4X9fQiTrt84S9JhYstc7VbJY
	 KOHFcCDc855mAa7uQySHxyntYE2z6FEMIbTfiRJAkeXUsSpVJ9GVenEqAPCYxwTCN1nP1
	 fSoOxfUwAQhRnG79E4i/yGisidBaHewA8JOfydB1EhiOH1UsmLglrpJaJ92LIkGjrubOB
	 uCXVSL6toUypaDZqzXtctSCtYVFDcrmfRnR79DUFn/EFgotVo0mRJeswIoXUlDjVEw3UA
	 6HyquscXC4liKTa7omM0HILJyOYIeOuLkfb4M7k2bQY3HhYRoVxe2ANprZ3Ovrpdbmw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304219;
	bh=bSzdAfD9XbQmJYzeG/5eEAIrD8Mde1jGHjfQrKCA2u0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UXpvT8V0t7tn7RnAaED60jJO5sljobGnAuZnOOsnh1Dao2WCkDZqn9pbwxDQzIp1n
	 C4d+7jHOgwF5h8Tvg/Zqmwtm/zxnD40rFthFLaaGshtky1iVTqCBY8/pTjgy2wr+pK
	 iPGUldtqtRBBR7+1OktRB84fFRuTCUUfg3c/MY+16dwp+SyUIewDx4pC1xa+ndTAeR
	 xcUruRb46v3ZBn/pA/35V5kcWY8xedOBPb7a7nP6YMyUItlropU4F2j5oz8+esXEl5
	 8fsZGmejK6CkjRIeTMz5sENr7ZQd02iC0gdknSfzjsRVHal32Y7tlYXslvy7MixicP
	 BFytYlFsRzoew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEF3080DC5;
	Tue,  6 Oct 2026 16:30:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EFE2B341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDB30606C0
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:24:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DRPbkN6gdkQ for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:24:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EC612606BF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791303898;
 b=hOQ+JGADbQyIu1+soGmHRJmUkSHkuICvmhQB7477aF58kqAPBRlOqTAP7Y6Fh1kPzQGg
 znBsmZ9LDTcM9nZ81LdCM1iDpDJWfI67OKNgokAKDI8L4jOOybUSoWLdAIqDxmOIsvwjZ
 zJOzeZJ1xJkDHeTdxyTTvql9zIR/+gUgk1f/qD0dTaPF2uGmcNW/mUQek40VTorbTNkaE
 FWcBamZGAs6gt9KJDpziSnZ6+gWGA9HSB3r7XNKQlIqQ6EDPm7tsnaKo74sn/NmZp1OBZ
 kcoaN9h3DJFQzlNSJXKKm8i55m15okDb7KzFl1wvtHAdXq3Kmx7gxavmOJrpV8kxSiw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791303898;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=Z+w6+QrNpZUV7cbD60ObwSmUImoSck6TSpbtweBjx7E=;
 b=mn/GrdH63HLdrHhV/8n1XQ8pQ8ZWElDyoosUEj+WfT++JOw/EHNd5YZGP48azXZMftps
 7asBhBiZe53vYAh93QbeRZKsItdbU8Kh5dZMnHWS47QUWf+ZIXHdPIeAQCZDiUGQhdHqu
 yAB1NCWM4Ypi9MDLwvoeJKhi4tFjFEB4qOFxUzTJHEuX0FbPT9dwSJzAmb8IFXdrFuEFW
 KuGz1lAEQ8NifJlNzb9oYG8oJeljsqvXT+4/DEsgg0w39UQXCNbXEDxZxaPzwwExBGja7
 eC/2yNvgKd6sZXIAQLltfIKgURHS/Xmq0SCEFM6FHFKkUIrOvxvn3ik6jifiTYHuRhA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=UOjLmePd; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=UOjLmePd
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC612606BF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303704;
 bh=Z+w6+QrNpZUV7cbD60ObwSmUImoSck6TSpbtweBjx7E=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=UOjLmePdr/QkkiuN32B2W9vMuIAw2q3Vk08OCznXvUKfs85+NKQPe+LRryu8gaUc3
 fbSRAEocNxXizfDCFMsYZBQvQK99+m4nFvvolK8a/0Ld+dj6SkYQdSE7Y2IBsKTejp
 spd4KD3iiWnL2u2lw23Kw9RfnlVVdOMw1MW2ttEszP1kgBDDGaEbzO/w26Kf7yhpU5
 gxYVQZDi4U47Ap9aFtVURWgl6T0DNxE7pCmVtIEckk4TDWFytgPQRRnSZTAzb3Pd8g
 jd9inUjtcD6NLGFxoRmq1YO4F6VTiEUe8wTKcDxwnxiHYlflRwpMThefHWLz9TwaUW
 9BgPt7skqD5nA==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 IDhruf5fzxN1ysq9hiH5FuH/K4/hA7zNOtcx7EgX8ETBZxSXLXw8fhSJZJOK2VdjtWyfPTyAH9S
 VyDagvMvbxzwW4NCf4mjMvHZY6zGIRVPVsKYQja9nQwaCC636Ogj6/4EQ501qaGKeTs9041k6sE
 kV6vfDHb+wGOZvvH8aPyC9bxygRaaaoWiSRt4P4VsTDZfRRwKaD0nvPu+xCpiYAQF07zs4BFF3F
 5TqtGJMifz7hjEpqI7GfMwWroii2oavcXkh3H82AhU7Qm4pukex5dphXmwVOEJ7HMS0H9+Q7dTI
 5yiiiHGLdvZmBYX1hEYO+8xAZ/1QTn7Znm+Tx8f/YuZM/eKwNFocVJscD7vgCrQbbrleaV/XXjq
 0JaAou7FNQBC3Qm6N2DIIbTqHv811Ap66iDpoBzOkYMZWZTHBzggEoGJeLSiK0RHjG7/FmIbFgG
 c6NPUllAtQs9KmVNYS6fVD+Zx6cJwMHhgkD08tv/Wt0ZXThTf8CKYSRuVtEfRjqydJfnpL2FSEH
 KoCwxIHzsSOGOsvYQIHLKiJNSO2QTDl5z2PaWB/EcQ5tjkqrn8qe9tj1svCtyW1ZqOMWzJ6OPi0
 TevlbA==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4F42EA4C4E02
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 18:21:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7uq-000000000ir-3hY6
 for buildroot@buildroot.org; Tue, 06 Oct 2026 16:21:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 18:20:48 +0200
Message-ID: <20261006162106.3439373-68-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v8 67/84] package/libplatform: remove package
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

The last package depending on libplatform, libcec, removed its
dependency:
https://github.com/Pulse-Eight/libcec/commit/332bca975a71d8e876b66dc6a7fca938b49b1831

The maintainer of both libcec and libplatform has put libplatform into
maintenance mode: "Don't use this library in new projects."

https://github.com/Pulse-Eight/platform/commit/97332651ddfb3df9240dfd4227ac35484f8c4341

so we can safely remove the package from buildroot.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                     |  7 +++++++
 DEVELOPERS                           |  1 -
 package/Config.in                    |  1 -
 package/libplatform/Config.in        |  7 -------
 package/libplatform/libplatform.hash |  3 ---
 package/libplatform/libplatform.mk   | 13 -------------
 6 files changed, 7 insertions(+), 25 deletions(-)
 delete mode 100644 package/libplatform/Config.in
 delete mode 100644 package/libplatform/libplatform.hash
 delete mode 100644 package/libplatform/libplatform.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 16d530e273..552cc1a890 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -286,6 +286,13 @@ config BR2_PACKAGE_WESTON_SHELL_FULLSCREEN
 
 comment "Legacy options removed in 2026.08"
 
+config BR2_PACKAGE_LIBPLATFORM
+	bool "libplatform removed"
+	select BR2_LEGACY
+	help
+	  libplatform was no longer maintained upstream, so it has
+	  been dropped.
+
 config BR2_PACKAGE_FLUIDSYNTH_SDL2
 	bool "fluidsynth sdl2 audio support removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 9f5cc3819a..8fd68d8efe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -447,7 +447,6 @@ F:	package/libogg/
 F:	package/libopenh264/
 F:	package/libpciaccess/
 F:	package/libplacebo/
-F:	package/libplatform/
 F:	package/libpng/
 F:	package/libsidplay2/
 F:	package/libsilk/
diff --git a/package/Config.in b/package/Config.in
index 63d121ad5a..87fbcf446e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2238,7 +2238,6 @@ menu "Other"
 	source "package/libosmium/Config.in"
 	source "package/libpeas/Config.in"
 	source "package/libpfm4/Config.in"
-	source "package/libplatform/Config.in"
 	source "package/libplist/Config.in"
 	source "package/libpthread-stubs/Config.in"
 	source "package/libpthsem/Config.in"
diff --git a/package/libplatform/Config.in b/package/libplatform/Config.in
deleted file mode 100644
index ade6baf2c2..0000000000
--- a/package/libplatform/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_LIBPLATFORM
-	bool
-	help
-	  Platform support library used by libCEC and binary add-ons for
-	  Kodi
-
-	  https://github.com/Pulse-Eight/platform
diff --git a/package/libplatform/libplatform.hash b/package/libplatform/libplatform.hash
deleted file mode 100644
index 5fead5eb95..0000000000
--- a/package/libplatform/libplatform.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  2ab98ba486b28dd9c31e9f0f8a04eddad12c09ad1951c359fdef475baafba296  libplatform-2748be52ae27e6007ef548b697d4a03ff7de4291.tar.gz
-sha256  0137261d24ce001fc5237aacddd267533e0f150ac23cf21acffea599f7358f7a  LICENSE.md
diff --git a/package/libplatform/libplatform.mk b/package/libplatform/libplatform.mk
deleted file mode 100644
index aeded5e9a7..0000000000
--- a/package/libplatform/libplatform.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# libplatform
-#
-################################################################################
-
-LIBPLATFORM_VERSION = 2748be52ae27e6007ef548b697d4a03ff7de4291
-LIBPLATFORM_SITE = $(call github,Pulse-Eight,platform,$(LIBPLATFORM_VERSION))
-LIBPLATFORM_LICENSE = GPL-2.0+
-LIBPLATFORM_LICENSE_FILES = LICENSE.md
-LIBPLATFORM_INSTALL_STAGING = YES
-
-$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
