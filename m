Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75E1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 22:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EE0D60AC6;
	Mon, 31 Jan 2022 22:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1D0B3KsVcfLC; Mon, 31 Jan 2022 22:10:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8FAE60AAD;
	Mon, 31 Jan 2022 22:10:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 71BAB1BF2A3
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 22:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 65B694053D
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 22:10:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TE8TTfX_UScu for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 22:10:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CAD54032E
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 22:10:45 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id c192so11292971wma.4
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 14:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7qiGe0h7voQR9cK6lRvmb5vY+iO4AMiW+noSC+lbXhg=;
 b=MwLP7Rt8nZnLwBRF8mY3fnzPk4OCwn8TW6UcP9UCHrGgj1EBSf/w7PmDHc2us3xWrX
 EvlgyUVdqj+lQcU4WllZvo9+6Z7RIQXtlZlEjrnE4Vak0PtlcIkeMUIMyZ4lruRLr1fz
 v7B+Gl73tOoIiLt+bhbgngmMnOflMdtuuAdd3RNNv2DwQQ/TMWUCkZYc1kTtVmhEOAcn
 q59TAOVz6dqdiO2FpW2Fr3KE1cSDT3gQ/75HmQ+WafhLmk9H0cK351gzUX7qDm9KuAsF
 nUf/c3sD6IpNjvR3fIw3t005szkdUEN7rvYfmQjNTnPH/xtJdmMy0D9I/UtW6OGa55/J
 pWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7qiGe0h7voQR9cK6lRvmb5vY+iO4AMiW+noSC+lbXhg=;
 b=s1VVZfJb/qAEdxz8bMB0/IaaCOIsA/q8nPYZmCp0JjmFd1uz5OEXxGpsEk3DqrwPqk
 wKgXGbPefuJVboxFKtZ0cZ48st+aqWJJT0u361RVjXDmd920OX1WnVvdFm6wQJds6Njb
 UzBwNU6v/lqPQhoC+Jq3HnMX/rKTOmRR3hva8mq/KwjkEjyqLfIQ1q+mWbSITyaihPLn
 WzMJyrgumFOA2Ww00AxMElDJuC3P2UoibqhmivWsMeJL4uAyu2flsDEJNKw4vbSvF8SD
 4iVJxF9TKX9Jk8RqWdshrCK1ej5xzyuED4btRq7g3zqzDHZq+NfURFZsRE21N+eAX4BC
 TiPA==
X-Gm-Message-State: AOAM5314+I0lX4X1KnbDKThhd0eb/KD2+O5WxhvAGvFDncBrKP2Yxjg+
 FWw1VXXmV7Koy3y01/GQa5qhJ3uFEzs=
X-Google-Smtp-Source: ABdhPJwKgB8z322waT9W6/6rtpfQ1TlfqF+2zTgqsc7w9utJnVCwRNFPRxOdxC8ZyD/5ZLy0yo83jA==
X-Received: by 2002:a1c:a709:: with SMTP id q9mr28121114wme.170.1643667043057; 
 Mon, 31 Jan 2022 14:10:43 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id i19sm496460wmq.45.2022.01.31.14.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 14:10:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 23:08:41 +0100
Message-Id: <20220131220841.127708-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libuhttpd: needs MMU
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libuhttpd needs MMU since version 3.13.0 and
https://github.com/zhaojh329/libuhttpd/commit/ffdf7de3a4a1f5a62aa3814ac96e889958a30840
to avoid the following build failure raised since commit
61797c52f5deef2cb67e60cf075ca243078c8855:

/home/buildroot/autobuild/instance-0/output-1/build/libuhttpd-3.14.1/src/cgi.c: In function 'create_cgi':
/home/buildroot/autobuild/instance-0/output-1/build/libuhttpd-3.14.1/src/cgi.c:321:11: error: implicit declaration of function 'fork' [-Werror=implicit-function-declaration]
  321 |     pid = fork();
      |           ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/8d2a79dacf9ac423f7ece51b8c23f3683238312b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libuhttpd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libuhttpd/Config.in b/package/libuhttpd/Config.in
index 9159341d89..52bbd313bc 100644
--- a/package/libuhttpd/Config.in
+++ b/package/libuhttpd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBUHTTPD
 	bool "libuhttpd"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBEV
 	select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL
 	help
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
