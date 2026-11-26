Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5A2606A327
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 14:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=X9YaQcGE;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=ZYNk2cvi
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 098FC60A81;
	Thu, 26 Nov 2026 14:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IUnLGtCappNH; Thu, 26 Nov 2026 14:09:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 34EF760A59
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795702154;
	b=Izi5jS1g3853d/Tr3VVhfiQMEYOftPlf2x+1MCMb6X8npkMc5AzP+ZK2cbEkg7a3ZA7Y
	 WBOCrpBKCkruLbR41uPjcdODsl2NUXXYyVP/dxyeQUcucfVeb+DXoGNVSthAG/uRtmms7
	 Gsh01N5o9RcahLgFBWRzmewrDs3NGEb55tdzlY5ZUysu6S6qytTskhieup7Z7H9XlsQcH
	 1RymWzGXC/M1SFq48Q7poW3P3uEyV64JfxJ6Uap7ajCAkrAMXWBzDxpNHR9Tab0k2D0fP
	 XOghPGId7pNE6Td/k36kZklMI8REfmdBN1cbvy4AVhlFK+I6p23AiQdxtmEJ+Meo8/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795702154;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JtZZG3uJrwnS8qeKHNGEjaHU47x879DDC5mHqZWw9Q0=;
	b=FpKtB3xMXDvIpcboW4YnTjXzdu2ICiweeKUilGRsbHfzhQSZ/MhtvjMIKfYZd/Orzfxl
	 CxodXMCZdfCGvD+Q6pM4DqizyL5n8RWC7G7WDkI9SDnVB9mmMZnYUSSNNEZG0r4g2hg7T
	 tzqVM6hjEYAphK1zhTQb1MztIRlLhI13Q+TJFL5dvrZO5gh3t2JOQOcX5LZKR4/t5eHvr
	 xY7YRjwjeUnCjV0tcAhS0Zuh/HYYFZnR0O56xf+8CpHXkHKijdosq0mU5oACQyAZhWxl/
	 y6bhgKNejwkHcVTVq2q4Yc0WS8CgSGenbGAFTOQ7gF7bv6BV+Lp5OdeHPwkKj5NRoJg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795702154;
	bh=JtZZG3uJrwnS8qeKHNGEjaHU47x879DDC5mHqZWw9Q0=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X9YaQcGE2jK1ukkCvDxlqU7zc2Lks7o517HGq4wmg70QDoOTzm3MoEXXtiB7SjayP
	 oHPpyRsw1xxqr2Fv0+OkF4am0EdDUZm+UFF9Rti32tgL5cwPwERVlydejBqoHyfX4S
	 Q9fvqHZyuruMrSSjbz6TqpMUdnmLivit1jtY6nyEaVrPwgXwJjPqP2ePrkvPwKv3Ju
	 MRIXp2a668EJwYfe9g1PWT42pO3AVJGkNr/LJC+v1v0oZSNcCuQScUhwlNtFJjEwgK
	 QJ/E5avGa/QJoor1E9KRnybhC2CtnTLGODV2ncyf0nqUQLeOQvM7G1KYXWCVEfu2Ld
	 D4g04kPjA8B6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34EF760A59;
	Thu, 26 Nov 2026 14:09:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0560B22B
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 14:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFED940934
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 14:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTbBAWUquVJx for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 14:09:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ED6CC408B0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED6CC408B0
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 14:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1795702149; bh=hW0T2O5rSCx+27po6c5LOHWS8Q6VvkZ7VW+9ahlvXFo=;
 h=Date:From:To:Subject:From;
 b=ZYNk2cviC1KM7T8QgomA0nCm5mFgLaptNh5Lg1fAUOKBs5DlZQxOmwDafbjq1t2sy
 qttZVPtab7m980cOy4yvKjOa3yzM8v/I/Sm6Dk6KCbnPg/iHDSUPehGTp650Hb8eAm
 Js7eDe48NPAiJcPhGbI9tmCfFLVwWyvnYuLJ98ypspDxPH/jgzpL7nBOC1AqMuENIj
 j1UWeLZ/InneSw2s5Esr543Ye3p24zWzEpl8gOfWjQ0eaTV5LAxCoHQ8g32Tew1ZdY
 /PTIDkbo6KRzdxDVkzFyrTXAcnZbhdFmhQ7WaaMqDCccPVNkTVCljho4a/7X7VfB4g
 a8sSMcP9JfVtw==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 4605B31E0B54; Thu, 26 Nov 2026 15:09:09 +0100 (CET)
Date: Thu, 26 Nov 2026 15:09:09 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <awg9hZZwc-YoI9tH@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.113+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/perl-cgi: security update to 5.02
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

See here for the Changes:
https://github.com/leejo/CGI.pm/blob/master/Changes

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/perl-cgi/perl-cgi.hash | 4 ++--
 package/perl-cgi/perl-cgi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-cgi/perl-cgi.hash b/package/perl-cgi/perl-cgi.hash
index fa4544493c..f03ff862b8 100644
--- a/package/perl-cgi/perl-cgi.hash
+++ b/package/perl-cgi/perl-cgi.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  ea0c7b5b002f100f23b11ac9487088a9  CGI-4.72.tar.gz
-sha256  babc1ca72db188083a1c3812debe88c4473b943b1f7c662281cd57c580a8bdd9  CGI-4.72.tar.gz
+md5  4646759262a5b2b778406e51e69b45fb  CGI-5.02.tar.gz
+sha256  47637ad0413c527e00e1249d14dba0c234073ad4bef09746fafd73dd85ded665  CGI-5.02.tar.gz
 
 # computed by scancpan
 sha256  55a4d9005df91f82cd19aab29c3ad64c1a2e2d69a069f76570ee679bedd6b351  LICENSE
diff --git a/package/perl-cgi/perl-cgi.mk b/package/perl-cgi/perl-cgi.mk
index ca6968125c..10dd0214a4 100644
--- a/package/perl-cgi/perl-cgi.mk
+++ b/package/perl-cgi/perl-cgi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_CGI_VERSION = 4.72
+PERL_CGI_VERSION = 5.02
 PERL_CGI_SOURCE = CGI-$(PERL_CGI_VERSION).tar.gz
 PERL_CGI_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEEJO
 PERL_CGI_LICENSE = Artistic-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
