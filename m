Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B813C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3702582141;
	Tue, 13 Feb 2024 21:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nKQEbs9tm05a; Tue, 13 Feb 2024 21:15:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35BA582143
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35BA582143;
	Tue, 13 Feb 2024 21:15:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80BD81BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69F0A407DD
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bTVDXlfoQDuJ for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D8A5407A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D8A5407A8
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D8A5407A8
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:28 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7bfd0e99154so215210939f.1
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858926; x=1708463726;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u4SMY3qP9ScLd/bQ35z79Uggu1NKXadaIXh+ia45aCM=;
 b=ZtfDUnqTEWM+zVEj9LfAt3ySYJy5mkNq0RvaGHVy/nzNhWaX++WX9x225yT+nltHTr
 mUspiStKkG0ab3Z0Ia9rA0VkC/bb9/Jv5rYK/0GpEqXsSoxk8PmkspxZE5ZBYYT+6Yjt
 cAuCYZVfQVRfzDSwP4gcGmFAWmADTyXzWpos/U1xq6cUsZEaPanoMUejub38dbr5wyyO
 i2c6e6JfufaDqnxZtgkOD8f7anoEUhNZJF13Etf8qjRMCuoo+jmzVqgaFs5U59GRhgif
 SxPyOY4VBYerE501CUjVtl4sqB4tCHGoOL4twAeNcty9oSP4lQQft4KBL3VF2/o21yIH
 jCJA==
X-Gm-Message-State: AOJu0Yy5VgGs1wGDrdhDl3BGKqMYd5UDF10Yf7VaGipU/3qGXy+p1mjG
 mIJt5Hn9P6lUNkn+RFdPySV6zwjwykbkHK7V/k3vRToNxrXaON5O9N6gfG+Zd1UpVA==
X-Google-Smtp-Source: AGHT+IFb+bpWfV0p8EwLohN7E1kLFmgyfOw8alLHcAOyoEczt+FELCxlE22W1imppp2//P/CI862pQ==
X-Received: by 2002:a5e:c012:0:b0:7c4:80f9:8808 with SMTP id
 u18-20020a5ec012000000b007c480f98808mr581239iol.8.1707858926559; 
 Tue, 13 Feb 2024 13:15:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWXM/CUim0zUCitmxGdU0+UNY7Tyrfv1N5ux90h5kgkxAjiPt0vESRdnN8UIzM3Xe59yq584/tBUBSyxZpJVooOeEAExkI4qAQRl9b7XRkJ8YrZQnj2ziS6XTgDo7TUH7Pooq4RPWuXvqJg5wehr5IWbjI/ltNtQFeQAJYl4sVMHYv6RS0AmzM1Ad13X1lFjd3dhdKNaoHq5wwKaPRJdaFSOSuZgfgMlHln2rFWhxEf6vQT4U/Mj4u3PKYnwPAicuKoK6OyPmuLxgNRXkw1ANku5QR1SLBriJ+TFC1uwoodJV7P+iOCd3EyzfSvF7c7jGEyA6Xnkp0x+/EUHAF7jE2qYCuG7zqnD5dgnlth54GttgZWJzOZaLfIcMt0a0nwf2PGdKuqAcmUjaZNBVjBAMUwY2kw0h+NgYh5H0InOcWARqr26ehVN51mE0HOFb2g6frfiMhGd2Av2DQyviAs5xlNpsgQC3KaxqzvO3YkqyUfUY9gxyVUW9g9ZgOP78UJz4NkoPUYyLwNmYqDEKJaBrQTx3I8Z6rb/nBof/qqWc2sZCNEUG7cT50lFWxcPRf5bYatYRyJyF2TgIyoAAPwatL4Br1OjrdIHd+zVDLuNugQhS64kHw2xuEGYDWjh3jdk9bfKzrITM2QnOwNRIJ+8nHRqIvix87IMuWlMqKRsC/pAi8bqVPeDxHWwbU0i/GTSX2PEz5UiISlB6/nsuUbA912SwByFB6gm5qyYT0fjSA8MfCbKSwvLA==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:14:47 -0700
Message-Id: <20240213211512.3918044-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858926; x=1708463726; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u4SMY3qP9ScLd/bQ35z79Uggu1NKXadaIXh+ia45aCM=;
 b=LpwS/iSkrMa2v+4NM7P6ts5BGFhEOrxwprcuFATap+QaVqxqmJilUkTIuKXecF3/nH
 6G9MDQj4RYY0aCYH2K5ZejQ6PdCCuHybToNW2hLQvkV548X5TyPsQ2IEg5gtMdZpIIlq
 H4P6g0c5PLK9A4jd0QHegfAvoWYlXQXt5OVjoCzT7caqF3Sjh5RIqpzhzHbyO8EM8tyD
 YPmwZ2d7qKMsukii+5vDCAebg4ZOaXtgxggfuP55FRfRU4eZMm2OyOoLxJOQ4ZblMKts
 cfp97G+QHeudlrkOaYDu7KriKAYoIdoq7WKqXVwUT3qrEQJ5zMjAC2T7ZdDXWsRyZfwq
 tn9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LpwS/iSk
Subject: [Buildroot] [PATCH v8 01/26] package/python-poetry-core: new host
 package
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - update to 1.7.0
  - drop patch which is now upstream
---
 package/python-poetry-core/python-poetry-core.hash |  5 +++++
 package/python-poetry-core/python-poetry-core.mk   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-poetry-core/python-poetry-core.hash
 create mode 100644 package/python-poetry-core/python-poetry-core.mk

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
new file mode 100644
index 0000000000..c6b180c852
--- /dev/null
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/poetry-core/json
+md5  7461547cac0e0e9c8cd7463aa87e7470  poetry_core-1.7.0.tar.gz
+sha256  8f679b83bd9c820082637beca1204124d5d2a786e4818da47ec8acefd0353b74  poetry_core-1.7.0.tar.gz
+# Locally computed sha256 checksums
+sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
new file mode 100644
index 0000000000..4ca587b11d
--- /dev/null
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-poetry-core
+#
+################################################################################
+
+PYTHON_POETRY_CORE_VERSION = 1.7.0
+PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/cb/1c/af7f886e723b2dfbaea9b8a739153f227b386dd856cf956f9fd0ed0a502b
+PYTHON_POETRY_CORE_SETUP_TYPE = pep517
+PYTHON_POETRY_CORE_LICENSE = MIT
+PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
