Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6E4C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0AC360B05;
	Tue, 17 May 2022 20:43:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oC03bXDkOaAw; Tue, 17 May 2022 20:43:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F307160BAC;
	Tue, 17 May 2022 20:43:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2FEA1BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B176B60AE9
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e5uOGLfIio3Z for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:43:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D066760A9C
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:43:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r23so10234350wrr.2
 for <buildroot@buildroot.org>; Tue, 17 May 2022 13:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qD+g32YRUxrn8zGi3tnJPfGD9HTCL0rTxgoVprGqkrQ=;
 b=f5tBTNSnxzmNdNV9pi8Mg0z9b3pXDN2yxcyKAaDQjfCkjzG9P6XpX3XWwUbL7te/iw
 0/DJynUIQKfBwg+CZmy08CFq5L57tiTRrH1qvvrYyprlH1iBfmTkZJ83mTviuUWcIPlK
 snS8uu7kgc3sYJbdGo73P0S0bkHYiVCDibG3O6epB/Ed1AHXknMnRCLm+Pts+VcXCGcr
 B8lL6UzhoRL+ZksyW97wBWOAjXCFYa1rO5z+e+5Wec/Q5kaai1BDXD8A5oHQT/7QWFSK
 xACcveJhBLx4L14M+Tx8vluvSi4xHSGLDb7zBMwMVMcdk6NsRrs/oLvlo7rPc37tiCsf
 R1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qD+g32YRUxrn8zGi3tnJPfGD9HTCL0rTxgoVprGqkrQ=;
 b=UibkomWCicF+78tQntzV5oEaV1ktqp2ZjdHC8aRARUX4KHaVUgiJQAorhgg0lfROQu
 rBX/obCeuHpRsvD5oFOCOg8UHi++Rpjjur/Cz1wcLEG7v1lPXCIHgl3XFlLif/++q1qF
 BlqPPgZBqfWrGOKEyB7d0kQ8puL1m74xjL47+O+JHZGzFTPBuEtgN05BfEGUV0QjKZqN
 MZ3QVMZXny9sTCtzZ58qTIZWhuyvapvoieMKCcaaoJul9wqRa6cotQnffa3+Uk/AOABV
 1urwXEZNAtxvxXhKHHFvqzMzPmynk4tF1fULT0eKfmCIJEXYAo+IrsAyhf6xOiuuJ6oM
 Jt9A==
X-Gm-Message-State: AOAM533DCBArWBH07lqwDKx7mYwnqqBeYpLDr7Fuc1mYPqmX8gBhPzCI
 czI916rh1xOuExbc+J/RmEadrRmBv6I=
X-Google-Smtp-Source: ABdhPJzjMXQ56fBqwxlZUTvxDVudyB7RIQzYOulfGeRempdEhaIS282dta3ufyE0LBQZ+70LWWTwFg==
X-Received: by 2002:a05:6000:1a89:b0:20c:613f:da94 with SMTP id
 f9-20020a0560001a8900b0020c613fda94mr19889841wry.356.1652820200132; 
 Tue, 17 May 2022 13:43:20 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a05600c21c100b003942a244ee6sm63915wmj.43.2022.05.17.13.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 13:43:19 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 22:43:17 +0200
Message-Id: <20220517204317.198644-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-service-identity: add missing
 python-six runtime dependency
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-service-identity 21.1.0 release requires python-six at runtime [1].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2459841098

[1] https://github.com/pyca/service-identity/commit/705f4af829adf4d1b6e44250d8039635a73199d5

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/python-service-identity/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index d6ca060562..09ebd97a65 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
 	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Service identity verification for pyOpenSSL.
 
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
