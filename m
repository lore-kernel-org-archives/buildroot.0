Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BF0C02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 15:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D646F84B9A;
	Wed, 22 Jan 2025 15:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pEjXTOZWyIGJ; Wed, 22 Jan 2025 15:18:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DDC284E04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DDC284E04;
	Wed, 22 Jan 2025 15:18:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 654B9959
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 422044013C
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lPx_fbpPfB7 for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 15:18:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E964C403DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E964C403DF
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 15:18:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E07C786031; Wed, 22 Jan 2025 15:18:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Jan 2025 16:12:15 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 49a749fa54c260b74e9dac08bfe397142847afac
X-Git-Newrev: a1fae4305e15d9ea5a5f346d10566c6b61d5443f
X-Patchwork-Hint: ignore
Message-Id: <20250122151820.E07C786031@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/curlpp: add patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1fae4305e15d9ea5a5f346d10566c6b61d5443f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
