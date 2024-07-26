Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA814C3DA7F
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 09:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA24881FDC;
	Fri, 26 Jul 2024 09:46:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 49iLNx5lzvYB; Fri, 26 Jul 2024 09:46:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84B6E81E52
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84B6E81E52;
	Fri, 26 Jul 2024 09:46:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EF1B1BF20B
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 09:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69ED06062C
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 09:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iIHKCJFHfJvE for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 09:46:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::936; helo=mail-ua1-x936.google.com;
 envelope-from=danomimanchego123@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8A2E66061B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A2E66061B
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A2E66061B
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 09:46:16 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-83120879efcso160251241.1
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 02:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721987175; x=1722591975;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CGoDDa84BokcY34hZDVLiR5r2j9t0a9QsQJH56CY+yg=;
 b=rJVOM2oL/YpE0mp3DDotvu8L6JILAbC7IdCoSW7sOF+QVrgEHbfCTUeZ67YzR0nNaH
 8sx+I0M0N54uYuiiJSJRsSbNsY4ueHF48vX7r7rCqzy1bFhv34ROVqcUmSW7uD+Yjdy+
 pmbt8CnuAjW79/I0PbBpWCb7q8djQEN3a/WRAcbK6uZZq/pvK7x7Y6yH6m6MfGg17rG5
 2jRLppKKTzf4HqlLbcnxyGjYPLPlKuI513e0fDocBE+Po00ALocLVlwd3baQSaN5ZgUf
 yOmbu1ZkQyDgSfzZCqm4WnfKBVpkRXUXv6OhCNsun8OzJmc7jC2ozTksNq2O2pER4OSp
 mv2g==
X-Gm-Message-State: AOJu0YzqmwLtUEH7ZMfzy1yiJ9ma1/dGkYEWjh7evZaNKDXVrkldvjNl
 NYY4CCHayyrth749Ds1Mwal1HHhS4RliowMv88DAUpI0i5hA/QkOafsTsQ==
X-Google-Smtp-Source: AGHT+IFGEoTtlkrtIFARYsNTllSzFwc1gQFklSkKOdXU/L9PAPxII0GNPdo2cC/uXmMwpjLvmKEG+g==
X-Received: by 2002:a05:6102:809e:b0:48f:9324:db08 with SMTP id
 ada2fe7eead31-493d6393c5emr6830576137.4.1721987175009; 
 Fri, 26 Jul 2024 02:46:15 -0700 (PDT)
Received: from dmocelo-Aspire-E5-575G.hsd1.nj.comcast.net
 ([2601:87:c480:28d0:b112:cd58:ee23:4bc0])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a1dcc43dacsm77306285a.126.2024.07.26.02.46.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 02:46:14 -0700 (PDT)
From: Danomi Manchego <danomimanchego123@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 05:46:03 -0400
Message-Id: <20240726094603.10333-1-danomimanchego123@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721987175; x=1722591975; darn=buildroot.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CGoDDa84BokcY34hZDVLiR5r2j9t0a9QsQJH56CY+yg=;
 b=CRtUytQj4itRWQ1RpV7IKHeV8Wei+Yqwa/X4gf60ZWlCzhX6tgB/ElxJmdyt2oGws1
 ZR4w8VQXMmwEflzaIo1SLnZcHoFmlc8mc7Lzuxj3QGCiM3k25LoFaQoEKDhIKh9SFdS/
 gReeOSt1zHwdoGU0jZ1PvN0/ILOSiJrkePz5GHoMADSvdD4GAm4IOeMCJmQ0TfqRj9IO
 hVXrussXum5YU1y7ltTWcfzKFn3aCnfSxXum4EqnnEq7PKNvViR54AJ1nW20xBemeLrH
 u1pVvZrWMSokIyEZIjZZSXz2eghq7m5io9hPNi49nVtcdl2ilD42ejetFwV7N18dr6y2
 +1Gg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CRtUytQj
Subject: [Buildroot] [PATCH v2 1/1] libpwquality: fix PAM module path
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The libpwquality package provides the pam_pwquality PAM module - the
replacement for pam_cracklib that was dropped from linux-pam back in
version 1.5.0.  However, it currently installs it to the wrong place,
so passwd and friends fail to find it.  This commit sets the security
directory path to /lib/security to match the corresponding setting in
linux-pam.mk.

Note that libpwquality has *always* installed pam_pwquality in the wrong
place, since version 1.3.0 was added to buildroot in 2017 in commit
462040443ca943694fc59ec8380c82f8bf9aaddc.  However, back then, linux-pam
version 1.3.0 still provided pam_cracklib for advanced password checking.
Linux-pam deprecated pam_cracklib in 1.4.0 but still built it for us when
linux-pam.mk set --enable-cracklib.  Linux-PAM deleted pam_cracklib
altogether in 1.5.0, so it was not until our update to linux-pam-1.5.1
in commit 276f1e0a896698abec85500a86686bf72c79eb91 that pam_cracklib
became unavailable.  After that point, pam_pwquality was the only
alternative for PAM-based password checking.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

Changes v1 -> v2:
    - Add more context to when advanced password checking broke
      as suggested by Thomas Petazzoni.
---
 package/libpwquality/libpwquality.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpwquality/libpwquality.mk b/package/libpwquality/libpwquality.mk
index f12e583b2d..ba62cdfb09 100644
--- a/package/libpwquality/libpwquality.mk
+++ b/package/libpwquality/libpwquality.mk
@@ -23,7 +23,7 @@ LIBPWQUALITY_CONF_OPTS += --disable-python-bindings
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
-LIBPWQUALITY_CONF_OPTS += --enable-pam
+LIBPWQUALITY_CONF_OPTS += --enable-pam --with-securedir=/lib/security
 LIBPWQUALITY_DEPENDENCIES += linux-pam
 else
 LIBPWQUALITY_CONF_OPTS += --disable-pam
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
