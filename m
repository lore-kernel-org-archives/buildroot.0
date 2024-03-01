Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88947C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 22:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4376440289;
	Fri,  1 Mar 2024 22:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OpGefd04Coah; Fri,  1 Mar 2024 22:00:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65D054050F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65D054050F;
	Fri,  1 Mar 2024 22:00:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29D761BF32C
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 22:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9253140407
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 22:00:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PQgxdUwnAApQ for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 22:00:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 663C840486
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 663C840486
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 663C840486
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 22:00:23 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-412cb0738bdso5957765e9.0
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 14:00:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709330420; x=1709935220;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rL2PyZta+Q/fwnn99isjxe07fls9uegjCGmLiiVMfIU=;
 b=RhvOXOpI22YdVWRbLPIC3eyv4vXZmVvGuUWj87YtjBzjm3ImuEE+EX+TbzDX3THnYW
 tdILZqaXntwECbiHuIiu+QcX2gYg8kva2JUITOXeE9G3+WFRJhbmoubIORGKiVpNMdSL
 OJyPAArIEa0966OMhWmcOR3Mb+l2DirEfzwPwzC6S3WFbCpk/KE+PMB+Jy5ieVbS9JvW
 hbRL+3Uv1+wv/XLTKTyqxv9Sawzri9k5a6yebTj2e5kkYObsgMc6ZKpYlkqS0blBSzl5
 0yiU4x2wC2M44jrU8YZrOySm43aSX2NjNH1pcBWjdAz3qGpc6/1W0OdQQgTIAZDysyX8
 JD0w==
X-Gm-Message-State: AOJu0YyUERy06DiQv434Aqx2pbyTdtfEMuYEf2aZLT+x2nejx48eMZH8
 kNRK07S+LmgRSzziAnnb9z/CETNL+0dgNYCiqUthq+ILQOO5eiOIc2wgRWeW
X-Google-Smtp-Source: AGHT+IEn9Yg7FfY6dyZFSHyh69/VZuo4trISdP9a3UAazW6S45f9dsa72Rznwd3zKMbJVmBB++KE7g==
X-Received: by 2002:a05:600c:354b:b0:412:bca2:1680 with SMTP id
 i11-20020a05600c354b00b00412bca21680mr2364057wmq.35.1709330420208; 
 Fri, 01 Mar 2024 14:00:20 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 v14-20020a05600c470e00b004129ed6f9cbsm6741471wmo.4.2024.03.01.14.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 14:00:19 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 23:00:16 +0100
Message-ID: <20240301220016.427420-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709330420; x=1709935220; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rL2PyZta+Q/fwnn99isjxe07fls9uegjCGmLiiVMfIU=;
 b=GtUUd/DglZQTjxz1qWl6CauPhoTKqsPuWqjG7cUPDz6H+ZCjzixHxqNj77EehDLraC
 Z073kjw94yKd8WAMbZwoyNwxEHgVIYWAHReNFz9Liy8cecfNyBk8HaMzxr2XGUA90rG4
 82ceniRqm+AG4MlYjnm/h1DVi3hkej8ODB1mnNpauvCM6eieX/GwavLDUEkYpJ/bwtqv
 SnafUIvMPcqP6KnSQa7Jv7FzsvgP5IpUAYO/EnbYTXeh0dl09HXBa5YH6Z/6RJPQozPk
 plGs1zUHKPh1vGQcMPIyGmzzoO81QXvzZz6yWnSp7PErCUHKtIBYUhTYAOWZF7Q3qmfH
 O4yg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GtUUd/Dg
Subject: [Buildroot] [PATCH 1/1] package/nginx-naxsi: needs pcre2
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

Commit 722b84eafa5e3d9540e0a80bae0c971a3a778358 forgot to update
nginx-naxsi resulting in the following build failure:

In file included from ../nginx-naxsi-d714f1636ea49a9a9f4f06dba14aee003e970834/naxsi_src/naxsi_runtime.c:7:
../nginx-naxsi-d714f1636ea49a9a9f4f06dba14aee003e970834/naxsi_src/naxsi.h:147:3: error: unknown type name 'ngx_regex_compile_t'
  147 |   ngx_regex_compile_t* target_rx;
      |   ^~~~~~~~~~~~~~~~~~~

Fixes: 722b84eafa5e3d9540e0a80bae0c971a3a778358
 - http://autobuild.buildroot.org/results/87bbcf946ccbd8e3bf1ca9f39464f4bb198c8d42

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nginx-naxsi/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx-naxsi/Config.in b/package/nginx-naxsi/Config.in
index fc2ba9bfe3..d30d653df3 100644
--- a/package/nginx-naxsi/Config.in
+++ b/package/nginx-naxsi/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_NGINX_NAXSI
 	bool "nginx-naxsi"
 	depends on BR2_PACKAGE_NGINX_HTTP
-	# uses pcre, so nginx needs to be built with pcre support
-	select BR2_PACKAGE_PCRE
+	# uses pcre2, so nginx needs to be built with pcre2 support
+	select BR2_PACKAGE_PCRE2
 	help
 	  NAXSI means Nginx Anti XSS & SQL Injection.
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
