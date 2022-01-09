Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C58C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD8BF4045E;
	Sun,  9 Jan 2022 22:32:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l3gV_RUM5Jns; Sun,  9 Jan 2022 22:32:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD9434010E;
	Sun,  9 Jan 2022 22:32:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C29121BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDCC6402F7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a30LjTXKgbuo for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:32:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA84E402EA
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:32:46 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 18-20020a05600c22d200b00347d3a13c7cso3686937wmg.0
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 14:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o/ln8dGHn/TLXKjdtIYuadzYK2HQ9KFLXak6dl/eBf0=;
 b=WlKKq5NhDBV3ceeCclQaVNJvHq7Nh6Gv6KHhGD3zEzzCsCC+wOu9NAmJ80zEBTOwfO
 cRVAQ9v3L2tSA2lSpZBTTAFw2cG426rg0rSw3OLo8SPs4YX2U41qxHONOI5o7GYTEKEY
 5lC894Z+LN1TVvsbWTjHOiPHcYynqImp5KYMaVlP0uVAec3GIX93Yz1hGRTxk9LQtDvI
 VZj+xXvegl+PMgNyNE7k9AuGJnQGJre+Pp+KfPwWHB5HD7xad7ZhqdPH53Keisih4fMP
 8gO7Voy1A4ks1d7A1jfggLPm+azmFRB6I/IDRclhhlfYeOZujpQHGvv1LmM0OcQznpPy
 2Uuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o/ln8dGHn/TLXKjdtIYuadzYK2HQ9KFLXak6dl/eBf0=;
 b=fs3qx4mmG6vW0rGVyrzk2y8FWEgPxZnrzSJxIXJJcf9VdYK+nO1WPH2b8v3Bp7x+HC
 UrAwV0Oqn/BW2mrcCJLPwC+S3Zcpor0XavQoGg8lHuS057u4okt8FQkf4Y4XPsFbVLpC
 h+DZuBMS2uJZCzKjZfF9JfMhnMXdsOvz6Q7LEpDphYcB54sHcdNPvNRHyFJkT4i9E1DU
 t4ukez8+/8eZPn4RIc9c8QIMV5Nv37V9HJseprZclSQNj/T4uF8CURcMZBm66NyQLaKg
 SNeOACv0Io9T2kiY/IGortBnNKCBQnzQwYCQG3Uf4QqVjgpIA+ZyzfjL2Dj+P3I7O9JV
 10RQ==
X-Gm-Message-State: AOAM530eMix9idpVvK58pgf3Bvj9gkrSIMInCkKQNob3zaINipPOhn4V
 xlqn/g+3Si2UrtND4iEV1IlUQIu896s=
X-Google-Smtp-Source: ABdhPJwtnmwqOpR2LLgAVmrJmVbuzpPqez0hRZI3EZY6SyDKusCQ5Fc91WDnRTwvjE1mMWfGMVF7Iw==
X-Received: by 2002:a05:600c:b50:: with SMTP id
 k16mr3755388wmr.85.1641767564796; 
 Sun, 09 Jan 2022 14:32:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id n15sm6033223wmc.0.2022.01.09.14.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 14:32:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 23:31:35 +0100
Message-Id: <20220109223135.1409181-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/squid: needs threads
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

squid needs threads and
https://github.com/squid-cache/squid/commit/7dba4ac446341548a0b101489785f2cef9a33caa
to avoid the following build failure raised since
bump to version 5.3 in commit efc07b7a1818787229ddb335ca26ff2cf03820ae:

ntlm_fake_auth.cc: In function 'int main(int, char**)':
ntlm_fake_auth.cc:187:18: error: 'std::this_thread' has not been declared
  187 |             std::this_thread::sleep_for(std::chrono::milliseconds(response_delay));
      |                  ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2aabc8375d41ad4d047d20ff8ee4fe1c978e7ee1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/squid/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/squid/Config.in b/package/squid/Config.in
index 0df2aedef6..6272140768 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,13 +1,16 @@
-comment "squid needs a toolchain w/ C++, gcc >= 4.8 not affected by bug 64735"
+comment "squid needs a toolchain w/ C++, threads, gcc >= 4.8 not affected by bug 64735"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	# needs fork()
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
