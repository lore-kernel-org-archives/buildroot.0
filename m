Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BA4606A33D
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OGMW2qbE
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CF7040940;
	Thu, 22 Oct 2026 09:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-ol8twJtHgD; Thu, 22 Oct 2026 09:34:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4638A4099A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792661692;
	b=DVb9r6yZPuuRKU+YFZ1rFw3osx3SCfCSu+5c502Cm9Ptkz5IogMpZZpXxEGjxhnN6zyd
	 bkyupe4gsphmClSH7HIW3GGB/HpE5tVyxGd40UUZuDkjc3e/KyS9ej2zumMV9bbbSCgUa
	 M3rJ3gCmIwRJ0fgrl2X6bSwegjSeFiie/XdyL3M40ux0bolxcW92Rg0zt3avhkMdNnPuB
	 JR/EGRxTQ9q0Q77F7D6/tJ+EfCNwwWy4TTmSNeTHpCIfspz8QYeVrEbLev0bJgJR4DRid
	 B/JZnS33j9uTmX19/rKKbXTqYjgY2gDw8z9E1SFU03CWgcpT4fIFnNnAX27GLMw84sA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792661692;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BEzwDOzSm/b8CuCCUOCgdi/dmu7R+5MCbFeM6+a4ZCg=;
	b=Ujid3Q77YsLZ6FID0h3jUYU+2KfyznK5VHedClcTxtmxpJzWj8DGpdF/LyEc6iu747fM
	 pZqf0yX4r6hp7SzeBVAwmssDjzgBaNCXPmNAPGd1Opovc37aCXXrGNJmSNm8cVkAcswpH
	 MDgAdkCOtKVfflnu7l/52NN90gnt2K1i83koYeBkfwKW01PzBzKSWEv2FPGQm+6Spy/s2
	 Fe9EVrAvZeb0uKmIe18cESFNGY8UgM2VDM/zRvhA+kwHiKqEQZnXl1BCPIjY8mFW3KvGM
	 MnfdmvlHKFZRzenpAkZXm/g4sySJWiOjWVUsrai7PlwuU2qrEHY4nR+WMIZ2WE1ScDw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792661692;
	bh=BEzwDOzSm/b8CuCCUOCgdi/dmu7R+5MCbFeM6+a4ZCg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OGMW2qbETPwbKE8PrxPto9TfvOS712SrOiPa91Z7TQH8hkjzLgs6Lgyjk797RdrSf
	 HszOo2mXtLKqJBBEcTihdzyKIACREgfVsqqql67LuUuicib8ptuf0PC9MsPo2BicDD
	 7jghnyXfIjeUhWTpy5KzmL81irqyjDEmoMf8LDpJswj6mZ5drRbiICgrN/3imQ679F
	 Mq0RJVCq4N0RKYjUVea26V9e3VrJGIwzx2vbmlZBb3IUtifn4eRup3UXY1/wqiDKd8
	 Dl9/NtpV4cdVe77AvZnKEoOrhBJL9o9E2zmwPQYvfp3qgC4zZtxzTXEtwhzthHVBHG
	 kLTioPa5aAXug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4638A4099A;
	Thu, 22 Oct 2026 09:34:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FA0095C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56132811CD
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FuRGSy7busST for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 09:34:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 99C3B811C9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792661673;
 b=DOwTqIpmiBffpzr3p25vNCENNyY7W2gccUZWO8t/IsDr3SZ3bZML/2gx65RYo1nvtACu
 ukwDHT8n0atH+xK2uwLsT6zUmFRQVAjnAw0euuH9hcGeBdmAy9KoIIAKx8d9teT48MNIR
 wSQFNeVJnufdmytcn0CyPvJsnTC3P9QR7qtn6c+CoMGZw8m8FvUg7h4A+n3FJpFhtC0EY
 IRvbAxfd2K8um6fa8KbICOLjeLYR2NiDK5lc7yDXznWL9z21LDWeQ9dGBcPU4amaZNWZS
 YTlnEHSfZKNQCLizErtwrKyXnL9ReS6yNTOXw8bZZj7AIQJ79jTISWGm68A9riadKmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792661673;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=xb6fWNRmFRn3TnMN43whafdWZ+ilY8GTYIGc5fk+xrs=;
 b=KWhg0qAyKaoZhimXQX8ouRP/uNMRkmk3F+QNrtElQzh3DcXMJkUmvkOk+Z3pGKpIHy7s
 JLTBAXqaipfh7NNVPR4mKg++4T3tF7if6D/jaj8s+CPBPpUHcishyClnD+rF/5q2uM2Sm
 J7gnF7v4yW3mLeUVpmfGMPwLxoiY9ULt3BKY4LguyvlTgupCG93VmXOLoPBHN2NQFKqdr
 wKfcYDH+RP/UJAEPwbk487X6mIimw/Dt+e+8lZQqVwsWjqixmt7ZEUXRtWZbYKMDvQWyq
 iRj7g1ZkBY63WZqkTangrxtQa89UvgqJQpSCXULiyv5BBpl/jJl9w6Qu3QfnRb3pgZA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99C3B811C9
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E8B99B988; Thu, 22 Oct 2026 09:33:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 16:55:02 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cffa4cbb83b2679a83cae3afe3bf1aef099b14be
X-Git-Newrev: 21906a939671219829f6ba1d669a32f537b978ba
X-Patchwork-Hint: ignore
Message-Id: <20261022093309.8E8B99B988@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] support/download: enforce
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
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/21906a939671219829f6ba1d669a32f537b978ba
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 432f0a533b..cf62dc24ef 100644
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
