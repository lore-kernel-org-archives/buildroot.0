Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCBD606A31F
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 09:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aNXzvPvP
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EC3D40976;
	Thu, 22 Oct 2026 09:34:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9bocxkNSJICV; Thu, 22 Oct 2026 09:34:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 46F074099A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792661690;
	b=bHtaI4YVOUHP4NRk2iYfwSTklmNiyqDQzCyHkevibuFGSqOTnHpLftTSsS3XDbryGBDv
	 ATNulPHmhi1j5UzlQFWDEdnApx5cGlTV0CS3n+Aaa3NlpdzEFyciO94mZQAdeMekA86ki
	 JUfOMlSr6kTE8M4RWJyI/6DVrYxCwdCkiQzk94ZRn3BXgT/ZtM7uDi8T7DgyoBvEeqqEJ
	 RGQ0+0StPdOwIMXzxwiXLEFCedSnFCXS6H5v2nzGytSldkmq7klTSqRvhkD3NdTPLnGgd
	 COXDUDQnaropXM7PbQKVu2OtDKv3AzvNCUYsxPN5MUuiMCGsP2YTREhNOACoIzSuIHg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792661690;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=w2kJqIzs1yN7/3k2Kz1xRTWSYHBGnX9p6eLxPbYlPgw=;
	b=m9YwFRJH0XmUUQhyM58jk0rOVwlb2jwaakQd9p1+OEJX7W/6YSIEDBXkOH/bC7BCqaGn
	 S1yUqjdDV9zqKjVRoOGGXBwC9ZvfcWu/19L79X4lnYR1+RDohWrRxfkSOIBKCkjw9shJd
	 cfvc5Yc8bA9GqmknNw8rOJ+xNFYIFN/joL5dyXE/PADrPF04rHDtmxPVl/U+tbvApOGhe
	 2txdtQ9sXV79br4kye2VTiu1vFyFriWpJRBy4vT7PJCL7+a4hwGBM01MN+Jnx5H2GJ7n+
	 x0Am4A3S+V5s+pSXilul4RMhbzVQsuksXp7Das0OxvEdzwCMgRIOytQnqyG7RkWM8pA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792661690;
	bh=w2kJqIzs1yN7/3k2Kz1xRTWSYHBGnX9p6eLxPbYlPgw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aNXzvPvP4eX36+rTJQ0sfO0XvS24MgzWwEBkCC/U8+sw9rdnjAiOmxIe1qOHY7BWR
	 3n+vykmTWYBGHrC1+B8/suyHgqG2UpNo4tXfMYvaml0qObm1xoqrun585+p0LbPOlE
	 I7dzZtuGWkRExCAN/Yb5LLKXKEn292YtyoW2xzRFxqjXShg8sPY6Se7loAYpUh/USl
	 riUUk1DgWeYMUo/ikqPArpMDDaq/JqF58vAZ3qexhxI8HJI07maNJqNuVjJ1sO9w0A
	 N+bWvY4uIkYceqA2Nl8iB2u5lBAkhVpbJO/2xSEniEGhxr8AVufQoD4enhX+BwcSjT
	 f9IEmJtCMzfZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46F074099A;
	Thu, 22 Oct 2026 09:34:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A0791E11
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D32A40050
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMveGxeirHnI for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 09:34:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8362D4039F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792661673;
 b=ec6DOR0PPp+ixDbhKeL+XQYPQXaX6Uwmvb7KxGHAjlcfxVekqQlHjyW9L10/n8WlQsZp
 iEludqYn7fWDiBwVbuZqJOWbNhW3bo/Xsk38amnCO/t9D/ibIvbN9+gHGf0dftx0SBq1+
 YT/T9COPhDuj+4kG00wneA06K7DR5nTeUFa4LjoF8ZhIZaIwiTh8Y+mNRtWAWOK1KKDDg
 cwUg7j4+iOXufybvSw5O2jQxirvIzHux2LcHI2P+QW9UnH+74lkEuOvED7JiL2ZWlKi/6
 ZEmD2nPx6mA8wa7jU/nNs+OT3poPe3yYer4Jd+jKP/WC4RwR0rem77d94jhZk2ilvbA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792661673;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=F49pmav0x4q5glHYG6a+amyWnAaWaNQIK1IuIKqmOG0=;
 b=JOw+XdTTIvnQSYjIi02a0vjTS6o54/g1Fw4BKBl9Rkfqpi3qegPlDH3/ZXoyz+3KtiQh
 9q+CrgQIIqLt1m+yPATgqMmGWQde7FGEmwOWjcXBHqjSTZ3+D2c1oQFplEsrJNHtTneKj
 BqZnOTu8618cbhm0pjebsJysDSk+uGZRA3NfQ5PVtAnX+KFlFZOUNGqJPEI8uBDMCJ/6s
 PZjAKZJQm1bLHZDKCagQdeVvQKI7zeKsR2CZzldSuxy9Rj/fvs/Qt8SfsBF3AxzhsvFXi
 WeZS3YRcVr0s84sM9kNZJ/W2QCGZLuz+bgYV0FkQILC5iQHYVEykn+kQt5GWkufmodg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8362D4039F
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C2BC9B985; Thu, 22 Oct 2026 09:33:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 21:51:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 21906a939671219829f6ba1d669a32f537b978ba
X-Git-Newrev: a50da0051a9ad4abc2b884cf3bfb01e1982ea11f
X-Patchwork-Hint: ignore
Message-Id: <20261022093309.9C2BC9B985@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/php: security
 bump to v8.3.36
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a50da0051a9ad4abc2b884cf3bfb01e1982ea11f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This release include fixes for critical remote code execution
vulnerabilities:

- https://www.php.net/archive/2026.php#2026-10-21-5

See the release notes: https://www.php.net/ChangeLog-8.php#8.3.36

This fixes the following vulnerabilities:

- CVE-2026-109618: https://github.com/php/php-src/security/advisories/GHSA-w8hw-w9fx-j79w
- CVE-2026-109619: https://github.com/php/php-src/security/advisories/GHSA-6wmf-4rv5-p3rp

(alternative to commit e9be6e35d3da84c9ba1ea792169641b38e086e34)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 99ce84673e..604e52a54f 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  ff4630fbbbd94359134b7d3c223db59329905bdc4f5a9ef93d257b48e358619a  php-8.3.35.tar.xz
+sha256  dd54693aa334c5c4d72e9aee96b082c2473750a18a6c1d105789c93a3b1692fd  php-8.3.36.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 497ccc49e4..fd01d75e7f 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.3.35
+PHP_VERSION = 8.3.36
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
