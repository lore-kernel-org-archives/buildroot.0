Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EAFD43343
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5391410DB;
	Thu, 11 Dec 2025 19:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V63zstSn8KJI; Thu, 11 Dec 2025 19:28:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACF8A410CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481288;
	bh=YDvxjsmC17v3n++0yzuhgtkRsZoLXvG6Didxu5iYxfw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ep+8oFhekXDngO8UGtrqXxexmMV3SOrC0X7qyZfJyg3zp1Af3zdAeBHEsqGvyEZuF
	 ZWQSmD/qCZuPzauL4CXN2XJdxhYCPAWG7wu9QDA7snvGnqLTpJYQwrYXFBg1n2+XE0
	 q0XXZvn+Z27zFLP0YvBHia42bEWGkw2veyV/bkXKBiRt7D/OGftbuVvj67AjkGMQqU
	 Z0JWlXcc144TFdSdqzK2WlPvxT31WabOBIIO4fkTEYxpbddF4PS0Eg75pVtkqCRGPH
	 xIiF9wVTZEZJauY4sujw7uA/s5aYBxnUP7wfODs3QFJlGSo34ZvCrUcLSSpRwcdxEi
	 G6mc8r4QmuGbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACF8A410CB;
	Thu, 11 Dec 2025 19:28:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7248EE7
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EA924007B
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uak3JMT6iwTY for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18908400B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18908400B4
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1811386B46; Thu, 11 Dec 2025 19:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:22:10 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1c44a81679bfce4926b3e3f68bebc9eb0627f912
X-Git-Newrev: afdebefb0bb144df34af1b19c66a2dfb19fdfb81
X-Patchwork-Hint: ignore
Message-Id: <20251211192747.1811386B46@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libdbi: fix small
 typo in Config.in
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
Content-Type: multipart/mixed; boundary="===============3615760164641988178=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3615760164641988178==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=afdebefb0bb144df34af1b19c66a2dfb19fdfb81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

When browsing the available Database packages, libdbi appears in the
menuconfig as "lidbi".

Fix the menuconfig entry by updating the relevant boolean name.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 4d016a1d98f7cf850ee83d5c2003a2b66c72675b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libdbi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdbi/Config.in b/package/libdbi/Config.in
index 13ac344f82..d9a1316311 100644
--- a/package/libdbi/Config.in
+++ b/package/libdbi/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_LIBDBI
-	bool "lidbi"
+	bool "libdbi"
 	depends on !BR2_STATIC_LIBS
 	help
 	  libdbi implements a database-independent abstraction layer

--===============3615760164641988178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3615760164641988178==--
