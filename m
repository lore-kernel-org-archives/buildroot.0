Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16D1C02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 15:18:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E5A284E41;
	Wed, 22 Jan 2025 15:18:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qiVgPWaed8Ah; Wed, 22 Jan 2025 15:18:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46A9484EB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46A9484EB4;
	Wed, 22 Jan 2025 15:18:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 974C7D7
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75C6484B0B
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8osmH1iVEbGo for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 15:18:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FB8484AAC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FB8484AAC
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:18:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D1A681103; Wed, 22 Jan 2025 15:18:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jan 2025 16:11:47 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 207c07d1555149f1bb1dada44161b75fb2dd76c9
X-Git-Newrev: e85f37c892bf27b3e5e96513894bd73b0e2b4bde
X-Patchwork-Hint: ignore
Message-Id: <20250122151822.7D1A681103@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/curlpp: add patch
 to fix build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e85f37c892bf27b3e5e96513894bd73b0e2b4bde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

curlpp is broken since the bump of libcurl to 8.10.0 in commit [1].
This patch backport a pull request from upstream from [2] to solve it.

Fixes:
    https://autobuild.buildroot.org/results/4a4d3b248898f0e73620fcb1a7a94dcfb6e6866e/

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/d68b999787a0e0838c3bb2d5966f11d8a349a49b
[2] https://github.com/jpbarrette/curlpp/pull/178

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
[Julien:
  - reword patch title one liner
  - add link to commit which introduced the issue
  - add link to the upstream pull request
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f06c28d1afef98e80f358c35ae65e035aa64f6ea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/curlpp/0001-fix-invalid-conversion.patch | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/curlpp/0001-fix-invalid-conversion.patch b/package/curlpp/0001-fix-invalid-conversion.patch
new file mode 100644
index 0000000000..e95e9cd7c5
--- /dev/null
+++ b/package/curlpp/0001-fix-invalid-conversion.patch
@@ -0,0 +1,27 @@
+From b945d57a5acd12bda320a63eb9e45bbb7586cdde Mon Sep 17 00:00:00 2001
+From: Aaron Smith <aaron@soccergeek.net>
+Date: Mon, 16 Dec 2024 11:48:33 -0800
+Subject: [PATCH] Fix "invalid conversion from 'int' to 'CURLoption'" error
+
+Use cast to 'Curloption' to fix compiler error regarding invalid conversion from 'int' to 'CURLoption'.
+
+Upstream: https://github.com/jpbarrette/curlpp/pull/178
+Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+---
+ include/curlpp/Options.hpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/curlpp/Options.hpp b/include/curlpp/Options.hpp
+index 40b64ed..292eaa7 100644
+--- a/include/curlpp/Options.hpp
++++ b/include/curlpp/Options.hpp
+@@ -308,7 +308,7 @@ namespace options
+ 	typedef curlpp::OptionTrait<long, CURLOPT_LOW_SPEED_LIMIT> LowSpeedLimit;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_LOW_SPEED_TIME> LowSpeedTime;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_MAXCONNECTS> MaxConnects;
+-	typedef curlpp::OptionTrait<curl_closepolicy, CURLOPT_CLOSEPOLICY> ClosePolicy;
++	typedef curlpp::OptionTrait<curl_closepolicy, (CURLoption)CURLOPT_CLOSEPOLICY> ClosePolicy;
+ 	typedef curlpp::OptionTrait<bool, CURLOPT_FRESH_CONNECT> FreshConnect;
+ 	typedef curlpp::OptionTrait<bool, CURLOPT_FORBID_REUSE> ForbidReuse;
+ 	typedef curlpp::OptionTrait<long, CURLOPT_CONNECTTIMEOUT> ConnectTimeout;
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
