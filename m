Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDF6C433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 18:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E91660F5F;
	Fri, 21 Jan 2022 18:59:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6iNsHuEsV-Me; Fri, 21 Jan 2022 18:59:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5B2360FD0;
	Fri, 21 Jan 2022 18:59:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28A981BF2FF
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 18:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 817B48125E
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 18:58:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EA83nJ0HwSvd for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 18:58:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A22C381330
 for <buildroot@busybox.net>; Fri, 21 Jan 2022 18:58:54 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id r187so234895wma.0
 for <buildroot@busybox.net>; Fri, 21 Jan 2022 10:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bXKrPraNywfEB5wuFUfmpRhF4EmySlrsPrsH1wgoT60=;
 b=N0mDQ/z8KvFNXrF+ZY5G5YdYYNxfugOvtamyC/ZPnI7eHooefeBFyxTlYYJg6+ajDG
 0F6Rua+Oi9IS5gqHpFgOaYthhYpafcgZ7kQIeR/lMU8eC6CNXw0tLpvDkhkUm04SlwR6
 qU41lXLtgpQROiXbd3OjRH107z8+IP6cuwJ1cB22YcdE+LNh6jbcGnvYQCt4561f/MdN
 N3AvfkSy01+JNceN/COI+F2hc1MYmwzY0dxsyru44nyQw9yFSAaVz3e0MMuai5F+Atgd
 X6G4lwy67ofLa0hELyxCR8+T8p65vgpta5rhruNbzNsHQkqutZG0n3cAaUkM3YZwInSp
 95kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bXKrPraNywfEB5wuFUfmpRhF4EmySlrsPrsH1wgoT60=;
 b=Z35GLM2+1KKV989rqOhq0W0IX9feVoEmoTI3OTSN09m+UdnIFDWnYOaMyxtbPv0H62
 bS1t0rBfbBYDk+5Yk/jExx8P/56Gi4/xyjbvINeoi3NQOUZMdQe0oZaiVA8soSFhnB53
 QBdJ9C9GHBmHKcssYPHlSIDPqls0Ah/j4+Wsyk/PkVVYLHlg8lrH+RZDUFtf5FkZZQ43
 DERS0Qr/kk18li4/8EQzLuQE7ZlFLywhstd2KddG9g0pttFEpSwVUZWdeeG3vx1VMZf6
 jzkDLTJ3TcJ9MZME3tphp/cSh4CdHtl4Y34J8fv2ON3i+5m7Wab0bStdkgdAO6KQwNq5
 SwTw==
X-Gm-Message-State: AOAM532gvF75X6GXBIGWlCXdxW5InGxX4g3BFW/8jPgJHXSYBFvDdQMY
 6mZEVu1WaT/t4+DrG7g//gJuYTSaWdc=
X-Google-Smtp-Source: ABdhPJylz5mCqtBBKBt/0ylKrFLt+SJ7FHRFbD8CpRN7OKydBIsxRJhQylA5OypJsn1XXQy2bQGiyA==
X-Received: by 2002:a05:600c:4e8e:: with SMTP id
 f14mr1960585wmq.175.1642791532951; 
 Fri, 21 Jan 2022 10:58:52 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id d2sm6165681wru.40.2022.01.21.10.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 10:58:52 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 21 Jan 2022 13:38:56 +0100
Message-Id: <20220121123859.754653-5-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220121123859.754653-1-francois.perrad@gadz.org>
References: <20220121123859.754653-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/8] package/perl-net-dns: bump to version 1.33
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
 package/perl-net-dns/perl-net-dns.hash | 4 ++--
 package/perl-net-dns/perl-net-dns.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-net-dns/perl-net-dns.hash b/package/perl-net-dns/perl-net-dns.hash
index 916603e71..1af14e2a4 100644
--- a/package/perl-net-dns/perl-net-dns.hash
+++ b/package/perl-net-dns/perl-net-dns.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from http://cpan.metacpan.org/
-md5  e8ee02ec42dfeb10ae4a0d175d5fcafc  Net-DNS-1.32.tar.gz
-sha256  b890a7b44d573f27cc713caadf1e12eaaa4478a6504d1157194df614316b5b50  Net-DNS-1.32.tar.gz
+md5  f3ba5295ee588d25dabc74a2ecda296a  Net-DNS-1.33.tar.gz
+sha256  5a40e7cf524e4bd2c33cf03b82b47d5308b712083aa5ee180b0b5af54c71fbd2  Net-DNS-1.33.tar.gz
 
 # computed by scancpan
 sha256  1e44fcf65509b47a251eda0ce1f8bd6aefa13517e38cb1e95b8d36120fb15452  LICENSE
diff --git a/package/perl-net-dns/perl-net-dns.mk b/package/perl-net-dns/perl-net-dns.mk
index afba3e216..fa7b50c02 100644
--- a/package/perl-net-dns/perl-net-dns.mk
+++ b/package/perl-net-dns/perl-net-dns.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_NET_DNS_VERSION = 1.32
+PERL_NET_DNS_VERSION = 1.33
 PERL_NET_DNS_SOURCE = Net-DNS-$(PERL_NET_DNS_VERSION).tar.gz
 PERL_NET_DNS_SITE = $(BR2_CPAN_MIRROR)/authors/id/N/NL/NLNETLABS
 PERL_NET_DNS_LICENSE = MIT
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
