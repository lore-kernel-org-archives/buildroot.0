Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B69DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 19:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 074D4815CC;
	Mon, 25 Apr 2022 19:36:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bdo0bOetyhnh; Mon, 25 Apr 2022 19:36:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3079281846;
	Mon, 25 Apr 2022 19:36:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29D591BF989
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A872E81254
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 19:35:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SKv6MxoZc9MA for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 19:35:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 018708125B
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 19:35:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CB9AB8430B; Mon, 25 Apr 2022 19:25:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Apr 2022 21:10:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa2a017ba911419bc5b54821888007fb3587a495
X-Git-Newrev: 9a890e68b6c19b273fc001fa0b2b7eac9bf3b19d
X-Patchwork-Hint: ignore
Message-Id: <20220425192517.CB9AB8430B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netsurf: fix build with ccache
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a890e68b6c19b273fc001fa0b2b7eac9bf3b19d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update second patch to fix the following build failure with ccache:

/home/autobuild/autobuild/instance-11/output-1/build/netsurf-3.10/tmpusr/share/netsurf-buildsystem/makefiles/Makefile.tools:413: *** Unable to detect toolchain.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/b4ba19d7dcff1b0ee2b1546598b5ae6e9257a16d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/netsurf/0002-do-not-cross-compile-nsgenbind.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/netsurf/0002-do-not-cross-compile-nsgenbind.patch b/package/netsurf/0002-do-not-cross-compile-nsgenbind.patch
index 2d4637511e..7caad47a20 100644
--- a/package/netsurf/0002-do-not-cross-compile-nsgenbind.patch
+++ b/package/netsurf/0002-do-not-cross-compile-nsgenbind.patch
@@ -8,6 +8,8 @@ the build, so it should not be built with the cross-compiler, but with
 the native compiler.
 
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+[Fabrice: add quotes around BUILD_CC to fix build with ccache]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -21,7 +23,7 @@ index f279f01..5698c87 100644
  # prefixed install macro for each host sub target
  define do_build_prefix_install
 -	$(MAKE) install --directory=$1 HOST=$(BUILD) PREFIX=$(TMP_PREFIX) Q=$(Q) DESTDIR=
-+	$(MAKE) install --directory=$1 HOST=$(BUILD) CC=$(BUILD_CC) PREFIX=$(TMP_PREFIX) Q=$(Q) DESTDIR=
++	$(MAKE) install --directory=$1 HOST=$(BUILD) CC="$(BUILD_CC)" PREFIX=$(TMP_PREFIX) Q=$(Q) DESTDIR=
  
  endef
  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
