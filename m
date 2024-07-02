Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64ABC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 06:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D94C81F72;
	Tue,  2 Jul 2024 06:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQVikTXUMcDN; Tue,  2 Jul 2024 06:51:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A984481F74
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A984481F74;
	Tue,  2 Jul 2024 06:51:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1736F1BF97C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1196C413E0
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id reC-6Ika71ia for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 06:51:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEFEB400C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEFEB400C6
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 06:51:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4D6A81F7D; Tue,  2 Jul 2024 06:51:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 08:48:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf24725ee3fad62c389eb3219b19cddb74044c0c
X-Git-Newrev: cea0cf39d4e477e97f7ae21eeca9853d04fd3e6b
X-Patchwork-Hint: ignore
Message-Id: <20240702065131.B4D6A81F7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/empty: fix patch fuzz
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cea0cf39d4e477e97f7ae21eeca9853d04fd3e6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update patch to apply with fuzz 0.

Modify upstream status information to match current practice.

Fixes:
http://autobuild.buildroot.net/results/dc119fed6ae341bc4b581e64148be414eedf4ef4/
http://autobuild.buildroot.net/results/3daba0971f422f2085bb152c0e97859ab980a9e3/
http://autobuild.buildroot.net/results/8353079e7b8ee8e2d431f99026c93ec3b0bcc239/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                      | 1 -
 package/empty/0001-respect-LDFLAGS.patch | 7 +++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a122f74bb8..949b7467cf 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -571,7 +571,6 @@ package/elftosb/0001-fixes-includes.patch lib_patch.Upstream
 package/elftosb/0002-force-cxx-compiler.patch lib_patch.Upstream
 package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch lib_patch.Upstream
 package/elfutils/0002-Really-make-Werror-conditional-to-BUILD_WERROR.patch lib_patch.Upstream
-package/empty/0001-respect-LDFLAGS.patch lib_patch.Upstream
 package/erlang-p1-sip/0001-correct-include.patch lib_patch.Upstream
 package/erlang-p1-xmpp/0001-fix-includes.patch lib_patch.Upstream
 package/erlang-rebar/0001-src-rebar_port_compiler-add-fPIC-to-LDFLAGS-by-defau.patch lib_patch.Upstream
diff --git a/package/empty/0001-respect-LDFLAGS.patch b/package/empty/0001-respect-LDFLAGS.patch
index b98af07eac..64e8b5ca30 100644
--- a/package/empty/0001-respect-LDFLAGS.patch
+++ b/package/empty/0001-respect-LDFLAGS.patch
@@ -4,15 +4,14 @@ http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/app-misc/empty/files/emp
 Reported on the Gentoo bug tracker
 https://bugs.gentoo.org/show_bug.cgi?id=429664
 
-and reported upstream
-https://sourceforge.net/tracker/?func=detail&aid=3554236&group_id=136798&atid=736886
+Upstream: https://sourceforge.net/tracker/?func=detail&aid=3554236&group_id=136798&atid=736886
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 
 --- empty-0.6.18b/Makefile
 +++ empty-0.6.18b/Makefile
-@@ -16,7 +16,7 @@
- PREFIX = /usr/local
+@@ -22,7 +22,7 @@
+ UnixWare-gcc OpenUNIX-gcc HP-UX-gcc SunOS-gcc
  
  all:
 -	${CC} ${CFLAGS} -Wall ${LIBS} -o empty empty.c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
