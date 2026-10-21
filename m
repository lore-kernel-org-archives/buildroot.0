Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74548606A319
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 15:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Vp67ZBGk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42E5C4058A;
	Wed, 21 Oct 2026 15:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lSY_fq03DBdk; Wed, 21 Oct 2026 15:19:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5627A405E3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792595999;
	b=OU/qQmZyVahBnOAjS2mSdZ1OWKuOUDAeiG5aoZDODegkgLO53kDmXCFqhhz9pum0/Wk1
	 45XSHmlEYlDKMfnMzIDZKeKm8plpuI2urU9ba0lHsizXu7EX8jNpYBqEbUs5pVPdM5vEz
	 m7V3Whda/fi+xUPsArtj8744NISyaCYd5jdiVm9W3WpBgFNDYhl2S5bYFFf25O1cV5Se0
	 5nCK8hlx3seRKLva28gDzufnSOW/H7GVXXq1GG5nOLl1xcTQcfJieO7F05Gn4Z7I+4fgP
	 eLZDW7NRvHxiKssJVz9A9RU2u5U0QQ7qS+siQ/cdg+kzGMpsPas4c2Z3hTUdhWsMSAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792595999;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CJYwVOU8zljxyrlSXfNDuDg38TiAb/SvvZ/tsKqGjC0=;
	b=HvBSh6wg4dJgwer0iLokRxLlUO2UWEDVApjskYFhuB7ZgHhj+4mY9dKLgwKElzKdRTeU
	 /YsbLz0PMBG9ROOf5nidmyhuL9Gbzce0/HpvqfcyL9lkTtG7gaKaGrARBxYDdGuKX7bVo
	 xOH2G0bgNMKIL3cF6U3050HaL18rt9659HhxJC3JRSZPgWwoQ1j3c2cJJH/Vk9wdyRmgL
	 MG5VaJfYhQ7a3kVxtFUrBnCMD8+4/TC4MngVR8wgtHPUAar5yTl/6/gCRtLcnsiWfLems
	 KlxZPokXkMpU8zGKqUJ+cPSQ9DYQyAQ3utCw/uGkb4d5259M/VJBbTEhbAXhu+8PUGQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792595999;
	bh=CJYwVOU8zljxyrlSXfNDuDg38TiAb/SvvZ/tsKqGjC0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Vp67ZBGkYmSMCjMRFmgtSCKkhTBlPiZnYqi4J8YAe882LKbHmr7IRV9zXB/SyuX7X
	 yY4P9T+Wh+XLlxBXbBhRb348KERnoP8WhMQcxmw1FT/dG6G9pKymC41T7S4vZ3GhF9
	 r4vHz1nlJzUwbWvVrQXBlDkBlF737kzia7kF2ysGlK+sfPqp/8j6bv/mXUxl2rdxEr
	 1LN+DpKMRZWH3xeNe1xkMGtK6o+EXyp5dLAq9kOH2ceOTPCw1N/WTSWDQ5hvBROpxr
	 IgsqveUYkH/nOu2g5FelK8pV7SG9XgNCKiCJOzwQoi1yDjhBjJC+BlZr124TC1dPK0
	 2Ic1OTyAmJ7lQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5627A405E3;
	Wed, 21 Oct 2026 15:19:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D02DF95C
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 15:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDC8181182
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 15:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VO_BB4L85IOF for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 15:19:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D1EAB81176
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792595996;
 b=WxfeRqdbsBolFCYser1gedx+LcrFKMIt1YWkaArTmQhXvcD9TEZ6rAeGcipARp8TD1rm
 NYNMDDg+FYMzJBol3nV6FNx5zLp6vKRhcan02/qLxJ6j2WJdLzPtkm4KGxLjPsMNOnXGX
 +d3ue5nDlGDpziGuUtKrc0alJI9lJtyaG0m5YZjdtY3yAFPwNQbhxMX/1e9X8B92UZGDr
 u3YPWoHGWbfgj6ugZMl3Y++YQum0Y7J6M6HBjORZHTkLmPCHI2gD6eMfRt83c75jLBLpH
 fM1hHRSZICCdBWrxrh0chQrAojINVXaG4TtBG5lwkMexILGIwvDkw+T5ar1yzdaArSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792595996;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=meSDHiLmndjmOWUAFeJk3zP0qVCkK6806cFCKnCzf/A=;
 b=O2f+41AN4yTSuwz/s0MKwyPK8gV8FmbFNfjXSd5/h9NJNU1wArBJ246pM9NhXGMOmy0p
 W657oduBQ1hZYWCJrem+0UoLz5UBnPHsebdUTkX87EZYb+xgYh0f4TsWDt0EJiQVo5+Bq
 FnBQwdE1eyomqb6Zheo+XUwKbDMfxzacHlBQ+ClFo+2jJg4XDpako+5TwNm5P8eLq3Nqq
 nHqdcNwvjE7GiHV7M1R4VQQysdS8h/L29KALITeuhgua7P51R1+Iv/p2j7Ki9HjngNoXv
 ldD2xVGh4FpZU/4nd3+0Htij2iUDICGk8c4hIs7wWldFTw1ddqW2yZsILfcS7o3vVPw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1EAB81176
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 15:19:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A382599A51; Wed, 21 Oct 2026 15:18:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 17:00:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b65f6274e5e70e7101277a6580929abb39e8ef0
X-Git-Newrev: e9be6e35d3da84c9ba1ea792169641b38e086e34
X-Patchwork-Hint: ignore
Message-Id: <20261021151832.A382599A51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: security bump to v8.5.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e9be6e35d3da84c9ba1ea792169641b38e086e34
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This release include fixes for critical remote code execution
vulnerabilities:

- https://www.php.net/archive/2026.php#2026-10-21-5

See the release notes: https://www.php.net/ChangeLog-8.php#8.5.12

This fixes the following vulnerabilities:

- CVE-2026-109618: https://github.com/php/php-src/security/advisories/GHSA-w8hw-w9fx-j79w
- CVE-2026-109619: https://github.com/php/php-src/security/advisories/GHSA-6wmf-4rv5-p3rp

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 0f2b6785bf..e1e92781ea 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  d9be75c08e8c316f4c8f4194d8fbe1750a15f6a6d9d4e3fe72082abeeb800360  php-8.5.11.tar.xz
+sha256  08bc2eba2a588654ade1357174aa646b761556c862dda0678345ee29ed481209  php-8.5.12.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index cd1270be57..1bb25d0863 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.11
+PHP_VERSION = 8.5.12
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
