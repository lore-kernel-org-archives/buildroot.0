Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3CC606A333
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 16:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Wp3e9kta;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GwECU7Pg
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB8EB80EE0;
	Sat, 21 Nov 2026 16:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bR9wPQoZa9pj; Sat, 21 Nov 2026 16:50:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AEBB180EBE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795279846;
	b=HGByb63RLTjwpD4+F3fd0aR5mTnhwc++gdPl3hnOmN/i3k8N1h2aaXmrHcvOOpMCK/bi
	 rOhV8dS/EqyITmSJiKkvxNp4uk2Wc/Yng+A/XncbMqp6E5saK82lRvl7v17/8mh7l60zF
	 Pxlm7qBVMyssXG3HLanJ/LHR9r9puwafQ1oYAeVondUVM8ALf0Lrb2YJp1WQcniroZxhm
	 a21uxtPLI4uedXoAepdmQZJejWHrBgM4LEV55X/dEPbjkwCdwCnnhc4fISu7CctjRjPC3
	 TO8+GUW56qOZKu1qMAmrsHyQY5HUVJm9f8tZhMov5xgSeOI7VUr8bg8Xm/xkhDfhYmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795279846;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=VbTNWu18z7hIyfkmnbzBOvOLkn1xkMxh4gxeTR+4dDo=;
	b=aZurb6bSl5q1Gqc3NNVaYw0mWUe3ODEChbXjccfOr0UUI4aCRfvQc2782S5vAZg3+3bf
	 XS4gVm6Tlchj8BNHxUKSKlsV9jyCgX3/b9lVrpV+gJm20dF8HY49v3GTkgODHgKxTQb9l
	 bFs5gmsjAe4xoXKX51qjSQLrMLBa2r4uxmMXrRPEq15vs3JncO77flfb7KDcMXHZn+lo6
	 vsgmpx8zARMyO9ezWKv6Y1wwYLTqSIRk83y1YhzVgx2fz1BKw9+68LOgrJlNjsq/e3uy0
	 iNpAJxd5CFH6+c5qnPOGJyAmi6fEhP9gKQS5GWKz8m43Ucz1eSNGthkplcbI7bnV3iA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795279846;
	bh=VbTNWu18z7hIyfkmnbzBOvOLkn1xkMxh4gxeTR+4dDo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wp3e9ktaVr2aNFcX5Fb58lXs75V3iwzErV3gNor02pX8M6ldXGU2+zKu++4elSodn
	 VMnhsainQKuELJxxiuTI0dYoVhZRmIp/CIDmiPPcUOrI6PUEnZVzbqwkp2HlkO9ncm
	 KpiTbMR7NwgvHCFQZ16NIVhVZfEVO4SMRlKgjRZQO8EgWfpdflRJR8gjXPeBKNFdxR
	 Jo6PLgwlyawBz5FvQ/KbxFG+Hbm3URQkkoM7dtXa+Ol6Wrv8HrqVEOfSJp5ZrHUMiy
	 R6oseFps0z0QrMLh7hWV6dZ9E3xI4iF6AqhyVly2rX8cp+sAkTSZc1vRtNUa56phtk
	 RKWLZdLh8heWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEBB180EBE;
	Sat, 21 Nov 2026 16:50:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B20715D
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E584D4009D
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:50:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NqCtCT0dBtxR for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 16:50:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B01FA40012
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=GwECU7Pg
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B01FA40012
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:50:42 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48dfc0421d9so1852247f8f.1
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 08:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795279840; x=1795884640; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VqlYmN7EiXaIZjTI+9BlgqWHBOnBUfycHSx5vA/rFq4=;
 b=GwECU7PgMcqNp+uyuJIXxE0+14dGrGcXqAgjkIDI4Jd9m4PjTnOfs4Je3ULck5cuig
 Qoo6GEURrtiptZEfYiB4p3jCEifQwJa1bPJlUzXHzdAqM2lUq0zBzLAQBD2vOHT4u/Xh
 02EN+f/+JtlFOxkr/KsUEJ84MfZMobMQZXp887TRuuXiBjY6DVMS3NYOKrFYIVj1x1b7
 5M27cx+sP/JDNCpG2/ApFzhk2QrfmqNj1QKDRHRkUEuqq2CgAHqlMB3OkupOW/5h7n8C
 F7eujAzy0gQFtCtITOmnEFWHGZBZ5fk7V2L+KPB7WuR4UoGVRLJkzPvzfgrE1B1aUl2e
 WVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795279840; x=1795884640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VqlYmN7EiXaIZjTI+9BlgqWHBOnBUfycHSx5vA/rFq4=;
 b=RwlXU1K7exYPGA3HRXiiVHNB7AKTQGVelYaBnAvvJYoUz9Ndn/ScfRq76uFZWKZ77j
 OB7X6vyWWHRMb1AgQc4RE6MR9I0l1KNazu1GB6PTaVMcFzl3bDKF8O7U2pw2/huxvBAO
 cSsL6rD0hvCoiaSNlaCvsBrVaMZ2UTURG6lSN7VBtzrTee6mwSVxvL7P8A/8cNX0zb1h
 8bX88m0vxHnxPgeg+J/05nRCyiVqrWkleO5K3DgoSW7VhHdN2DDBQw7VjUw8Wby6IeJI
 JXb2kd/BMPQixN6h+TI9G1vswiaJH8cC7cOwpV+hslJHgMa6bLvgY8dZJR3M+d3LCPj7
 0jVg==
X-Gm-Message-State: APuU4Z8uARQz7SvTpkuZg7e3IHCaM6QTSOUz7k6AMkQO/G34iY6M1MAn
 jd6DWXfrsww2J/Ao8xtSicOMHdkKQzMz5/lSAh71fbgJroR33wj3Z8dYDjmB6Q==
X-Gm-Gg: AZFdTZePhFYxFu6XsbHdJWztBQW/xSWeC+TrwR7Ir6/lk/1jsd+FqsPxmiWcYkKCTX1
 sX3o+xSeJec4YDMOvv96Z6RDdpeosWkZYnEeJqxod6ZMQbZ3/J98c1WV/RAC2Roxx7q7Ise37Q+
 bogf6IBKGVCWJr615mnp618BpCBo/sV5bLwwuzNmRYgwCaKqWZFO+Z78V6RSVfgTRNIWPyQqbVY
 su9w3ZlfkZdlTF15HAvDLNba8JZpAj/+/ZbChIAZLLfADlq182bBku0fc8dBcYYX6Oc/GnZZkTV
 lMU2RECtAMwVPmdDoYa642VBvpEsdkCWNOvHShyQL7l9NKn4kSuN+plww8CM48SABPWoPWaDE/g
 HYANgad4YgWiAVa7eRc2zCOlWxpjXxCHQUG4QPUX3wj+rbMsyPnU2ccKtbjr3AcYAbzQeF2EaMD
 izTpYIB+yhPwuUQwnNOBIgS7EojR7SJbiEtVmfsrCscO4HR1lNpP/CmsXV864+dchtWTnGv/uta
 KO8BdXDgR5xOtODotISK5DitpVzf4urWKVcIcSuoX8eD0ZYVr+8UmN1DULrWNxcXA2Axv2RfZHm
 JGYR13o92c9KoTLZm68XqtC7Zss88DXCv3A+TyG64iTa3ryhoBg=
X-Received: by 2002:a05:600c:5493:b0:4a2:8c5:5e5 with SMTP id
 5b1f17b1804b1-4bb8881c734mr151561095e9.7.1795279840003; 
 Sat, 21 Nov 2026 08:50:40 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8d4f9aa8sm140806655e9.4.2026.11.21.08.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 08:50:39 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 21 Nov 2026 17:50:37 +0100
Message-ID: <20261121165037.2913283-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20230919042236.557974-1-james.hilliard1@gmail.com>
References: <20230919042236.557974-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3] package/swupdate: add embedded lua handler
 config option
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: James Hilliard <james.hilliard1@gmail.com>

We are able to configure most swupdate options using a swupdate
config file, however the embedded lua source option may need to point
to a buildroot generated source path.

To simplify configuration of this swupdate option add a buildroot
config option which will pass a source file path to swupdate when
enabled in buildroot. We also need a config option to enable this
feature in swupdate which the source file path config option will
depend on.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v2 -> v3:
  - do not enable CONFIG_HANDLER_IN_LUA: swupdate removed it, and the
    embedded handler now only needs CONFIG_LUA
  - do not enable CONFIG_LUASCRIPTHANDLER: the Lua script handler is
    another feature, not needed by the embedded handler
  - strip the quotes of the source path with qstrip
  - help text: say to use an absolute path, as swupdate looks for a
    relative path in its own source tree
  - rebase on master (swupdate 2026.05.1)

Changes v1 -> v2:
  - pass path via make opts instead of kconfig

Supersedes v2: https://patchwork.buildroot.org/project/buildroot/patch/20230919042236.557974-1-james.hilliard1@gmail.com/

 package/swupdate/Config.in   | 15 +++++++++++++++
 package/swupdate/swupdate.mk | 21 +++++++++++++++------
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 112e53a127..0ad32950ed 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -60,6 +60,21 @@ config BR2_PACKAGE_SWUPDATE_CONFIG
 	  I you wish to use your own modified swupdate configuration
 	  file specify the config file location with this option.
 
+config BR2_PACKAGE_SWUPDATE_EMBEDDED_LUA_HANDLER
+	bool "swupdate embedded lua handler"
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	help
+	  Enable the embedded lua handler.
+
+config BR2_PACKAGE_SWUPDATE_EMBEDDED_LUA_HANDLER_SOURCE
+	string "swupdate embedded lua handler source"
+	depends on BR2_PACKAGE_SWUPDATE_EMBEDDED_LUA_HANDLER
+	help
+	  Path to the Lua handler source file to embed in the
+	  swupdate binary. Use an absolute path, for example in a
+	  br2-external:
+	  $(BR2_EXTERNAL_<NAME>_PATH)/swupdate_handlers.lua
+
 config BR2_PACKAGE_SWUPDATE_USB
 	bool "swupdate usb"
 	depends on BR2_PACKAGE_SYSTEMD
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 2384dea33a..def4248fbd 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -28,6 +28,12 @@ SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)" SKIP_STRIP=y
 # we don't package EFI Boot Guard/libebgenv
 SWUPDATE_MAKE_ENV += HAVE_LIBEBGENV=n
 
+SWUPDATE_MAKE_OPTS = \
+	SWU_VER="$(SWUPDATE_VERSION) (Buildroot $(BR2_VERSION_FULL))" \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	CONFIG_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+	CONFIG_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)"
+
 # swupdate bundles its own version of mongoose (version 6.16)
 
 ifeq ($(BR2_PACKAGE_E2FSPROGS),y)
@@ -103,6 +109,14 @@ define SWUPDATE_SET_LUA_VERSION
 	$(call KCONFIG_SET_OPT,CONFIG_LUAPKG,$(BR2_PACKAGE_PROVIDES_LUAINTERPRETER))
 endef
 SWUPDATE_MAKE_ENV += HAVE_LUA=y
+ifeq ($(BR2_PACKAGE_SWUPDATE_EMBEDDED_LUA_HANDLER),y)
+define SWUPDATE_SET_EMBEDDED_LUA
+	$(call KCONFIG_ENABLE_OPT,CONFIG_LUA)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_EMBEDDED_LUA_HANDLER)
+endef
+SWUPDATE_MAKE_OPTS += \
+	CONFIG_EMBEDDED_LUA_HANDLER_SOURCE="$(call qstrip,$(BR2_PACKAGE_SWUPDATE_EMBEDDED_LUA_HANDLER_SOURCE))"
+endif
 else
 SWUPDATE_MAKE_ENV += HAVE_LUA=n
 endif
@@ -205,14 +219,9 @@ endif
 SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
 SWUPDATE_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
 
-SWUPDATE_MAKE_OPTS = \
-	SWU_VER="$(SWUPDATE_VERSION) (Buildroot $(BR2_VERSION_FULL))" \
-	CROSS_COMPILE="$(TARGET_CROSS)" \
-	CONFIG_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
-	CONFIG_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)"
-
 define SWUPDATE_KCONFIG_FIXUP_CMDS
 	$(SWUPDATE_SET_LUA_VERSION)
+	$(SWUPDATE_SET_EMBEDDED_LUA)
 	$(SWUPDATE_SET_SYSTEMD)
 	$(SWUPDATE_SET_WEBSERVER)
 endef
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
