Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31ACFCAC593
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 17:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC11260E06;
	Tue, 17 Sep 2024 17:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAb5h0EDhYDR; Tue, 17 Sep 2024 17:41:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD3F860E3C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD3F860E3C;
	Tue, 17 Sep 2024 17:41:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DCC91BF35F
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 17:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 290BC4202F
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 17:41:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWXs2mEmDTZf for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 17:41:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E5E9D41975
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5E9D41975
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5E9D41975
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 17:41:06 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-82aa4fd82a4so207255539f.2
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 10:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726594865; x=1727199665;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5GBeTikUwX5dkOFjlQjXwYgeOjWSt2/o0THd8pet3xE=;
 b=wUMBFTA9jpte+WcqB15NRDOFp77uj7U3Mpua3bnYn5l2EVRNvwuVeZ/OBx2z3UP0q7
 JHleAJzWXlb+sr+jt4N8RoeufUYkFlmZLC3RSfS6WM8Q/DWL9XYQrD03PmtcpiiBBmdV
 q6GyCOO1CEEJcfUK8teIa/7bUq99R4IBnAoK0DjxSrai57n3Gnftzd7BypySqfmrfA2G
 MPKhXmh1Vb9WCad4Jf9EtLsxrTosL7/1PnkQPlLpzn40W4hnhMkd9ieNYZU3jGGv+uYm
 QAC1N947Neb/8aD3ugq9aegQEc/gF07fhdW4JoBMnAdNv20MkidG+3ikbLL5lvkUaji3
 5IKQ==
X-Gm-Message-State: AOJu0YzxPtBeLNHdnxP7lZB20Mgj9TJObup1C5qwCQnJCae6DmzAATqA
 5Bl6n6aKDLSTIU4vDBKf1Z8Z2aDFeDUhmmHMGSHzTKn012KpWqA5FU2/Eg==
X-Google-Smtp-Source: AGHT+IHSzSxDryEcPeCk+ZXlpK3oMkgu9zECNgXYkiPmSV+pOxC08m+mBxh6HflAlQwbl8+7r557Eg==
X-Received: by 2002:a05:6602:1551:b0:82c:fd13:271c with SMTP id
 ca18e2360f4ac-82d1f8c8d31mr1891529539f.4.1726594865485; 
 Tue, 17 Sep 2024 10:41:05 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d492694a5sm214970839f.11.2024.09.17.10.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 10:41:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 11:41:03 -0600
Message-Id: <20240917174103.3844806-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726594865; x=1727199665; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5GBeTikUwX5dkOFjlQjXwYgeOjWSt2/o0THd8pet3xE=;
 b=WkOIT/a0VwiKHTBozDrIelYs9l9rwtGiE7Q+wnx+jje4coLmsLsjm9N78O0Hl69EzW
 6X7fXfovKFalI3+vVm1wI3yYePBcxqYZnZTORAhp2QgIgCC4Qt1/7vAcVbNCnl2HL4/g
 cGcAX9ThmXaA0OSFKObDqEnf646H6wel8fe29oynOE+UviKVM4wnzRrQDi7W0JsupxEs
 67Lm8zMyc+38uWbf+TkrZlnAsC1qPfyLKl2EBHHypzhexSXTnHpaxGJUDPCVPLRkLzNn
 E1kiI987WVUwcS6XZlO/uMezc89IF36vebOHRR0RP9sJ3RyCrvMTClU8IH3ncwj+QJKQ
 nAgQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WkOIT/a0
Subject: [Buildroot] [PATCH 1/1] package/python-mwclient: bump to version
 0.11.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mwclient/Config.in            | 1 -
 package/python-mwclient/python-mwclient.hash | 6 +++---
 package/python-mwclient/python-mwclient.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-mwclient/Config.in b/package/python-mwclient/Config.in
index dc93e6c0df..1473793ec9 100644
--- a/package/python-mwclient/Config.in
+++ b/package/python-mwclient/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_MWCLIENT
 	bool "python-mwclient"
 	select BR2_PACKAGE_PYTHON_REQUESTS_OAUTHLIB # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Python client library to interface with the MediaWiki API
 
diff --git a/package/python-mwclient/python-mwclient.hash b/package/python-mwclient/python-mwclient.hash
index 354bd685e4..5f870bb55f 100644
--- a/package/python-mwclient/python-mwclient.hash
+++ b/package/python-mwclient/python-mwclient.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mwclient/json
-md5  148bd36bfaaf591bd9c0076cbf1ed888  mwclient-0.10.1.tar.gz
-sha256  79363dd8d12f5e3b91b92b63152bf9dfef27da786c076a244e1f148c8dd67139  mwclient-0.10.1.tar.gz
-# Locally computed
+md5  791213fdc5d071c8652d81986da9ae6a  mwclient-0.11.0.tar.gz
+sha256  2bb7696f3703243eb33514ab162d7f6076dcedd011be90682936046c5e34fd06  mwclient-0.11.0.tar.gz
+# Locally computed sha256 checksums
 sha256  67689d1fd48a5adba31272eed653c12160dd3abbfe92ab056ac42a155e12e523  LICENSE.md
diff --git a/package/python-mwclient/python-mwclient.mk b/package/python-mwclient/python-mwclient.mk
index 07aa877ed9..60154f6eeb 100644
--- a/package/python-mwclient/python-mwclient.mk
+++ b/package/python-mwclient/python-mwclient.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MWCLIENT_VERSION = 0.10.1
+PYTHON_MWCLIENT_VERSION = 0.11.0
 PYTHON_MWCLIENT_SOURCE = mwclient-$(PYTHON_MWCLIENT_VERSION).tar.gz
-PYTHON_MWCLIENT_SITE = https://files.pythonhosted.org/packages/97/b4/5fc70ad3286a8d8ec4b9ac01acad0f6b00c5a48d4a16b9d3be6519b7eb21
+PYTHON_MWCLIENT_SITE = https://files.pythonhosted.org/packages/5e/b3/0f77b8838a22e99b9cb64aef15fb96a4a8315fe890dbe3bff6f8364e8940
 PYTHON_MWCLIENT_LICENSE = MIT
 PYTHON_MWCLIENT_LICENSE_FILES = LICENSE.md
 PYTHON_MWCLIENT_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
