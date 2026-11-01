Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55280606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 14:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IS8OB8ll
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 316AB80D93;
	Sun,  1 Nov 2026 14:51:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YzQLK6CrckgG; Sun,  1 Nov 2026 14:50:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3906080D97
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793544659;
	b=TMGTs4E9VCHd2DB7D0CMUWxpJTg+Y2OudL7fIpvOyhudz9b5ZCBvWnBaV6q6qcZisO/w
	 flTRQ1jkfVfLpZtx2+r/HvU+hFgbBdpCD9V5V92cmTM5RmJQpQdu1U4M8Da2VNfu3ptsY
	 GbNRfzAULdCay97v9NdOwKCK89ut+tj8+QtKfepReejM/zy63gx+dFP6lM+TMulga4H3h
	 J/4U6iWQFICVaohOuslQxv63SuEwkg+ofJJ4Lfe9HJSkmziI0Nur6U+hAabEYX1s2GNV6
	 dQdRNPtE+hkUmZPkkZEMIZHp3/z/Ol3tKj1DxPZQfWNS6eAQ/7ThMX4N/ckkg/dW6zg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793544659;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=pu87ID5BHq2G5QJvbUM4toJXyBs+O0YTfg/j4YknfWM=;
	b=DA83uaPmuKN+0JYa/3mME1C6dFr1TvwzF+rUesUQ1EFGoWTb47om9RSA42yHtnw5NOiH
	 oPUuK8z3vnyTvFHNnJLXmWTwAFG929vGdu5Sfne+Lmygph+8uxO4YmQqXDEpjyim1kKaS
	 jELapWJEWc8yvD7stcHsshplVM341aTQJbcAPTMs9kpHg4E80mFjoXsoJgliH0XoGgBdh
	 eYslKrHc6r6CWFgHbPIHJ8En8uDEsE+LQF+7BlOj3HZCfk+xi6ZJlueQiMbalf49hlm4A
	 aPtuHX9WwatzEakxUH01gphdhRoyGFG8CTgxEiiNtBDsKDeiW5+95Yj3KUzatiNuR4A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793544659;
	bh=pu87ID5BHq2G5QJvbUM4toJXyBs+O0YTfg/j4YknfWM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IS8OB8lltwhrQA1rCJTeMfONZsO7g9/+cjekVUJWJhRiEBNNQNV7pJrVy55s6O4yo
	 f7UcFWYBlrxo/t3f+++UxdLUBnzfP5ZN5MWy32Jj4zoMysW7fLxFPkaYuqaONqvgB0
	 idnDe3tfrmzLRaUd2QHulVK/0Ai3cxjVuksw/cIyywEEHb+/X295RE3BUfTTsEBvGL
	 sL7ISlH6Mc5RxfIGme5j6mzf5lAl5hzb2zzcVzDAXScmnOijNk5QkVoY6u/QMOoUh+
	 e6pOTag3hn8zKZJ/P5FHy0iOnCAKuYR+WRsCc4GbPl7//aE1NDmbt8pw9NI9Tn+koo
	 yjrP1K55cyBoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3906080D97;
	Sun,  1 Nov 2026 14:50:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B23F4B7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CEF5405E2
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6iBSQgGjcSr for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 14:50:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B52C6405E3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793544646;
 b=aJJee9XKUAyog/bQJGaMzjCIHbwdTrdCySvHW9edy1lKyzE2qmyG7BTF468uNvgL2Szn
 sIm9yx0dFjhfRYXj+ZwIqTgEG4VrfmH5zireX+BzsuhduYFnb62YCTcRTY3niAoCl6YcK
 7baZ/d1YZ7mgQkIuI5F0d5namP1Vbzyk1UuE4fzGv5Xn1CUg8xXKL1Q/wrXRO5yuGtAwy
 wFoBSN4FhFEXfAFJTe5cQeucz4wgd43hKpIF36Bu/HIWzNAAduPRP42ErYXbSr7wXIeMg
 spazhFz778bfEGShK3V/JFvzz6Wvm5ldFL626Tu0Qkh5ZHibikErUneVrUAyD3CrT2g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793544646;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ij5EiVeEvcpAmA0zWW0L9XiQfaLOdVxG/IW1hWFPtE4=;
 b=UiBcbe3RlEKNj7j52pgu4bksQBKI1Q4s5nsaY83ajVzxk/mLLcBLy6hUUtvs/fWivGhc
 j0YakNe7jZxulErNAAEFZ6dj+fRER51okMMJKLkVt/FpvdpzQYCFNaEKILPdRSWK3uAl0
 lu0BlW8/I0RzrSE8uOUgt3j8EMZ5NY+VAN85rRWzC8DpCOmVKo490xrYElHJMNZ+jefjg
 UpbgPYBUSNoWM9cWhOFzWa/8wKEogPsR9H1cUgsGG0cFSumc2EbAQ5geGs/e+WwgasoET
 c5Fq4j03SgBo9GBBgcB8OUGU4mT2RfD+JB3dNd5X4TETrFB+7EAqkGFIPmf8oUkcMrQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B52C6405E3
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 14:50:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A4759D491; Sun,  1 Nov 2026 14:49:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 14:54:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1bc28b9dcad33c23407a0eb5b5783e0c5aee6d4b
X-Git-Newrev: e286327742d04758fe997f6bf0f5eefa9e73c8e2
X-Patchwork-Hint: ignore
Message-Id: <20261101144917.7A4759D491@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-platformdirs: security bump
 to version 4.14.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e286327742d04758fe997f6bf0f5eefa9e73c8e2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fix unsafe Unix runtime-directory selection and multipath site-directory
injection:
https://github.com/tox-dev/platformdirs/security/advisories/GHSA-2gh9-8m4r-2xwh
https://github.com/tox-dev/platformdirs/security/advisories/GHSA-jmm4-8x35-q6fq
https://github.com/tox-dev/platformdirs/security/advisories/GHSA-9w45-w2cj-r5hx
https://github.com/tox-dev/platformdirs/security/advisories/GHSA-5pjc-393q-rwmf

Add the host-python-hatch-fancy-pypi-readme build dependency for
both the target and host variants.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-platformdirs/python-platformdirs.hash |  4 ++--
 package/python-platformdirs/python-platformdirs.mk   | 12 ++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
index 641b1e62f9..073f9b002d 100644
--- a/package/python-platformdirs/python-platformdirs.hash
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/platformdirs/json
-md5  9df73f0389c5b7093ea0c73af181eb95  platformdirs-4.13.5.tar.gz
-sha256  05831adf87d392760f4b5c3a0a95579ab5a10b18b9b9bd43680dcb47544788a0  platformdirs-4.13.5.tar.gz
+md5  07dd523bb5ca12c4525df2cd242336b1  platformdirs-4.14.2.tar.gz
+sha256  6d13b4c1d66b7548dcec9e3db13c1ba9d9adb65041b5d07869313afc07e6e41b  platformdirs-4.14.2.tar.gz
 # Locally computed sha256 checksums
 sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
index 0aebffb6a9..f6da1e5498 100644
--- a/package/python-platformdirs/python-platformdirs.mk
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -4,14 +4,18 @@
 #
 ################################################################################
 
-PYTHON_PLATFORMDIRS_VERSION = 4.13.5
+PYTHON_PLATFORMDIRS_VERSION = 4.14.2
 PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
-PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/58/e6/d0abbb256b44e6a05748c6942511ff67db8dbb068de0c35b24bf1b395b09
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/6e/4e/2684728d9f2c8c4110738dcadca7e0bed4b60c8dc68c40c2a9e0cf017900
 PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
 PYTHON_PLATFORMDIRS_LICENSE = MIT
 PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
-PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
-HOST_PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
+PYTHON_PLATFORMDIRS_DEPENDENCIES = \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
+HOST_PYTHON_PLATFORMDIRS_DEPENDENCIES = \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
