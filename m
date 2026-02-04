Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC06E9D416
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:07:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01007610E6;
	Wed,  4 Feb 2026 17:07:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOSMtkrmpyA5; Wed,  4 Feb 2026 17:07:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E261160D76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224821;
	bh=h4zLYRBNirVlN/CmMaKlc1OHWo16lLvZK9kQtxjwqDs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LDSYX9txWYPDOhwupnNjMG4eTzjmiw93ViNonmLjirT+/89XKBGuj2DtvGHPSGTe1
	 r/ZlmU0ylEob8vXJEfeJ08uESOZGMOSwlkxi0nfqHIr17/MsMNsFyzpwYiF9pRvySs
	 8PP6uHAKPstr8TgSvIUSLZKnQirxAAuOIsqmOOh46mdkNXwjEdFPkKqsGPBiugdpis
	 4m0EYGAaPKHRjajJUZmIgFgNxHmfggu4UUR+/WLwgHwMBPHrbO9FZR8OACSMeGetrQ
	 Eq+FgteWTMgcf2pzvv8NIxTeLOryt1xzUe7N6B/0YWCXzlD8uAhOgEN/HoF+PYv4Qi
	 UxiVaggTbUPOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E261160D76;
	Wed,  4 Feb 2026 17:07:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2CE12173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 676CF605A6
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CgowGSYi5fBB for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84A9E60609
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84A9E60609
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5F7687FE79; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:28:13 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 503b13b3cab0734a2af842aedd9f89c6b33a40ec
X-Git-Newrev: 6adc876f41e720a9d917e2514eeb6f2603e7d9be
X-Patchwork-Hint: ignore
Message-Id: <20260204170637.5F7687FE79@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python3: drop
 unsupported system ffi option
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6adc876f41e720a9d917e2514eeb6f2603e7d9be
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The --with-system-ffi was removed back in Python-3.12.0, in upstream
commit [1].

From the Python 3.12 release notes:

  - gh-100540: Removed the ``--with-system-ffi`` ``configure`` option;
    ``libffi`` must now always be supplied by the system on all non-Windows
    platforms.  The option has had no effect on non-Darwin platforms for
    several releases, and in 3.11 only had the non-obvious effect of invoking
    ``pkg-config`` to find ``libffi`` and never setting
    ``-DUSING_APPLE_OS_LIBFFI``.  Now on Darwin platforms ``configure`` will
    first check for the OS ``libffi`` and then fall back to the same
    processing as other platforms if it is not found.

Buildroot includes such a Python 3.12.x version since commit [2].

When compiling python3 in Buildroot, the package configuration step
reports the warning:

    configure: WARNING: unrecognized options: [...] --with-system-ffi

The commit drops the now defunct option.

[1] https://github.com/python/cpython/commit/25590eb5dee5176f3ac60916b19450f8198e7ffc
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/76cd14167f5eb3ffe22e131ddbbecf9bc61f2ef1

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
[Julien: add links in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a7a3621c0b45cd76255f018a2ab3718a14f0dadb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python3/python3.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index b4c3cc9a9c..4ace4d8573 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -199,7 +199,6 @@ PYTHON3_CONF_OPTS += \
 	--without-ensurepip \
 	--without-cxx-main \
 	--with-build-python=$(HOST_DIR)/bin/python3 \
-	--with-system-ffi \
 	--disable-pydoc \
 	--disable-test-modules \
 	--disable-tk \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
