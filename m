Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C95DC27C55
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 11:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BCBC427D2;
	Sat,  8 Jun 2024 11:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4fUac7I4R7U; Sat,  8 Jun 2024 11:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF53142801
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF53142801;
	Sat,  8 Jun 2024 11:40:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC6B61BF5DA
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 11:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6A4942725
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 11:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62W1RX_nUlhH for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 11:39:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91E4C4271D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91E4C4271D
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 11:39:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56CBD87B59; Sat,  8 Jun 2024 11:39:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 13:29:30 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: eeb0abb2e177f3c98778fe1af96bb613063d1308
X-Git-Newrev: 6cdbb9ae17c2f8b44e3a65f9ab8c2022b53d753e
X-Patchwork-Hint: ignore
Message-Id: <20240608113948.56CBD87B59@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/duma: set
 HOST_CFLAGS
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

commit: https://git.buildroot.net/buildroot/commit/?id=6cdbb9ae17c2f8b44e3a65f9ab8c2022b53d753e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Set HOST_CFLAGS to avoid the following build failure raised since bump
to version 2.5.21 in commit af2cd694e3903131d6e2f00646adfa83a89a23e2:

/usr/bin/gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -mlongcalls -mauto-litpools -O2 -g0   -c createconf.c -o createconf.o
gcc: error: unrecognized command-line option '-mlongcalls'
gcc: error: unrecognized command-line option '-mauto-litpools'

Fixes: af2cd694e3903131d6e2f00646adfa83a89a23e2
 - http://autobuild.buildroot.org/results/28be2acc6d58754c7431df81d0b63b30e6af8554

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b8c70f67017ebe08459992ac575ae4989243c232)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/duma/duma.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/duma/duma.mk b/package/duma/duma.mk
index 6bbdf41f4a..80fe8a5d64 100644
--- a/package/duma/duma.mk
+++ b/package/duma/duma.mk
@@ -20,6 +20,7 @@ define DUMA_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) \
 		OS=linux \
 		DUMA_OPTIONS="$(DUMA_OPTIONS)" \
+		HOST_CFLAGS="$(HOST_CFLAGS)" \
 		CPPFLAGS="$(TARGET_CXXFLAGS) -std=c++11" -C $(@D)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
