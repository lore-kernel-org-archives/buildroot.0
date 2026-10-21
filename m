Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BA6606A31B
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 09:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lC5INj9R;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q0l30xbi
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C0404076D;
	Wed, 21 Oct 2026 09:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-K4fjkMrjUX; Wed, 21 Oct 2026 09:42:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 319AC407F0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792575777;
	b=bZCYUHelp6sw8mw4T9gxZdbJXyWS0yJMxnp20mMPUIWWcbjPZux+DirI2r7YitLjrKNS
	 4tSw2MhK1vqBMDRu3jEzH4evLqNDh8ecvonasqSfdlGOZ6Ckv15iN9+1os0VOtM1SqN0I
	 mpUQhXRBoK9M2eBLUkfnUUNMfA+jqPIo+beOnCYIcWULWgCua5zwDu8Ouh49MNqZmzt7K
	 zHX6zonaaCoAAljZDfWjmo0HjrfoBH2Qu7rGZxhMQlFUo5iDxEwc/gw7MdLXbMcLw6//+
	 sX2VCdIBWx7UII9ishiRBfbTVOCAXXGJa556y111YU2thr/8200VrUvNSzb6XI+aKEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792575777;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uKeZGRoxGyzpovuDD4EwvaqrUK62svhYanlImUCctlw=;
	b=R/uKoFTSxWPPJXHJHRTldefKgDRxoZIMe91OqDfunFs0XmKY6Qx4Zlhv/gW6W+pHQVEr
	 cH8CxpCfGsyEk7VG23gKdGYOdVbP/Frtur0yLnUXVIkqEFUo1zidswixcrD5KMwxe0BiC
	 5ljZbj+m062D7KJnSAdweiaooB6eRr73GkOsHdIN2CrgFU2qvqYsiZfB5+a6Pxcgl+Xcd
	 ckB1VfsyiBXZH4w/wD5JqhLQ33TCLYxm7YCG8qoiRcl8Gac8QRaAe4BeU+BO/Rr3CDkKs
	 jdgddaIXPV/pJRg8BNS5YJt9i0+dz419Bx3y4dxg6fp07lSIYkcqBYAHpoemR8kuv0Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792575777;
	bh=uKeZGRoxGyzpovuDD4EwvaqrUK62svhYanlImUCctlw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lC5INj9RwoCwOv5gABPeRbeLbEfxS6OzTxKiqyfOTftr4PwZQRppOQtPIE/XgLmOV
	 pXVBBkSkV+fJf3QyczhkvHQmaE2HtgmhjSjFanNdpflBPD0Ts4HVMUwkEcnvx88kvc
	 pIKUnOqeNXBciT1XRVsgRuLuKj4Vgs11mxY/8b6QQdEcvBvymRBfKUtMoqsGdBWv7B
	 3fdi6mJY3bSdj6saL7FDaTJpffZU0el1kMqtjuF0798sPb6Yhmi9of2CHC7OL5jP1o
	 WNKLNUu56qn9bft5+KbfJGpCQo30hjo1wKSD5AFQhIB6XZt/aIlZR7oMRwt5e+P7ry
	 9QjhnRedPJTDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 319AC407F0;
	Wed, 21 Oct 2026 09:42:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34EB42A8
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 09:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A9B660773
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 09:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2njUGVpGoaXx for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 09:42:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D8F4260755
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792575774;
 b=ogj6kwuD0n4Ku4Uh32IvGViHIcWD1AqapZ/HL0Lw6NK4UwsKM2f2nRElVxDprnVRpPrR
 47hKOXty/jmkpTEwY7FfYE+XmaIJM3c9PjMnno1UrIoMamMJ6INtWYiejx2M1MZqTY/OX
 y51lMjWpRDZzkL2F+Vrj/KOSMYkhXiwCk4YRZH1S1voR9JGCoD2LyKz1KAze+dzY0+wsz
 rStZ/pgakMkuv0tUmXps/7CszHYKd5ReIewWwFbhbzLfC+Gupv/NLLXEP9yN4Z/EeHTwz
 fqMher4055XAPQO+mIlVqceDjsf1+hFPZDu+KZhv+mQKuTVZkROPKvpMQMyeDLN0KHg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792575774;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ta/RqOR/FJYW7NemLVYlZ+LMNda/VsqPZuGA1051iDU=;
 b=cDYQ+7+20ILr1p48NhBjmDnVr05BW2FKv4XRDnH3sGZij02Y1iMT5qrRbcW2IIyhqmtG
 +AUhVcVhdOF+lSUe64YosKNFSBr5NjzYY92gKV/n/d9lanmgxfohQ2Q0rGP6WdYX3MIT6
 W3gCG20c9J+Q5Z/+TwQOMwAQICfZJZqxkts5WJV07QC95rA7RQZW2ccJZllcJWVa4Jdzz
 PClgoHEZqgEsmx1A/NhQDATdKlrV8LsDM4S1KGic8yuOM6sl72xxUODB5FOMiZD30ZwZV
 4FmFjrV5Pnh4Xy7ULXOsniOHzBRisAL+ddHX1sXBAE4CIhGz1tDoBn84RiWa68ZTEEg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=q0l30xbi; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=q0l30xbi
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D8F4260755
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 09:42:53 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6b1ab2ad719so764608a12.3
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 02:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792575771; x=1793180571; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ta/RqOR/FJYW7NemLVYlZ+LMNda/VsqPZuGA1051iDU=;
 b=q0l30xbikSy4SpVpIYtxq4romfiKhJORskyS2Jejk3f4CVnWGm/xN4tQugYx0gZLEt
 pHLmw7pnbRMP7nXF6pQR4aCzu0Lu/rAEMDVdBeq2xlJugoV0Iu4UZCW33jyKYbVu6qEX
 UWO1XppByJ+YQuCNYnv6ocVykHLv1EX8xruv1mDN1P4OMYQ9MPypB8Sqkn7jzXjnOXeb
 pz4g8Q+c4sk3fvMzkkNA1BxZNEByGOUltygAtfW/0nfst9zNmZfLRL2rpRQQWcrqsWM8
 Aq+JGkClXf24IQZMreRTQYGf6XouaseR12doerP5PETN6ov2f59xIrCmSiRIqU+uXM/a
 Hj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792575771; x=1793180571;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ta/RqOR/FJYW7NemLVYlZ+LMNda/VsqPZuGA1051iDU=;
 b=0JZ0pC35U6MM0ALEBco0xpj+s8fpTC3toacGyOOVsw5sUUgSy/YUvBf0KxvpbDgY4z
 B1U68a0uXjFs31mFauRk5OAI2OPfxob0ax46QpXvWmMpkH/6huwhYRhznWuQQ1ntony4
 nLi2mOCv7mVbQOhz1wge9w1FUjKuT75fjlVGf0Z67qfs8HebwHLJB4XZvSMSOeqajaiu
 +itl+nc6GJbB5lQPVFYlJ8D9UUYggrfVVCMWRiJPAY7mSqYOTx6TI6/+XoChuJxeef49
 gnspc9ihYNJTRz4FxFq2SIkPrZk+XyquZj9RGnv8t72vFm2WIqRTDVIVTzSLboAyQdKQ
 vkZw==
X-Gm-Message-State: AFq9FYIjbFpRQqqurRkrZr1audadFfhu52JDplmL01nuuoywpIKI1CoR
 IfkCecFXZg1tlDKJfwGGusNPZgceG2kBRvpuHjnKWhCswbVJRqemJSyf//Y8nSkv
X-Gm-Gg: AYBFou0amYTLNCLtVZvxFxghZABMFtmNEEeOAU88SZNyGtTQrXR9BevyeztJpwvHrsD
 B8dHpx9OumXgyim1AB8E6nXLF1ecuYcfTJeXQASS+SGSAig8CFd93F6WCIWxpDJ7esjYG+6xJWs
 sI9+fENOgJ+UstsYhTd2pfm1SLqt2j2tKHtU9j+e8Erj82MgKYRnVye2lVtQ05wsh6y65w//gw1
 S5dDRy7Iq6SS84K4m0CIPTm9OxkZKowYQnrQi5htgcSMYxjv5vZfZhhA0XIzmNBhuryWs0mX84H
 Mh+wh3kFXLo7U/VK/8Nlnfpo3ROHvCUE6MMzafUKnhCVA2hDJwvN7nFQYDnH7wMoUx9OrfuhLfJ
 PVVq9O2R1ajkgaK/8WmOhUpxzyfa8HsouiwwJCugnI4jcffa1soEU4E0c2MTeFxs0Mtt8StTmbR
 wqOapBY9gdMqqFomDA0DBxHRQ7pRiSNTQa+daqOCotEmCEvgldSRk3YdSqqENPMXKQ1zCSQ+Kk6
 6sPc8X5APlCVKQCJcFLn56lfD7juG/sqCR/hAX/1SCm9n6/RyJl/gu59TDOFBtteMMuhzrxo1gt
 xHHwfyVWcihZamsAow==
X-Received: by 2002:a17:907:72cd:b0:c31:866c:9696 with SMTP id
 a640c23a62f3a-c467973ae23mr123846466b.31.1792575771220; 
 Wed, 21 Oct 2026 02:42:51 -0700 (PDT)
Received: from gimli.addiva.ad (h-46-59-24-110.NA.cust.bahnhof.se.
 [46.59.24.110]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4678e5acc9sm60252166b.9.2026.10.21.02.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 02:42:50 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>, Joachim Wiberg <troglobit@gmail.com>
Date: Wed, 21 Oct 2026 11:42:47 +0200
Message-ID: <20261021094247.2931801-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2025.02.x] package/firewalld: fix CVE-2026-4948
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The setZoneSettings2 and setPolicySettings D-Bus methods are guarded
by the polkit "config.info" action instead of "config".  The desktop
polkit policy shipped with firewalld grants "config.info" to any user,
so a local unprivileged user can change the runtime firewall
configuration.

Backport of the upstream fix from firewalld v2.5.0, g5fb3914.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 ...K_ACTION_CONFIG-for-set-ZoneSettings.patch | 41 +++++++++++++++++++
 package/firewalld/firewalld.mk                |  2 +
 2 files changed, 43 insertions(+)
 create mode 100644 package/firewalld/0001-fix-policy-use-PK_ACTION_CONFIG-for-set-ZoneSettings.patch

diff --git a/package/firewalld/0001-fix-policy-use-PK_ACTION_CONFIG-for-set-ZoneSettings.patch b/package/firewalld/0001-fix-policy-use-PK_ACTION_CONFIG-for-set-ZoneSettings.patch
new file mode 100644
index 0000000000..b875e69903
--- /dev/null
+++ b/package/firewalld/0001-fix-policy-use-PK_ACTION_CONFIG-for-set-ZoneSettings.patch
@@ -0,0 +1,41 @@
+From 511a305c504e4c0928eda670598528309da3436d Mon Sep 17 00:00:00 2001
+From: Sizhe Zhao <prc.zhao@outlook.com>
+Date: Tue, 31 Mar 2026 20:46:50 +0800
+Subject: [PATCH] fix(policy): use PK_ACTION_CONFIG for
+ set{ZoneSettings2,PolicySettings}
+
+Reference: https://access.redhat.com/security/cve/cve-2026-4948
+
+Upstream: https://github.com/firewalld/firewalld/commit/5fb3914ad830feff6cb2b0670457c60a323c6c6c
+CVE: CVE-2026-4948
+[Joachim: backport to 2.0.2]
+Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
+---
+ src/firewall/server/firewalld.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/firewall/server/firewalld.py b/src/firewall/server/firewalld.py
+index be53fbab..ceaa4322 100644
+--- a/src/firewall/server/firewalld.py
++++ b/src/firewall/server/firewalld.py
+@@ -946,7 +946,7 @@ class FirewallD(DbusServiceObject):
+         log.debug1("getZoneSettings2(%s)", zone)
+         return self.fw.zone.get_config_with_settings_dict(zone)
+ 
+-    @dbus_polkit_require_auth(config.dbus.PK_ACTION_CONFIG_INFO)
++    @dbus_polkit_require_auth(config.dbus.PK_ACTION_CONFIG)
+     @dbus_service_method(config.dbus.DBUS_INTERFACE_ZONE, in_signature='sa{sv}')
+     @dbus_handle_exceptions
+     def setZoneSettings2(self, zone, settings, sender=None):
+@@ -970,7 +970,7 @@ class FirewallD(DbusServiceObject):
+         log.debug1("policy.getPolicySettings(%s)", policy)
+         return self.fw.policy.get_config_with_settings_dict(policy)
+ 
+-    @dbus_polkit_require_auth(config.dbus.PK_ACTION_CONFIG_INFO)
++    @dbus_polkit_require_auth(config.dbus.PK_ACTION_CONFIG)
+     @dbus_service_method(config.dbus.DBUS_INTERFACE_POLICY, in_signature='sa{sv}')
+     @dbus_handle_exceptions
+     def setPolicySettings(self, policy, settings, sender=None):
+-- 
+2.43.0
+
diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
index eae8afc27f..d2c87267c6 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -9,6 +9,8 @@ FIREWALLD_SITE = $(call github,firewalld,firewalld,v$(FIREWALLD_VERSION))
 FIREWALLD_LICENSE = GPL-2.0
 FIREWALLD_LICENSE_FILES = COPYING
 FIREWALLD_CPE_ID_VENDOR = firewalld
+# 0001-fix-policy-use-PK_ACTION_CONFIG-for-set-ZoneSettings.patch
+FIREWALLD_IGNORE_CVES = CVE-2026-4948
 FIREWALLD_AUTORECONF = YES
 
 FIREWALLD_DEPENDENCIES = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
