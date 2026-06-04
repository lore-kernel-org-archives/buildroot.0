Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241FBCD8C82
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE55140F76;
	Fri,  5 Jun 2026 12:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g80Wzx9X4UHV; Fri,  5 Jun 2026 12:38:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 146C740F62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663098;
	bh=bbSvXGGnGT92fu4R++tF9dD+ly9JpHoNZHYdqziqPcg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PHDnmAXYyhT8QcCQlilqB8YDC1PjyVElMZkv13coooefT0Q6pdspPYDhlbC6PDl05
	 I3NYF4i+VtgOSYUBiVXIBDIxNy6eRrR8b3unGPJ49gmYuVMlsvQDFtI383ud2Peo3x
	 sIIxQ8YNqTlaIMcXM787uJFFp0L4tL6+R1v5kycafJZE4z8zfeSBr0i800ibAnMYRv
	 SDpJnwrte8v9IsV4sPZMMcwNlJwsM4CgY8qZ80N8XFNQVDshebzxA6o50QKTdGQQlH
	 91eWaHmd3JWTKwvT+wcnThVrY+/Tf5gTUjsOuKlIEbPqTVdzZ4Ka55kfSZH2r/Wg0V
	 iEchuJ9TPRP6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 146C740F62;
	Fri,  5 Jun 2026 12:38:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DC90F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1212681E79
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VHD5bg1uN6p for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3A2081E50
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3A2081E50
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDA9087B2D; Fri,  5 Jun 2026 12:37:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:01:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d0f7c24f3356ef59b1cf5631d92731ed02d414ea
X-Git-Newrev: cff587367ed936e63df466c4c25eb96af203a062
X-Patchwork-Hint: ignore
Message-Id: <20260605123712.CDA9087B2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 support/dependencies/check-host-cmake.sh: verify version argument
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cff587367ed936e63df466c4c25eb96af203a062
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit e7533662a4362a39cfe4f37b1fd840fcc711eeb1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/dependencies/check-host-cmake.sh | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
index c7aa16f48d..18088ab669 100755
--- a/support/dependencies/check-host-cmake.sh
+++ b/support/dependencies/check-host-cmake.sh
@@ -9,6 +9,18 @@ minor_min="${1#*.}"
 major_max="4"
 minor_max="0"
 
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
