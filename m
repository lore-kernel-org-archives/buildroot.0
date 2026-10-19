Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E3F606A31D
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 19:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fGq9itoE
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B3C8404C1;
	Mon, 19 Oct 2026 19:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AripU5VYvYRi; Mon, 19 Oct 2026 19:30:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7ECF140540
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792438242;
	b=DAXlHfPx4N0JebbB0uSCZhMBsvWfzp6Aw3SUCD72fqZPLO3agZoyKOa86qLg07oc3RUU
	 jQBJQFg29uHrTfvJAgtTvUuhQywV3++lHY5BMDrbAM7vDJwbSCC693A7V1XboSXMNBa06
	 e4gJNR+0O4bHcpyPbs9u2rWbJ1MgJ9aBG0Gnk9gg1FVs9hRrVKRz7L7C3StQKbu2XYO+5
	 eUXf0wN6I9tPW3aBEnX96s9wkqdrXLZNhoxr+7KMquD9CjjIjQ8WUxxSmRrkh10SFY3/0
	 nRh9fQhWlU603nZafqY0kVHc4dPXVEXptWRy6b+oyvEHpxUbXcm+mns1Q9keAFu334w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792438242;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=hhgnvI1gZ2m5INpcPXHRU249Yhoo1Fbx0oqBV00HYEY=;
	b=DZE4Huz+/dPf96S7pQ2jUkyOQjPMQuFG5Bmy1UqgEkZgDyl0monskdp5AafDiR1DrpQ4
	 caIXrl9CeQdeoBfqFVz728RCHNm+SLVAGIKZOnHRordLgMu3Vgix6SRZIKVsjbWR2Ffsh
	 rkB15lzsX1jsqhUXccPl6kEPmU6r0TSqijZTTz3psqMHoXEw6i5PAuofaUGGSyE3P2q3I
	 T0a9a7VhZRhNDARuPZ2io6o+dRY8B/j+RlHMXlrNi5qI6VC6ABMq6cWg2A25Qqaw8Ctr1
	 c/cqOF1kPI4TzMtpMReHr+beKr49AlM8jtmKvYLKfbSwQkeiaaBInNCq/4Ug8aX+e4w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792438242;
	bh=hhgnvI1gZ2m5INpcPXHRU249Yhoo1Fbx0oqBV00HYEY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fGq9itoEugzBH7ALQ7XAcWrvykpHScMpLx0syRiU2qlWXmbl54ZSH2zWAQf2+fXVr
	 4D5/LQW/y7fN285xUOOAfjtY5jo5AgHV5qN3kqeDhzIAeQLzQkf3yb4iflTOMrsj/Q
	 u17x2YAo1CljUsqSSeCVt9yt46Yv6hAK/RVpcL+QJouvAdK2hOQESrOaIW0yuFIMsG
	 JgTPAvjn+uM2TMqAcm7sSlx4frizFd3C0mapEJTT4j2MikqDotVkAFqDsIJPTURkPC
	 Nbet1YQ7nuOiUPGywh9RxP8TpT70Ch3OEeY3uj8wPAI5mHqNxhtGGM8+m3TZsnF4ua
	 Kt8x0kscjeBYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7ECF140540;
	Mon, 19 Oct 2026 19:30:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C8321E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E924606D3
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CBH2coBryljD for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 19:30:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 3B52E606DC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792438240;
 b=RihULJvEMIu4cZ3xFoN/Rqwp9qsYEPIw/5bag7vS+fc/SD4dMdS7Ui4hJPCOtdb7Fk60
 EUW+x4NmP5vv13+cdY8C6JkqRqcQcntKBsmHRmTqg91uGWILwuoWeJPwbqLcM3rMv4400
 A7oC1o10MwU4k202VhubaJjubIffzGrELkQpbAo8vO6CI8dEFrE4BaWQ9QlATfp/VBJ39
 /SPVavaS0Q+t/gPOUVdqNF7Q9X73sT+OC2R5kfT5IsSBM2HdsM8fOCyUn+6bvD/s7U+IO
 lpeDbtP1nwK6FbapT7Dy5KHCTL3TURg6maWyuDMKb42a68pumJnzD45m5WtDFetGYTA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792438240;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Zw+oL0+JHT7trNSGVx115vRtHPQbrOi76uDQNjhIDto=;
 b=jQoQnyijeTVP42cJEAb9wsvvMCDPGo+R3CfWh7lF8PxUxebnH4ZxOgx/Zh3Ou8uJn7LI
 szSC+dad15CuHnffmFsb5o8sYVWETP3ZS3vtLDjl7xzUvLXFGQbHZ9vdxCG1JNKpEpA3v
 C86LY0UHqCcTSQ4ecDhLnxUY5NF7y0pXhpvMnLOkXCPpGi3ga1ZpCPIDzzg59mWAWfqtn
 WJH3Wj0F3zF/dfppXHmR1bIQPUlX7JvtECw+Xhl1qaKINO31qnZCxB+k5jgT0EIBIox3i
 UMLLR2TcwrET1U8Hwbo6qAhGaKfEfWV+kwYyS1uMO8pveFtEXx1Ygi0ElYAPRtbJyRg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B52E606DC
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:30:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8904B995AF; Mon, 19 Oct 2026 19:29:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 21:21:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4eeec84c3341715e0436e40f94b31379f227000f
X-Git-Newrev: 24590006a64e09a52ea6ed254c706877b9706e61
X-Patchwork-Hint: ignore
Message-Id: <20261019192917.8904B995AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-update-modules: add missing
 BR2_USE_MMU dependencies
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/24590006a64e09a52ea6ed254c706877b9706e61
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM selects BR2_PACKAGE_RPM without
replicating its BR2_USE_MMU dependency.

BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU selects BR2_PACKAGE_SWUPDATE
without replicating its BR2_USE_MMU dependency.

This commit fixes that by properly propagating the missing
dependencies. There is in practice no functional change:
BR2_PACKAGE_MENDER_UPDATE_MODULES depends on
BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS and go is only supported on
MMU-capable CPU architectures. But since there is no formal
relationship between BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS and
BR2_USE_MMU, automatic validation cannot infer that
BR2_PACKAGE_MENDER_UPDATE_MODULES cannot be selected on !MMU systems.

Fixes: a474642fdcd8c69e12126bbe8304479aa855d916 ("package/mender-update-modules: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mender-update-modules/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
index 88e0805976..dac83c47ec 100644
--- a/package/mender-update-modules/Config.in
+++ b/package/mender-update-modules/Config.in
@@ -208,6 +208,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	depends on BR2_PACKAGE_LUA && !BR2_PACKAGE_LUA_5_1
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # rpm
 	select BR2_PACKAGE_RPM
 	help
 	  The Rpm Update Module updates software on the device using
@@ -220,6 +221,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_RPM
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/rpm
 
 comment "rpm needs a toolchain w/ dynamic library, threads and lua >= 5.3"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
 		|| !BR2_PACKAGE_LUA || BR2_PACKAGE_LUA_5_1
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
@@ -228,6 +230,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU
 	bool "swupdate"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # swupdate
+	depends on BR2_USE_MMU # swupdate
 	select BR2_PACKAGE_JQ # runtime
 	select BR2_PACKAGE_SWUPDATE
 	help
@@ -240,6 +243,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_SWU
 	  https://github.com/mendersoftware/mender-update-modules/tree/master/swu
 
 comment "swupdate support needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_STATIC_LIBS
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
