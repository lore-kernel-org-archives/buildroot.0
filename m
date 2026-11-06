Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E53606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hasqwr5Q
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EC4A813ED;
	Fri,  6 Nov 2026 21:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zhuA4Rl9wFqW; Fri,  6 Nov 2026 21:14:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3892E81361
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999688;
	b=V2jo/KYRJcP5XvTz0iIVejOVD56UuNn8BrcrzTRHJ2HBpMnh+KJD4HogaDaWAIouUXyq
	 soF9h6aPK6qf2+TR8a7rZcRdL8HVuLmPWKIB6yayNA1GRvANB5ongMKHOO/MwIB9eZAs6
	 eoAZWwXZS4o7fr8xgJ8y1Ca+F4PgJGt2HqlWvnr2jlqBzWYSAbvCU3LXzS34VsFw5o1xE
	 /bndsz9IASBmrO8dx+CzKbgrF49qAJ70fdTQSS/+jxFhEk/bHyMBCf64GUzxUtbb2ODQ4
	 PXjMRb5VVLX/XKZ9vKHJivKrEZOTkksZATlYxKx+xIaAbO5sWNwZzpdxFxsbdh0slbQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999688;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cCegOW3nAbAZ0N5i8Q92iVQCXO4RUd8HDqeqx4n4bXU=;
	b=Q4sWQmHcXRutlw1vDzIvKUnzdkEorsi8rTHmW4VTdNHJdWjOjW18xiii1JTkdNo06mIm
	 H13bZXtlDfSfZePXYSSbwuOuwHOUI8F1tYXDFVuEzuW8RdpCJHelpkAza9tIO9qPX5aX1
	 KRBoXFJvbiQ0i4tKO7okirYyG/zx/OsmQyOqyPvDzZJ/aVGbWIM59G3Ts2T2m44tFn5QC
	 F4Z0INB0UpuQXtasxNjysqHnEItGxYauRg4VwkkTi+54Xsd013byqZtR3rTVprIsM/v0o
	 ylmQFAzC+skVxVUQTKwsf0SidlA7CLHuskWF4UnonE1gF5rJUPXsVQxHaWIVOa8uE4Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999688;
	bh=cCegOW3nAbAZ0N5i8Q92iVQCXO4RUd8HDqeqx4n4bXU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hasqwr5QUo1iWiuoN7RhsAbe0O37SoVMBnRs8nO+WErXNq3LYpRPr9PLFFDZ3jvv4
	 L93NvF2i9cx1AEnpu3JyUmJpzlhZPGVAAY+pxM3xNC/pddDKZdYyufszume32S3DsI
	 F5kniVYSeszoWt4Sv+yrxlBtJWNTzqkLJs91JN77PJqER/EuRDP6MHsLl1HJshFX29
	 VoNJ6oaExXLedYiqlSy6KDw9Lr8tDrREuTOJ77HBP4YEWAukT30UlhBrvEo0Pwhz8a
	 P8CkAZu5cCTyLOkB0kV+4yysEBinLzHlWVMZuTL14eA4LDdNurSXg5hA8snfZAoeuc
	 BeSo5kdanaVzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3892E81361;
	Fri,  6 Nov 2026 21:14:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A128F4B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8808781250
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EwPKYIr-_-rD for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C9A7081281
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9A7081281
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6B2A9ABB8; Fri,  6 Nov 2026 21:12:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f9a8a07482c41b0cb3bc8b302f541f1adc50ed2
X-Git-Newrev: a4727f34237304223f93c145a20cc359e357a05e
X-Patchwork-Hint: ignore
Message-Id: <20261106211248.E6B2A9ABB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ipython: bump to version
 9.18.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a4727f34237304223f93c145a20cc359e357a05e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index 3a5d5fe34d..921e9db6b5 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  05d70129fbbf763d51ad3d61f179926b  ipython-9.18.0.tar.gz
-sha256  93ec98e27d5ce494c962758111c7dff1ef45f9efdd55604ae70a7d4cabb3e1ea  ipython-9.18.0.tar.gz
+md5  ce98d6db5d3019576ff79b47aace5851  ipython-9.18.1.tar.gz
+sha256  6319c0f5372c196397899479e6db1783dd7937abae06815d1317e8d5d51aaaaf  ipython-9.18.1.tar.gz
 # Locally computed sha256 checksums
 sha256  8387aac32433e5b121c355aa9e6ce2b9a399da7edd59ab94b19d4f5326b1ced0  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 716d75d386..c6450f9810 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 9.18.0
+PYTHON_IPYTHON_VERSION = 9.18.1
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/c6/9d/fea7fe7e360b6a4992f00600445849374675d82d665ffc194aee50c314ab
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/38/04/0d945c72d5b77527273ecb4c66aa2436de7a3b3bbe3da345bf053232b886
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
