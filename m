Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AC1606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 19:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mtbcMdW2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VCVEWni6
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 086B7406F0;
	Sat, 24 Oct 2026 19:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNa7Jhdb174m; Sat, 24 Oct 2026 19:19:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 26C30406CA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792869572;
	b=emRK2LSUei0IahX8m2vaTT9lwGs/r71Euvip5nIpN69bfzTqx7iYGSMB4UJyHijiNfyN
	 KmDXv/EP+7czyo1KLI+BQf+pXuFihC7Jbpwtgp/6Rqqwilr5s7ckTXiJP9Nl53agYflM5
	 FS6dgFroof2ov6aUupOhriJV2WHazWpOn31ZVgZyUJjRXHEaMv52XXdF0d6bJgnZxwQMR
	 zNUvEY5tEs1XBoL9BcuwTd/3pMlfb53soZHiXj3DSd6tZb0jDQvGmfL6aAUs/xetMFSx6
	 JyZ/XyU++Liq2ObaBcZl1nQwoyhpFMyEPlGhctH4BC3zOLzgeSPPM6gtvbYnlkcPd7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792869572;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=GUl0h7lOe2GiwcEWIY1ackc1q7U8Cogp8uzfiWLLTzQ=;
	b=eFThoSHiYd8v9EZuCa9NC9tmoVigeiVwG4N3TYAtMkNWQx7DrO6UYvY0oQvqK8PGRoL2
	 m3muqe+Ok7CCPPoHravIyU6guqOXM0r3T087GDlCiO6Jgaansi5WTk7NO+iJso4Wm8M5N
	 Dlo5f16Fo7Yx4kZSd6NmYbblvr1IZgjRQ3WKidciJ+DmWpSgPv3Ct59HaHZ5CLUbF3rz5
	 IF3LEIEd/FMj3QG4ogcjG1bXrgK/vsrx65fzvRW9q5t/Ugmxl8qRxQf2Kq9uQPCdXjy0g
	 U98mBK0PTfFMoKxNdrvtBwDU9xz6OF9OBbnGDl5Hlgf15CsrkjOjjO2/usILcPfLFwQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792869572;
	bh=GUl0h7lOe2GiwcEWIY1ackc1q7U8Cogp8uzfiWLLTzQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=mtbcMdW2AKQABgGd62ywY5r0ToavXtWVk5R9Bi9MXVELohaAwJ6pdLvQKC7vsDN/P
	 XbdXnvRwMz6zX/G9292OWlf7XB14SDPIMYe5ZfYN2nZnvnDd6io5LH3d93WsTxdoG0
	 iZiLI7GPdnsDsSx8KJiENhPd/oAwUDBSdC+WVOZVp8ElA0/6Vyr6Q3mH+M9P1Yo9b6
	 KNyeHPi32zNL1QTKotDNDaWDFf3BD3wmk3DZ/oT5xQt2q7V3r6wfvs+ccAKlW6wG4B
	 uwtnGPOcXovODjY2zG26FY1smLvN7HBwUfnlPip3bc4wl76fcBWc6P85SovJNFArpV
	 mjy+VQIlozfBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26C30406CA;
	Sat, 24 Oct 2026 19:19:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D83B0356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9BCF80E9C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CGeqCbYyGTaV for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 19:19:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2412B80E8D
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792869570;
 b=sw3GUUpBgFVGOvbKr2Jyvhe71e4r9qTUlHwKrWWLg4pB6bEw6DIGk3ILI+02wNTMyZx0
 ClnT4AB14y/G0MDbd/QbzhZCgcV0O1DKw6ViKN2nT4jA7LiOp8W6ZzHsYIJjlmOnpU5UN
 sm/LrtxuhBTIehfZejsR51ZUhoihTyd8DxMOZmKjZfvJ6Nbs5ovsmXzNf2TDknRewdesZ
 D/8BmTznd6hGAxTGN1I9H/cpZzuZyVtJyt7BMaKFn4hWqAqIvMt0TojKpZvhEiblSpXNc
 tL+B8EQBiL6TLEj93NNhOwl7rRvhseWuwrHkZ86TgWwllwfWAac0miAqF4IYA/+7S2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792869570;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=0+eN6ncHbY8WsdiqOmdgVI6S8pRvxr5b6q2LPqG1o74=;
 b=YsAJkC09WpTzuNuVpkm9vmsQaM5Zrp25oOF6bmUhka+Gqi1uU0bAjeRSv+Onwwv6mZBC
 c2a+0yUFInZJgFXjPCCJEncPvVzm1uCNjK1AD8vAieTr5I1QDnSuhRBstv73Wzmmdpn/E
 tn0DEdqnXE53npjBDsRxXLykSYL2Jicay0y2+hye5QyhoOOEmHrWxmY6HD8GnwmgbBSNP
 Fze6JL99iLqQib7O309NqTbXLYUx3FHEoz8T8H45IjPttH96kZ8IYMdC56tRjPRd7QnL1
 20WZs99WHR4sM1Z0rD6M7lkZ1/WDaMSTqI76fyr7gB3CeDkN7rz5x66mxLZQdwVWvIw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=VCVEWni6; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=VCVEWni6
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2412B80E8D
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:19:29 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-843cf077f10so2068381a34.1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 12:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792869569; x=1793474369; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0+eN6ncHbY8WsdiqOmdgVI6S8pRvxr5b6q2LPqG1o74=;
 b=VCVEWni6PBZuuozoHqoBh0g2T2uISgJ2dBcNLaS9tg/KfAzDk4yXcEs3w2ew/Sk9Jd
 7Aq0QYb/1JJHtw0w0slpBOoiWS1Rak15s5jnc6wbAbUouokkDpNbO6loGGXv6QdRlchY
 dnzymjjb+7vGQxCchibodM/MnOTRsbAwxNX6c9ceTkRnR7+xvS0g/1Me0VYXnTVg78Vn
 9CIlQKT60bsLHkug3ra1cFsgWzxp9vAwdI0AMEoZZD+IcMxFMFwNpD4frORbomDQJGiN
 wo+SPqQZ0CV9K3B5zrWqo4hZCz3pfSrRRCdDGUU45r/JB8sEP/9eOzvtrBFreYilANFL
 3ZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792869569; x=1793474369;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0+eN6ncHbY8WsdiqOmdgVI6S8pRvxr5b6q2LPqG1o74=;
 b=tpRe55MqJ+ElzlRrZCGjwzx2Yui2TcdBJdryTeDU+vd6BLHeHJ/W/GK/uyqrpCB1ln
 Iep51V/GygV5PfbucxWVK7aVn/qCCq43sDW7XwkQhlX/3uac2jcfUIWJVT5jYNKCNjpX
 +/QbvGRQIMeK6vzb+nYxotoAGrKQTmpwuBByyK3T/St801+ZS5BMzchR+zLt+f0l7t94
 6kftpd3rbD4nqH+paKEuZ48066/a9JV3T06TnYq8ENVPHcXVdsN2W/xFbmNHenVZLNIQ
 139shHc1ges7WX6vSth82bIQOsvh4zYVQHaA800XeUOdvxoofshTc1s24Jf9VRx2NGWU
 pu/w==
X-Gm-Message-State: AFq9FYJ6880pXh1bnAF1qQ0sExWHA04T1p6WyLOaBk8WPubqqzrjCLaX
 RjrhDva4cLuYAhSYsFzIlVsQvHJL71cw74kHrofEg51sbrBIu+Eqg27rKVfKllU+
X-Gm-Gg: AYBFou2EHV0/J8YgZR+eKKeFWFsjPHbOI0S5zSs6ci8pvT72hEV2ZVhbvOE1quYhNCy
 dFTA45e/cUVL469+mQ1EK00Bts4IwdhCH+dP8mPyyCiDnidYmTDX80RoEW9XvYlJATjfZ66NjRL
 RRfdy1y/ZGhTHmiJkplNKS2PScQOPZ93Mej0nNFpzsHlyF8Y7jRa4Wq0vI3ACes0/kxVP5ZCluz
 k0SKAj51Ea2u0YQMT7muXqZmH89/XzjSlZ9y2PwCeAlIATThAvBRezY/wVa4kRYkFb3UzUFBaNg
 G15FuexxIc2lL9Q8E5Py9xOWOQ07koufR60iwyzmlHhSXEfnvXxn2OMKElHyZFw+RWBg4Uf+BMU
 xBAm/R7/iPFPGsoZ+lrJXDQq6rESdMDgIes0M2Abvs/WiROQVuyX4eEgkf7WwiXMy+mwIlJw8Su
 XpNduPtviEYndwe9DDSCIq/C3La2cA+A99pMulSEvsvHv/96MXbrheO1gtLOlG2RrfqJvEFueKM
 4vh0I2dq53DGmDD9J/uvx6bMARfxh1J6ygD2O338QVxe6J7JMkS2TmDidNDVEkNbwRg+kDl5XxG
 +BMpiF/h9wUQ0t9E51UO6ZqKrIFrAcCbE0MyboJxQp8oRp+Ksj17uiT2HTkhxzyOHn6h0MhWgY5
 XLWXMQJsfr+Nho/AOigvNEv5jXgifEW7lWpJS50vkjjUlOC7SnXlZDoN/EQttdumDNXU3E4GyuJ
 NnoVM6be3jVF2hCJLjPvcFSdO4
X-Received: by 2002:a05:6830:2695:b0:845:156f:5899 with SMTP id
 46e09a7af769-850ff487a25mr2137122a34.29.1792869568840; 
 Sat, 24 Oct 2026 12:19:28 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-850fc005bd7sm3018896a34.24.2026.10.24.12.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 12:19:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 13:19:18 -0600
Message-ID: <20261024191920.2149450-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/python3: add sqlite support for the
 host variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Waldemar Brodkorb <wbx@openadk.org>

Add an option to enable the sqlite3 module in host Python. This is
needed by the default cache backend in mypy 2.4.0.

[James: drop the undefined host-sqlite selection and use the correct
--disable-sqlite3 option.]
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python3/Config.in.host | 5 +++++
 package/python3/python3.mk     | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
index 28fc0dbaf8..cfebbd8e8e 100644
--- a/package/python3/Config.in.host
+++ b/package/python3/Config.in.host
@@ -27,4 +27,9 @@ config BR2_PACKAGE_HOST_PYTHON3_SSL
 	help
 	  _ssl module for host Python3.
 
+config BR2_PACKAGE_HOST_PYTHON3_SQLITE
+	bool "sqlite"
+	help
+	  sqlite module for host Python3.
+
 endif
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 1916982dfe..03ce2d1a05 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -18,7 +18,6 @@ PYTHON3_CPE_ID_PRODUCT = python
 
 HOST_PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
-	--disable-sqlite3 \
 	--disable-tk \
 	--with-expat=system \
 	--disable-test-modules \
@@ -73,6 +72,12 @@ HOST_PYTHON3_CONF_ENV += \
 	py_cv_module__ssl=n/a
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SQLITE),y)
+HOST_PYTHON3_DEPENDENCIES += host-sqlite
+else
+HOST_PYTHON3_CONF_OPTS += --disable-sqlite3
+endif
+
 PYTHON3_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_PYTHON3_BERKELEYDB),y)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
