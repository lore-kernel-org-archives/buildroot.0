Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E94C5DF66
	for <buildroot@archiver.kernel.org>; Mon, 17 Aug 2026 17:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C91E080FA2;
	Mon, 17 Aug 2026 17:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UeY6LAlpxXdP; Mon, 17 Aug 2026 17:50:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A40CA80E4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786989005;
	bh=YLOM0jnJpBAQbd3PHe0R7oTcopYPkUp7kVSYw5woS1I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XfjFcRosLTjcAico4k3SZ6W60UTrLBq5jztvHrEYPQPsos4mXr5SFToFgHT2yz1Yh
	 ENhecGeJvwEl2CVzxCdoRTfnCZa27BGjWHap2zzQnRayro4RwKcUopMPABKAtne4y1
	 jfH7gr19LuVQt0hzO6CUvTFQwVtLfpEIl+pRSU9hppMf/YghsMXMX5D+w5lnjug7j3
	 8gqCTu1wQ4LV3IjKqPO7uTAqIjYQu9R8KjDZbw9wkVHC09gWFAf5lTU9+7Uz3py12C
	 q4i5d0d9kdidfKUmZ6oK1yBvpq+7Avt0d9BLhIt9F0jloWxfYn4F9GSWt0AySKdk05
	 RXoRTVCCrOvjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A40CA80E4D;
	Mon, 17 Aug 2026 17:50:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9032B194
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76BC640229
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IeogcBeY3q5r for <buildroot@buildroot.org>;
 Mon, 17 Aug 2026 17:50:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B754E40204
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B754E40204
 for <buildroot@buildroot.org>; Mon, 17 Aug 2026 17:50:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12D4B8D312; Mon, 17 Aug 2026 17:49:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 17 Aug 2026 19:27:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2d757b1df003e135e4a431ac19f8750dcd4ab64
X-Git-Newrev: ec8f1b03e61e865a93c9253b1a57431cfa573f1d
X-Patchwork-Hint: ignore
Message-Id: <20260817174912.12D4B8D312@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: decrease debug level for CGO
 linking
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ec8f1b03e61e865a93c9253b1a57431cfa573f1d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Workaround an upstream issue that arises when packages are build with
gdb -g3 debug level:
    https://github.com/golang/go/issues/77436

This has been fixed upstream, but is not released yet, so add a comment
stating when to remove the workaround.

Fixes:
    https://autobuild.buildroot.org/results/97cd9c2586a0cc2a16cdb2a75dae1836feb5ffc3/
    (and probably a lot more...)

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Christian Stewart <christian@aperture.us>
Cc: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/go/go.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index a64d7538f8..265d3aa880 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,6 +4,9 @@
 #
 ################################################################################
 
+# When bumping this to 1.27 (or beyond), remove the workaround for
+# upstream issue https://github.com/golang/go/issues/77436, below
+# (i.e. revert the commit adding these lines).
 GO_VERSION = 1.26.5
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
@@ -75,11 +78,14 @@ HOST_GO_TARGET_ENV = \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
-	CGO_CFLAGS="$(TARGET_CFLAGS)" \
-	CGO_CXXFLAGS="$(TARGET_CXXFLAGS)" \
 	CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
 	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
 
+# Workaround for https://github.com/golang/go/issues/77436
+HOST_GO_TARGET_ENV += \
+	CGO_CFLAGS="$(subst -g3,-g2,$(TARGET_CFLAGS))" \
+	CGO_CXXFLAGS="$(subst -g3,-g2,$(TARGET_CXXFLAGS))"
+
 # Allow packages to use cgo support if it is available for the target. They
 # will need the toolchain for cgo support; for convenence, include that
 # dependency here.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
