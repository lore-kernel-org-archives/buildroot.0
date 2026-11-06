Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A92606A32E
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 21:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nqtocmUZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EEA660AA7;
	Fri,  6 Nov 2026 21:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCMUKT_yUFF8; Fri,  6 Nov 2026 21:15:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8E11660A55
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793999710;
	b=odlORDCc0R3XeL3OvxCnbS0T/ObV8Sw2fcSoqoT2MKcESCmNt+Tj5DbCOFaj3KnW4Vy2
	 lSEHpTL9lxdM1WyUg2pc7mlh2jaYsE1sF+xRZ5ooyHFcbxul4fsbNbwT16GRQLderwt3r
	 Tj5/m48qmuTR9QLfnJYJxJ1Z9hfyLgTDGl9cWh5NRqAh72V6IPDsgH1G8vmOxGLlMbAtM
	 T96T3MfTd0YU254m5Gn9xyBDTOsRxi8N/5tl9Mqmy1Mol6qpUZo4MqyDDVhKSbzQXWP65
	 82cKf96WvPKz8m3sQtsAgBnuE4f+OkCyvsyOKgKnQVT3XQ3Jcd9ZIqnpFaj1U8QK89A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793999710;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yEFdmzjA8pUHqAyFoMtrDe1UTR+0bCCspnYTBocE3AU=;
	b=oFXKYh3yNslQ9YVgs1NeT3qReEEyMPlr8F2nV9q5o9ZHDmBORnYVGihqO6YfEzTcnAvN
	 YxWmN+fz++ZO2HLDdcBcRmfv0kO+JfvhKTnMxN18qPs5jHwWVfCgvs/6SMwyLujV9y1vS
	 x02IsenBZB57SbUDBFhYRjb1Ph/wtQkGUEGh7oVLRSwgxTIpftTJspFApn2JcoPmTgBc8
	 uB7QwRHt48L0C0sx+7NyPpe0nxrqLLNRImUs5OMCJjLSKPd7DlkJLvuwU0YfkeQISAbVX
	 Cd2eRFh6WEXNKic9HiJlE3gSnyVv4tYSW3wvllcSp/f0Ax5jLM4zMwQ0hq+zYpXbdtg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793999710;
	bh=yEFdmzjA8pUHqAyFoMtrDe1UTR+0bCCspnYTBocE3AU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nqtocmUZ2bg+W6lAtnoWt1Dg15uBwc7aAPjFdHP6y5wVMHxhZk6EAxy9BiqOkOfxM
	 hOt3S0JCadV9rwwUHYe7VtxrRHO6tWXEttKU/7pL2ieGPYohPoigz64nlIXAuopP7/
	 avIaJO1jukfAuNN7SKR+/b9crRx5pr/eidjg0tAE+jTFLBL7KdFAhM96toOzRWCxC7
	 dW8ulnrXO7ZF/dkQEd7663eYWRF2rvxRSIt4CaUg679gKFili9DzbZRstwYwObae+U
	 Z9WiO1TIamkIH8ZJ3aflhDBXq5hqBdZ+g1lkM7jgxncPdQ7vhG7aaWFxjT1RPnY+8l
	 ohG2c1pONr2PA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E11660A55;
	Fri,  6 Nov 2026 21:15:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55B1FA64
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4397281220
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XsI9PvqwXKuv for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 88A318128A
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88A318128A
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 21:14:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4A449D52F; Fri,  6 Nov 2026 21:12:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 22:05:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0deb06a477d3733f88fe8ee1f251a611131d193b
X-Git-Newrev: 34a242b3bd82ff78dfb2b0f54db25c76c2d2ff8a
X-Patchwork-Hint: ignore
Message-Id: <20261106211249.A4A449D52F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-types-setuptools: bump to
 version 84.2.0.20261104
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	TVD_SPACE_RATIO autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/34a242b3bd82ff78dfb2b0f54db25c76c2d2ff8a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-types-setuptools/python-types-setuptools.hash | 4 ++--
 package/python-types-setuptools/python-types-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-types-setuptools/python-types-setuptools.hash b/package/python-types-setuptools/python-types-setuptools.hash
index b16553abfb..89f78b7554 100644
--- a/package/python-types-setuptools/python-types-setuptools.hash
+++ b/package/python-types-setuptools/python-types-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/types-setuptools/json
-md5  c2d13d00413ef92673581c250430493c  types_setuptools-84.0.0.20261006.tar.gz
-sha256  0f123655f44390a15ec62c9fa30b57f6dafe53014524d28b62cab1edbc303059  types_setuptools-84.0.0.20261006.tar.gz
+md5  ed3288615fb39d436b51f511ec87c64f  types_setuptools-84.2.0.20261104.tar.gz
+sha256  1ec758bbeddf88d52f963fe663beabc2117b6aae73cf3d2902d7dd0df81bd76e  types_setuptools-84.2.0.20261104.tar.gz
 # Locally computed sha256 checksums
 sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-setuptools/python-types-setuptools.mk b/package/python-types-setuptools/python-types-setuptools.mk
index 0ca0056c54..d342d927b0 100644
--- a/package/python-types-setuptools/python-types-setuptools.mk
+++ b/package/python-types-setuptools/python-types-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPES_SETUPTOOLS_VERSION = 84.0.0.20261006
+PYTHON_TYPES_SETUPTOOLS_VERSION = 84.2.0.20261104
 PYTHON_TYPES_SETUPTOOLS_SOURCE = types_setuptools-$(PYTHON_TYPES_SETUPTOOLS_VERSION).tar.gz
-PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/fc/36/012e992d81f3c3575e6428d53c2bbe266858cf1b7df7335476ab99f17908
+PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/d9/08/fe21d9b3e02c6a612ef01ee0212ef82619aec8d2373d74d69c4144ac2934
 PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
 PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
 PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
