Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F64CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03E2F40D7E;
	Sat,  3 Oct 2026 15:16:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jZnTbpcWLHeD; Sat,  3 Oct 2026 15:16:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8F73840CE7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791040612;
	b=X1VZ3IpGJPHmA6iLKj0Z5bJ3PbcJHghuk3zMCFJYCdopc10XHnXbSxP1ThDNp6Z9i84P
	 SpdQLRPJ6kfvfph6WyP9A1GlLkZG6viFlf0jI6MzuStBHNIOBDR9REIx4APMfsAhq/Nrc
	 4TVlVTBnBCy7empHmWwrxP60lBrJBfRJaF098CluSWron6pqKhxkGzWePwstgNZRbOtSH
	 MSGEvV2Ve0ydQ2QnOA2gn7KVhDzY0rrgPTr5Tgk2uVdznL5bq44vybbn2tEPou9y26lht
	 92fTq9knUiTki/MRfWiY6wBB0QQH+ecIjdEfA/e8IxMymu2ru8/Jq+45iTCFGqFMM1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791040612;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=69z7Xsn+Y4xma2Xes00b85wr3vbtTo5mLXrRdJnaZnw=;
	b=H76WOOuMyLjstSx0fGWMAtLbMfgiAMxvM658mKbE62SSgs6AvFyQt0guR/wHyMKENViS
	 0lm8WrcVFuZGkY2b+KC0/EO6Kt9idXDmNy+/W3N1RrmJef0cLYP23lpgP2Qi4RxTqIx32
	 spZl/4QTQ2WNKcx+g8HohJw/Z2Z31KwPACrKQQbig5f/985vXXgkujiDyitB30plLyhfi
	 N3VKkwSV9zEaRkNWPceA7Cxe2vgvsdi4+mjVlTtKAhLnQL32TrBme+G51KucVteeE83sW
	 pkruADFtU6H4mK3aj0PWFd0gPBDir0RiLpACaLjHzha+UUpcugUBxhN5OE3/KlaO8/A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791040612;
	bh=69z7Xsn+Y4xma2Xes00b85wr3vbtTo5mLXrRdJnaZnw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=MHlOWMOmT9VV7RsyfaEw3C4cem7jyYRmzGO+q2GWbUsClx0DYT/IHvnwNyDHRTEYT
	 WCOwaMFmfN1OFkWxXdFre+4EYpZqkf/uODN7y7rUxhskgSWGnRIZJuZ3wQCJqOB4jo
	 pH2z8qPK+NYFc+b8OGtE/dMuf2m+ZigfaEfhyT/X0RSe5iFQOvsKuXtq/LHUpb9muX
	 3Aow/WqdGAbYB7U100VwpJzOixp0ccAU7vIwNZ2DJQCQLAclQSgwD396bWNe0vCtMR
	 zlqfdj3AEqTr1JRqAiRDUEMeo3tAhCLd7YvNnsdluNzlAiVV0rqQ21id6HbuhuIdQi
	 gIF1473QVed3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F73840CE7;
	Sat,  3 Oct 2026 15:16:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33103263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17FF440CE7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:16:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mb0TmDF_0Gyf for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:16:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 38EB040BA2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791040610;
 b=WjKVFWLGtKm2+T5jgH9daVDthQ7jY+FgO6SuZHt6Bv3BgMK6hGDid/0T9+IdYeePACef
 LROvB4zMTOPDsV2C2TBQKdFZ3o2WVsaYsdKFq4ky7UDn5KXWgDpEpCvbX3oeRBPYBVxWv
 2aZuAO+0HJUeo50KNjIFcKqx7xDBZHFOXmBKGEZZnox4jVdejNUx5twQL/8J15bYdKMsl
 DU7BmaZf4IEAGOMzOAiHLWx2kQDzZ/xRb0hGUDpYAj8+cj5A1IFHVGuBPerNh/CpwkF43
 HhPK1rPBCWPs+t4JKJJoiaFr8PJpL0Hi5jQtUnz64Di04xx0FkvUG9jHz9mn81Id/cA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791040610;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=McdXx8BM4TbBe4F4Nt9QyXJZNRkVZJ8WjwVAzb2I5CI=;
 b=CWLbCfJMIeU9ogwk8jbmUIjB3GMZByUo7q4UYpAbL4xfsJ6tbjx4jaPu6AQHKZeH1ia0
 SLt56SskMuT1Gd38jZhPMPKrapr0syJdh1GoOM5gaul/vxQ+5mVyQpodX0r2OjP1q+HeX
 M0X8sS7u/T2J7ZBPcGi2m7eDsLwQr7Glli7I3zGXB4LBtsKYjL9UWbcs80mz2u6c9CUYs
 /XM1uDqRf+L+OKMdZQ9q0t2/QwOl1QQl+lkun05BH2HKnejGEhWlHZ5Nq3bXri2exNxgx
 gaSukalsm9sdnQ0tWC488Cz9NPPzRDcTfI/3cMcRzuXgpLKg04w0g98y/QLzEUXLiFw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=mZ7+kChF; 
 arc=none smtp.remote-ip=212.227.15.19
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38EB040BA2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:16:47 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHGCo-1xQEtZ15PM-00FVhE; Sat, 03
 Oct 2026 17:16:45 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Sat,  3 Oct 2026 17:16:39 +0200
Message-ID: <20261003151639.3618082-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:ABnq5TRu4OnCoB1kN3AkFQCx1NTCxka+BIX29Kr/QaGvQWLfoJs
 bfQkNovdMMdn2yUZlYqciQKA8Omn0DnjRfsT6MtYk6DlRE3rdG/EU8winQT8Fo5eCAkGuHZ
 3V5BkiB1Xmj+hJxfuI/XudiH4gENjST9h6B+wAUCBFbGvlXuabSoRsGam6UI5zeeQTPn4u/
 t7NzbcpXLTdkOJ+9px3eQ==
UI-OutboundReport: notjunk:1;M01:P0:CxFedIh0DE4=;DPyst2Utp8B0ohfz7iQLZdfuW4F
 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
 6KOT0+h1THxXqkeaqYsx7cLEXA==
Subject: [Buildroot] [PATCH 1/1] package/libseccomp: security bump to
 version 2.6.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upstream changelog [1] lists three security fixes (without CVEs):

* Incorrect 64-bit comparison merge in libseccomp can weaken seccomp filters
  https://github.com/seccomp/libseccomp/security/advisories/GHSA-4q85-33p6-j5g6

* Oversized seccomp filters can trigger libseccomp double free
  https://github.com/seccomp/libseccomp/security/advisories/GHSA-46fr-jh49-xvhx

* Oversized seccomp filters can trigger libseccomp heap corruption
  https://github.com/seccomp/libseccomp/security/advisories/GHSA-2hqh-5c36-grrm

[1] https://github.com/seccomp/libseccomp/releases/tag/v2.6.1

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/libseccomp/libseccomp.hash | 4 ++--
 package/libseccomp/libseccomp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
index aaadc8424e..58aee03e6c 100644
--- a/package/libseccomp/libseccomp.hash
+++ b/package/libseccomp/libseccomp.hash
@@ -1,4 +1,4 @@
-# From https://github.com/seccomp/libseccomp/releases/tag/v2.6.0 (PGP-signed checksum)
-sha256  83b6085232d1588c379dc9b9cae47bb37407cf262e6e74993c61ba72d2a784dc  libseccomp-2.6.0.tar.gz
+# From https://github.com/seccomp/libseccomp/releases/tag/v2.6.1 (PGP-signed checksum)
+sha256  501f66c667225d53791b97e1d7cf85ab764c297d04881f60f38f451c4b0ee1be  libseccomp-2.6.1.tar.gz
 # Locally calculated
 sha256  102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  LICENSE
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index 26585b1887..e1d1271d71 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = 2.6.0
+LIBSECCOMP_VERSION = 2.6.1
 LIBSECCOMP_SITE = https://github.com/seccomp/libseccomp/releases/download/v$(LIBSECCOMP_VERSION)
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
