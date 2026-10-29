Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55E6606A31D
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=otpp2alc
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFC1E60C00;
	Fri, 30 Oct 2026 14:18:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hzGFSCLWh1nX; Fri, 30 Oct 2026 14:18:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AA79360AAC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369921;
	b=bcZuOIh3nEQze8nnoSOi49C5tnvIm2Lbb9fISGkLkrIY8sQ5JPd0j/CHIFwJQ9CmZWb8
	 lAHu9h1FuLOgCRFryS/Lb0sAkpvpBl+EqbavR7r1+2VCnXQ+bZsv7aQEaTYQxwwOysmD3
	 vlwnsvsoGHqjg/rZ7uJiofYPcvxEsX9k+ghGurdQ+lL4HYTnG+0GkCKYKdljNtzy0Z74s
	 TXDb+tsn+H5IZL+ftpKk33J92VyCUUZlWeSSGI9A5WLUDd/a+2AVXhyEwXeYecED82MTi
	 12gfbzYo8P68oVA0FojbTT2EypLaf3cmoVnrAcFzYe/yc8uD5s0rEWbmpO3ztE1nzAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369921;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=KUSa2y3UASe5+eHGxmvc9yALHVR1FdbxE82f6cwbcWc=;
	b=dOuJpjrY0WpQzAR7FUDZ7nkbnC0uTn+cGLw2Yc4RorpNfSdN/ddRko4M6M3q6atPQErV
	 xp0Yl0hz34DXiQQggNWVA/t3uCS/NejveKa8njBY/6zL9bxXDIuN9r+PDvSu8Ntgkscky
	 dzYAYF5oY4HATJUTBci3VWAfTgJcJ4TpmxubhX+mM2dXHAG5/95Dhp+5CI2/QGRHcSEh6
	 7apPCtf7EJqWGKjgU5wccA2aTEL432XxJ7ZqNXVEberlb+Z5IDhyiqV+0cw/jjG0bwXHV
	 99mYLLTAyG1PM3ypWKQJ3Z4QNzNrM8wOgyr7/0HdWjNOB+qGzMTxQHVj5B6XFY38/EQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369921;
	bh=KUSa2y3UASe5+eHGxmvc9yALHVR1FdbxE82f6cwbcWc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=otpp2alc/O+MbJrFVPTnoC/Br1qiHf61NX6QBlmOdLO+iDVAWMI+MrlT/CPLZ1THN
	 PdULBQ2mw4elItFvjGThuSpaB87wmZyfjpILS0nNbs4NrGczNCxVAa8k+rB0VZidiN
	 B5rZkgOFeVUdoXxRbWzCY3j8XyJg3DZXappjIP2rcDY2bEB57Gu0IgkDuxJoz4UHZ1
	 HxKbdyZXHJYcyUtAGyLH+4fDYalF+5lza2UTBtUQWgCJkP3lRH4O4w64K1krGr+0xV
	 tY4LZM+4L04EDlWqYInNR/YlkF+q5trwLVJ3Hg2LDaxS5f94IyeZEodIQe5wMh41d6
	 9aA88uJBJYGwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA79360AAC;
	Fri, 30 Oct 2026 14:18:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE9C2712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0DD381135
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vzJ9teiOhO5j for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6D88E812B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369884;
 b=kubJDcHjhHF3Zf98e9qFkgx9Y8EWh3yImzp8p5UKgbHTwxvzeHAo0QeY2a4qnbo7vHR1
 looQQCAR2gnEdT5eKfaqKeq+g+ZBBvXvgtMNzP6D8r8TslsUN2BF4lWznng2HiROdkwfM
 whFAgPFycWFYP9s34ZR1gYCtWlxmMP+IAAl8E5QKWo6w2v37I9QEzP5QULLBa2t1TS+O4
 4fXgGgqPBi8+oeA8NR7i8nAs56lNE7tgnbzrx5F8KE0JCUCbdpVhb5/AVomSPLEAJIRle
 jyWTgvunPtPy43bIcofrmSzWv1Xg/Bg+UoRa9Qo2iuvTOrKk1Kk0r6IO4pnxlQtDXPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369884;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WX/Tqm96k+lna9n3UcO+FpiO6TkqbimoKsnjX6sMhmU=;
 b=kA6f1ij83uoD/Yg9jEMYmJY3AujtnLIfxqBnJ02TPw2j1uu2A7eBKabapBbV3YvVUe7X
 bMi6L3U+t7k9G5EvVbg/Mv+L6ZkN/xvDQuDF+O4K6WtUGQZc8SVDA2GGjL6QpzePTz6EP
 9SIF6gQP4EhDTQkDQfv06r/WUpZDq8XICwJnGfgJtl6zBacstirlz774l5erMpEEcD8wt
 xRGgopyEdN2OSTdc69n/Z5uLctR27axYhrsxD3f/WES0aPLTi1/ApuhkdW1pm91HhM8Sq
 7bZ9gVaHx0regaSPqfXyG91bUzDNZ7Fw1QQ86NZ3xrfbKdo3hlPwhtGkJHkjHmxsKfQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D88E812B1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C8079D389; Fri, 30 Oct 2026 14:16:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:04 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: f7d1d109602528bc61b9d2e0336df0ae8b67ad9d
X-Git-Newrev: 8c04b770cf45f40d548aefab7703acc51374c30d
X-Patchwork-Hint: ignore
Message-Id: <20261030141636.8C8079D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libheif: security
 bump version to 1.23.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1505682792320621971=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1505682792320621971==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8c04b770cf45f40d548aefab7703acc51374c30d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/strukturag/libheif/releases/tag/v1.23.6

Fixes the following CVEs:

(CVE numbers will be added when assigned.)

CVE-2026-XXXXX (GHSA-h4h8-qgvc-m7r2)
CVE-2026-XXXXX (GHSA-fcmw-5764-7rq8)
CVE-2026-XXXXX (GHSA-6fqc-p7r8-2g36)
CVE-2026-XXXXX (GHSA-q7mw-2fmm-5q94)
CVE-2026-XXXXX (GHSA-vv35-6hxg-95x8)
CVE-2026-XXXXX (GHSA-8p2c-9wv4-rx4p)
CVE-2026-XXXXX (GHSA-86ch-j429-fpr2)
CVE-2026-XXXXX (GHSA-3gwx-cjv4-jr74)
GHSA-hqpw-h8p6-22q9
GHSA-hvwh-xpj6-ph5x
GHSA-v5rj-g4wv-j5w3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5b5fc8431bfc234a80653db5772eb47d65305aae)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 30265f4aab..44e9c54781 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.5
-sha256  fd9036064c4432f0550d15072ddf34956a248279ee9aeaff0fba3fa0f77d8f1a  libheif-1.23.5.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.6
+sha256  4484346dc5995319dbc11e3a1c35d0a2ec46511ce370900869337fd2c7033125  libheif-1.23.6.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index cd171b9637..179c952566 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.5
+LIBHEIF_VERSION = 1.23.6
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING

--===============1505682792320621971==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1505682792320621971==--
