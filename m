Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA315EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B8F484598;
	Fri, 13 Feb 2026 19:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2jBTxpuL2IQ; Fri, 13 Feb 2026 19:36:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3113845A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011360;
	bh=8RYcDM74Ouwg2MCl6i75CCNYRG2zR6M4SYqqtMapI5w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pbzkE7367lxG889zS7f4Flau1ln1+OTs7kvfxtcDoqIF/ICbaRxjbx736JDPdH48b
	 4CTBXSMxm6o+jdsSp7Ba9UI4eus6n0XrGdW0RrroO2rWUt5bwE5QSJ7H9+6PbdqES7
	 sPw9RetXnDwXOyvfNr2fq1evw/l5NgULyZEgF0V8ZO6eOVlAzgWzkryjTeOqkkYdj9
	 L3FDTXR96qr7+MiNH9/AfwBBSt0rRWaRIpucE7N4S8L4lFqCGske9kW9bpWusRU2Ez
	 nMmv3Ld6ZqFNgmXlZ1AWS6s3DzvyhpGk2AFrXZ6yA30AUQXdivK/udcaAupiJhKLTe
	 dBH2UMUtcoGGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3113845A1;
	Fri, 13 Feb 2026 19:36:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03A5569
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E5C541E4B
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PthfpbC89Jl1 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FB6841E37
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5FB6841E37
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 545DF81EB5; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:00:37 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2d82944aae5ae25152422e608633ab7fbc498f34
X-Git-Newrev: f35b44d29bb327582821728d12eae4ef7e6d3f94
X-Patchwork-Hint: ignore
Message-Id: <20260213193528.545DF81EB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mp4v2: add CPE
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f35b44d29bb327582821728d12eae4ef7e6d3f94
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The CPE `mp4v2:mp4v2` is valid for the package mp4v2. See the latest
CVE: CVE-2023-33719 that reference the upstream repository.

[1] https://nvd.nist.gov//vuln/detail/CVE-2023-33719

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5a03ffed801f5558e334d0e0000668d6e3355af0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mp4v2/mp4v2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
index ae777cdc75..8d8e184b99 100644
--- a/package/mp4v2/mp4v2.mk
+++ b/package/mp4v2/mp4v2.mk
@@ -12,6 +12,8 @@ MP4V2_INSTALL_STAGING = YES
 MP4V2_LICENSE = MPL-1.1
 MP4V2_LICENSE_FILES = COPYING
 
+MP4V2_CPE_ID_VENDOR = mp4v2
+
 # help2man expects to be able to run utilities on the build machine to
 # grab --help output which doesn't work when cross compiling, so
 # disable it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
