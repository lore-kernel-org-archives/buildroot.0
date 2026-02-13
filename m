Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BCFEF99D3
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4E67847B9;
	Fri, 13 Feb 2026 19:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gxuMblmk2qPs; Fri, 13 Feb 2026 19:38:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBB4A84825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011536;
	bh=+XQ43l60X9QaNrkC/X2wLVWqIQGnFs6u5hyluMAo8dA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mxUS5rw9Ia1rjrAt7em5a0N6V1LqOZjVQOtjibz4HOsZuI1JXyNvS1Qwv1jGn3T+U
	 JuKuuvVdYB7zjDEtg3kVVq3V7+8HoyTjEyOMj/ZiPYP93B5tJuku92Z2HBgEsjzMYh
	 U77b4PmHDgUI9/xt90dNnEZnBejP8+RyS0hxv5zaAdPvRhmmH2UTwTsJ7nOLv6HE8n
	 Cn+fyuoVtfPE2JfFaDQtdPXRA9nKvspzZakkGiZaSc8ZwNQZ9qN02q8/NU877LXrLv
	 ywVpJ9//WxThA2unJepi2xg4ta7fH4lTlRfJRqy3Bfn2IenAeNAlrHCnNt7r+P5tmU
	 7RIhQSpKxUjTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBB4A84825;
	Fri, 13 Feb 2026 19:38:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 732F2EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 642AF412D0
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H5RulkrNTH8v for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D345413A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D345413A8
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6252383DBC; Fri, 13 Feb 2026 19:37:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:32:54 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: af208ccb898cd0eebaeb9515f685165c8adfa5cf
X-Git-Newrev: c2a4bdd8e1c9c9521b123ab9d14494505529fbd7
X-Patchwork-Hint: ignore
Message-Id: <20260213193704.6252383DBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/mesa3d: fix
 aarch64_be build
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c2a4bdd8e1c9c9521b123ab9d14494505529fbd7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Buildroot commit 1b8d7e7bedb204b6fb1094a57822a4652206b44a bumped the
package to version 23.2.1 that contains the upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/77826e835243291df664ccf2a7b8405287b72387#e65744354fdd7dd38342b138e59e40767cfcdaa9
which causes build errors on aarch64_be.

The build error was first seen by the autobuilders with mesa3d-23.3.3:
https://autobuild.buildroot.net/results/b62/b62eba2155b080ed02fde774994f2fffc8a6ef51/
according to https://autobuild.buildroot.net/?reason=mesa3d-25.3.4&arch=aarch64_be

A backport to LTS branches should be considered.

Fixes:
https://autobuild.buildroot.net/results/efd/efd07d97df4e0c1ceb07fc26e17898afef5435b9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Romain: update the link to autobuilders mesa3d & aarch64_be issues]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 32c6fffd414df733b2b35b2baac886e6dcbfd271)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...blake3_neon.c-only-for-little-endian-arch.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/mesa3d/0004-blake3-add-blake3_neon.c-only-for-little-endian-arch.patch b/package/mesa3d/0004-blake3-add-blake3_neon.c-only-for-little-endian-arch.patch
new file mode 100644
index 0000000000..5e4c89b714
--- /dev/null
+++ b/package/mesa3d/0004-blake3-add-blake3_neon.c-only-for-little-endian-arch.patch
@@ -0,0 +1,47 @@
+From c4292cc5af3278b294c2baa5464c9985228205fe Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 3 Feb 2026 20:13:49 +0100
+Subject: [PATCH] blake3: add blake3_neon.c only for little endian archs
+
+Fixes build error on big endian archs:
+
+Build machine cpu family: x86_64
+Build machine cpu: x86_64
+Host machine cpu family: aarch64
+Host machine cpu: cortex-a53
+Target machine cpu family: aarch64
+Target machine cpu: cortex-a53
+[...]
+../src/util/blake3/blake3_neon.c:6:2: error: #error "This implementation only supports little-endian ARM."
+    6 | #error "This implementation only supports little-endian ARM."
+
+as detected by buildroot autobuilders:
+https://autobuild.buildroot.net/results/efd/efd07d97df4e0c1ceb07fc26e17898afef5435b9/build-end.log
+
+For reference:
+$ grep -i endian output/build/mesa3d-25.3.4/buildroot-build/cross-compilation.conf
+endian = 'big'
+
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39681
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/util/blake3/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/util/blake3/meson.build b/src/util/blake3/meson.build
+index bd51cfb68c3..767da2c6ec3 100644
+--- a/src/util/blake3/meson.build
++++ b/src/util/blake3/meson.build
+@@ -35,7 +35,7 @@ elif cpu_family == 'x86'
+   # There are no assembly versions for 32-bit x86. Compiling the C versions require a different compilation flag per
+   # file, which is not well supported by Meson. Leave SIMD support out for now.
+   blake3_defs += blake3_x86_no_simd_defs
+-elif cpu_family == 'aarch64'
++elif cpu_family == 'aarch64' and target_machine.endian() == 'little'
+   files_blake3 += ['blake3_neon.c']
+ endif
+ 
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
