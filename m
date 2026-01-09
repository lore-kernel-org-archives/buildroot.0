Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B82D2D0FC
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 706E383EBF;
	Tue, 13 Jan 2026 19:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TAlvjGin4SKR; Tue, 13 Jan 2026 19:41:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AE3783EB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333278;
	bh=rnfNlWeu1ITwUD7xw3QSxpneQT/cv0XB+UzJ3i7JWwA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rpU7aoZJ3OUgJRSSO6JlB9vtYICdctgsYbdRltuJEgkufT1sb1v+4PC4uve28n+fI
	 L3svHcW5LRK3qfYd0H3RRzHXBxUfqmud2aLd4vgnec1DDhCnb474QwCQU2+qInuZo6
	 DzGN8l4381PiGRuw27aNUmNwrRzrUhfBsliiiuh0Hz0Z6OUmCBCbW2qP9nc+VmDwyj
	 n+JnGF2tQ/ih+b2h/RkiJn/Fn6Zf0Sc6OuPO/nt63awTeD7dv7wrvvU/A/HHcGfTOC
	 8u6DH85TL8AV8I5AnsOGWkZu69LixXNADNI78Jx7MqB/XsdlxbmkZhAB1JogOg+yHN
	 oelkhGaAWAFwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AE3783EB5;
	Tue, 13 Jan 2026 19:41:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E2A9D1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB901406E0
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xlaaOI-Mj2U for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CBE1406ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CBE1406ED
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B0D180840; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 17:00:36 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 76ba19668bf02dfb3d9d3e94a8a6da948e1e7906
X-Git-Newrev: b5ddb8b79450b49b2a4705bb436692c1228360d5
X-Patchwork-Hint: ignore
Message-Id: <20260113194034.4B0D180840@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libcpprestsdk:
 add dependency on Boost.System
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b5ddb8b79450b49b2a4705bb436692c1228360d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

libcpprestsdk searches for the Boost.System module in its
CMakeLists. Hence it should be selected as a dependency.

This does not fix any build failure, as boost-system was implicitly
selected by one of the other boost-* options that this package
selects, but an upcoming commit is going to change how boost-system is
selected by other boost-* modules, making this preparation change
necessary.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c659e0383d8f66b9bf89b5a30de89476ef48d5bc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcpprestsdk/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcpprestsdk/Config.in b/package/libcpprestsdk/Config.in
index e533b30393..7688021ed0 100644
--- a/package/libcpprestsdk/Config.in
+++ b/package/libcpprestsdk/Config.in
@@ -13,6 +13,7 @@ config BR2_PACKAGE_LIBCPPRESTSDK
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_RANDOM
 	select BR2_PACKAGE_BOOST_REGEX
+	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_OPENSSL
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
