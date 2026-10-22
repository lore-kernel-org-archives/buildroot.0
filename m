Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC14C606A31D
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TY3W4wiQ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2DA14077B;
	Thu, 22 Oct 2026 09:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e-bIe2oQJdEU; Thu, 22 Oct 2026 09:39:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C67F34061B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792661977;
	b=mDsTSuVQtErwqHBBug9tRIbpLxkwX3L3pAWrNtjk4a7zaE6kdGOvUK52OpylZpQaRV/L
	 rsm5oTLl/H//9pLTsjQgIcjhBTvZdd+gtRuSos9PgY2GAADaNQNolR2Uh7198mIkKWgPx
	 gkojJXtO9fqEKTBklcBXDWQXf142UKt94x4AZ1A6l2aHb3ZmmtFzvCLjPVNmYgVCqgSLJ
	 QB9fk0+jCC4s2YDgIdseC4/OWIKUG2ohBDeRnCaWIZZw6o+MYt5aqe6EKm5o5xIjd4p3D
	 gsrNpN+rO++1bDuZu8crQ9iV3TfpVsyJ1641btVXJ0TCBm828+04t3Mi0pGW2W5MhWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792661977;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Af8HbTvtbAFIzFg9PRoxpuC0MKVgPTRfBvdoz6AQ4kg=;
	b=mkMMG5lrzJJK49P0qyGAPrRHRs0FNLAHN9/CiedDegY/kifHUrVx6r9WFukM5HAna98f
	 utPAlXA71XBaFdwyAqIxlSXPSOC4N6EMVSzuBHwoiIJU+T75g0G5yI1pr08/xaT1g5/TG
	 daZ1+fwois2gU1fU+3Cw1cR6Vc5F+sJbkeAiN6SaxMTLQbhRCTajnHDjIosAQ2qsNBTKl
	 Ao4ZU57pv/eSI0qC2llun/q9xOSKHbZkgkTMPngwQ8pnP3mjA8YYIWVNguH8dYZ7h9f76
	 wAdEiR0WFTrwnE5+8HnOebbcDGyHvaLvFgPB6pM33XQ6SMrS0hck0ffM2HSE0mCHPew==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792661977;
	bh=Af8HbTvtbAFIzFg9PRoxpuC0MKVgPTRfBvdoz6AQ4kg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TY3W4wiQDH4zv4tPuLPjRMo7sMJ4CH8iCCYhpr02VuDXZpPM6fadVjEJlTCQkKm/l
	 PJtMn8jDzlxZKfg6qZvFsi9cGMOcAi+/9tinEW1yrVKBCD2V31KarX0RnhpMl0Ssv6
	 uAHpLQmsR1rTJK6EUJu6QvnT9dzjGAe5EXKIh5tdwlm0I2za6g1XPhHqMxRtQBrW4R
	 cEbD6YGsUbWR+QmQn9isX1k/QzIeQFVzpcD4xyAQ7KBcUZw0DCq4GpaZS2EWGRdGID
	 D9JvWyWOdroY7kolo57EMc7nrmZxMfjxCq6YgfHF5WSSk8GRBVkPexXTmhSLhMeg9r
	 fPK2toeK5Y+vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C67F34061B;
	Thu, 22 Oct 2026 09:39:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A45851AB
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A53D60823
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:39:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_3JYaSwYcQI for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 09:39:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B2C5D60606
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792661975;
 b=cbcRUOFwixGjj5ADUlAPxseuBCqskst4zpl8ImatymrjkZYBmeu5+NQyFhMOL2Vx118Z
 Z31d7qgDMHjRcGWY0v0QlQibyuxvWFgfWU6zykJRz5ieYKn6if4fbV+YmtoFMvrtXmCfF
 pHGqnz3KJgw87BT8lrJkbZ+nE6m97H2Ev8Fc/IdEiPeDMEc6QOxyjCf7l3xMn8SRFzM8Z
 oKZ7IXgYw0Wlxm9IMDPOwriHJhz/HPX30rDQhLOLv1jpjJnJytHbnUEbzgLZU+nYY/6A4
 Fc1EGFtzeDOrxa/ffywm/RI2QPUzq5Zwejve/yfRWaRbg+oUyypkwFuw0jvrWqC+o5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792661975;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=L5DPIHUhKXk/cMrlJlOM/4KBLy7lfPkhiYnuwH2OL3Q=;
 b=Cg2Zg4UayPC+gvtFGZnoGTIXcOUvM2uii/mea3KYQd38hNSMbQvODvlYTROBWQqrqCUD
 zAK6atkfGlvT+/MlE0ocdzSGlx/+4qjab8x9ZpbgVzSpq/ddSFItJ9MlGwlqgan0+/HZV
 Tdap/pbSkPzOSE1YCDlZNfaeSocKrvqV1mPK5TmbXrtnMgOiIpLKsRIPjyYgHPyWU6ysI
 3J841wfuVpHz2N9Y9hD7eLFZSdM73WQrEZDuwq7Uaw3Jrq08E8XhdSf1gHfKQQ96UqoW/
 J7w9vqa47DwNJOybM7CZnuaV+SSGr6d8oxN9VO/iL74mJpM31uW93JzEzMKv0pXk1zw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2C5D60606
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:39:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7F699B985; Thu, 22 Oct 2026 09:38:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 11:37:20 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d6061d653d7fb215c2409c59e4bfad1b9d677215
X-Git-Newrev: 6fb12d67a19a9e0923dab2ca772097fd92f93a4d
X-Patchwork-Hint: ignore
Message-Id: <20261022093811.B7F699B985@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] support/download: enforce
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y for missing hash files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6fb12d67a19a9e0923dab2ca772097fd92f93a4d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

BR2_DOWNLOAD_FORCE_CHECK_HASHES=y is supposed to make the build fail
if any download cannot be successfully verified against a known
hash. However, support/download/check-hash would only warn if there
was no hash file at all for the package in question, and allow the
build to continue.

This is a security fix and should be backported to all stable
branches.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 42340d022fdbbe900e69461228b0e61666785562)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-download.mk     | 1 +
 support/download/check-hash | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index b38f0c7053..896fb59def 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -116,6 +116,7 @@ define DOWNLOAD
 	SFTP="$(call qstrip,$(BR2_SFTP))" \
 	SVN="$(call qstrip,$(BR2_SVN))" \
 	WGET="$(call qstrip,$(BR2_WGET))" \
+	BR2_DOWNLOAD_FORCE_CHECK_HASHES="$(BR2_DOWNLOAD_FORCE_CHECK_HASHES)" \
 	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
 		flock $($(PKG)_DL_DIR)/.lock $(DL_WRAPPER) \
 		-c '$($(PKG)_DL_VERSION)' \
diff --git a/support/download/check-hash b/support/download/check-hash
index d18ec8b134..669c3a0d78 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -98,7 +98,7 @@ for h_file in "${h_files[@]}"; do
 done
 
 # shellcheck disable=SC2086  # nb_h_files is a non-empty int
-if [ ${nb_h_files} -eq 0 ]; then
+if [ ${nb_h_files} -eq 0 ] && [ "$BR2_DOWNLOAD_FORCE_CHECK_HASHES" != y ]; then
     printf "WARNING: no hash file for %s\n" "${base}" >&2
     exit 0
 fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
