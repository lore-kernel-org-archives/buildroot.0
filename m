Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73493C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 09:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2387E824EF;
	Wed, 29 Dec 2021 09:43:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iScTRtlHhBGM; Wed, 29 Dec 2021 09:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86B358254A;
	Wed, 29 Dec 2021 09:43:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F8691BF4E7
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0736F60BA4
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 09:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KAL3v4BL9Q-5 for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 09:43:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D87F60B9C
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 09:43:18 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a9so43250364wrr.8
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 01:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nSWTkz95AMZ2fqdS1uddvCV5O5BdHm6MPNGOqCOzoQQ=;
 b=fjfefaHaF8FfFH10HG9rK+XKUqBTp9s7YkADgEpbUJSt93SdjaPCK8shsaqIXk+UC2
 uF1Y7IBH+AR/krhquu89H4UPEmOO9TMzbiio9NJPPHRNRVLtii31LnslTXmAqsp2OiFJ
 MfTN3ty0KSi4GpELQ9+QX39DVd1738T9T9UByVvK7C12g22TasKWkTGd0w0RHXx+h88Z
 C5Zxs7KFIBGIz8Su3Q4kagguvmqoWcxpX1hFZ04qVcKcycLRHeUiaUGiCjmN/F9vq/fH
 45yDU9axf4uT4PsMb6WLnnFJBsRAPLmrQYtH3j6rpcxyDUM35kWmSKi46pvvQGr5IXHu
 agEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nSWTkz95AMZ2fqdS1uddvCV5O5BdHm6MPNGOqCOzoQQ=;
 b=isJf8FLI1Ppzj95yW5xCM2MF9LSkV6fLon/JsNx7nor9mgozyuluB+Dw2xYtRhL+kL
 mLWhwLOyFM56ifYQ8HydopP/MwMjY1WkazMSC6SFoSD5jyBCslvaH0lv9AravHckFZ6X
 gwp5wtF75xltzUxAub/LhSlLzul/mHgXDNRxfk5JYa5WQrcdrNwyBfSKuVAFJxGafycN
 +4ZPgzfjEZyDq/9ONh6T0ay1J3FNdfwnSCw7Bsjs6CFzlRAgnbiBMxI+cma2PQaZRTDa
 JhMTxJVzGSqezRCOZbY0xg7FCKEWA5OHs1OVHXDhLgrfQcXLqheP7Mz3hFDP+OgZNivN
 FyqQ==
X-Gm-Message-State: AOAM530q93LI2b5UV25uY2psM86fddVqwR/uJMydfhGW28hoN/YkFdf2
 0UE7IoLtOcdSzOte7aasf7/mlJcM8TM=
X-Google-Smtp-Source: ABdhPJxmXCbq0OkxC6csodDcswu3NJwKhkgjyPX3c/fKFP9lsMGWZTc3wtDJUlU2a1gGASboESqShA==
X-Received: by 2002:adf:cd85:: with SMTP id q5mr20219670wrj.80.1640770996313; 
 Wed, 29 Dec 2021 01:43:16 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id bg34sm25597051wmb.47.2021.12.29.01.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 01:43:15 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 10:42:25 +0100
Message-Id: <20211229094225.512279-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/glibmm: link with -latomic if needed
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Link with -latomic if needed to avoid the following build failure since
bump to version 2.68.2 in commit
dddb65efbdf2c7952f22a1e51009f17f1676db4a:

/home/peko/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: glib/glibmm/libglibmm-2.68.so.1.3.0.p/main.cc.o: in function `Glib::Source::reference() const':
main.cc:(.text+0xd40): undefined reference to `__atomic_fetch_add_4'

Fixes:
 - http://autobuild.buildroot.org/results/6a2709956fbb16ac3cbf676acb242c88f83fcdae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glibmm/glibmm.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/glibmm/glibmm.mk b/package/glibmm/glibmm.mk
index 578267c75e..525da6b618 100644
--- a/package/glibmm/glibmm.mk
+++ b/package/glibmm/glibmm.mk
@@ -15,9 +15,15 @@ GLIBMM_DEPENDENCIES = libglib2 libsigc host-pkgconf
 GLIBMM_CONF_OPTS = -Dbuild-examples=false
 
 GLIBMM_CXXFLAGS = $(TARGET_CXXFLAGS)
+GLIBMM_LDFLAGS = $(TARGET_LDFLAGS)
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 GLIBMM_CXXFLAGS += -O0
 endif
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GLIBMM_LDFLAGS += -latomic
+endif
+
 $(eval $(meson-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
