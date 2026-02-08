Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F95EEF06E3
	for <buildroot@archiver.kernel.org>; Sun,  8 Feb 2026 12:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 352FC817E4;
	Sun,  8 Feb 2026 12:15:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVHMb8GiHG-l; Sun,  8 Feb 2026 12:15:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B792181778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770552926;
	bh=SJF4KFNF6U5IV2xnNb+7GEIJiaZlTh1/ch0yCz36omg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XNlZRuUBNh6INRvhWNjel8Gm0PrgimQdkUk7y7NaM4YEvlInjqiaF0ugzylqGf6iV
	 xy/9/UzMkgLifzv44lfh6wdu6YShZmE5uzYT+YSVMgG5bjneconLVwaNjgrvRc19p3
	 8jtInWT4KtjsX1r2obnNEIOxZAUE51qtpF/xPzSpmoSMrlv2cEVdrcrDoLEmgcmcg1
	 S5EY2eVa1SWXdXMLMAwlK7Y3PAETEHvl6TZnCxTw4uRdlBsTJEp6mtloZTsTELFibU
	 UY703pQGADew1KGgOWuWrkkzsBLnli1BCh6NBj/fXynxDPV1mvsbHhKFPsnu4QMoZg
	 tPTQvIty9lvrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B792181778;
	Sun,  8 Feb 2026 12:15:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B398D1A9
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 12:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1C176073E
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 12:15:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYNpmh_0q4aw for <buildroot@buildroot.org>;
 Sun,  8 Feb 2026 12:15:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E53F60735
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E53F60735
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 12:15:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C86283A69; Sun,  8 Feb 2026 12:15:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 8 Feb 2026 12:55:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16a0560152c65b0c312912188573e9def9374654
X-Git-Newrev: f18b4289d7391bce788a8ff3fea7be82e18c4b8f
X-Patchwork-Hint: ignore
Message-Id: <20260208121523.8C86283A69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/meson: fix build error
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f18b4289d7391bce788a8ff3fea7be82e18c4b8f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit eb1f160b7a08537fdfeb0800b9240a497f4237ac bumped meson
to 1.10.0, this release includes upstream commit
https://github.com/mesonbuild/meson/commit/35193dd8e4f2a24ae689eeb8d01a2c3bcca11025

This commit caused build errors
https://github.com/mesonbuild/meson/issues/15497#issuecomment-3812709660
which were fixed by an upstream commit to the master branch:
https://github.com/mesonbuild/meson/commit/c1db93be859b360b64fe20d49a286278b56df64e

This patch adds to upstream fix to buildroot.

Fixes:
https://autobuild.buildroot.net/results/aab/aaba3d6a9d55c3e8030d3e3487bf93074a4deac1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...d-do-not-fail-if-only-the-build-machine-u.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/meson/0003-ninjabackend-do-not-fail-if-only-the-build-machine-u.patch b/package/meson/0003-ninjabackend-do-not-fail-if-only-the-build-machine-u.patch
new file mode 100644
index 0000000000..22f9ace42e
--- /dev/null
+++ b/package/meson/0003-ninjabackend-do-not-fail-if-only-the-build-machine-u.patch
@@ -0,0 +1,45 @@
+From c1db93be859b360b64fe20d49a286278b56df64e Mon Sep 17 00:00:00 2001
+From: Paolo Bonzini <pbonzini@redhat.com>
+Date: Tue, 3 Feb 2026 12:56:36 +0100
+Subject: [PATCH] ninjabackend: do not fail if only the build machine uses C++
+
+This is caused by the introduction of the cpp_importstd option; while
+target_uses_import_std() tries to protect from the option not existing,
+this does not work if cpp_importstd exists but build.cpp_importstd does
+not, and get_option_for_target() wants to look at the latter.
+
+Just return false on a KeyError for simplicity.
+
+Fixes: #15497
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Upstream: https://github.com/mesonbuild/meson/commit/c1db93be859b360b64fe20d49a286278b56df64e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ mesonbuild/backend/ninjabackend.py | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/mesonbuild/backend/ninjabackend.py b/mesonbuild/backend/ninjabackend.py
+index 42f24d47d..e0aaa39c4 100644
+--- a/mesonbuild/backend/ninjabackend.py
++++ b/mesonbuild/backend/ninjabackend.py
+@@ -3297,11 +3297,11 @@ https://gcc.gnu.org/bugzilla/show_bug.cgi?id=47485'''))
+     def target_uses_import_std(self, target: build.BuildTarget) -> bool:
+         if 'cpp' not in target.compilers:
+             return False
+-        if 'cpp_importstd' not in self.environment.coredata.optstore:
+-            return False
+-        if self.environment.coredata.get_option_for_target(target, 'cpp_importstd') == 'false':
++        try:
++            if self.environment.coredata.get_option_for_target(target, 'cpp_importstd') == 'true':
++                return True
++        except KeyError:
+             return False
+-        return True
+ 
+     def handle_cpp_import_std(self, target: build.BuildTarget, compiler):
+         istd_args = []
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
