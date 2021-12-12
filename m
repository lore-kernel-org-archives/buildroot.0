Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4A1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 20:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3604685A13;
	Sun, 12 Dec 2021 20:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kUnn_KJL52f; Sun, 12 Dec 2021 20:37:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CD5885A0D;
	Sun, 12 Dec 2021 20:37:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9E6A1BF41A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 20:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 946394013C
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 20:37:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H_vZhnGtSlqr for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 20:37:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 809C9400CC
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 20:37:54 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id c4so23888302wrd.9
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uxTSwuScY/LwgcNvnKCQ15Mlf0q4v8U2At7B5ExgnQE=;
 b=Cpuv1DbEo7o/zFwCfjlXvlqqjSZdVeYVYiaaxvwrbdba99FYFREwQvT9EE0Hn42UHp
 +UhII6YOKFSL9IUlXyYl0VqFDFwrwJH393V+6lL5q8E1MpyBxdcxGIHFhk4E2GFmVeMO
 yJDzl/dDNyusqFL8mUc0nJTklT5NVPwwiGKJxZ46AYdofuvODwI8Zw433+8dVYZAGI3V
 lIl0/uj/R9MOO+6AHE4Lm//x7hlPrc0MEy+a7YSsWlQvtQfE/Edek2FpLMBmFurXWcM+
 fmqhkcnUDmZe9lkR2lQd18xbEhjDEafNskegTU+AR9skHjidqVgtHwn+75PAd4OUXeyy
 QcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uxTSwuScY/LwgcNvnKCQ15Mlf0q4v8U2At7B5ExgnQE=;
 b=swxtukCXbOmpc7hWxMvMGJp/UOXoWKLN7cyrNHuXN6CCaDr6JaJjpZa4VnrOHo00ND
 dXWVVaIkSA+MZxfm0CFsJgubXJjtsnlq8zkYio4zmawH/877LolqHbod3qkLwjsy3UNy
 s+yqhk4kVywHSmrR7VxY84wVBKAngSM2E90Wv8/iIg7MnKJixNtxWx7Uz8p+hmaq+ylt
 QxJ1s4lph9I8GrioD04k+mjUPWQjZikHtCV49MOSfF6nYqMzIBDJ7a6rNe3mPKhDYP4a
 eTy2amIwhBpV++d6DVX+f4gcNQZKzCbkShWz4hlu/+rMHM/oDwpwQnwgETHcdF4lY4Pe
 x58Q==
X-Gm-Message-State: AOAM5329gwaJg6fMTdzPgR0+hvHmXSyVpL2r6ln6J1DEsbrG+pzGRta7
 8uq8zD0+XB1ufuguYI9Y8cmzsVt2i48xVw==
X-Google-Smtp-Source: ABdhPJy8rgmlBqNDl50p0wljtwEoAceSJj1Z3MxZ3p9QR5jtHvpBtjr2wp5ZeY57K/skUZE7hTNSIg==
X-Received: by 2002:a5d:4904:: with SMTP id x4mr27622806wrq.139.1639341472488; 
 Sun, 12 Dec 2021 12:37:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id l26sm4964966wms.15.2021.12.12.12.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 12:37:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 21:37:39 +0100
Message-Id: <20211212203739.947243-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dosfstools: add SELinux module
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Support for dosfstools is added by the system/fstools module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dosfstools/dosfstools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 77b560ee9b..26a28670c0 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -9,6 +9,7 @@ DOSFSTOOLS_SITE = https://github.com/dosfstools/dosfstools/releases/download/v$(
 DOSFSTOOLS_LICENSE = GPL-3.0+
 DOSFSTOOLS_LICENSE_FILES = COPYING
 DOSFSTOOLS_CPE_ID_VENDOR = dosfstools_project
+DOSFSTOOLS_SELINUX_MODULES = fstools
 DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks --exec-prefix=/
 HOST_DOSFSTOOLS_CONF_OPTS = --enable-compat-symlinks
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
