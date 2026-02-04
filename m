Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A51E9D3E3
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 14:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2567B607DF;
	Wed,  4 Feb 2026 14:24:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Ek6Bjm9_dXj; Wed,  4 Feb 2026 14:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3964E60AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770215053;
	bh=sxdpiM8Gx2Vu+xfnEqCywOX77briDiOdeDxcB4NEoIQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=DVPeBLNW5wMeh7KXx+ktNT5yco6sNGhCdFFq9hrnh23Ch0XgW2lesPSRmp2PVrvok
	 5qgD6953LIiHOtfIHteQiJWcrMhTYJdviOxSFkSt0SV4SqCnr/UEELSCp45Z3029Nm
	 7PSm2dqm/YywHjkViaXh8rNDsWeZXa8xJ6ll3hyqUC7Kfj3WOCWRRkGIxgcONvkBn/
	 zNV4a4w0g9xx0UuUQr06zHdxikF0POyY5xddgLJZuKAVpoLOsjSeW4pOYkaOdTd9Pp
	 wX9MN7IApR8ruPlRZVEVyOdS2pVRWW6AIK2l5Jsv0MMM7OpHhr4iZbMpSKnR5RbvBM
	 xhDERjNQ7w+5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3964E60AB4;
	Wed,  4 Feb 2026 14:24:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B151173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:24:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06EF283EDC
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:24:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FBrju9CY8TqT for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 14:24:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.92;
 helo=sender4-pp-o92.zoho.com; envelope-from=kingxukai@zohomail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0CF6B83EB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CF6B83EB2
Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com
 [136.143.188.92])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CF6B83EB2
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 14:24:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770215030; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=T24Jj689Wmi9D9o6uLZiIJ1dSopd3FFF+0Gz1/Fr0+ubJ6O7Zy6htNkCDkTe64PwLKqtP/D1C3GN+PALl5Qv4d/cUcAPqPB8OWf6Q5QdU+LeFN6LFD/YHNdYQ6MWD4HpwNBlmavfK6S9gMQlQG3RUvSrMzseSwh7hbyiv2FO/+I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770215030;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=425NlktjwzqD01dR88IHCsIDDlNYrfMvEK3ltGza3tg=; 
 b=d9NMe4NmywgcD9il1OgcxN8JdNFzsbAqri7S85n0jC6T22j64rcsGdd9qDlVBeBkFR7Cq1Ajcw95/OMPRicj8CboMnJgXb4ZxyzNJKHSFbFYpwpkzpVCnCyzgO7nqvGDwYnlL1ECxVM8vlGZW7rJ7wNQShebT52AWmxQk6WzHLk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=zohomail.com;
 spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
 dmarc=pass header.from=<kingxukai@zohomail.com>
Received: by mx.zohomail.com with SMTPS id 1770215027400613.593595475053;
 Wed, 4 Feb 2026 06:23:47 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 22:23:07 +0800
Message-Id: <20260204142309.506287-5-kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260204142309.506287-1-kingxukai@zohomail.com>
References: <20260204142309.506287-1-kingxukai@zohomail.com>
MIME-Version: 1.0
Feedback-ID: rr0801122720f2b84d76dabb0963a4ca520000ac43ee1a87e31f3ad2a1c94d52bb6b2de55228fd09aa3f9fa1:zu080112271abad3fd21e589611562f3c50000881adeed681f9df49edfed64b77cb89497e65d781ab6171141:rf0801122c966966fa2e5c75c0fda8a2050000ce2cedb3694ccf8b4635ec5136dfd3b8d93a405af78a7ec28a507a59aada:ZohoMail
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1770215030; 
 s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
 bh=425NlktjwzqD01dR88IHCsIDDlNYrfMvEK3ltGza3tg=;
 b=Y3bVo2zcjX4TTx31wkWW1l0ycxUblRamR4Uem91wDTEKiSMEP2N59duv6V8r4QWO
 SHgOSOheTZXrfam8yD44UIHnc3XtSo6tjKbzMs8E7do0vYqPhLpX/nCaEt3WyCZvDCx
 9OZfXvD0XunDJjUkgoCUhhlJ0sPR8aaa0mKqFxjE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=zohomail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=zohomail.com header.i=kingxukai@zohomail.com
 header.a=rsa-sha256 header.s=zm2022 header.b=Y3bVo2zc
Subject: [Buildroot] [v1 4/6] support/testing: add python-cloudpickle tests
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Xukai Wang via buildroot <buildroot@buildroot.org>
Reply-To: Xukai Wang <kingxukai@zohomail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Xukai Wang <kingxukai@zohomail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a basic runtime test for the python-cloudpickle package.
This test verifies the fundamental serialization capabilities of the
library by:
- Importing `cloudpickle`.
- Defining a simple Python function (fibonacci).
- Using `cloudpickle.dumps()` to serialize this function.

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 DEVELOPERS                                           |  2 ++
 .../tests/package/sample_python_cloudpickle.py       |  6 ++++++
 .../testing/tests/package/test_python_cloudpickle.py | 12 ++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 support/testing/tests/package/sample_python_cloudpickle.py
 create mode 100644 support/testing/tests/package/test_python_cloudpickle.py

diff --git a/DEVELOPERS b/DEVELOPERS
index 892738362f..0c220e6a3f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3478,6 +3478,8 @@ N:	Xukai Wang <kingxukai@zohomail.com>
 F:	package/python-cloudpickle/
 F:	package/python-farama-notifications/
 F:	package/python-gymnasium/
+F:	support/testing/tests/package/sample_python_cloudpickle.py
+F:	support/testing/tests/package/test_python_cloudpickle.py
 
 N:	Yair Ben Avraham <yairba@protonmail.com>
 F:	package/casync/
diff --git a/support/testing/tests/package/sample_python_cloudpickle.py b/support/testing/tests/package/sample_python_cloudpickle.py
new file mode 100644
index 0000000000..48f1c64b7f
--- /dev/null
+++ b/support/testing/tests/package/sample_python_cloudpickle.py
@@ -0,0 +1,6 @@
+import cloudpickle
+
+def fibonacci(n):
+        return n if n < 2 else fibonacci(n-1) + fibonacci(n-2)
+
+serialized = cloudpickle.dumps(fibonacci)
diff --git a/support/testing/tests/package/test_python_cloudpickle.py b/support/testing/tests/package/test_python_cloudpickle.py
new file mode 100644
index 0000000000..b28080f02e
--- /dev/null
+++ b/support/testing/tests/package/test_python_cloudpickle.py
@@ -0,0 +1,12 @@
+from tests.package.test_python import TestPythonPackageBase
+
+
+class TestPythonPy3Cloudpickle(TestPythonPackageBase):
+    __test__ = True
+    config = TestPythonPackageBase.config + \
+        """
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_CLOUDPICKLE=y
+        """
+    sample_scripts = ["tests/package/sample_python_cloudpickle.py"]
+    timeout = 20
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
