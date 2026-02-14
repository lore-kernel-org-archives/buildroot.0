Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE9DEF48C4
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 11:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9523A40ADF;
	Sat, 14 Feb 2026 11:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oHUZjRSkzpjx; Sat, 14 Feb 2026 11:23:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C09940AA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771068222;
	bh=+Jnx4FqkeW0WG4u+S3lfczMzRnd+gZ2AjFivIGibsBA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Anb9bHb9OAsWI9xRj5tPSeJbvmvTtP1/0MClyievVqVZepwkD7segZnPRFiX4N0tz
	 qv5qpphud2mm8BYSfknc6q1NM76xVH1rBbsV9GRWafqSopVV9O6Vgx15eemaK5cIxk
	 eUnmZFP/picOE1eRcxLb92naBPzbqpmeHVqpjkQQzMqdSRH/BoM0kW8Sv6uS7IMtwQ
	 We0mR3qjTly9+SwFH/H/TUHd0D6rk/9ScUKf5uGWmTeuod+1jcum5wCB+NPs3nmgyM
	 G3JFH5hVlRnegJMr8rgkurutJ2vhhoB15L3LqBu6qfUG8SVh/90sas6wNiWZ/LFmel
	 nQXW9eBUDT3jw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C09940AA9;
	Sat, 14 Feb 2026 11:23:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 840B5270
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71B1E835D9
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OPzP3HAFhps1 for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 11:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4027D83521
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4027D83521
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:23:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2124186C9C; Sat, 14 Feb 2026 11:23:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Feb 2026 11:38:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49d1ea93f7d3ad8f7113cea39be4c39b4d6faca6
X-Git-Newrev: 764f9171bcbaf6ef94985adb1c42d4fc6b4b21cf
X-Patchwork-Hint: ignore
Message-Id: <20260214112339.2124186C9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18}.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/764f9171bcbaf6ef94985adb1c42d4fc6b4b21cf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  2 +-
 package/linux-headers/{5.10.249 => 5.10.250} |  0
 package/linux-headers/{5.15.199 => 5.15.200} |  0
 package/linux-headers/{6.1.162 => 6.1.163}   |  0
 package/linux-headers/{6.12.69 => 6.12.71}   |  0
 package/linux-headers/{6.18.9 => 6.18.10}    |  0
 package/linux-headers/{6.6.123 => 6.6.124}   |  0
 package/linux-headers/Config.in.host         | 12 ++++++------
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 90e2bf73cb..4352943b52 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4b493657f218703239c4f22415f027b3644949bf2761abd18b849f0aad5f7665  linux-6.12.69.tar.xz
-sha256  a616d4b5a18a9097e2df8e03dfd2ba366ddfc1321b16d648651dc512b3e945b1  linux-6.6.123.tar.xz
-sha256  9766422a49b9a24ea911ebc0b4e7d1f3d84fba3bc374387ae3c4bc60bec6d089  linux-6.1.162.tar.xz
+sha256  143e8bc76cc41f831b51aa5e75819bed55bed41f299d35922820f1d2d2b02600  linux-6.12.71.tar.xz
+sha256  a7aefb9f8e9be2314a66ccda708257d1c2dc04e68235cda987879597fc89794e  linux-6.6.124.tar.xz
+sha256  fd2d033321bd15e0ad5669208b6e43f3f93ccecb059a512ca6b913ca940c38ea  linux-6.1.163.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  01c0d3ae4c138a51891cb54d21374259fd07bfe1076e06362ec0ae0a822fbd2e  linux-5.15.199.tar.xz
-sha256  b990ed34261149542f932e5eaf1ba58535c5d48c147ae36bc2747c65e54d1046  linux-5.10.249.tar.xz
+sha256  fce4b1c86688880932ba8f755880cbf390a89453464bfd90b9a1b01a121c2998  linux-5.15.200.tar.xz
+sha256  47754da223a9f264b917be5d575a4dae03fc8777aa9e1b00473e973ee997d529  linux-5.10.250.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
 sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 105f025729..f7effa8edb 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  303079a8250b8f381f82b03f90463d12ac98d4f6b149b761ea75af1323521357  linux-6.19.tar.xz
-sha256  030115ff8fb4cb536d8449dc40ebc3e314e86ba1b316a6ae21091a11cc930578  linux-6.18.9.tar.xz
+sha256  d6d377161741ada2fab28eed69143277634a2aeb5e3883e50c031588ede48ede  linux-6.18.10.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.249 b/package/linux-headers/5.10.250
similarity index 100%
rename from package/linux-headers/5.10.249
rename to package/linux-headers/5.10.250
diff --git a/package/linux-headers/5.15.199 b/package/linux-headers/5.15.200
similarity index 100%
rename from package/linux-headers/5.15.199
rename to package/linux-headers/5.15.200
diff --git a/package/linux-headers/6.1.162 b/package/linux-headers/6.1.163
similarity index 100%
rename from package/linux-headers/6.1.162
rename to package/linux-headers/6.1.163
diff --git a/package/linux-headers/6.12.69 b/package/linux-headers/6.12.71
similarity index 100%
rename from package/linux-headers/6.12.69
rename to package/linux-headers/6.12.71
diff --git a/package/linux-headers/6.18.9 b/package/linux-headers/6.18.10
similarity index 100%
rename from package/linux-headers/6.18.9
rename to package/linux-headers/6.18.10
diff --git a/package/linux-headers/6.6.123 b/package/linux-headers/6.6.124
similarity index 100%
rename from package/linux-headers/6.6.123
rename to package/linux-headers/6.6.124
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b9c86168be..09c6cb724b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -464,12 +464,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.249"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.199"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.162"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.123"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.69"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.9"	if BR2_KERNEL_HEADERS_6_18
+	default "5.10.250"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.200"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.163"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.124"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.71"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.10"	if BR2_KERNEL_HEADERS_6_18
 	default "6.19"		if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
