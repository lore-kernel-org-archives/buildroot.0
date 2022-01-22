Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B735C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 22:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8592408AE;
	Sat, 22 Jan 2022 22:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0gu3LuXVK6aN; Sat, 22 Jan 2022 22:45:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 096D940892;
	Sat, 22 Jan 2022 22:45:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A7791BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0922E83E69
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:45:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H6_QfOQftbEQ for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 22:45:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1872283E62
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 22:45:48 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id h29so3945741wrb.5
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 14:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cfh4Vief6jVX+tJwxNkB0JEgxQ0kxBmhQoLitv8RFOE=;
 b=blyQmCCKo2ijGRjl3F9UZxVk39mb0uLSVSVRdFihOWYqnHt2o9NLvo0vgTu1c3jsEx
 +OXDUMoAZvIHkijb/L3z95IoMS6TBup7ZW6M4Vof63qDmK3Za+cbyiVsgvwgQx3BHE6B
 H+l3RQB+GnQ8Z+WWbHPqP7YovwRSbwowJGbzwNo/1izwnTWMA1aAew3pWAiCFLWgJuPq
 8XoiGP/TkIDNWv34unhkbfgADMW49T6xAS3Gpx5A61rx8bSoCxoNt/QP5u1bza5LOl/S
 r6fIzIV9SfWaKwCXp8qK6RztGSSJUWsOxUL+8AFrBmSHT+oV0xoHaSETgfi+VBqh/s7m
 hAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Cfh4Vief6jVX+tJwxNkB0JEgxQ0kxBmhQoLitv8RFOE=;
 b=F/pidtik8+5QmZUYwyIpoqaN6wUespZIQsoHqhKr9Drso/5wkcjIC+gGyYftIeuN1f
 Dy/QS3kwljtmqWW8MAggQ++R9WyMkZTXEgUGBuxavpk/uXPsOBoXE8CY/Em8LJvEvYta
 XDEl/HITmzy4SbOmebER2ImTi9j75Xaj3nKv+xu8DhVQ8KkOm1h6uhsAyW+kF5Ks/ffj
 ihlwqiV+g7eoiagTrJgwGTAYNHVyJFEVjcjFB2crSg9ttyrgzSyFqUkDHUxj0fuiw1sm
 jWQkpE7ZTA1yU4tbO0tckFO658OMHY3lbQrklIkuQaDT9PxiVPBdMr8oweb25HqSCWcU
 pRKQ==
X-Gm-Message-State: AOAM530CcnzDW2fS1qyIAZkUPHJeIZftYrYathDaw0Rpf7O3/qSA7eTJ
 /RoTo04MlsHCY7cwy6MMmahe5AINcBw=
X-Google-Smtp-Source: ABdhPJz/TYnNPXxYx6u3jecR1f3e035ZIRPxZaL6B3K0kvTrG/m4trUruYlu0bigRVYb2ezAz9Y8+g==
X-Received: by 2002:adf:fa11:: with SMTP id m17mr4650264wrr.11.1642891547021; 
 Sat, 22 Jan 2022 14:45:47 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id t16sm5663687wrx.79.2022.01.22.14.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 14:45:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 23:44:10 +0100
Message-Id: <20220122224410.309822-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lighttpd: switch to pcre2
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

Switch to pcre2 which is supported since version 1.4.62 and
https://github.com/lighttpd/lighttpd1.4/commit/7512d82ca49f1b579819c2974c61de4e3137c70b
and enabled by default since version 1.4.64 and
https://github.com/lighttpd/lighttpd1.4/commit/750414d3bb6f13c119220e56d0c8123e665dffc5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lighttpd/Config.in   | 2 +-
 package/lighttpd/lighttpd.mk | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 9f593a9228..ed674a9227 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -48,7 +48,7 @@ config BR2_PACKAGE_LIGHTTPD_BZIP2
 
 config BR2_PACKAGE_LIGHTTPD_PCRE
 	bool "pcre support"
-	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE2
 	help
 	  Enable PCRE support. Needed to support mod_rewrite
 
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index f0974dd5b2..2a05071209 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -26,6 +26,7 @@ LIGHTTPD_CONF_OPTS = \
 	-Dwith_mysql=false \
 	-Dwith_nettle=false \
 	-Dwith_nss=false \
+	-Dwith_pcre=false \
 	-Dwith_pgsql=false \
 	-Dwith_sasl=false \
 	-Dwith_wolfssl=false \
@@ -65,10 +66,10 @@ LIGHTTPD_CONF_OPTS += -Dwith_bzip=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_PCRE),y)
-LIGHTTPD_DEPENDENCIES += pcre
-LIGHTTPD_CONF_OPTS += -Dwith_pcre=true
+LIGHTTPD_DEPENDENCIES += pcre2
+LIGHTTPD_CONF_OPTS += -Dwith_pcre2=true
 else
-LIGHTTPD_CONF_OPTS += -Dwith_pcre=false
+LIGHTTPD_CONF_OPTS += -Dwith_pcre2=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIGHTTPD_WEBDAV),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
