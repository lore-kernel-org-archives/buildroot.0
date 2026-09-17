Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AAFC982C1
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 08:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D65D80EE1;
	Thu, 17 Sep 2026 08:14:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2pbY4bCaTa4D; Thu, 17 Sep 2026 08:14:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F255980ED8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789632886;
	b=KBkRiUC0SUelRrNvL1mG8Rn1EDopb18fcs30zyLrUCIOsjXIo5v5AFARsrb5FrAuLCXP
	 Ng7mSpGw5iWg7GTB5TaZ6NW5qx6z47qfpNdSQX5Cba+M/nhLzqTZSOzFo0ncrtn3PqI6X
	 kX9XuSSf/M7rTk/NLseW+WvVKHQjssQehB7xUxQWyaJpWpLR3ixevkMeOVtUgIg7P8cKU
	 1JCAnjRg+tv1I5FLC19vB4wLjHYF9uFpTXu1ePoQnDYW0ZcsGcGWSUrr9ZT4Ju9gHMcEQ
	 y6gStKeXoNypYQ3ZH+POL54WJt4QbhRzQA7xFNJMJ8kcT4kSLddPZ3UFklY48XN5QKA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789632886;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Date:Message-ID:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=+JHjYH7ZjhQYA0fhVHHdod+9lhu9UFqqeI8UbaB9hho=;
	b=Vfl4hXuu9rfiNldXfyNjXmWtBzRLWV6aTzmUEf5h29JqHuvN+Z+FLtH8sG75MF1gKS0u
	 oUul4Mk0cMSP/chaTXnijCyVb2Qa9U2kvuFrlcNtOyIpyt9S8fARLQp6XwcKYe9VywmIl
	 5DDMcSuN3mxv9d0In7Y3Je/qifJWh530m5UCSAiwdiW5rrerXDxSGXrg9sa8lYWyeruuE
	 IEGyVbnjHWDBIM/LIjWazt+3I6AIq2rkANw4X/O/yJS+EHT5BzK7k5tJwxBH3j244BnMJ
	 S5RPxLyRppfnmoZCx4sgSCAXT2f0hX0xSQsGjsM8yjyRwxL/x3NYe7WJZDd3vvy69gA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789632886;
	bh=+JHjYH7ZjhQYA0fhVHHdod+9lhu9UFqqeI8UbaB9hho=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=sU9mqwXfIPVkY/7o2iRO3wD8vZFfQ+qDxYwe6a62oYUKSZB7a31AWHS4iW5ct5oo3
	 YlG+OANUXfO6NpD0LwbrLu+STcA704DxAPFO0D/tdtdgPKPjYqI13OUIeJk9mqmvJt
	 xzCy+ellpM5GcdwH4YGeYpRkoOq+DP7L4P1N6W773lPaCdjFlXBSTWQ3zcqcYjXNFG
	 9O8dA9JUNdmwmptjn1vhWJfbhOLgT5BnfmEx0x8SjyFABMHNzc9lpyPxS4WAmhU+SE
	 gQBTV4dxWE0N7BPi4OoXyppkDiTNiWxG7AfA7I9BA2jYFd6N1hQ+D9KS2MqzwTofTI
	 tJHG3SToqux8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F255980ED8;
	Thu, 17 Sep 2026 08:14:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EFAD7224
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0ECE60659
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HMGyvJRFMcOH for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 08:14:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 34AF260623
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2001:67c:2050:102:465::110"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789632884;
 b=cHLP/abqLIpD8PAI559Ky5AyzWnaIhowWoKyCRAwRXynwgH9JfH6SwaUhE2VENdQbF0k
 tYXoMsEY+v/CiNihU3I0fTMY3vrBlNyKvGxwP9ZBRElTZuYY7Mf70GeG4qv2MF5qm2cK4
 35+TcRODy7xQ9f+NYugXLAP/wMKmqZ97gx8aaTiVDa/TTXlrtpp8yDaVmM/u1qj8FDsyn
 861CRIgWPWbKtFZTkfDDoOeoZLmKkjiMA1LnlZz62UEFtTl2RxAe4j/zvliqyA0lk8ySl
 R02Lgd1mGGofIfYUOYvQyhK0ajoxmhoH/4O55+VpWuJ4fgbcWpTDKjvkMWMIY/zQ09g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789632884;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:MIME-Version:Content-Transfer-Encoding;
 bh=bfOSTOQmue5drvpcA64nu814e9p4lRHqoHbLhNiuT+s=;
 b=P7g2mgbbidzKjGlvcMAupzFOiPeLXsoMixwN/dgIsv92l4AOWqvssLUaV1WwxD/SY/J8
 bZfBpsEeQ/jsmxjvDWM3cfo7D7MOsPIQPFQ+hWnn1uhD3jhlP9raQfvqzLwZyOVK0rIQE
 NG9nNSSgVnS76RODHk37h1somU0BF3sitHz+hhdARbE5PLjafa9MqMLsFLAQZexHeRHCr
 JNikmbtrghodD2CSIbfJuOZ4xFuWshGxuO6/oUMTyZ+aDh9dVxH4Nguu1SB+z/5KZSyo9
 a+2pwe983Y7ps1onaKjvUUc0DIklWe0VD4HMWaBHWGpGd53p7TW8kNJEjBBXr6ba1Pw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=oss.othermo.de; 
 dkim=pass header.d=oss.othermo.de header.i=@oss.othermo.de header.a=rsa-sha256
 header.s=MBO0001 header.b=hvp5Ww9S; 
 arc=none smtp.remote-ip="2001:67c:2050:102:465::110"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:67c:2050:102:465::110; helo=mout-b-110.mailbox.org;
 envelope-from=manuel.diener@oss.othermo.de; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=oss.othermo.de
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=oss.othermo.de header.i=@oss.othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=hvp5Ww9S
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org
 [IPv6:2001:67c:2050:102:465::110])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 34AF260623
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:14:42 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4hlpSt6x7mzNlrb;
 Thu, 17 Sep 2026 10:14:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oss.othermo.de;
 s=MBO0001; t=1789632879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=bfOSTOQmue5drvpcA64nu814e9p4lRHqoHbLhNiuT+s=;
 b=hvp5Ww9SOSwlwFujyyGtsc5Hh9VNvuzIva40mO6cWIBCjNpNWRLfV4otcSscjsgOPp3g+t
 chNcswKn3Ewk6WYA05FCcldITQmxxJDTmyU0Eyg86vhCJCH7+zZvZEU51oJuEjW1vANCmt
 6DAvbT/0NxuG6wtw4PqU59Aogogskwnz2GjAOVBNWaDw4hURT4Rjrj07VcMWNh4EiB+kuT
 jTT8mSMhKWUqlWSc2Al2cm86MehZiOSgL1QdzveF6Cz4X0SaBGgGeSRfIOfo2XkStf2lsV
 DR9Vl2P6CvbTq76hfKI66OxTorY7cTS0RVzhKHGnWDnakLYTnwBpfvCiqfAZdQ==
From: Manuel Diener <manuel.diener@oss.othermo.de>
To: buildroot@buildroot.org
Date: Thu, 17 Sep 2026 10:14:11 +0200
Message-ID: <20260917081411.697438-1-manuel.diener@oss.othermo.de>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-annotated-doc: bump to 0.0.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

See the release notes here:
https://github.com/fastapi/annotated-doc/releases/tag/0.0.5

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
---
 package/python-annotated-doc/python-annotated-doc.hash | 4 ++--
 package/python-annotated-doc/python-annotated-doc.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-annotated-doc/python-annotated-doc.hash b/package/python-annotated-doc/python-annotated-doc.hash
index 8ffdae9b5d..5eee275743 100644
--- a/package/python-annotated-doc/python-annotated-doc.hash
+++ b/package/python-annotated-doc/python-annotated-doc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/annotated-doc/json
-md5  825f2ecff1f182cd942ea09907ebafdb  annotated_doc-0.0.4.tar.gz
-sha256  fbcda96e87e9c92ad167c2e53839e57503ecfda18804ea28102353485033faa4  annotated_doc-0.0.4.tar.gz
+md5  bc5f2360d5687f8e822115c8a7ccfa12  annotated_doc-0.0.5.tar.gz
+sha256  c7e58ce09192557605d8bbd92836d7e1d520ac9580096042c0bfd197efacf1bb  annotated_doc-0.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  fff170779a6acbf65abdb405c087f1cee1786691e4a96a4034517e4a504a0cdf  LICENSE
diff --git a/package/python-annotated-doc/python-annotated-doc.mk b/package/python-annotated-doc/python-annotated-doc.mk
index 2186601a8c..6671db2f1a 100644
--- a/package/python-annotated-doc/python-annotated-doc.mk
+++ b/package/python-annotated-doc/python-annotated-doc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANNOTATED_DOC_VERSION = 0.0.4
+PYTHON_ANNOTATED_DOC_VERSION = 0.0.5
 PYTHON_ANNOTATED_DOC_SOURCE = annotated_doc-$(PYTHON_ANNOTATED_DOC_VERSION).tar.gz
-PYTHON_ANNOTATED_DOC_SITE = https://files.pythonhosted.org/packages/57/ba/046ceea27344560984e26a590f90bc7f4a75b06701f653222458922b558c
+PYTHON_ANNOTATED_DOC_SITE = https://files.pythonhosted.org/packages/5a/8e/38aa427ed5402449e226975b649c5dc73ccadfefeb95e6aecb8f8ea4b6b6
 PYTHON_ANNOTATED_DOC_SETUP_TYPE = pep517
 PYTHON_ANNOTATED_DOC_LICENSE = MIT
 PYTHON_ANNOTATED_DOC_LICENSE_FILES = LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
