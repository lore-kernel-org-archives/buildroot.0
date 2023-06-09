Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E57AC7EE25
	for <buildroot@archiver.kernel.org>; Fri,  9 Jun 2023 16:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE63F40448;
	Fri,  9 Jun 2023 16:21:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE63F40448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jd0JLYz9092z; Fri,  9 Jun 2023 16:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A702419FF;
	Fri,  9 Jun 2023 16:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A702419FF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3AB441BF2AA
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:20:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1449B84238
 for <buildroot@lists.busybox.net>; Fri,  9 Jun 2023 16:20:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1449B84238
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I1xppgETBLTz for <buildroot@lists.busybox.net>;
 Fri,  9 Jun 2023 16:20:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3A1D83EBC
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3A1D83EBC
 for <buildroot@busybox.net>; Fri,  9 Jun 2023 16:20:31 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f660e57123so402148e87.3
 for <buildroot@busybox.net>; Fri, 09 Jun 2023 09:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686327629; x=1688919629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sNUPnFZjcRvIFLADku5j981dcjn4dTeslhZHHxbK3mw=;
 b=jIUwVTNVMugzqBwWRkylNAY7k6mE9eIwnINXHR/nQW7QQ/PNQaRo2C5DKgj4YTv9o5
 5ik4R0F7YUA4H8hVVA9tR6u1E8X0yAgX0GgPOic2pdCgIS5+duoKm6GLD9zbiqqikbh8
 NS6awaUZpgtyps+Eu/7XO2egOSnSYjB/wA/67E7UDesn6vMTEmd7ZfmCRhimhYiD/9k8
 wIYG084ihhGxPOlJ3bs8VqVHi9KWPOFBr0wHLsonb4P0JxwDnIjkPeydgLJBwsUNFwVk
 eDqYK2M9778xyge/+1ksR7PgNtKI9H32QUMRVjlxZN2fCs2M+PpzsH506MaQIyg03GYF
 hNyw==
X-Gm-Message-State: AC+VfDz3TeWyTTtWQoLwn+S24t0LcMAuZvbG6QDtRG65C3e8wleGXcK1
 IiggntEVXiR37rUgyHfptV4+HmIoKgU=
X-Google-Smtp-Source: ACHHUZ5bbqCqAJD+j6Kp4E+1lK6a1b9g1tgxDSPapAQLLLpHgyBasahJs8gu0Dej30DG6mRJGPGiow==
X-Received: by 2002:ac2:4985:0:b0:4f3:a485:919a with SMTP id
 f5-20020ac24985000000b004f3a485919amr1073823lfl.57.1686327629479; 
 Fri, 09 Jun 2023 09:20:29 -0700 (PDT)
Received: from vm.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a1c7c13000000b003f7aad8c160sm3141044wmc.11.2023.06.09.09.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 09:20:28 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  9 Jun 2023 18:20:17 +0200
Message-Id: <20230609162018.1231615-7-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230609162018.1231615-1-francois.perrad@gadz.org>
References: <20230609162018.1231615-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686327629; x=1688919629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sNUPnFZjcRvIFLADku5j981dcjn4dTeslhZHHxbK3mw=;
 b=Y3f28MDLJxV7Ak+JsqjDoh2ULssgELWsxPqy0Yd5LxYaSuBQLrcmtccTpjJZuIsv8R
 KIiuylAnEmtSG8fnoXK0Nk+5dPPhWSzF453V0fetVMi3shotq8eurl7AScKLw7UCA2TU
 8bAAb1Swq0x+2bVtm8FmN/VAWOIWXJ79LRuhVN+fziPNnPByQhQAe4dzG5hwZN48BE7A
 9YJM45fzVVLelIvsfX+Zw59UlTTmcDbxSicbBgqe4gMtC9bx3wAy8DHylmrlICV3FtMi
 rNaK7ZWOxZWGUyYZvbvBl5gvQjiHmHK9h5jEZm5GsE9We0oRLeWpLPv3Vc12V1AHhTHP
 686Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Y3f28MDL
Subject: [Buildroot] [PATCH 7/8] package/perl-net-dns: bump to version 1.39
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-net-dns/perl-net-dns.hash | 6 +++---
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index a98ac3525..cef979990 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
-# retrieved by scancpan from http://cpan.metacpan.org/
-md5  b70b74481908d995f57569ab7cfe6432  Net-DNS-1.36.tar.gz
-sha256  143ba0e530f8b727be61ec052974cbf52df5b0afc0582d75b04809e0b2a95ebe  Net-DNS-1.36.tar.gz
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  4a20cb266f1f75d97b2d535655d211db  Net-DNS-1.39.tar.gz
+sha256  e99cdedf9f0d60dca16f613e488c5b7f123c2fb24b3346d580cfe7da40851ac6  Net-DNS-1.39.tar.gz
 
 # computed by scancpan
 sha256  1e44fcf65509b47a251eda0ce1f8bd6aefa13517e38cb1e95b8d36120fb15452  LICENSE
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index f4c20c07a..2626c22d6 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.36
+PERL_NET_DNS_VERSION = 1.39
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
