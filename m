Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A30CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAC9841991;
	Fri,  5 Jun 2026 12:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qQ64s3pmiUH7; Fri,  5 Jun 2026 12:40:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBA9641977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663226;
	bh=160V3Pz5ZOdZpzk64a+iDibwg6bGp/Fm8r+YeSW2cz0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ItMCk1SYZUgMIUuabR9U16dOrfLzWan487u/uOdmKrEuQQesY7jQEoST/++o4n8gK
	 uIXr35h/WMYTtcU5aSE2WqIf2Yo7HqELeVqrX1Y9D+Q8/7MPY7c8U1Cu2Mcx2cmIQm
	 E2Tl35c1IP9Vwb2m9oQA828Kn7WcrbcvVl2/IcuaXr9y62+MO2oKe0JpUSDrIANdK4
	 ZshT+l25S9Lu+t64etmWDT58ndi5PI5w34s8vkXb/bmNdEElxEDGRZ2voDyq5QwbPr
	 HptTxymW9NfreHuSJgnnHJAvQwnwRt2hb0LPh5hrj8sTtsvSZHyB8wcNXQjtn/c4pc
	 kq69k3Idxv24Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBA9641977;
	Fri,  5 Jun 2026 12:40:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 043FF3B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 493A4410A4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mzBOe7RqMe8Q for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5BA741050
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5BA741050
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BA57872F5; Fri,  5 Jun 2026 12:38:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:55:55 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: ba410d9a153d24c7c2cc2c2995d9b2adfa24e869
X-Git-Newrev: 2a9e6de11c5840b2dca8019973af704dc9a2a3b2
X-Patchwork-Hint: ignore
Message-Id: <20260605123837.1BA57872F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2a9e6de11c5840b2dca8019973af704dc9a2a3b2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
