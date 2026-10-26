Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B60606A31B
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AF3EWMy2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BC8GeJ3n
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 130154061D;
	Mon, 26 Oct 2026 09:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSvyNe5Q17B2; Mon, 26 Oct 2026 09:43:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 29D3140623
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793007783;
	b=RVqRyzASpGUotu5Tk2PrC8conQ2Qs3/eItnOwBHtmDWx7xdbHjaEwMDf7AdigHte5lrt
	 QnevogeEsmK5OebLHRTNSu5eIBk4L+3XSho3kPo5XA22eo3gikOvWJDsMYOhBzCznrJaJ
	 /egoHEpYGnRHlzEnr8O8H5u+c9XEvD95LLRJ46HtsYmtL5T1ZkRI76Z0LD05lThUHy78r
	 v6Ssna9F5uH6lCvS27LVekP3PJ/nWsAgdq8TDdNawy+xNefEh0+f4qNTYi+sbd88Z61FN
	 wYI7KE6fe92U+z+RMq+jjtneuqF0XWqRR2LAtgMVmcbY8vjBZYc9mbMTFnCNZkjisTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793007783;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jPlmM9CQe7uWSfJsUtM6LtVcg99Vvnrpj2p3IKrnO3s=;
	b=RbZ6xQhzZxacQa1T9y3KQIJ/T+9UiDqGVv7NYVcnJw8auJ+JuUBNPRVJaTZscjDqQs91
	 80HNA3tW33a9gIpLwvEVTWtw0QSi4kzZN4fJjO0MypF8bFjeLPvP7ir9QNyfPNYTnQul/
	 163KM91bN1eRh37/2plufi19MmH2PLzGQPsBT3Uc7wy2BjlgQbRGf4zRUVTVmcABS1/Pe
	 eqVbpi3hZ+2fW+Ikr8TSR+7LRgC7WCTYkoHT7GdJg+EqKYNc7g5MX1pLzSFvBjXkzutuC
	 xgSKytvY9NqqsIrk1AtnivDtXOJSIbkLDcFnQrpfybJlY8P0/IudzWTb7uA9P7JK0YQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793007783;
	bh=jPlmM9CQe7uWSfJsUtM6LtVcg99Vvnrpj2p3IKrnO3s=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AF3EWMy2PY9KRfgfZHEbFob5s/GQTHxlYDUANTJiorsyZyQalGdNE6SuAWwroXrTS
	 w9AW4sgmTwbJZDr70XfbYEgk0gRqA/Ejn6mNQplf0yDRkcRsp0pwrQUesjPx3xjDfY
	 B28285lVM/oRu/sEV4n3925FPKqx5cRToMfvmEG1FT7S6sBojOVN200vt3IGtcDhAB
	 DHRnB0XBI4Zf4Ybg1O6mXOk2WADENXzxxbEW3ZuQCpAEDfxVlzE5AuOZQkT/YqfZou
	 Z8KMXrmA+Pq+QnwatyXD9wmHpyPd9ryJ3pHnjqWUPrw8eLEe7pbWRhib9VRcQajfH4
	 QCrN9hEvCGLkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29D3140623;
	Mon, 26 Oct 2026 09:43:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FBA0356
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 09:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85A9E80DE9
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 09:43:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c6TQPWTIatUc for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 09:43:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 74DDA80DA4
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793007780;
 b=COrayjNpJlq/8ebnLOmgXjFzId7y9MVRm8mVB9Qax7pV1H+wxOu5/9FlApQ2xp65Tzmj
 G/b4ntVu6A6PAxPvw/s5GBeAOHD1L4E1bG0XjGyuSF0bq+BmkbiIonlyGudjZBesU2Pym
 hJCZ62VSMKZoqyVUlaF5qx4irLfQx7AZUWDOz7GCy2J/1/jOUYBn0Lw6GyMp6BROp4JKV
 HdF13zOhwZqplJhu+pBpUraRYvJnfbtDoWHA0qPcVz5OZbDGB8xUcPJOs4Tivp/rP5X0a
 LshOz6cxzeAisUOSWDosjbnBhKzj+Z5wR4qAPRrNS4YxaOD3/1sWFq719oI7kF9G3Jg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793007780;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=sA0lQB9xBL/dgmWXWTY7oeZG13QHCcQwPS+MxvqM8tI=;
 b=ksD+CBz3pkdd+VTQHmZ6szC716E9J1KdmHJu17ONjGgi7cSdEoUpIx1QJ8pnQoNnsFVY
 yhEIZpnRNGIZXyWiC9cW+tt1yAMcBtq1cs35pQ+dTURUiA5tiUMQqSBrdBM40SEcmV41c
 IpDjJq2XJPDjMP49CUQ+kQILZXsMiYOa4k4cCesUXQ3pfYvy5Hu6YImfBNa/k6GP5pbHF
 3h1RFVP90TelXOPJVPFLfcJNKSAkWUGtxtl0HvUkx53T7wF0DeR2or9dJLpNpHNxe6bNU
 3QMPznuEkR9dackhgJX/yiFnix6tb6xP8vZafPMZBMA1IlNVjCSMPezsiTfe4h74IeA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=BC8GeJ3n; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=BC8GeJ3n
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74DDA80DA4
 for <buildroot@busybox.net>; Mon, 26 Oct 2026 09:43:00 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a4dc547987so4391855e9.0
 for <buildroot@busybox.net>; Mon, 26 Oct 2026 02:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793007778; x=1793612578; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=sA0lQB9xBL/dgmWXWTY7oeZG13QHCcQwPS+MxvqM8tI=;
 b=BC8GeJ3nz/CT7bAPcaQmNH0hLbyXj4lyHf8INZTqia2ugqimByZdEMUrM9LWVydk/T
 exYmYXMYs+IMiDpV2WkES7jlX+JlyCnzq9ONX3jzQi+4ecEPTAi5io94u+mZ7n0pT5FR
 +uanYcodkl0KdStowMuvyH54N+KZZOOI3w77pgziEFxWkqnTlKKWX0tEk+kaCPKv+ZNs
 XcLHTLvBIYxwqOBi3ER81GagedmuAKZ7Qq93HbqWllLhaeMNe2vxhhNtUlLvkXVJEoS0
 cYCAwFJ0csVa8htitbNBQMAiBOme4WY744YzK/wkDhn5w1dmAfpuLljrSoQOszPGKNl+
 WDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793007778; x=1793612578;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sA0lQB9xBL/dgmWXWTY7oeZG13QHCcQwPS+MxvqM8tI=;
 b=t+zqx8u3uGoAieBXNz7Y8Hv5Vz6u9IUsLhmR96cZFuddSYgHd69gd+hDWBip4au3tl
 m+8JtoD3hW3ATeRzI2jpR9hpXOSqS0Hemr7BFJryuujz2+1hzGk0RxPYewNY4KZZCvNj
 J3rkwmnvpeGqY19gEHNpWJd+NSbR6BHf3lus5YaN6AgpJZluyKsTTi/wn9d5sDITwPYB
 HU2WFv5aLpn5t997X4TKgjlmw0rDokuwgK4YAlvMs9dnANFgenOoKTByIGPb/EF5tEHB
 EzMjjOXNeJTYwvBZg1zMUPU3Fq+Sd1BcZ0fSlxN86u9f9lZxSGkN6jw2JH90k5rkxzOI
 Drvw==
X-Gm-Message-State: AFq9FYJ9egiwLYcxF8FHDPa79myYjqgDpj+qEx/KOAPX3FPcxnJw53Se
 9GPmw4vJfYSgd6fNxevxIhiZU5fAsd7cHYDKFu7/MeQxAFHiC7hP82QAngLu6g==
X-Gm-Gg: AYBFou3906Q+0HlhzyNL3jGYb24fyp5/YC0v6ZiTJgIySTGJpdZjyEc1cASwgEOiQm9
 ZI5SDfSGzw5YEXaj8p9G4JuClIfPmueZ4Ep9wTdcbs9yZuvStAqYHSbSZ8GXckXVbRm+3R60mHF
 VJCLZ91W5afeGe1UCdyonPZLVLwB6MKBAI23pzJ+5Mqcls8r4L9FWtx+h2IWqgnZjMuEkYghEOR
 8++5Ili596OBaKPqZSNasuMfU2XWyOZNALNYrRE7hGmx6y87qAw3f74i+KwTr7dyRuTk2drUxl6
 9sgIJlVYv8Mt8qxBvVjksRv9hM0Ayiktk4uEaWGSshlu9rmAm4HyR+zPY/qs5aWq+lRYxdGIDkt
 uFYG1Yob+2CwCDdc9byhFWvFIwLECDd17zGnV3yElxyOcO0i8fRfRTrTw2Y7KhZA4I9ZvgvqyMT
 L3Xt7OhMDGxeAimFJbQW8QV7r+A6I+N28lGlip/a8B7S1xwkP4iOS+v56wNERogPrR0wWhfociJ
 5HTC/s+LRTOAjQ2CK++k6JW4Tp48qayFUipkMaUF4Xp1VMTSBIC4G302cHJIgsTr+pdWpptgSaW
 cfqDFLOybvb0/5GXPkOaeYGLFAC8NdO0
X-Received: by 2002:a05:600c:1c1b:b0:4a2:1a:a116 with SMTP id
 5b1f17b1804b1-4a35aae5c48mr123388485e9.0.1793007777914; 
 Mon, 26 Oct 2026 02:42:57 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a55e9aasm185274535e9.5.2026.10.26.02.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 02:42:57 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon, 26 Oct 2026 10:15:28 +0100
Message-ID: <20261026091528.278350-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lua-lyaml: bump to version 6.2.10
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

for changelog, see:
https://github.com/gvvaughan/lyaml/releases

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/lua-lyaml/Config.in      | 2 +-
 package/lua-lyaml/lua-lyaml.hash | 2 +-
 package/lua-lyaml/lua-lyaml.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-lyaml/Config.in b/package/lua-lyaml/Config.in
index ef2d3823d..c13c0118e 100644
--- a/package/lua-lyaml/Config.in
+++ b/package/lua-lyaml/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_LUA_LYAML
 	  converting between `%YAML 1.1` and Lua tables, with a
 	  flexible Lua language API to load and save YAML documents.
 
-	  http://github.com/gvvaughan/lyaml
+	  https://github.com/gvvaughan/lyaml
diff --git a/package/lua-lyaml/lua-lyaml.hash b/package/lua-lyaml/lua-lyaml.hash
index 49c98d980..d36191e1e 100644
--- a/package/lua-lyaml/lua-lyaml.hash
+++ b/package/lua-lyaml/lua-lyaml.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  515e81d21903c1e428b017f2fe9dffa4e29ae9881b0d49ddbe6ba625e3164fe3  lua-lyaml-6.2.9.tar.gz
+sha256  ff2ae6c2c25941e44cd5bfd0fdc837f70c077571539e27fdf61443c5e6654de7  lua-lyaml-6.2.10.tar.gz
 sha256  30847a6989db6d5aeee177099fbaa1aaba793a0e5359ab0dafe1582eefb5a028  LICENSE
diff --git a/package/lua-lyaml/lua-lyaml.mk b/package/lua-lyaml/lua-lyaml.mk
index 965060dd6..e591c1cc9 100644
--- a/package/lua-lyaml/lua-lyaml.mk
+++ b/package/lua-lyaml/lua-lyaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LYAML_VERSION = 6.2.9
+LUA_LYAML_VERSION = 6.2.10
 LUA_LYAML_NAME_UPSTREAM = lyaml
 LUA_LYAML_SITE = $(call github,gvvaughan,$(LUA_LYAML_NAME_UPSTREAM),v$(LUA_LYAML_VERSION))
 LUA_LYAML_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
