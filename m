Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CA7CFCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 036F441E92;
	Fri,  6 Mar 2026 19:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zInafcRod3qf; Fri,  6 Mar 2026 19:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F05EE41E6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826666;
	bh=PIvsOyyQ1wm8uC5a4Hp0qV4pMP7/eIWSytqlmOrsTU4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WfUazjTpHtI0jwq4vMz6YqY+JOe2deBPn0VFY1GW8hrAU39gW1dXndZcX5nGVkOAY
	 jTwmCf9jyWqs5oZTUKPI81PS9D/ez4+f+SnqRuqaskvjYIXpG6EtDcC6dMeCa6D9oK
	 gSyXiI8uKjQgNr4ZzWXMM+epP0hB1CJZLyq3iCrtR0+rK6d8b3u1r4CKMLpwmhPcPs
	 yAfUqFBSgySq4k6kNj6ZJSnNat5nUsHkha5Hfm64FWUOOhgSA9TzFVdqynCU1X/59D
	 o4gTBzDDK5LKiLbsa+e7Na4LUspG5z8imWayR1WmrWKuvSNjyFPR+t5dndKvvj8efB
	 zPI5lD5k2O+Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F05EE41E6E;
	Fri,  6 Mar 2026 19:51:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DFCD223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D263C613C9
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NvxKHVip23Uf for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:50:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A3D2613DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A3D2613DD
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF937855F0; Fri,  6 Mar 2026 19:50:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 14:04:24 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: e3ba0684d454f80527b8823c9aec184d97e756c5
X-Git-Newrev: e379349510cc79c33ea0b5f60aba7e99e781106a
X-Patchwork-Hint: ignore
Message-Id: <20260306195050.AF937855F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/poco: enable
 parallel build
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e379349510cc79c33ea0b5f60aba7e99e781106a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Buildroot commit 126162b9159a185ac1897db1a9956f0379fc1428 disabled
parallel builds in Jan 2017 due to a bug which was fixed upstream in
Nov 2017:
https://github.com/pocoproject/poco/commit/1724e8ba53d05ce688dcdb5176b128f116af2682#diff-76ed074a9305c04054cdebb9e9aad2d818052b07091de1f20cad0bbac34ffb52
https://github.com/pocoproject/poco/commit/076dd9679bf2e77f1df219287f0eb42ea36b7371

Building with -j100 worked.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2a1e6376c1718bf8a22ee53755d7e5da23babc6c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/poco/poco.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index a471a24adf..fe1dd29855 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -77,9 +77,8 @@ define POCO_CONFIGURE_CMDS
 		--no-samples)
 endef
 
-# Use $(MAKE1) to avoid failures on heavilly parallel machines (e.g. -j25)
 define POCO_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
+	$(TARGET_MAKE_ENV) $(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
 		POCO_MYSQL_INCLUDE=$(STAGING_DIR)/usr/include/mysql \
 		POCO_MYSQL_LIB=$(STAGING_DIR)/usr/lib/mysql \
 		POCO_PGSQL_INCLUDE=$(STAGING_DIR)/usr/include/postgresql \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
