Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD76C606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=m8/fp5ao
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD2F940D6E;
	Fri, 30 Oct 2026 14:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tO9aHXQsAO1f; Fri, 30 Oct 2026 14:19:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C008C40D81
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369994;
	b=p568hi9qlFrSGwVlzcsraKO/e2Ms6jaQcf++NeKGHVTzjix1ZUqUvCa1puC8i7HSvBLh
	 W+k1+vZsuNGtqVAMFSnpd53UKt8N9KiGZcrHfvRLM3qhfHDE5pjyFm8qpeYkc9M5ktVcr
	 y8/ZucRgRYxPILyDJb0Lraqr7zfFX5p26jTzucGb1nPA0U60bkkPbJRTDna9dta3NVzDR
	 31Sh7NXKv/JOYjk7qPAhPBAxpxWFVbiwealDdAas0Ov70xiTPP9B0o384IPZiG+9zm0f2
	 iUEab0i5RiNRCqY6xyjaeHQYlPr/HybiqzPtLSjrckVAQ9pn7BlZRd1Gd9q3x021XDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369994;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=HoqwiJ9r0nWzk28rMkn1h61FewP7UHK2ahwq3jc01lo=;
	b=Cf9a5KGpGpxV1qTvKWcmwoKdAtWAzk/FemsQOIHnDvUodXj9szao6M2YEb/2CZ0V2Bg4
	 RUui/tVytf6DqisJHsmnHlkFuNKb9eU96NcEPPPEyza1NodGhYgklSpHSYGqtZNmP4MUd
	 PrVEsH4u9pFykuWd7vW2WFPIcxgDgkkIB9mREVKJUGX9m3i0tozyCmbO20abLqZzYG3t8
	 22SMq1NSbDiBqilMcI1/qt2sUXvWtOVrwAwWX2XeSklrGFQOvVojIp26sArcawWF/q68E
	 JiOprVNZ1doBc1WIXe1RWLOfRy0yOTPhNy6Zv5wNS2SLBz5y2BZS4MQAEl4j0uHUstg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369994;
	bh=HoqwiJ9r0nWzk28rMkn1h61FewP7UHK2ahwq3jc01lo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m8/fp5ao9DGWnkJSImD31TXW4H/bTa0is8tB2+JoLVhKTUmy+vo9OMhD8AyfCnjVQ
	 ZO4M+6ocetlS+Ulc6SXi9UNONTZCJw0z5k7IrYzbRXGCzerr04kfzxnBAJlOyWmSZr
	 YYbjZZ8a4OBjIKpj5uSmpdvn/IDp6fH6MigITR4gzhZFWKw+8az/CzFKuuW/TimF2m
	 dqI6xbAqGc87XcR2OmcJk7FUAe6/yBhrkqC9wVBOIewFXNvcPBY+4tGfRSCw36HXZ7
	 /rUp5C1rAArrTD6rZU8KDscv5USHpAdW6IxkgvERZsL15BILnoko+4QZyikKZnYLIs
	 3SbZ51p+rOn4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C008C40D81;
	Fri, 30 Oct 2026 14:19:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EDDD4362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFED0400D5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rTYf3S3EdMRd for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4902640535
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369894;
 b=DzpJjHTAtnyxfMS/ZzTRe6z0YiiMG7d3076GWOuyxLcMbutBsOYFW/+rM15EUPj8HE3t
 DpTuitGm0DhD51UZakDqqqNGy3PuxKyJB7hCQfguWuw0g0uC5guDj3nG8gS0bNCg5mJHW
 +WkBeqOedqON9hYrH+R/7rgq8P8qCCdXs3WvBto1GmlNNFPR0ZO2XxoNHmlVa6abtO/rC
 8nq6qHC/49AJoD5Y/IT5DDx/KgM3vBS+pN2gfIr8ck38l7HEm7FdCrcVYWAQAgc/cgdsM
 C3QJ4mPsKac7msvwhgpk8OZ7UmYoqDsvdrGhfo97yw9HXzEDTUpZjxJ//MsD0IaCrQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369894;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=R9oiAwlr1V79GT04pGvbDh+QA+ovdomj5Ougd0W8TTA=;
 b=bdmmrBNxpxnjMR1HAVGKcl9KmgFYRoZbRmOOzSviVFLXp8sAjD4SP9Lavt9QqnFuXl+i
 QEput4EaLGPJNOL5esguZRizAmNDsWl1jzFsDKKcdbZ5i65kvb8Tc02VrtHwcWUtCmso1
 Q6k5AtE9kNOejUwHeDR2dPUq/u1WOkFn54T2o04O/UfDomnuvkKNAxnQkVDd5sGGqNNTk
 SQWy9PKddf74X/qRXS8v41S5NFiHktmKOKTPGrROnUkk/XtljJVtXcBkQpmJ+gmDwMi0X
 zvxPnzEAtk0PepvsFWgnqOybdAP1NN/OwY64M8pJIW3nHM67Mv4UHfXhg7sb5evqaAQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4902640535
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 678AD9D389; Fri, 30 Oct 2026 14:16:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:10 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 7d3e5f3cec1b582ae53eb4b2dedaf570553e4260
X-Git-Newrev: b6037472a70785559c53ca705496cfc902655444
X-Patchwork-Hint: ignore
Message-Id: <20261030141646.678AD9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libnss: security
 bump to version 3.132
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
Content-Type: multipart/mixed; boundary="===============0993913506509301144=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0993913506509301144==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b6037472a70785559c53ca705496cfc902655444
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Version 3.132 contains a fix for the eMudhra intermediate CAs ([1]).

For release notes since 3.131, see:
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_131_1_RTM/doc/src/releases/nss_3_131_1.md
https://hg-edge.mozilla.org/projects/nss/file/NSS_3_132_RTM/doc/src/releases/nss_3_132.md

[1]: https://emudhra.we-have-a-problem.com/

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2cbf77c1164f454f1b2e50765bbbc276b0c7b602)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 02bbcaf00d..37922f094c 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_131_RTM/src/SHA256SUMS
-sha256  ca0005bc77e9255d9942103e6f9756cfe311a3df72afa99860709e386eb3c167  nss-3.131.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_132_RTM/src/SHA256SUMS
+sha256  ee9cf4837ba801141a804321c4462ad8f452ff4314275c6d5108a6b05af227ff  nss-3.132.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 6b4e68a624..209730f6b5 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.131
+LIBNSS_VERSION = 3.132
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============0993913506509301144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0993913506509301144==--
