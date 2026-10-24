Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D298F606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 13:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=m05O1NDx
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2412812D6;
	Sat, 24 Oct 2026 13:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zMMq7LLjdtl; Sat, 24 Oct 2026 13:49:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CAB0381309
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792849787;
	b=cMEvgsElTPE0qfHQBr1mxNUnneK6kNKUHqSIm96kcj9FwoFLAKQgQatoE+LwjkTWrUOL
	 AeIwQaj87s9LnHk6RGWrIo2S2Y8ogLpz8IcHIp/n59IL1S24kUCp74dQfTq+CPHzVHLAs
	 H0C7OKjun3u4sl40qhv7XXX497ZNOO7EX0FmjwNs678SsSqtgGTkk/O1Uni+c/zAPXBLz
	 bmQp71rK5QEvXEXtWDUy/9+NvWt2eFWAlN2G/UZwp32dfSXQ8xoR2AZhVs7gtqyGNfEPQ
	 2/qDx1YxPKQ8P57hcZZVGe7oqk7ZuJ9YBqdyrvogwCm/6WLNadPn9MgRwxNT2ct0oTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792849787;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7UByVMwhgyCi13B3Vxxi1QA7xD+LytMnS8RZQ+Qx9fY=;
	b=hwrWEA6rOjLe3TGRXks+sxk4cd4XAwwJhtYtzxwfonH7wb2uvwUZoSy+3W+d6j6fV5m/
	 WEK9Zhkvk9t8Gflz1ai7eg9eARG4Uvws2izX+Fafu2BJjTOOQ+3p0IqjgdhglgaMDGjd0
	 4IBpSd0ONJg1iv3bgsloQL5aN6ZUqiDiAvFAtd7ZHmz7HQSsgRYhCsQYeFzn5gOiwdivN
	 5Rf5K80zo3enP+IyKDqwG+LljGq0Axu9wouP7HSG7oKc/y1PEKuUSEq5Lg0umCAp/8Vuy
	 TmqMNcaORDr677SERL9hnrgGiJSq5MjOFX+0F5Eaoufofb6+PC1aUdBUMJiTloBi5zw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792849787;
	bh=7UByVMwhgyCi13B3Vxxi1QA7xD+LytMnS8RZQ+Qx9fY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m05O1NDxgy7wdKaFnaOaXA8RLkFlxlj5GyVk7sEuT6jJEK0nRsdEBHIG92H7gc8eq
	 XPb1UUkrxyovYTKQen8j5b+g2FOphNqJlda7YZNst+EkCDjbBh1nqXyaRqpnsP8JX4
	 q2jMZtktpAi7VgoARZg699xiwLJNrP7rH5Q4ZzSIpsAg7wdoEZicdavlwZ3bttnoJt
	 0EP+qHsgDzHGIV9UlBMM7224nVw+VU6SSq/8sFHn81LE8eIak30QW33lrymlGpmLWD
	 pwAIzruOmrsX78DIhf+VAk7xiqs0X3X1fZtd5ZHksGJG4CmRc0W8qMT8vNqq0RAvUR
	 WWgvuz1HnJu/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAB0381309;
	Sat, 24 Oct 2026 13:49:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 56DCF380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 488E481309
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7veJ7_mOcC1 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 13:49:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1E2DC812D6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792849785;
 b=IGFv1P77IhDpHnYd0Shg5h71LG7x9jjARnr9dhyGOsPmDNxZvuRV6BAXSdEy55jubSz6
 i582CP4j5VRbeMBRiOWfhx65qVUbapxxJkta4QyqimB31BGjKQT+ZZnZ0r69+bni6xaDi
 r078mSXNZPM3R9zaS9dRB0/Fm51ySjvP3jf18TH4z8NNbSM845oMMIQhsgrjGlMuyDSrj
 WWf3EgofAl9emkQxvw5cX9knOlVZ5Wu9uLtNxW7DsyqKLguoQu1j20QGm8tLVOSoAcUKi
 xmg4Z46pEoV/klmIKTO/nHrAcybH8kf3W3O2Og8lxN5m6KUn7/GfhDg6pOPSREXOuew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792849785;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=KnwGufvGEDewP+XkpjOO8vQ3Wjiz2m2YDQSTKoSFt+M=;
 b=IjD1U2tlhnlbt44WGc8LGYw1ErmxfiJIe/6/G4n+wXwq1u3t4GUQPqgMDMwgCyl3idDZ
 gMQ4jgdvzF7vhJQ7ndy9JXPHm7mn4IzbqUIrfZV1flWn3eqODI/KpuWeZpQSPN4oBHAbs
 6fBeKBSfCrfw9tAduxprhEubzA7p4E5TK6eLmVCG+AARuBI8gSy1XemhLW2g7F3+MNqkR
 kQlcQgC4OciH8ie2vfAhCy84Js4D2NujI5Ey901e7eHbglCGWQG8rlsr905lC75x4//B3
 LQECpAPU+uyew6FHAwrw75ziKIeAtCqv8DrOfKAav797iHD8C3qLzkZwpfZp6LwaqPQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E2DC812D6
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:49:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1887D9C7C9; Sat, 24 Oct 2026 13:48:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 15:48:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f904d35dce2f40226a115cb0e440bc486a7ae48f
X-Git-Newrev: 400fa09486b5181bdc7bc292f88bdfe3b41b4e68
X-Patchwork-Hint: ignore
Message-Id: <20261024134820.1887D9C7C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-xlsxwriter: bump to version
 3.3.0
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/400fa09486b5181bdc7bc292f88bdfe3b41b4e68
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the license hash for a copyright year update:
https://github.com/jmcnamara/XlsxWriter/commit/fc6fd01016d6d71fb7048e135027e56b41d10d06

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-xlsxwriter/python-xlsxwriter.hash | 6 +++---
 package/python-xlsxwriter/python-xlsxwriter.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
index 92c3dee1d3..663b09f426 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.hash
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xlsxwriter/json
-md5  9b577c64f83dec8e357dab62be575e5a  xlsxwriter-3.2.9.tar.gz
-sha256  254b1c37a368c444eac6e2f867405cc9e461b0ed97a3233b2ac1e574efb4140c  xlsxwriter-3.2.9.tar.gz
+md5  f715b29253890540a5892fed5b2aecb9  xlsxwriter-3.3.0.tar.gz
+sha256  0a6bf2e4dcec8b29dd9b86d1e622132134c48bb6fd10f925fdfb229f0447199a  xlsxwriter-3.3.0.tar.gz
 # Locally computed sha256 checksums
-sha256  cf08b60a4ded986b58a617cb8304373bda5c4eff42fb4e30d7597b616e116e87  LICENSE.txt
+sha256  79cd3a88b65ecd9996f4bbfb7f3adf0a75df366aa1d3bbb7fe150b9e43d5b4c7  LICENSE.txt
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index e6a8fe4adf..d6f841a219 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLSXWRITER_VERSION = 3.2.9
+PYTHON_XLSXWRITER_VERSION = 3.3.0
 PYTHON_XLSXWRITER_SOURCE = xlsxwriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/46/2c/c06ef49dc36e7954e55b802a8b231770d286a9758b3d936bd1e04ce5ba88
+PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/93/f2/98b45e52bc0330256bd4bb039cc44b28f838ad85602ce4f358f355d501bb
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2-Clause
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
