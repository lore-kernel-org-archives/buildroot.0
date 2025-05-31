Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483E0C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D0E740869;
	Sat, 31 May 2025 16:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id grgVLaWAIpVN; Sat, 31 May 2025 16:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C9CF407D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C9CF407D1;
	Sat, 31 May 2025 16:41:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B47E9235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A664440660
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6aXqhwOA_kKr for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:41:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B07A040659
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B07A040659
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B07A040659
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:41:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AB0CA1C0D6C; Sat, 31 May 2025 18:41:09 +0200 (CEST)
Message-ID: <3e75f47f-f8ab-4078-82c7-63fe54d49b80@rnout.be>
Date: Sat, 31 May 2025 18:41:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
References: <20250524080446.1185955-1-thomas.perale@mind.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250524080446.1185955-1-thomas.perale@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748709669; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=sMQTgw3F04iAwnqNPGcIM2WXPuyJKnF6bQ15BSTF4DU=;
 b=NY+amZrC7wLQ1QtY1k1PHU/R+Dhw1Hr+6w0Z9H9D+I1EaSJnhn4VIazzBU+jk5u6W7LhRt
 sNv+g3ooRHZfK+rIzbOo/Vr3STnt7lNbnm+hjJQtJlIdZKd89WxwEWniTYI9j6wXEahCg0
 /t1njxzaVlvABcSQhlWHa9xUUk/uzIG0MgoxbuW6UpB1meEeBDnIm9mv3jvWht5SKsVCI1
 eHZlW5ddNbxNzazt1XmZiFCmX2WKLDZqQhIGuWqWyC8fP0nZT5iKML7opo7ine/blko86j
 BQW7zQIShvCNJZVQfV997hBL5p+cAfntfOvA//NA8qZHRHN7rjjoHc6XDAcIRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=NY+amZrC
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/libical: fix deprecated
 CMake 4 policy
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/05/2025 10:04, Thomas Perale via buildroot wrote:
> The commit [1] updated the version of libical to version 3.0.20 which
> included a number of build fixes for newer CMake version.
> This patch is not included in the 2025.02.x branch and libical remained
> subject to a number of build error with CMake 4.
> 
> This patch backport the fix to remove the usage of the now deprecated
> CMP0005 policy with CMake version 4 (see [2]).
> 
> [1] 8cdeeb536c package/libical: bump to version 3.0.20
> [2] https://cmake.org/cmake/help/latest/policy/CMP0005.html
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   ...ger-support-old-cmake-policy-cmp0005.patch | 42 +++++++++++++++++++
>   1 file changed, 42 insertions(+)
>   create mode 100644 package/libical/0003-cmakelists-txt-no-longer-support-old-cmake-policy-cmp0005.patch
> 
> diff --git a/package/libical/0003-cmakelists-txt-no-longer-support-old-cmake-policy-cmp0005.patch b/package/libical/0003-cmakelists-txt-no-longer-support-old-cmake-policy-cmp0005.patch
> new file mode 100644
> index 0000000000..6e21c6d6df
> --- /dev/null
> +++ b/package/libical/0003-cmakelists-txt-no-longer-support-old-cmake-policy-cmp0005.patch
> @@ -0,0 +1,42 @@
> +From 7f07ace91faa8b1d578bf5bac2987660f91f31ca Mon Sep 17 00:00:00 2001
> +From: Allen Winter <allen.winter@kdab.com>
> +Date: Sat, 14 Oct 2017 15:49:54 -0400
> +Subject: [PATCH] CMakeLists.txt, src/test/CMakeLists.txt - no longer support
> + old CMake Policy CMP0005 ISSUE#315
> +
> +Upstream: https://github.com/libical/libical/commit/7f07ace91faa8b1d578bf5bac2987660f91f31ca
> +[thomas: backported to v1.0.1]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +
> +---
> + CMakeLists.txt          | 1 -
> + src/test/CMakeLists.txt | 2 +-
> + 2 files changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index d5aad80c..e2d5de72 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -50,7 +50,6 @@ project(libical C CXX)
> +
> + if(COMMAND cmake_policy)
> +   cmake_policy(SET CMP0003 NEW)
> +-  cmake_policy(SET CMP0005 OLD)
> + endif()
> +
> + set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules)
> +diff --git a/src/test/CMakeLists.txt b/src/test/CMakeLists.txt
> +index 322b5e40..31ab6199 100644
> +--- a/src/test/CMakeLists.txt
> ++++ b/src/test/CMakeLists.txt
> +@@ -6,7 +6,7 @@ include_directories(
> +
> + set(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_BINARY_DIR})
> +
> +-set(TEST_DATADIR "\\\"${CMAKE_SOURCE_DIR}/test-data\\\"")
> ++set(TEST_DATADIR "\"${CMAKE_SOURCE_DIR}/test-data\"")
> + add_definitions(-DTEST_DATADIR=${TEST_DATADIR})
> +
> + macro(setprops _name)
> +--
> +2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
