Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1015CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Apr 2022 13:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5494405D3;
	Sat,  2 Apr 2022 13:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gn79C4tZ2q8A; Sat,  2 Apr 2022 13:02:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA61640530;
	Sat,  2 Apr 2022 13:02:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1F911BF418
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 13:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEE8B40530
 for <buildroot@lists.busybox.net>; Sat,  2 Apr 2022 13:02:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EfNccwff6cQ1 for <buildroot@lists.busybox.net>;
 Sat,  2 Apr 2022 13:02:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD913401D2
 for <buildroot@buildroot.org>; Sat,  2 Apr 2022 13:02:24 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id h4so7747958wrc.13
 for <buildroot@buildroot.org>; Sat, 02 Apr 2022 06:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1BIUGkK2COsvQMzc3b0Iwx7pO2wvXDcHZnuD4S33BGg=;
 b=VzeiPHTcAmMZNJpU2wsuA03ZkrZMPkWzmz2w3OufmUvL6kJrYiuLSQR+VLQsCOPdgc
 FVyimKT1W9zFOghYkNWBTXy8iMRZBlvq/oBJjOaGhVPlO3QI6zrr+0kkJMOE2F4bIgh6
 vm2Eg1zRI8SEGpfU5G0mexkdFYJeAnesUyney64eIfHXYFyHaVmKEy3cLV7g4TZVrC0p
 ZHQkaMh11cwyuPD3J+rXSHMgiZX4CJh1kc4Vx3EWE8dvngo5kdGSks5Tou9EEtPN5vTO
 rITr30lj+0fZAD5slp0ewm43sDXojn0GiQTaMcyMJGjP6Q5+hx9fqzLD0vAJUEnzDuDs
 ambQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1BIUGkK2COsvQMzc3b0Iwx7pO2wvXDcHZnuD4S33BGg=;
 b=cO3Z6zbVxInUwjBm+75hy9UN9E3RGmW8e2s0sSGEQcnvGMBtfB4fLjtlNjHBpN2ns7
 I095CbvlHzzocEA5hMr60EDmRVNB9S+6yUS+6KJfubjjEPDw71OugkAbLvpUxFlQMGTR
 nYMt928XxEelfEOqnA/47eEYzvIEYdpX653nYyrOeCMaNGUk/47DR4hdlVUUhCMsJqiq
 0H47Ps3tAbxyHjP7ADqooen/v3OxUockxU5XgUGwN9pPHux8mdkoohxsMTeYGNTZxnbo
 tqjBFbpgt5CHHEsSHOhPLVqON309zePldIC+4mJa8Rboyinw7qv9kNb5p4HEX6ayGLoY
 A1MA==
X-Gm-Message-State: AOAM530Za79tmJLDf7oGOkZIUBZX/ty3wAVYTnZMioQHQ5Xoh1gbJpmU
 CPVccroGbsh6V/WsQhl5uMIcBNFrtak=
X-Google-Smtp-Source: ABdhPJwRKo8mb3UlZbkJZfODEYAbmRQcQND9XOIOUcPp+FOOL+oTFw0nSVTQxY2bOZOZoipDH4VPDQ==
X-Received: by 2002:adf:df8c:0:b0:203:e4f3:920 with SMTP id
 z12-20020adfdf8c000000b00203e4f30920mr11067180wrl.461.1648904542574; 
 Sat, 02 Apr 2022 06:02:22 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a0560001aca00b00203daf3759asm4835561wry.68.2022.04.02.06.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Apr 2022 06:02:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Apr 2022 15:00:49 +0200
Message-Id: <20220402130049.453518-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/libkrb5: fix BR2_SHARED_STATIC_LIBS build
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with BR2_SHARED_STATIC_LIBS raised since
the addition of the package in commit
7ae94b51ed5d51fb9fa3f5a931bb8435bcbfaa42 and
https://github.com/krb5/krb5/commit/bd13166a4098198832d921b8e50b97008b714b7b

configure: error: --enable-static must be specified with --disable-shared

Fixes:
 - http://autobuild.buildroot.org/results/dadbf9f77ffdcc4d4e48c6d7e6beb5da303a8074

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix patch number

 package/libkrb5/libkrb5.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index d14c464b39..0553e9bdb4 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -37,6 +37,11 @@ LIBKRB5_CONF_OPTS = \
 	--without-tcl \
 	--disable-rpath
 
+# Enabling static and shared at the same time is not supported
+ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+LIBKRB5_CONF_OPTS = --disable-static
+endif
+
 ifeq ($(BR2_PACKAGE_OPENLDAP),y)
 LIBKRB5_CONF_OPTS += --with-ldap
 LIBKRB5_DEPENDENCIES += openldap
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
