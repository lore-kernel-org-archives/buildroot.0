Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C15D606A324
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 15:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CuIuHCUZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=JPlNPHQM
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0687360DA6;
	Thu, 19 Nov 2026 15:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id urnox70pSyWl; Thu, 19 Nov 2026 15:06:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8357960D96
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795100777;
	b=XBljNo8XD2sdGCpSguL1ae1KYsG5NEGD0g6O3h131e7lpAoahOFFDefPuZyXEQe/TLEC
	 MWbQmOj8fk9gvlcjlNt2wv45lcprz+aIX9Rypr91HMHKjz1B3JFOV1OhQ/Bndd1OyDypS
	 k3VPEsaGRUsHwAQZC+h10ldn0hv2jZeoqvgDKOc8Be4KnbqRs8+qDkAG6Wha0zPSEtdgH
	 6FGjtITpErPr8rmt9+mSc7anKH1E8LCDb5LNCAMVdMhj+Bab2hqu8i6/9iQ3KcZZ63VCk
	 EM9SDyKq9Pno/xubY5JUt4v9dBHZUbJLK4sbqImNYEI2cm2/bxKFUNwkXpSQahdLMRw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795100777;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-MIME-Autoconverted:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Wy6FhhyY3bt379894hfrQzXrFQR28ixOLDCCrtWib6I=;
	b=j0MJ+NTh4QX4J8r7QubwPS4jvKXBSfaPJsyQeUUnrSwIMaHPKrSqvqJgeBXuw5Px96rd
	 sQZiqhOhofa4vxySs0LVAgqrrOK+w1GqUCqBUwV7G/vpi4IpFGuzXJt3fFRgwCIvbmSXz
	 4ioTqnmnjw1tA+8884UVYto43DZB6aFTQ6V0VrT6hIzz5lheoLuhXXPwBZTIibltgY4Me
	 087kQ/JCvsUOKelTiDpA14l/TZpdZELm+2tnGH9KTEXN0szZYO/8yFT9AwNJKKOTef51R
	 5hhBZ3Cd8nT+WfCcYfXajBEELzl9o5l//OtgAY9ljgmFaUyw3lU3HA43ScGUVPPJHBQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795100777;
	bh=Wy6FhhyY3bt379894hfrQzXrFQR28ixOLDCCrtWib6I=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=CuIuHCUZIm/SEZoyVr/rEIzKnwd2F1iGDu5p2QH+PlmzW3sdoD119v/fWQPoehhnu
	 CDK/Q4JI0inMHuPsFVBU2tA/SQhootVp1iR1bG1gHX+TdN568v3oqGKCo2LpP1etV4
	 MgS2wlipa4ejwfDKiS12f/UOIHbZeVsRlo+d/T6n0SnWx9W+qjCXsF3mCCretOoOtw
	 1oa/0F7THrRsWNh9ezgEdsNlgbrrbe+EuBuaTxWogQmVlBokAZpDa/n7sIH17PSpaZ
	 8bEbl5sYpR46ALbFhWv+cnSiR7z8lwcA2h6tx0b+4pGlmFTJas4lU6PD2rfEYRevr4
	 Q78RUFE9QwDEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8357960D96;
	Thu, 19 Nov 2026 15:06:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FA481C9
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 156FE40572
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5AZalUpW3x8N for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 15:06:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 3832940556
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=JPlNPHQM
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3832940556
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 15:06:13 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=JPlNPHQMFjthTPcaOWum959AnD0qaQtpUKzBKsAHQxQQRtbnHz+70O/T3TIRJfJLGWAXc4JPm67vnmxu+6EPkFdwqBNZkKQcZapBsZUGCEEzaDoWUqfafdZrXlA4Ang70orMNuEecUCPi2y9ysBc+8NPrQdsu/mvONUwzF+jsJANBC7ITSDDFEbYfg+FTmSEL/6PW8DXQ1mUT8H+lKTcvg+KkG7jqDso2GTteNLmBcdIbsRoZMVsuEJUGFe2c1XBO9iss6OiGhkwq3BiEZeHyhZ7nyhr/2MD6L39UWd8rm9/BQZ3uypdPzszo1E092pgB3C2FNgfa7SNnWjTAwLkjw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=sYvbNjvtDMuQ8SZYnKvhKONxW56JszLNZkOB+pqHAzg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date:Message-ID; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1514159613; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 19 Nov 2026 15:06:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1xU3i9-00000002F1X-0zpp;
 Thu, 19 Nov 2026 16:06:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Nov 2026 16:06:03 +0100
Message-ID: <20261119150604.534395-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Subject: [Buildroot] [PATCH] package/php: security bump to version 5.1.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes the following security issues:

CVE-2026-15353: SOAP information disclosure through malformed array
dimensions
https://github.com/php/php-src/security/advisories/GHSA-q23r-hr55-xmpg

CVE-2026-115560: Session serializer mismatch can lead to remote code
execution
https://github.com/php/php-src/security/advisories/GHSA-658j-r8rw-q6mx

CVE-2026-127960: Denial of service through folded HTTP response headers
https://github.com/php/php-src/security/advisories/GHSA-mmf9-xm3v-hg2x

CVE-2026-128064: Mixed-case HTTPS and FTPS URLs can expose data in plaintext
https://github.com/php/php-src/security/advisories/GHSA-f6gg-rchx-xw8j

CVE-2026-128090: PHAR OpenSSL signature bypass via algorithm downgrade
https://github.com/php/php-src/security/advisories/GHSA-68fq-fh7h-f8gr

CVE-2026-129182: Use-after-free via repopulation of
last_fatal_error_backtrace global after shutdown
https://github.com/php/php-src/security/advisories/GHSA-2fjv-p558-g82m

CVE-2026-129289: PHP-FPM request smuggling through an unread HTTP request
body
https://github.com/php/php-src/security/advisories/GHSA-qc49-hpvq-g2w6

CVE-2026-129291: PHP-FPM epoll use-after-free can lead to local privilege
escalation
https://github.com/php/php-src/security/advisories/GHSA-jm4m-qfqx-967m

CVE-2026-129292: PHP-FPM status endpoint XSS via unescaped user and script
fields
https://github.com/php/php-src/security/advisories/GHSA-3mg3-cr28-46gc

CVE-2026-129438: Incorrect RFC 3986 URI serialization for oversized input
https://github.com/php/php-src/security/advisories/GHSA-mg3p-mxj9-g2mm

CVE-2026-129474: Use-after-free in magic method backtraces can lead to
remote code execution
https://github.com/php/php-src/security/advisories/GHSA-8mjj-2r7p-4hg2

CVE-2026-129481: Use-after-free after interrupted session shutdown
https://github.com/php/php-src/security/advisories/GHSA-g3vh-838c-65v7

CVE-2026-129496: Timezone cache use-after-free can lead to remote code
execution
https://github.com/php/php-src/security/advisories/GHSA-gr4f-wgx5-jpfv

CVE-2026-129501: Double free during DOM XML serialization
https://github.com/php/php-src/security/advisories/GHSA-x8r7-mg3g-74hg

CVE-2026-129506: SOAP use-after-free when processing DTD entity references
https://github.com/php/php-src/security/advisories/GHSA-4646-p932-gw34

CVE-2026-129538: PHP-CGI out-of-bounds read and write during PATH_INFO
correction
https://github.com/php/php-src/security/advisories/GHSA-5j3f-64r7-f564

CVE-2026-126714: Partially overwritten session files can lead to remote code
execution
https://github.com/php/php-src/security/advisories/GHSA-fm2m-fjf5-v3cp

Changelog:
https://www.php.net/ChangeLog-8.php#8.5.13

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index e1e92781ea..e9982a160e 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  08bc2eba2a588654ade1357174aa646b761556c862dda0678345ee29ed481209  php-8.5.12.tar.xz
+sha256  607602acaf0c3061818e9916ec44a058e8b3d43959a83862b9cd3ec7bf5b785f  php-8.5.13.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 1bb25d0863..db513a2a12 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.12
+PHP_VERSION = 8.5.13
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
