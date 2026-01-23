Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6538FD6CFD7
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 12:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94B0440AD7;
	Fri, 23 Jan 2026 12:46:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11I_VeyxtbPT; Fri, 23 Jan 2026 12:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F4F540ACD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769172406;
	bh=ykmXxi4n+WOUeaCp8zBuhUutG/KSwwIY2lqnbig63gY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GcV2UQjisBHcJW9Frrq7iLki4mNR4RKyCx4c0B6L/nkRAghbzMhrOaJ+el4qWgCCQ
	 5VjxRuQWF9azBkCFevRzzdTC4gk4Qamgsh4pD2+AAQukN+NJZcelniGOlnWubIvMeZ
	 +i0oqTkNEZ8nGmz7UOkskqytMHZk6kKz7aP5ooIsqGeFOFPrzbTkrmpSut+tzvuXtg
	 bVzYmaV4/q90wYfB1KtFhQ5SErJ8SnKsLMaANM3ERlNqsLhR/Byb5n8N5bL6A/7OWw
	 aYvYBUSj+sWIf/pYoQ4otUa2bi/2vawRlJuqKr1kFnElB8JqfuFuen9WNaU6KODp4d
	 omGtNTghm+UQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F4F540ACD;
	Fri, 23 Jan 2026 12:46:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A7CE358
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 12:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73FD283BAD
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 12:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LLh7ZGwiWb38 for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 12:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4AC183BA9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4AC183BA9
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 12:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3C778761C; Fri, 23 Jan 2026 12:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Jan 2026 13:35:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80fa53a9ee40f6b6bd9956f9abc37cbc3a2c6217
X-Git-Newrev: d5e191fad75ddd88a3a0468fb0fe02f3ef258beb
X-Patchwork-Hint: ignore
Message-Id: <20260123124644.A3C778761C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmake: bump version to 4.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5e191fad75ddd88a3a0468fb0fe02f3ef258beb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://cmake.org/cmake/help/latest/release/4.2.html#id2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 7724fc4e85..32c334c928 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.2/cmake-4.2.1-SHA-256.txt
-sha256  414aacfac54ba0e78e64a018720b64ed6bfca14b587047b8b3489f407a14a070  cmake-4.2.1.tar.gz
+# From https://cmake.org/files/v4.2/cmake-4.2.2-SHA-256.txt
+sha256  bbda94dd31636e89eb1cc18f8355f6b01d9193d7676549fba282057e8b730f58  cmake-4.2.2.tar.gz
 
 # Locally calculated
 sha256  1e0d48f16c60f400838a96989684ae12cec35cb96688db11e8cb0204058cf4b8  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index ef4f6aa98e..63ddb927fc 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 4.2
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
