Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE29E87841
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7810440B85;
	Tue,  3 Feb 2026 15:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYzVyEokARPF; Tue,  3 Feb 2026 15:39:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0D55405E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770133159;
	bh=aimpqeuOjzY2u2JT25sfDAOjeb7ARSlcqxz6HukqGNM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AMVQZtbespL325D4O4JIeHS9MVaVVruypEVNVcKKi9h9N3vZeYwe5MD1K0JMz0uZC
	 SuT4bjt7RX+mhFCI2OWDFtd+Dh4R3jrxm9W8oHCFEB7rK1U6IJ6kpjknxypalXF3UI
	 KCMQIdImy+t4PthUylS2PXEPybvDLzsX/YN9p3ow0jK8GLkM5y7qiazjryk/Fc6uIY
	 2ggPKeUumh7uFuqvCjyMsjz6xme/XrvDrKa6664VAgXESOFj8SPf/z+w76du/5m4T4
	 vUgTxwfvA/nD4lgnPsRshatE/l9vR1b8A9YrulzXoaW6h/FkLwhF0sG4ZkPo4rSQHh
	 COuHDn8RIbZXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0D55405E9;
	Tue,  3 Feb 2026 15:39:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B38813D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 483486087F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id py3IXE2BbQq9 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8327960869
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8327960869
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:39:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 687A0866EF; Tue,  3 Feb 2026 15:39:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 16:14:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9171d2982b72f93b973bce6887bd87a91f5c3e1a
X-Git-Newrev: 37152aa6c3a755a89c6ab85338ebb7119fee2f22
X-Patchwork-Hint: ignore
Message-Id: <20260203153917.687A0866EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/aardvark-dns: add CPE identifier
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=37152aa6c3a755a89c6ab85338ebb7119fee2f22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cpe:2.3:a:containers:aardvark-dns:*:*:*:*:*:*:*:* is
valid for this package.

See https://nvd.nist.gov/products/cpe/detail/5F79D5CD-D716-4190-BE08-31EB5EEB233F

The CPE version strip the 'v' prefix from the version.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/aardvark-dns/aardvark-dns.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/aardvark-dns/aardvark-dns.mk b/package/aardvark-dns/aardvark-dns.mk
index 09a3a421f2..c0dc7eb2a7 100644
--- a/package/aardvark-dns/aardvark-dns.mk
+++ b/package/aardvark-dns/aardvark-dns.mk
@@ -11,5 +11,7 @@ AARDVARK_DNS_SITE_METHOD = git
 
 AARDVARK_DNS_LICENSE = Apache-2.0
 AARDVARK_DNS_LICENSE_FILES = LICENSE
+AARDVARK_DNS_CPE_ID_VENDOR = containers
+AARDVARK_DNS_CPE_ID_VERSION = $(subst v,,$(AARDVARK_DNS_VERSION))
 
 $(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
