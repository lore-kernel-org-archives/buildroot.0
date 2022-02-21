Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD34C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 23:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DADB401DD;
	Mon, 21 Feb 2022 23:08:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4mKW9_i7BUco; Mon, 21 Feb 2022 23:08:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 978FE401C0;
	Mon, 21 Feb 2022 23:08:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BB631BF368
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 23:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 599F240183
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 23:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q7TlpxDAI5MS for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 23:07:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 65DBC4011E
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 23:07:57 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so408506wml.0
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 15:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DAAXQNknQ7jqVG/hn74VAW2lUcE6YUJCxdCkLVJkwcE=;
 b=aC5t9Dk7DbGNdi0oR1F+WKvF6KzLUa8/DOLZVbiMqh2eWSuLzF8Sbt2BQOJqNbm5ag
 IUoG1y/1G8lGTA4mSwJcBmQ/3Sf0rniX+6U23SZNP9IaqUfOeVscRxSCtVOHd9SNtUdZ
 5sWth+BY6bHDabCZMXnpNkTIJzJFDTkVA5R/Eg+ZblAcZtTUJUcUWd2+KWM6P9N7zct7
 f828eg4edA5iiFDYUuPuyhrvWqvfd3S7z/QdEHIFo3IDXfTBv7GbYg69yVKe9v9uvrYe
 Hwct784zltEXZXmGZqR4kKFfqwmqf2EWqx6Qn+sliTZbfGBEQ7DwbiJf90a12oeyxjPj
 9rAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DAAXQNknQ7jqVG/hn74VAW2lUcE6YUJCxdCkLVJkwcE=;
 b=c8+HZPWPUA3LlLqdJE4wMNc7SbCG4Ytlx9dXGE76pdgcKHXbbMS2RVKEyzeO6kWcU0
 rj2ZThBCNHJUVYMzfbRGUwcnPlorhj1g36hf39+FrUbZ0UBomKS+CdOm/KweaiJ1rN1+
 ESKASSidrMBp0E3WH8xdOJyfGJsZ3HB5Auuk0gSPDDPOMMyMM5n83fQZpF1s3lzMAkYJ
 7t99T/AuTDvt2G/X2uwer2UJZOr6MGX/M/D/8vG+L1yMNt8TBej7dt3esjGVp6rjEIgc
 wrbyJuf0YFw4ibCLlDXj9oTn9AzIjdlM5bJSkOKqHl2MLt5PCFkDg/yvLVmwqBJsirMd
 uq8w==
X-Gm-Message-State: AOAM531a8e49P0w0SFze6LxXQq8pylgH82PPo2PGeuFr7zFQvR2h8SJl
 +tM4aWyx04u2Iy1v09DbnI32nKBMY2E=
X-Google-Smtp-Source: ABdhPJwCvLns9MYxmmTgDoP011vciAsTq0o4eDGboO5QksWf95gSAhrt4mPaAwimLGb8WUgtLVLJ3g==
X-Received: by 2002:a05:600c:1e22:b0:37c:3653:d471 with SMTP id
 ay34-20020a05600c1e2200b0037c3653d471mr943549wmb.175.1645484875422; 
 Mon, 21 Feb 2022 15:07:55 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id u14sm862811wmq.41.2022.02.21.15.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 15:07:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 00:06:40 +0100
Message-Id: <20220221230640.2203877-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-treq: fix dependencies
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-treq needs TLS support in twisted so select
BR2_PACKAGE_PYTHON_TWISTED_TLS moreover it doesn't depend directly on
service_identity and pyOpenSSL since version 17.3.0 and
https://github.com/twisted/treq/commit/ef2ac7ea2b74774adb9fef7675facc6017bfda89

Finally, python-idna was never a direct dependency of python-treq

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-treq/Config.in | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/python-treq/Config.in b/package/python-treq/Config.in
index f781b37305..7c02a35638 100644
--- a/package/python-treq/Config.in
+++ b/package/python-treq/Config.in
@@ -1,16 +1,13 @@
 config BR2_PACKAGE_PYTHON_TREQ
 	bool "python-treq"
-	# python-pyopenssl -> python-cryptography
+	# twisted TLS -> python-{pyopenssl,service-identity}
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-	# python-idna, python-pyopenssl -> python-cryptography
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
-	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_INCREMENTAL # runtime
-	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
-	select BR2_PACKAGE_PYTHON_SERVICE_IDENTITY # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
+	select BR2_PACKAGE_PYTHON_TWISTED_TLS # runtime
 	help
 	  treq is an HTTP library inspired by requests but written on
 	  top of Twisted's Agents. It provides a simple, higher level
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
