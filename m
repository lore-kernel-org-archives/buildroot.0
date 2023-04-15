Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9769AC77B70
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 18:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0145284353;
	Sat, 15 Apr 2023 18:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0145284353
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m06WxdDutnsN; Sat, 15 Apr 2023 18:02:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D2D984271;
	Sat, 15 Apr 2023 18:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D2D984271
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FDA41C3F78
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 18:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4412A42898
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 18:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4412A42898
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J2yTYnbhq9Nr for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 18:02:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2169742893
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 18:02:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2169742893
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0DC24841E9; Sat, 15 Apr 2023 18:02:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Apr 2023 20:00:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8a1bb2f639c5fcfa0e455c001c44799abbd407e
X-Git-Newrev: fdd9772739f3e8263fe711cf14aa4d01e37b9aac
X-Patchwork-Hint: ignore
Message-Id: <20230415180219.0DC24841E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] checkpacakge: regenerate ignore list in
 reference build envirnment
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

commit: https://git.buildroot.net/buildroot/commit/?id=fdd9772739f3e8263fe711cf14aa4d01e37b9aac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 1ed07521322d (.checkpackageignore: add entries missing Upstream
trailer) regenerated the list in a local environment, which differs from
our reference build image, causing spurious issues [0].

Regenerate the list in the regerence image, now.

[0] https://gitlab.com/buildroot.org/buildroot/-/jobs/4119717539

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 4847cd82bc..02c892c1b3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1106,7 +1106,7 @@ package/netatalk/0001-Fix-setting-of-LD_LIBRARY_FLAGS-shlibpath_var.patch Upstre
 package/netatalk/0002-etc-uams-openssl_compat.h-fix-build-with-libressl-2..patch Upstream
 package/netatalk/S50netatalk EmptyLastLine Indent Variables
 package/netcat/0001-signed-bit-counting.patch Sob Upstream
-package/netopeer2/S52netopeer2 Variables
+package/netopeer2/S52netopeer2 Shellcheck Variables
 package/netperf/0001-src-nettest_omni.c-fix-compilation-with-GCC10.patch Upstream
 package/netplug/0001-makefile-flags.patch Sob Upstream
 package/netplug/0002-add-missing-time-include.patch Upstream
@@ -1570,7 +1570,7 @@ package/swupdate/swupdate.sh Shellcheck
 package/sylpheed/0001-harden-link-checker-before-accepting-click.patch Upstream
 package/syslog-ng/0001-fix-build-on-uclibc.patch Upstream
 package/sysprof/0001-define-NT_GNU_BUILD_ID.patch Upstream
-package/sysrepo/S51sysrepo-plugind Indent
+package/sysrepo/S51sysrepo-plugind Indent Shellcheck
 package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch Upstream
 package/system-config-printer/0002-configure-accept-non-system-cups-config.patch Upstream
 package/sysvinit/0001-Makefile-disable-stack-protector-strong.patch Upstream
@@ -1636,6 +1636,7 @@ package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch Upst
 package/uhttpd/0001-Remove-Werror.patch Upstream
 package/uhttpd/0002-Fix-TCP_FASTOPEN-related-compile-error.patch Upstream
 package/umtprd/0001-Fix-output_dir-make-dependency.patch Upstream
+package/unbound/S70unbound Shellcheck
 package/unifdef/0001-Makefile-fix-error-on-install.patch Upstream
 package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch Upstream
 package/unscd/S46unscd Indent Shellcheck Variables
@@ -1854,6 +1855,4 @@ support/scripts/setlocalversion Shellcheck
 support/testing/tests/core/post-build.sh Shellcheck
 support/testing/tests/package/test_opkg/post-build.sh Shellcheck
 support/testing/tests/utils/test_get_developers/0001-package-binutils-change-.mk.patch NumberedSubject Upstream
-utils/brmake Shellcheck
 utils/checkpackagelib/lib_patch.py Flake8
-utils/test-pkg Shellcheck
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
