Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D39C433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Mar 2022 19:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B73DB60B85;
	Thu,  3 Mar 2022 19:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ipZTxdNbKkJ; Thu,  3 Mar 2022 19:20:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5EC260B5C;
	Thu,  3 Mar 2022 19:19:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB47A1BF3B8
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 19:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7DF4401B2
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 19:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TzicjJpTtFgn for <buildroot@lists.busybox.net>;
 Thu,  3 Mar 2022 19:19:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB43F40164
 for <buildroot@buildroot.org>; Thu,  3 Mar 2022 19:19:56 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id f37so10201255lfv.8
 for <buildroot@buildroot.org>; Thu, 03 Mar 2022 11:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bnKLnGaG5mEztVLVf0pmB+pJJSLO5yTD/O4qHfg73+M=;
 b=cL3O/r5NCh1CZNu0cYmwvrPEDS/YLZQAcMJLj7lROWwUr/NExX3IkqG2ZoJw5NxtGB
 OfrknxI+I10VJsfliT40sQEtZ9rR+VfGIFetS1n3GnBtf/cHNslu4KD5usOvZaI6k13X
 gWewr7DPUDmJLyeSRqkIItojd39yVFPd0a2Fh1mOf2rljImj/Vkc8qumdRazAFI1P15t
 EhauEz+fVWVngFZS1Zpy7NyH/01CI30onyZq3BMI4JG1Sc+LskX7d3dvBRIPSbRZefSl
 61ZDc1wfAvoieFzBphvxzlVuZ9O7lo89jRwJV2XfhvVemPSfp44u5H7AqImo0f+yBIqo
 8irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bnKLnGaG5mEztVLVf0pmB+pJJSLO5yTD/O4qHfg73+M=;
 b=wweXopui1rSs2uPR09/gxTOQeMHbr0Ee6GZ39TiVBhcFoIFGdcuVXhveQ6GvbFQ8O6
 TusrYrD9JVLEBDMwLwkdFsMtOOepj/CExyJZySGZZ6v/aa1cDbI76TzN8OyIWVV/yMS8
 aDTJh0uBVwarrcvpdur1EiSAtwTUBghwCUzAYbvae83EN7WCmoFVRY6ZhT196RQ3lwiL
 D3uLhPMaDLgvEgRoEuQf57EuZddVDhIohgfsp6VCyMgAyiVyHTQcJq787QKXj+BOOXGX
 r0fuskZjJcWMbQ2lRKd2xNfKi4tBkWeaQsVegW8N3+OAOvGAsf62dKtx78qvRTRCE7dn
 3Lrg==
X-Gm-Message-State: AOAM531LwSLVMP8RxsR2WrsoGlYlTnE37NoeI4Z59M+PKBDyqN45XZKx
 +CguP/q0rZhJdZMKjxtDvN47IDy3Hjr9uw==
X-Google-Smtp-Source: ABdhPJytUxCPqvoUHW3ewAW7/bk4nntdNb9UJyQ00Kxa7fgiPAFQWGeycq9YvefNGRRCYDe2uKoZdA==
X-Received: by 2002:a05:6512:15a8:b0:445:b890:97a with SMTP id
 bp40-20020a05651215a800b00445b890097amr6519456lfb.377.1646335194351; 
 Thu, 03 Mar 2022 11:19:54 -0800 (PST)
Received: from localhost.localdomain ([80.211.22.60])
 by smtp.googlemail.com with ESMTPSA id
 q13-20020a2e968d000000b00246215e0fbesm642226lji.11.2022.03.03.11.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:19:53 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Mar 2022 22:19:45 +0300
Message-Id: <20220303191945.3952450-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: fix
 libwpa_client.so build
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
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build target libwpa_client.so is not built regardless of whether the
option CONFIG_BUILD_WPA_CLIENT_SO is set or not. Add patch that
fixes wpa_supplicant build regression.

Fixes:
http://autobuild.buildroot.net/results/001981339f3b895ecd9208a747a0e47d07c9583a/
http://autobuild.buildroot.net/results/318f9ecd4060d34cc8385891b56d0a0e6275f2c9/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---

Hi all,

Note that the patch has been posted to hostapd mailing list
and discussed, but not yet accepted:

https://patchwork.ozlabs.org/project/hostap/patch/20220222085219.3996729-1-geomatsi@gmail.com/

Regards,
Sergey

 ...le-options-for-libwpa_client.so-and-.patch | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 package/wpa_supplicant/0001-build-re-enable-options-for-libwpa_client.so-and-.patch

diff --git a/package/wpa_supplicant/0001-build-re-enable-options-for-libwpa_client.so-and-.patch b/package/wpa_supplicant/0001-build-re-enable-options-for-libwpa_client.so-and-.patch
new file mode 100644
index 0000000000..156d0e7e2c
--- /dev/null
+++ b/package/wpa_supplicant/0001-build-re-enable-options-for-libwpa_client.so-and-.patch
@@ -0,0 +1,68 @@
+From e6a6a4e3df52cc60425fcd037d3ec68a38f948ce Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Sun, 20 Feb 2022 10:12:28 +0300
+Subject: [PATCH] build: re-enable options for libwpa_client.so and wpa_passphrase
+
+Commit a41a29192e5d ("build: Pull common fragments into a build.rules
+file") introduced regression into wpa_supplicant build process. Build
+target libwpa_client.so is not built regardless of whether the option
+CONFIG_BUILD_WPA_CLIENT_SO is set or not. This happens because config
+option is used before it is imported from the configuration file.
+Moving its usage after including build.rules does not help: variable
+ALL is processed by build.rules and further changes are not applied.
+Similarly, option CONFIG_NO_WPA_PASSPHRASE also does not work as
+expected: wpa_passphrase is always built regardless of whether the
+option is set or not.
+
+This commit re-enables options adding both build targets to _all
+dependencies.
+
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+---
+ wpa_supplicant/Makefile | 19 ++++++++++++-------
+ 1 file changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/wpa_supplicant/Makefile b/wpa_supplicant/Makefile
+index cb66defac..e384cc6b8 100644
+--- a/wpa_supplicant/Makefile
++++ b/wpa_supplicant/Makefile
+@@ -1,24 +1,29 @@
+ BINALL=wpa_supplicant wpa_cli
+ 
+-ifndef CONFIG_NO_WPA_PASSPHRASE
+-BINALL += wpa_passphrase
+-endif
+-
+ ALL = $(BINALL)
+ ALL += systemd/wpa_supplicant.service
+ ALL += systemd/wpa_supplicant@.service
+ ALL += systemd/wpa_supplicant-nl80211@.service
+ ALL += systemd/wpa_supplicant-wired@.service
+ ALL += dbus/fi.w1.wpa_supplicant1.service
+-ifdef CONFIG_BUILD_WPA_CLIENT_SO
+-ALL += libwpa_client.so
+-endif
+ 
+ EXTRA_TARGETS=dynamic_eap_methods
+ 
+ CONFIG_FILE=.config
+ include ../src/build.rules
+ 
++ifdef CONFIG_BUILD_WPA_CLIENT_SO
++# add the dependency this way to allow CONFIG_BUILD_WPA_CLIENT_SO
++# being set in the config which is read by build.rules
++_all: libwpa_client.so
++endif
++
++ifndef CONFIG_NO_WPA_PASSPHRASE
++# add the dependency this way to allow CONFIGNO_WPA_PASSPHRASE
++# being set in the config which is read by build.rules
++_all: wpa_passphrase
++endif
++
+ ifdef LIBS
+ # If LIBS is set with some global build system defaults, clone those for
+ # LIBS_c and LIBS_p to cover wpa_passphrase and wpa_cli as well.
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
