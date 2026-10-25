Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58626606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 21:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=X7K+HZTe
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C12260612;
	Sun, 25 Oct 2026 21:24:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fD8gK0kodJtC; Sun, 25 Oct 2026 21:24:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 44BD4605F0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792963443;
	b=KdB0a9hdeQXobZRPI+qybJQKPBkZc8nUBb9IsuhemaJaZ+o86QGWPVtQYidrf11Lzocn
	 93zoz9vgjPsCnrFZlsn5la+5AImnswt6HUt0vyNDrpCdNedrRa2YYMIRz5IcTDWefBSv6
	 XfuJphwB8PyOnb6kFoYxgkU6whpn+m7JkNLJA7ggupLwUqDmF1OOS8Mr4YQJnNrm6dqVE
	 6UxDLziy06g/snux78K9eBOe+njy6k/L2PqS7+nzblc7s1jfArbgS0q6P7WedN4XAin2Q
	 6sYzmghHike0OJycK7yyagMo2VK8vcwStAr2c4wMKWo5aJt/bPzGE4OgiuPV8U7iHWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792963443;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=b3+sSpB2EnPah8p4HLHiu+av+nbTJle1Mqxykm53Kes=;
	b=gexhojIx9UKUv1it+eiOucVQqEUbhVZ2htd29lzrApd+p7UnvfLJt2wbqgcs40QG0nt0
	 lM+/EAf9iwPmzmCt69+x07B6Ebg88bTO27p8POtLC8L1skkE7Nm8oV+E8qpvw2gydy2j+
	 zpQQrUvWae9geVdKjoX/u+6koj2ZbA04qrZNxwWtB85nrj+WsFWLxcO6X9i/na1VRAmR+
	 riMtjIzWUM7Yjd7ZEwBxIE/9ch8FR5X+pLWLoqVOJtfDvHnWajfDZYuFSF655VeugERnE
	 c1EYVO927XMNlc/B2/K7rP1fEIQlx2oae1BuwI4MsGohNoqxnm76wSw4uF4TRIvhwLA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792963443;
	bh=b3+sSpB2EnPah8p4HLHiu+av+nbTJle1Mqxykm53Kes=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X7K+HZTeoTDkr26FWbpwO7gxSUGLHufb728ztcvV8YTmEYW1Dk6tN37ax5IFRqYxp
	 YNA/K2olu/sjWNmepe3TaLUgY4Jl/TizHaew07po5M6LcCgsIk34BdDQM72K5NvsiJ
	 LLnWNY8lQi5c8iE5f8nGL5OZplgE2WZy7sQYT9d8RizvZRTLc0TTU9o6MajUxjn9gr
	 vPNLsJFm+e5eqFBzxXwjJaOgD+zaOTJz8e7oiGxjNgeoBmidVOV8eMnVi6EUA1qiSU
	 I8cOoNiNJajrJplKgH4CTj9dfQWr9RBJ8z80xJ8FZM0I/635ni0WPZF4wYNBOSNaSL
	 3QKB6efHTv3ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44BD4605F0;
	Sun, 25 Oct 2026 21:24:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 34F994D1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:24:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26EF340585
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:24:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCcnUYStNCG1 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 21:24:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6EEDC40588
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792963440;
 b=MwZh2HBioTdH7komEu4dN2ORzMlkMymVhAxh2LJb/7kykmDnDlplK5DsefctA+w7Rwzo
 RN8rjJuo/YPiQq1VpB/isSDMDQGlbBU8ZYP30EuRCZ0MTWnfSvs2zOb1LvUoVRCkmqOhA
 lPTrnXlK2suksDAvbh01bT2XkL0Z3BWHKd0QWozCHlNSPxuf6WXCVfDky3dAUbu/q00ij
 gytj9KwpY0sNSVNk/Mc4IZ/lfz+t+DPSgOObcP4N/U0NNAoqN/YiyMp8rAVkX8hmYWe+i
 fn0j/CyylNhUT2BwZ9kcpwvo0+IifXl7yuNJiaTU8UEicou4MeibtNRKNeo3fHIlX0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792963440;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=U1uZax0jIy69j1cgNNbM/9rkMTC51miEPkQ7zqy9Rw8=;
 b=VusMz+QD7oxbKocTVKE4p729wzO3RgULua+XnFagYSv2+uAY25BhwvBfjZw/sG3P411v
 LcmTzBmd/pG76XT+zK2IhXp//1n/qWZX8qRdx5v8kjFafM1HkCZtO1uNemXnSioxR7VYl
 BznELO7DG88CUzeHb1xmzmAgNCDQl8ZDhGccWezq3SYhfI4cZWW9+Dp6p5H0KzLh3bn22
 u2iCW9EMAl/s3vBCSMiVIPYyImLAaVGCVeEbwfI5tE5I7hcjWl10CEiI4rnpd7C8WIp1K
 9xzibNZTTA7tudoEXDRUJVu7jLUE8WbFZUOoKhnSBsN5KZm8zWCr88W2J3poFL8IZIA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EEDC40588
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 21:24:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C662C9CEDA; Sun, 25 Oct 2026 21:22:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 22:19:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: edd9d65265e0771e2aa7dc2be13e5ede596f5e56
X-Git-Newrev: 81d0026f25c1ef6f10db7eca0469689a85007e45
X-Patchwork-Hint: ignore
Message-Id: <20261025212234.C662C9CEDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-restool: bump to
 lf-6.12.34-2.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/81d0026f25c1ef6f10db7eca0469689a85007e45
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Align with other NXP Layerscape components using the same tag.
No code changes, just switching from commit hash to official release tag.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qoriq-restool/qoriq-restool.hash | 2 +-
 package/qoriq-restool/qoriq-restool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-restool/qoriq-restool.hash b/package/qoriq-restool/qoriq-restool.hash
index 72a34473f2..77c6442269 100644
--- a/package/qoriq-restool/qoriq-restool.hash
+++ b/package/qoriq-restool/qoriq-restool.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2879f14c9dd810e92d4c51c7f1a3e6705a5a585c2445e507f63e39872ac6237d  qoriq-restool-lf-6.12.20-2.0.0-3-gb44748e.tar.gz
+sha256  5a17fad0645d943efcae215b2d99f93406f605000cd4f0d5d9df627bc6f4e631  qoriq-restool-lf-6.12.34-2.1.0.tar.gz
 sha256  ddc794a75f11c3bd01015f16b9776064a894015e7a1603541283ccbc2e1c3a40  LICENSE
diff --git a/package/qoriq-restool/qoriq-restool.mk b/package/qoriq-restool/qoriq-restool.mk
index 79e87ef1dd..3d16531def 100644
--- a/package/qoriq-restool/qoriq-restool.mk
+++ b/package/qoriq-restool/qoriq-restool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_RESTOOL_VERSION = lf-6.12.20-2.0.0-3-gb44748e
+QORIQ_RESTOOL_VERSION = lf-6.12.34-2.1.0
 QORIQ_RESTOOL_SITE = $(call github,nxp-qoriq,restool,$(QORIQ_RESTOOL_VERSION))
 QORIQ_RESTOOL_LICENSE = BSD-3-Clause or GPL-2.0+
 QORIQ_RESTOOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
