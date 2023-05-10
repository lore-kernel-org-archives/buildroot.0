Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C39DC77B7D
	for <buildroot@archiver.kernel.org>; Wed, 10 May 2023 20:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41A357007C;
	Wed, 10 May 2023 20:44:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41A357007C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6sjOdrnSC8-U; Wed, 10 May 2023 20:44:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F7E070067;
	Wed, 10 May 2023 20:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F7E070067
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 843241BF349
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 20:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B5348419A
 for <buildroot@lists.busybox.net>; Wed, 10 May 2023 20:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B5348419A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A0dalaJhSAzR for <buildroot@lists.busybox.net>;
 Wed, 10 May 2023 20:44:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2CA184196
 for <buildroot@buildroot.org>; Wed, 10 May 2023 20:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2CA184196
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C99F862FF; Wed, 10 May 2023 20:44:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 May 2023 22:43:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19f5a10f49c35cd392eea623102b2d280d7d2d9a
X-Git-Newrev: 9482a4c6e581ceba9ff3fc37022e3f0981993bf7
X-Patchwork-Hint: ignore
Message-Id: <20230510204417.8C99F862FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/edid-decode: overwrite warning
 flags (fixes gcc-4.8 compile)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=9482a4c6e581ceba9ff3fc37022e3f0981993bf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Overwrite default compiler warning flags to fix gcc-4.8 compile.

Fixes:

  http://autobuild.buildroot.net/results/fff2cadaee1fa8c028ac558e852f7e52b1c8317b

  .../bin/arm-none-linux-gnueabi-g++ -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -std=c++11  -Wall -Wextra -Wno-missing-field-initializers -Wno-unused-parameter -Wimplicit-fallthrough -g -DSHA= -DDATE= -o edid-decode.o -c edid-decode.cpp
  arm-none-linux-gnueabi-g++: error: unrecognized command line option '-Wimplicit-fallthrough'

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/edid-decode/edid-decode.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
index 247ed207d3..cc9f2c1629 100644
--- a/package/edid-decode/edid-decode.mk
+++ b/package/edid-decode/edid-decode.mk
@@ -12,7 +12,7 @@ EDID_DECODE_LICENSE_FILES = LICENSE
 
 define EDID_DECODE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		CFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+		CFLAGS="$(TARGET_CXXFLAGS) -std=c++11" WARN_FLAGS=
 endef
 
 define EDID_DECODE_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
