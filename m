Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A49CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 14:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4EB5408D3;
	Sat, 10 Oct 2026 14:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iu1q1OfNc3Fp; Sat, 10 Oct 2026 14:29:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 64396408D7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791642563;
	b=pTHDS1lWT9ecOfddVGKDK6NG9J6+SWPQn4wqmrDoQdu5jtUQp0Enr9M7JV9Uk7hCA/Qy
	 buH4wis3k9rvSWvxjzjVixxD79ZPfVGYRT+rWsqS6w78i6HNoyLs/nt8/5cXOYjLIK8/Q
	 czTLu2Chc6kaP6c2P3A8QfpQZq3ej62yIb7AyKc2uj/QmitJVpCDRCDynoTuvn7NSo+H4
	 oKWvQQR06WKIK3lDM2AKzJx0I3QiH8rHtB+kzHixDvVhTgy2tnT4UX61p4tGvhublUTXP
	 8JpA6PfIhGyoIv7zQJSzuBERAWdBU4+l58IZYTivuKocynuR8DkSSS4E8vY+/nwlceQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791642563;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nv1yu3BwE0ecPY5gOTGiQU6mCiCTa0ICibcbBZbHgog=;
	b=ma8qxGvKDkmE6BmKpzvC80n4H7aCAFgSSS6K8nEGIb6/qHWH8IFY9C74RuWnSe8+l7zo
	 4T/VbrqN4FxHDzxDDT17RslKew+BDOOxcm1F7pCtFPbg9XeQ34UU02tOB/VV9F7LUIg2y
	 k8PhLPO8G5e8yV9e1ywqFN+hT7fmvGmiKD0gygeM2FAL4lKb7YUoWJVdQ9Z7tjvDktvfn
	 UbQUXBxSacCWQOYWjrgwdUstM9uFBbhczGiXCw//3ZRTgCU0hKyM8mCuhWRMcnRlNuid3
	 VCCSXeI2mn5LeJDyZIYXjS1PFJAuzRfICvXvaq0XeBeJr7rUVqLSF6J/0G/TlDNYatA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791642563;
	bh=nv1yu3BwE0ecPY5gOTGiQU6mCiCTa0ICibcbBZbHgog=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=orHJWGREXhIM9KSq4Unr8dJCdyfpxs0oLH0mmw1PG8QcE9WneYW3uzwUYGCvaKPMe
	 /HIlV7gVR4VYoOcexJzzsNwI4IIowmqVf8VvXiF/rHyRGWFO+aQ0qBKG0eW9EGUXnu
	 VKS+dZmqYqFMMmOm/9GQt8Et565s7dKwy1p5xivwFJIkgVnB4rA7aG2m9qNhpJOFd/
	 x48bud6+lCrVpP/+hpN9DzBQG6WLM5tMHr7iwNcpMLjKkTti+ngKgfCm9tALH+yKIL
	 WW2gNVfOPO6Zj+x8BdZfjDq2tAnq5n2TXOT1NysE5cDAVW8BAiD0kdwYRFiYz6MY5p
	 RjOTabb2SeZ+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64396408D7;
	Sat, 10 Oct 2026 14:29:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DE28317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A326F6064F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVTbcj2RXwvj for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 14:29:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CF9AB6064B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791642558;
 b=AGw57Pf0dKjIZ6rHbYzKiGkcvMo/RSgH4OB9tO2Qsc0rwuBNCp/wgHRtG2xto+fSTLnE
 2uoJF5HtBnrnpmCAZg7e3agthPaCRg+//UBrvXsabUMQ23KSXjLeIDLzRckz+LqyJb4Ss
 CNuMWlei59+vuLxmmyILWJVP1O2TQmpC4297it8FkQmWMz+Xlk9tY8tZA77ubKmhEbfkb
 uoMyDAeuKcseXiU0rIj2BQ5ZRrXZ2OZwFM6DN/nzIxNJou8Fmg7eAk4NThZI1DC5kZdps
 sqUDH5NiLuckn0S0nZzHLAHEPvwiS8E21UMBnsVPriV3jrTiqUMdTq/LZcD7or5pnxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791642558;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Cf2uWeodKi7v0iVzmxScEkubFzVd+HzoxmoH3K/7poE=;
 b=LXxIPrXm9VhEMXFLlSo7Ru8w8eMisiIZwAqNkfJyE9nadAxsgQOcCfiOeXNVRzuPdHXo
 vL4woZDF6S9rJgdIFMz6hxvPhpem2xz/EhPA4Pj9i5V7gX9woh/fQoDpei+H8gWkKnDzn
 n9Xa0op5hTfeUq0XlqFKU3XBK75Y4WiBszly5xRfamEPi+ENZTQ2t9Vfk4oDoYmXHdkb9
 1+AG/y/t8892hRibyzxlPoxcaIg5lmdgxMHlzMKzVTSzkCm58WgoeutPSL/PKTCjAE8PX
 047Yf1aUhj/BLPRScc1U/c2WfiZN4VAjw9j4SCT6pyIj59mwFjAK7cJAGSGFLNxlO5g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF9AB6064B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:29:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CBCC92082; Sat, 10 Oct 2026 14:28:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 16:28:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39235638d171f433b3790c6cf9226dec728cd105
X-Git-Newrev: ce4fc125fb32510c1378cae250040ecb9c8fb25d
X-Patchwork-Hint: ignore
Message-Id: <20261010142800.9CBCC92082@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlitecpp: needs threads
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ce4fc125fb32510c1378cae250040ecb9c8fb25d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

SQLiteCpp has an unconditional dependency on threads.

fixes:
br-test-pkg/br-arm-full-nothread
https://gitlab.com/heinemml/buildroot/-/jobs/16865965420

The problem exists since the package was added in Buildroot.

Fixes: e74059b39ce2f ("package/sqlitecpp: new package")
Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sqlitecpp/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sqlitecpp/Config.in b/package/sqlitecpp/Config.in
index 31de9a3904..614c46cb54 100644
--- a/package/sqlitecpp/Config.in
+++ b/package/sqlitecpp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SQLITECPP
 	bool "sqlitecpp"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA
@@ -10,5 +11,6 @@ config BR2_PACKAGE_SQLITECPP
 
 	  https://github.com/SRombauts/SQLiteCpp
 
-comment "sqlitecpp needs a toolchain w/ C++11, gcc >= 4.9"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+comment "sqlitecpp needs a toolchain w/ C++11, threads, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
