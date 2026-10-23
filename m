Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0638606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 11:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pTMiX1CJ;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=YojYAlcU
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B465160625;
	Fri, 23 Oct 2026 11:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5PhN59Oq-lPb; Fri, 23 Oct 2026 11:57:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D0A4A6063A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792756626;
	b=QWSDpcmelYn0hPmq0knrTonbdofsFST16a6histyO0pDzUsNsiCAKqUJLFY4iMFTZNzG
	 dnKPDImWFTNVFLec8NapZTgG1Wyt5e82TM6X39+S/3WQ7GDOPP9deRuHmhyWU98gph9Ap
	 ntrm91HGShgBziEhle4Sa3sD+vi6QKdPKElm+AYE9ty7PrDUG6TZ3T+lXa+1oG9LrLfac
	 3k7PgFpQ+K1YvOnGBq9RVcnLpoy6ueVCNxoNwmdeQT+S5Xn6p6gWXPXw1xULC8LLtpkIu
	 3wcLekRrt4ZHqaCXy26IL/9TEYsanZf0Tds+qcnEHnS5jJ4Z5W5ckHtVm5Mb0UyrV9Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792756626;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fHdEYCkQ6/BjMHzxx+kWs9SxRtmVl5J56WNTLekF9Vg=;
	b=FEIyrBamMjvjgOrR13Ve2dRN2HrkoYHIi+VW64eA1aUP3/UPiTvWhbREGMrFhqasxgaV
	 /RwltWLBnSRZnHHzm0SWItQbnddqdMrqq6OP9zDytKBm81LsbspojD0bL0WoQrYbiTfmW
	 +3jG14cAfE9uxj43v258ULHOqD9g6o4LAgEhtQpaV0IvDotIXfrZofEzKEEYbwByEUiu7
	 x+9ZjYt1yBf9r4lRITwBiehA5hMDhPsBGzsxS556iN3aZ7BO7OdbS9BAyaHMrl3UPnMqB
	 0CJbDCKmt8JLabEI6eymYVYnbMlp18pRbFYPEmfWd4qW5rFswxK2lF+DvQPTjNY316g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792756626;
	bh=fHdEYCkQ6/BjMHzxx+kWs9SxRtmVl5J56WNTLekF9Vg=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pTMiX1CJm+35i6jIKf8IfgWgrPRyNpqm+JKErNlygXbSM7+rwsXALcix6NkwlTDqC
	 vHQi3X6lH1kUwqvttPQuKT45iTVGRqlnPuey2rN9ebXCDxUdPuLv5LNZXMBZiDfwEG
	 NMk8HsxjkRTHfoUvGUF3eO1Zt8XIcUJ7KreWxWpvQMKqIW21dgm50veCuIxeRmWjoX
	 WmCne2wJChE999sFu6Pnh7a338ZXBWnkw43g3AnMRqEHlUewOLBuGNcfDRe/K3r2VM
	 /fGSh0/pk2HMrD9Bda6kUqs6ySHnzmQxi8JJ2bllyd1OtBkzokxgt7o9lWEYEg7w7h
	 fTyCExam1AnzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0A4A6063A;
	Fri, 23 Oct 2026 11:57:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 38BCE235
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29A44811BF
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:57:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tcS6ATPfB2j1 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 11:57:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 48D6F810AD
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792756624;
 b=mkQbFSV7V2S/iqbGi2rV5WJ8yq683bAYP9CvfDWIouhNe9MixPm5G8bIs2aqi21qIGlN
 JMBPYsIwBzUoJj3k+FEkdqCECgEKGLZ4rRLVnS0/b6O4u6G3g+GrpudoOVcvy4nfuHC9G
 Xxvnl9CY6hcQd6Fw9WLJNB2yThqPHy8HUOosiD7ettUo+zB2DzqPYPbAGWO9Rfy/NV+Nv
 dgE8nO7icPYRgaTEB2VcPsG9t47eqc4rKM8QaD23oY5VTeS3VTbwfTt4AWwfofvz2Qa7v
 OIvUHpVaBqEDtEerfbgLlBD2adAP4wdAQOsymDC43zpetokOjV6fgYO17Tz3c8fVuTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792756624;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type:Content-Disposition:X-Operating-System;
 bh=wtWI8MOMtmCWlpwPsFRDJGMqNt/Rnsw7L3oVAGDT/20=;
 b=aJPlTEVh89LUL/9VuacWm6MufDu9k0k2KqNG42YqpiI+U7IOoptGsJFy0TWS5ljDnxyp
 /cryft7KVj1LN5MpArzNQ7oieJ03kOf52Nxrvl+D0yGA+SIiN7DgIKBrqk06kh3ZM8E36
 qMD2xTRWfE8ET8Ga7SZGjrfC/3Ryu098zH5jsgOtNAROgz6rOPsFOjaAXC8kCHsqgykPR
 9nRvHSapnnQUWPEzI98+BpKHv2JZn7iB2vxlWjaIJUubeOUXkw1VIaX0EZFhOjoEON19b
 nHww3HuyjwwAMOOwN0LnvVwVyhEpsJuROAy9cITq9vrBUCEFpdeI36CbE2VzSLek5jQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=openadk.org;
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48D6F810AD
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 11:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1792756621; bh=uFrzp97ACsvcCQxjgtxhVw/cs42xfMSAXvI4P6hwZQE=;
 h=Date:From:To:Subject:From;
 b=YojYAlcUOERbOInlTD+JvMxdyQbIx/fE5BE+Lq9LbPO3RgJ0/oMuwFTX7RRvy5tqi
 scWrgMbkeF/WbLBTodJObtYbwhCSXNYYlHL6B7mU15UYIsOW31sb2Q4ZlrcLUqv7fM
 Ywt+3SwNIaOp0Gsc9xZIEXNpRbRbc8IfEb0AUQLZhoNylfZQjfcw2SD6LIPEQ6B8YJ
 O/c5IRGTAfTTEz6dZ3OBQ+F2VnchlRE/0nk/7YzeBQ0vhq1s5f6gtXdUSQL8Z6CRdS
 AQCrlZ3ad7k0UHS41eH3mUHX5YPDd5RMfYXd+W8AI6lvRAvworBO37Unx25llzb7Jj
 ieuEmjE5D4rdw==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 8F32731E09E2; Fri, 23 Oct 2026 13:57:01 +0200 (CEST)
Date: Fri, 23 Oct 2026 13:57:01 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <attLjdSxHA3_VTO6@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/chawan: or1k is not supported
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes:
 - https://autobuild.buildroot.org/results/2aa8986b4161c9ce25d4bddf8c29d1b204893e0b

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/chawan/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/chawan/Config.in b/package/chawan/Config.in
index 220c81a16d..64c39bb4ec 100644
--- a/package/chawan/Config.in
+++ b/package/chawan/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_CHAWAN
 	bool "chawan"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	depends on !BR2_or1k # not supported
 	select BR2_PACKAGE_BROTLI
 	select BR2_PACKAGE_LIBSSH2
 	select BR2_PACKAGE_OPENSSL
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
