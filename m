Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0767606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rOJJz+AB
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 799A060A52;
	Fri,  6 Nov 2026 21:14:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzI-_9oL1qn8; Fri,  6 Nov 2026 21:14:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8C0B860A6C
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999689;
	b=W8hJ9Sp+9tHWadUcklEeoMR/uCc/qaD5J4ayt8tOo9xTyxy5m8zRnl82+BDd9bp+Ahr6
	 SfZLHC1wHTOKL1JejmyiJtvN83iHojHANQjAWJ2HiAHIkmb/ApUPR1He7E2TpNeetYjQS
	 7Ao27PRYXbfWCEZRgmDyDvMfrDqeQpMwtgsJAq84Y38Zd1iV+MVy91RKgmgtaRJKA2xup
	 arftXPhSVNogqUCSt+cmG6aDwPhJMnaZV3wa4LeDSYcXLUFkE5ayfQnYwtIK6X3IYovNS
	 ZtuBP0oWjXjP1TN4OiQ4dU8PMm49mLoihi2sWkCM/BH1ZF38IcRaFYDRnSxHw7LrhyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999689;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bTza7+yj+wHIMCR8UaBhBIY+8I8ZYtTnLHIAOQj8hYs=;
	b=ApofMulY/JdAKyHkOkEAR4ChzpHvZxJPF/KfMuIVV0fzziXtt5+7Ich+8sD+jNEnBA88
	 OsIihdGWR90fZySJB9KB56PaiECCeqEgmRBc/mJv1ICb4BS3jcRY3TwlrYwh5kpJFi+Jr
	 nlm0QsF4kjEnXkW/Xz4f7rGq0izlmogMSKnH/umLOgMLbvEhvA22z/qYiUOyv20agPisd
	 lJlZhKyrufwq5nXMrljmBo6rorpB7wFzr++JqPbnM4BIFD67uK2IaZvU0VTQw3SPkXoia
	 Ro4pX1MiWF46FWbqY77jHxRdf5ukg6jmiCUc9aACtn6XrdYo3x+khWGzXT//IzU+aVg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999689;
	bh=bTza7+yj+wHIMCR8UaBhBIY+8I8ZYtTnLHIAOQj8hYs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rOJJz+ABh6+2Znu0P4X9Sqvg7tJ2bDEr8+FX9RjeLnfTOPDyfQBb2KNe69RtWBJ/H
	 SS4drHavm5U6pJ/YdQQTUYx++PzHvgsxvYXO6hsEUonxgEQXd2TzDgraTEpZxQnccE
	 we4b9nxIlu6qmbWaJT+deVd4Q7/rdQUXIPHp+jr8cmkvtXu99kSZs6i1k+PNf4uxgJ
	 KaQFlR5cCYKm+eCHXlMip4uQxNjtNCUzNY5zqzgrjQaRF9QudF0uHvcwRFUFfx9DOS
	 NYGaPNEQx1dkwenTpLj0pIrIhkc1p7IaXvzJqz69Aknh0u8ggSb2q8E2aIZYinSnPN
	 AWzaBG0G4qWoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C0B860A6C;
	Fri,  6 Nov 2026 21:14:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB806A64
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A195981281
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zoW7x56XXw-x for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EABAA81285
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EABAA81285
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 134FF9DCF5; Fri,  6 Nov 2026 21:12:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b6685ef8b86098c03648f7c4163d7fadd5cfab60
X-Git-Newrev: 6f98ccebe5e2b54f6251284f95afa277158ef732
X-Patchwork-Hint: ignore
Message-Id: <20261106211249.134FF9DCF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pip: bump to version 26.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6f98ccebe5e2b54f6251284f95afa277158ef732
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 445953d08c..22ca316b38 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  399f3e6053dd52028d2b60384332cea9  pip-26.2.2.tar.gz
-sha256  3a8e5c800492787f33a4114ef54444546c340df428974ebba17e0fd47e11af2f  pip-26.2.2.tar.gz
+md5  329592944207f872a94cb63da2b978f0  pip-26.3.tar.gz
+sha256  6c36ae7da8695be67e3cd9f7d87919667ced53f57ce2ede75d89b5912ed2bc4c  pip-26.3.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index a2efaf4918..5a11915ada 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 26.2.2
+PYTHON_PIP_VERSION = 26.3
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/fa/e8/0842d757e483e895e670f655084cfe8b8c72580c6769a76b30b2789a0608
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/53/c7/f8d9e2e0e7c1ed8a22a10eeb3b5bf7860bc07d8446c7a978a882c5c8214b
 PYTHON_PIP_SETUP_TYPE = flit
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
