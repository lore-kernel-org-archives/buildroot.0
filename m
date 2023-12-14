Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182BAC4332F
	for <buildroot@archiver.kernel.org>; Thu, 14 Dec 2023 19:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A0B882F40;
	Thu, 14 Dec 2023 19:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A0B882F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lavSAo2cl7-5; Thu, 14 Dec 2023 19:26:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B96B83D6A;
	Thu, 14 Dec 2023 19:26:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B96B83D6A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 836871BF3EA
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 19:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69FB283BDD
 for <buildroot@lists.busybox.net>; Thu, 14 Dec 2023 19:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69FB283BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ga7r21FuewMC for <buildroot@lists.busybox.net>;
 Thu, 14 Dec 2023 19:24:51 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FC8483518
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 19:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FC8483518
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7b3b819f8a3so401619839f.1
 for <buildroot@buildroot.org>; Thu, 14 Dec 2023 11:24:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702581890; x=1703186690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PWfaGBcX0VuVKruVhTcIpZ2ToQ6Jjb+qwYe5WjUCBiY=;
 b=bDuej4OlYViaOS3iTHcAethHYuwQkbm4GNcO+sKSgWrj2lg+Uu0UR95T/s9Uyzo2DI
 C0TFa5q8U2afV8nj5J3Bv84H/PXXanUSULyMJdcFZSK9cNj0d54e1zNtItN35ORglZhT
 6Y5vDGrcyo+qAsw5+KsiE3FQnbT+BBcYhLd4oQ5sLbn70ckt3XtkIs/zB/k1E51iuFnm
 OD0YDHRlqDS/KjrIN+iuvfNJzTl23N1Jk4bA5nT6bDKunRjfIk73yjthasETCnd63Us0
 x+/uGRaLYXj5pOvxcIgdQTQTsl+pBZlr6c0WEzpyAIgjWzgGkf8UDMUWVNnw6XoDeR3p
 5u/w==
X-Gm-Message-State: AOJu0YyRzy4z0dmvg+xYjHZFbkAYAw82/+lTsTXQpXK/PsHgB8EAbGBM
 6DX5KtHglvIzH2QWjp+BAX2/RZqHE3/DuQ==
X-Google-Smtp-Source: AGHT+IFusU7FyaFV4AVtqFAnYzr007bZBYHkdP7eGCxhkKCw/Rgf7zIi1r8bLn7ALuS0aezYy4mKkQ==
X-Received: by 2002:a6b:c90b:0:b0:7b7:1307:39f1 with SMTP id
 z11-20020a6bc90b000000b007b7130739f1mr8077488iof.33.1702581889896; 
 Thu, 14 Dec 2023 11:24:49 -0800 (PST)
Received: from james-x399.localdomain (97-118-228-42.hlrn.qwest.net.
 [97.118.228.42]) by smtp.gmail.com with ESMTPSA id
 c16-20020a0290d0000000b00468e80fa254sm1345615jag.148.2023.12.14.11.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 11:24:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Dec 2023 12:24:39 -0700
Message-Id: <20231214192439.259156-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214192439.259156-1-james.hilliard1@gmail.com>
References: <20231214192439.259156-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702581890; x=1703186690; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PWfaGBcX0VuVKruVhTcIpZ2ToQ6Jjb+qwYe5WjUCBiY=;
 b=QpbzXe7gZFGc3JZ6PIRgR+2Shk2D+6yOlpq9LHFVl7WMBZISHCewTassDY7eJORKWP
 AeeYeyY1mBdtjtwXrktCdZOyArJqe7N+DiNSO4yNo8GWz7MIXqaTpVquwhgV7a11Td55
 2OESRp7d1V3ITidzAsHta9bZX8eEL/BcWnPeXJ3IwsnJl0q+1l/vFnPr9Y1HtPBgvqCK
 +VizPQcvsBHcGpc1S5EEUitQnxZdP1Q0BrO2WHLekgScLMy+bm8maN8G1rI7xiHrY68X
 7B05kQ9J2GlWIFhig/349YWtlnUqziTJ2zjQZ3tOQ0N3+cuk9c3oaKYi9EH1wbcLNiI+
 6G6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QpbzXe7g
Subject: [Buildroot] [PATCH 7/7] package/python-grpc-requests: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-grpc-requests/Config.in             | 11 +++++++++++
 .../python-grpc-requests/python-grpc-requests.hash |  5 +++++
 .../python-grpc-requests/python-grpc-requests.mk   | 14 ++++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/python-grpc-requests/Config.in
 create mode 100644 package/python-grpc-requests/python-grpc-requests.hash
 create mode 100644 package/python-grpc-requests/python-grpc-requests.mk

diff --git a/package/Config.in b/package/Config.in
index 4a65104d60..ef3158dc33 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1100,6 +1100,7 @@ menu "External python modules"
 	source "package/python-greenlet/Config.in"
 	source "package/python-grpcio/Config.in"
 	source "package/python-grpcio-reflection/Config.in"
+	source "package/python-grpc-requests/Config.in"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h11/Config.in"
 	source "package/python-h2/Config.in"
diff --git a/package/python-grpc-requests/Config.in b/package/python-grpc-requests/Config.in
new file mode 100644
index 0000000000..3c266e5976
--- /dev/null
+++ b/package/python-grpc-requests/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_GRPC_REQUESTS
+	bool "python-grpc-requests"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
+	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
+	select BR2_PACKAGE_PYTHON_GOOGLE_API_CORE # runtime
+	select BR2_PACKAGE_PYTHON_GRPCIO # runtime
+	select BR2_PACKAGE_PYTHON_GRPCIO_REFLECTION # runtime
+	help
+	  grpc for Humans. grpc reflection support client.
+
+	  https://github.com/wesky93/grpc_requests
diff --git a/package/python-grpc-requests/python-grpc-requests.hash b/package/python-grpc-requests/python-grpc-requests.hash
new file mode 100644
index 0000000000..c816a65b50
--- /dev/null
+++ b/package/python-grpc-requests/python-grpc-requests.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/grpc-requests/json
+md5  39f0d7ef45ab3620d8b63c2408af35b0  grpc_requests-0.1.13.tar.gz
+sha256  30a00493b206156b94be21f641edcbef5ea69fb43daf503390da661123520521  grpc_requests-0.1.13.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-grpc-requests/python-grpc-requests.mk b/package/python-grpc-requests/python-grpc-requests.mk
new file mode 100644
index 0000000000..9ffd73d424
--- /dev/null
+++ b/package/python-grpc-requests/python-grpc-requests.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-grpc-requests
+#
+################################################################################
+
+PYTHON_GRPC_REQUESTS_VERSION = 0.1.13
+PYTHON_GRPC_REQUESTS_SOURCE = grpc_requests-$(PYTHON_GRPC_REQUESTS_VERSION).tar.gz
+PYTHON_GRPC_REQUESTS_SITE = https://files.pythonhosted.org/packages/46/51/8981bce4ca61bce1c7b7a12dd04f6cbd35c4ea874842b06283f6bbc9a0e8
+PYTHON_GRPC_REQUESTS_SETUP_TYPE = setuptools
+PYTHON_GRPC_REQUESTS_LICENSE = Apache-2.0
+PYTHON_GRPC_REQUESTS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
