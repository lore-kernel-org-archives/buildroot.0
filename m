Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9271FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 10:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35F1E405A8;
	Tue, 22 Feb 2022 10:23:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RByQifvcDPar; Tue, 22 Feb 2022 10:23:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40623405A0;
	Tue, 22 Feb 2022 10:23:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D965B1BF280
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D631360B12
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8iv0iZgtXIxO for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 10:22:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E1F560ABE
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 10:22:31 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id bg10so41386531ejb.4
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 02:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uZCGr6y+9EeKeb4a5/F1yD8dFWNcrLDzcnkxBPAmc8k=;
 b=gGB7MFnEkGsk4ZvYnRbcYAmIlh0o5kIvVnVc7/yPzYumyS++XiFiB8hSTslQ4YR7F0
 wLbdC9SAC54WV2++jF8uY2SuZGRuUKfVtn1wsWCvIqVpr9ZI2nqDq43Mtv+iX7DH+SSf
 9kdDtimV10v649lNDkYgSvH9/+D/Yo51Lv1PmU1QEe5aQFzJ+2SMbxLUDIQIPBsdBn/X
 W3ThmpNT5wcCKkQT2MN0ORTcRU6Nd6jL0wk4AyzBMQWXMbRIW9LrKSSOSH3gQgU6KDl4
 J7f37QOdxW3Dfd6GwESqnILAbThvqkys1Syy78YV4Djoyi5A7DVp7AbFEsNupwiFz64t
 UUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uZCGr6y+9EeKeb4a5/F1yD8dFWNcrLDzcnkxBPAmc8k=;
 b=bTE1ZTULhT0pv0rsAnvYpeRYf+stSu6UdsXKgfgdH+Qxh7gnc47Opy7KImIMFSSkQR
 t9bjI1nzY9czAoaL933gvMJP9rEDalwBYobgmuJsVVdi4YrI3BifRufN6jz+ap8Zm6yO
 4AOlpm7cLy68sqNpVbT/vTa7KkOwFXFEsF24aMqiBiV4pxkoWp+Fnqe9np6jL4Km7xl0
 6ujx3Jh5UnswFP1jGtau2TUx+etcwSVZt65KbvKJEgcFlKhXk6IpyYGLlIvszPm+SUBQ
 YEF1BqJJAve9w5QIXODUnbXDePDR4NbpfpSHQpIWTZ/Rif4UE1+8+7dvYgtwHVkTXD7S
 ED/A==
X-Gm-Message-State: AOAM532ARMDhFu6GvWTRVR5jzY4KhGOh3erpIHLFCmnBPIv1J0TQyg7J
 cwZgMyon8MSLn2WCKrAxW4+IAaMQkPeuRg==
X-Google-Smtp-Source: ABdhPJw1UMS1xYVf1ojgf/Jr0EDCEMImYOhRLgRBv3gjmOENOO3Gtyi3jn91Ux/a4xsfjLWq3ch+AA==
X-Received: by 2002:a17:906:a398:b0:6ce:71b:deff with SMTP id
 k24-20020a170906a39800b006ce071bdeffmr18752221ejz.204.1645525349345; 
 Tue, 22 Feb 2022 02:22:29 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id c24sm6097032ejj.60.2022.02.22.02.22.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 02:22:29 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 11:22:09 +0100
Message-Id: <20220222102211.74573-7-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220222102211.74573-1-nolange79@gmail.com>
References: <20220222102211.74573-1-nolange79@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 6/7] package/zsh: Enable dynamic modules
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
Cc: Norbert Lange <nolange79@gmail.com>,
 Phil Eichinger <phil.eichinger@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The autoconf scripts seem to assume that no dynamic loader
is available if crosscompiling.
This results in only a small set of modules being enabled
and linked statically.

For comparison, debian patches the fallback to enable
dynamic modules (unconditionally).

This commit enables modules if shared libraries are enabled.

Signed-off-by: Norbert Lange <nolange79@gmail.com>

---
v1:
-   so far only tested with glibc
---
 package/zsh/zsh.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index c5ab7c2fae..c26a00c430 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -36,6 +36,14 @@ else
 ZSH_CONF_OPTS += --disable-pcre
 endif
 
+ifneq ($(BR2_STATIC_LIBS),y)
+# zsh assumes shared libs to be not available when crosscompiling
+ZSH_CONF_OPTS += zsh_cv_shared_environ=yes zsh_cv_shared_tgetent=yes \
+	zsh_cv_shared_tigetstr=yes zsh_cv_sys_dynamic_clash_ok=yes \
+	zsh_cv_sys_dynamic_rtld_global=yes zsh_cv_sys_dynamic_execsyms=yes \
+	zsh_cv_sys_dynamic_strip_exe=yes zsh_cv_sys_dynamic_strip_lib=yes
+endif
+
 # Add /bin/zsh to /etc/shells otherwise some login tools like dropbear
 # can reject the user connection. See man shells.
 define ZSH_ADD_ZSH_TO_SHELLS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
