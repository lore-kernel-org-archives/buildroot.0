Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B489C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C0A64FAB7;
	Fri, 28 Feb 2025 17:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWPbdCWCoCAu; Fri, 28 Feb 2025 16:59:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05BCD503D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05BCD503D0;
	Fri, 28 Feb 2025 16:59:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A40068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD1DF42E21
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ze_O8cZkzRdO for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44D8A419CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44D8A419CA
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 324E18118C; Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 15 Jan 2025 20:50:02 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e1ab408b1fa9b4777f0bef338bbd7cad17623eb3
X-Git-Newrev: f06c28d1afef98e80f358c35ae65e035aa64f6ea
X-Patchwork-Hint: ignore
Message-Id: <20250228163011.324E18118C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/curlpp: add patch to
 fix build
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

commit: https://git.buildroot.net/buildroot/commit/?id=f06c28d1afef98e80f358c35ae65e035aa64f6ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
