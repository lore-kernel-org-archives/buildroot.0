Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048FCCD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CADF2407D1;
	Sat, 30 May 2026 09:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V65Pdl2D-0Yy; Sat, 30 May 2026 09:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9E444062D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780132882;
	bh=py9K4wcrx7noBRZ13hiSMYKuNjPOWAY6COUzO1bvQyo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LPNl4Xg1Oxndz58lC/sh6GUUPVu7EHNhepS08y17QGy630KNKBtX44gye1YH4I6Bf
	 BbSm8etBI3pEX7HgQnsnKU77UHB5ieXXFiGeYSi0pIC5Era1H3P0cDXi9Bm6kbullY
	 5hplB3VSJsuV/KZtwrH0uB4gYXWT2bJyZM+vU1rOlqdz8MxDJZ3qOi92iWcpxSQe0P
	 nXR038q6a8j57v6zsiaUErbc6/S8JSTAoFkEFJpzq6BlyWBdmyxJGy2roxsVfoDvod
	 tydJguUUXxdW488rZYZpNCVxAtJ3LY1Ep4nDa9+CE58SGsDUsbmiJ/utkSRp6JiIhX
	 a2HzhiDVUsNvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9E444062D;
	Sat, 30 May 2026 09:21:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F259D12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3DAE6F49C
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btVXtj7yqBCU for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25E2F615F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25E2F615F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:21:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2999A81F81; Sat, 30 May 2026 09:21:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 11:19:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 723b321bb03d7526f7583d64ac1d34eca429920d
X-Git-Newrev: e7533662a4362a39cfe4f37b1fd840fcc711eeb1
X-Patchwork-Hint: ignore
Message-Id: <20260530092106.2999A81F81@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/dependencies/check-host-cmake.sh:
 verify version argument
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e7533662a4362a39cfe4f37b1fd840fcc711eeb1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When running 'make show-info-all' without a '.config', it is possible to
trigger this script without passing a version number.

The 'show-info-all' target is special because it forces the reading of
all packages without requiring a .config, so BR2_HOST_CMAKE_AT_LEAST is
unset and the script is called as:
  check-host-cmake.sh cmake cmake3

Without validation, the integer comparisons below would produce errors
like:
  check-host-cmake.sh: line 37: [: cmake: integer expected

It's possible to trigger this by adding the following file somewhere in
you path:

cat >/bin/cmake3 <<EOF
echo "cmake version 4.3.3 CMake suite maintained and supported by Kitware (kitware.com/cmake)."
EOF
make show-info-all

The same issue can also occur with pkg-stats.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 support/dependencies/check-host-cmake.sh | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
index fadeae9f6b..ca42df5113 100755
--- a/support/dependencies/check-host-cmake.sh
+++ b/support/dependencies/check-host-cmake.sh
@@ -6,6 +6,18 @@
 major_min="${1%.*}"
 minor_min="${1#*.}"
 
+# When running 'make show-info-all' or pkg-stats, it is possible to trigger this
+# script without passing a version number. These cases are special because they
+# force the reading of all packages without requiring a .config, so
+# BR2_HOST_CMAKE_AT_LEAST is unset and the script is called as:
+#   check-host-cmake.sh cmake cmake3
+# Without validation, the integer comparisons below would produce errors like:
+#   check-host-cmake.sh: line 37: [: cmake: integer expected
+# The following lines checks we have a single digit number from $1 before
+# continuing the script.
+[ "${major_min}" -eq "${major_min}" ] 2>/dev/null || exit 1
+[ "${minor_min}" -eq "${minor_min}" ] 2>/dev/null || exit 1
+
 shift
 
 for candidate; do
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
